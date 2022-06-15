<?php

namespace App\Console\Commands;

use App\Models\TeamMatchData;
use App\Models\Tournament;
use App\Models\TournamentMatch;
use App\Models\UserMatchData;
use Carbon\Carbon;
use DateTime;
use Illuminate\Console\Command;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\ServerException;
use Illuminate\Support\Facades\DB;
use PDOException;

class GetMatchesData extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'get-matches-data';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle(){

			$today = Carbon::now();

			$dayTournaments = Tournament::with([
				'teams'
			])
				->whereDate('start', '<', $today->toDateString())
				->orWhere(function($query) use($today){
					$query->whereDate('start', $today->toDateString())
						->whereTime('start', '<=', $today->toTimeString());
				})
				->whereDate('end', '>', $today->toDateString())
				->orWhere(function($query) use($today){
					$query->whereDate('end', $today->toDateString())
						->whereTime('end', '>', $today->toTimeString());
				})
				->get();

			$client = new Client([
				'verify' => false
			]);

			DB::table('get_matches_history')->insert([
				'number_tournaments' => $dayTournaments->count(),
				'created_at' => new DateTime('now'),
				'updated_at' => new DateTime('now')
			]);

			foreach($dayTournaments as $tournament){

				foreach($tournament->teams as $team){

					$nickname = str_replace('#', '%2523', $team->captain->nickname);

					$url = env('PROXY_SERVER') . '?api_key=' . env('PROXY_API_KEY') . "&url=https%3A%2F%2Fapi.tracker.gg%2Fapi%2Fv2%2Fwarzone%2Fstandard%2Fmatches%2Fatvi%2F" . $nickname . "%3Ftype%3Dwz";


					$res = $client->request('GET', $url);
					$data = json_decode($res->getBody());

					$matches = collect($data->data->matches);
					$tournamentStart = new Carbon($tournament->start);
					$tournamentEnd = new Carbon($tournament->end);
					$tournamentMatches = $matches->filter(function($match) use($tournamentStart, $tournamentEnd){

						$matchTime = new Carbon($match->metadata->timestamp);
						if($matchTime->between($tournamentStart, $tournamentEnd)){

							return $match;
						}
					});

					echo $tournamentMatches->count();

					foreach($tournamentMatches as $matchData){

						try{

							DB::beginTransaction();
							$matchFound = TournamentMatch::find($matchData->attributes->id);
							if(!$matchFound){

								$url = env('PROXY_SERVER') . '?api_key=' . env('PROXY_API_KEY') . "&premium_proxy=True" . "&url=https://api.tracker.gg/api/v2/warzone/standard/matches/{$matchData->attributes->id}";

								$match = new TournamentMatch([
									'id' => $matchData->attributes->id,
									'duration' => 0,
									'player_count' => $matchData->metadata->playerCount,
									'map_name' => $matchData->metadata->mapName,
									'mode_name' => $matchData->metadata->modeName
								]);

								$tournament->matches()->save($match);

								try{

									$res = $client->request('GET', $url);

								}catch(ServerException $e){

									continue;
								}

								$data = json_decode($res->getBody());
								$playersData = collect($data->data->segments);

								$teamKills = 0;
								$teamDeaths = 0;
								$teamKdratio = 0;

								foreach($team->players as $player){

									$playerData = $playersData->first(function($value) use($player){

										$playerNickname = substr($player->nickname, 0, strpos($player->nickname, '#'));
										return $playerNickname == $value->attributes->platformUserIdentifier;
									});

									if($playerData){

										$teamKills += $playerData->stats->kills->value;
										$teamDeaths += $playerData->stats->deaths->value;
										$teamKdratio += $playerData->stats->kdRatio->value;

										$userMatchData = new UserMatchData([
											'kills' => $playerData->stats->kills->value,
											'deaths' => $playerData->stats->deaths->value,
											'kdratio' => $playerData->stats->kdRatio->value
										]);

										$userMatchData->match()->associate($match);
										$userMatchData->user()->associate($player);
										$userMatchData->save();
									}
								}

								$teamMatchData = new TeamMatchData([
									'kills' => $teamKills,
									'deaths' => $teamDeaths,
									'kdratio' => $teamKdratio
								]);

								$teamMatchData->match()->associate($match);
								$teamMatchData->team()->associate($team);
								$teamMatchData->save();
							}

							DB::commit();
						}catch(PDOException $e){

							DB::rollBack();
							abort(500, $e->getMessage());
						}
					}
				}
			}
    }
}
