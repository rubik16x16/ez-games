<?php

namespace App\Http\Controllers;

use App\Models\TeamMatchData;
use App\Models\Tournament;
use App\Models\UserMatchData;
use Illuminate\Http\Request;
use GuzzleHttp\Client;

class MatchesController extends Controller{

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
				'name' => 'Test',
				'game1' => 0,
				'game2' => 0,
				'game3' => 0,
				'total' => 0
			]
		]);
	}
}
