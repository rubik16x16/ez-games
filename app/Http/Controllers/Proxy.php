<?php

namespace App\Http\Controllers;

use GuzzleHttp\Client;
use GuzzleHttp\Exception\ClientException;
use Illuminate\Http\Request;

class Proxy extends Controller{

	public function index(Request $request){


		$client = new Client();
		$res = $client->request('GET', 'https://api.tracker.gg/api/v2/warzone/standard/matches/atvi/Iron%236056064?type=wz', [
			'headers' => [
				'User-Agent' => 'Mozilla/5.0',
				'Accept' => 'application/json',
				'Referer' => 'https://cod.tracker.gg/'
			]
		]);

		$body = $res->getBody();

		// return response()->json($body->getContents());
	}
}
