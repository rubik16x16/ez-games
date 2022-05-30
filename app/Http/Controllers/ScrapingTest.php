<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use GuzzleHttp\Client;

class ScrapingTest extends Controller{

	public function getMatchesData(Request $request){

		$client = new Client([
			'verify' => false
		]);

		$nickname = str_replace('#', '%2523', $request->nickname);

		$url = env('PROXY_SERVER') . '?api_key=' . env('PROXY_API_KEY') . "&url=https%3A%2F%2Fapi.tracker.gg%2Fapi%2Fv2%2Fwarzone%2Fstandard%2Fmatches%2Fatvi%2F" . $nickname . "%3Ftype%3Dwz";


		$res = $client->request('GET', $url);
		$data = json_decode($res->getBody());

		return response()->json($data);
	}
}
