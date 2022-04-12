<?php

namespace App\Http\Controllers;

use App\Models\Team;
use App\Models\TeamMatchData;
use App\Models\Tournament;
use App\Models\UserMatchData;
use Illuminate\Http\Request;
use GuzzleHttp\Client;

class MatchesController extends Controller{

	public function teams(){

		return response()->json(Team::with(['captain'])->get());
	}

	public function storeTeamsData(Request $request, $tournamentId){

		$tournament = Tournament::find($tournamentId)->load([
			'teams', 'matches', 'teams.players'
		]);

		foreach($tournament->matches as $match){

			$client = new Client();
			$url = env('PROXY_SERVER') . '?api_key=' . env('PROXY_API_KEY') . "&premium_proxy=True" . "&url=https://api.tracker.gg/api/v2/warzone/standard/matches/{$match->id}";

			$res = $client->request('GET', $url);
			$data = json_decode($res->getBody());
			$playersData = collect($data->data->segments);

			foreach($tournament->teams as $team){

				$teamKills = 0;
				$teamDeaths = 0;
				$teamKdratio = 0;

				foreach($team->players as $player){

					$playerData = $playersData->first(function($value) use($player){

						return $player->nickname == $value->attributes->platformUserIdentifier;
					});

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

				$teamMatchData = new TeamMatchData([
					'kills' => $teamKills,
					'deaths' => $teamDeaths,
					'kdratio' => $teamKdratio
				]);

				$teamMatchData->match()->associate($match);
				$teamMatchData->team()->associate($team);
				$teamMatchData->save();
			}
		}

		return response()->json($tournament);
	}

	public function getData(){

		return response()->json([
			[
				'name' => 'team 254',
				'game1' => 0,
				'game2' => 0,
				'game3' => 0,
				'total' => 0
			],
			[
				'name' => 'LAS YEGUAS',
				'game1' => 0,
				'game2' => 0,
				'game3' => 0,
				'total' => 0
			],
			[
				'name' => 'LA COMARCA',
				'game1' => 0,
				'game2' => 0,
				'game3' => 0,
				'total' => 0
			],
			[
				'name' => 'Sweaty Geese',
				'game1' => 0,
				'game2' => 0,
				'game3' => 0,
				'total' => 0
			],
			[
				'name' => 'Cartoon cartel Johhndevil',
				'game1' => 0,
				'game2' => 0,
				'game3' => 0,
				'total' => 0
			],
			[
				'name' => 'CCCSW',
				'game1' => 0,
				'game2' => 0,
				'game3' => 0,
				'total' => 0
			],
			[
				'name' => 'Anti Judas',
				'game1' => 0,
				'game2' => 0,
				'game3' => 0,
				'total' => 0
			],
			[
				'name' => 'ENEM1',
				'game1' => 0,
				'game2' => 0,
				'game3' => 0,
				'total' => 0
			],
			[
				'name' => 'Supervillains',
				'game1' => 0,
				'game2' => 0,
				'game3' => 0,
				'total' => 0
			],
			[
				'name' => 'Cuba',
				'game1' => 0,
				'game2' => 0,
				'game3' => 0,
				'total' => 0
			],
			[
				'name' => 'Rippers boys',
				'game1' => 0,
				'game2' => 0,
				'game3' => 0,
				'total' => 0
			],
			[
				'name' => 'Da Boys',
				'game1' => 0,
				'game2' => 0,
				'game3' => 0,
				'total' => 0
			],
			[
				'name' => 'TheThreeBeans69',
				'game1' => 0,
				'game2' => 0,
				'game3' => 0,
				'total' => 0
			],
			[
				'name' => 'Team TKO',
				'game1' => 0,
				'game2' => 0,
				'game3' => 0,
				'total' => 0
			],
			[
				'name' => 'Get Gud',
				'game1' => 0,
				'game2' => 0,
				'game3' => 0,
				'total' => 0
			],
			[
				'name' => 'AJ Demons',
				'game1' => 0,
				'game2' => 0,
				'game3' => 0,
				'total' => 0
			],
			[
				'name' => 'Zolh x Bean x Firmi',
				'game1' => 0,
				'game2' => 0,
				'game3' => 0,
				'total' => 0
			],
			[
				'name' => 'JSquad',
				'game1' => 0,
				'game2' => 0,
				'game3' => 0,
				'total' => 0
			]
		]);
	}
}
