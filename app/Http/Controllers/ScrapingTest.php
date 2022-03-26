<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use GuzzleHttp\Client;

class ScrapingTest extends Controller{

	public function getMatchesData(Request $request){


		$client = new Client();
		$nickname = str_replace('#', '%23', $request->nickname);

		$url = env('PROXY_SERVER') . '?api_key=' . env('PROXY_API_KEY') . "&premium_proxy=True" . "&url=https://api.tracker.gg/api/v2/warzone/standard/matches/atvi/$nickname";

		$res = $client->request('GET', $url);
		$data = json_decode($res->getBody());

		return response()->json($data);
	}
}
