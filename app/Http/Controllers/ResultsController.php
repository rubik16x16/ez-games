<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use GuzzleHttp\Client;

class ResultsController extends Controller{

	/**
	 * Endpoints
	 *
	 * Profile:
	 * https://app.wzstats.gg/v2/player?username={username}&platform=acti
	 *
	 * Matches:
	 * https://app.wzstats.gg/v2/player/match/withPlayers/?username=snowchild777#2308570&platform=acti
	 *
	 * Match:
	 * https://app.wzstats.gg/v2/?matchId={matchid}
	 */

	public function getResults(){

		$client = new Client([
			'verify' => false
		]);

		$nickname = 'snowchild777#2308570';
		$nickname = str_replace('#', '%23', $nickname);
		$url = env('PROXY_SERVER') . '?api_key=' . env('PROXY_API_KEY') . "&url=https%3A%2F%2Fapi.tracker.gg%2Fapi%2Fv2%2Fwarzone%2Fstandard%2Fmatches%2Fatvi%2F" . $nickname . "%3Ftype%3Dwz";

		$res = $client->request('GET', $url);
		$userData = $data = json_decode($res->getBody());

		return response()->json($data);
	}
}
