<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use GuzzleHttp\Client;

class Profile extends Controller{

	public function index(Request $request){

		$user = $request->user();
		return response()->json($user);
	}

	public function setNickname(Request $request){

		$user = $request->user();
		$user->nickname = $request->nickname;
		$user->save();

		return response()->json($user);
	}

	public function getCodUser(Request $request){

		//legendary117s

		$client = new Client();
		$nickname = str_replace('#', '%23', $request->nickname);

		$url = env('PROXY_SERVER') . '?api_key=' . env('PROXY_API_KEY') . "&url=https://api.tracker.gg/api/v2/warzone/standard/profile/atvi/$nickname?";

		//https://app.scrapingbee.com/api/v1?api_key=ULA7AGELM1FT259GC6ARUIHSJKJMDX3ORPJ0PAK0ZJ9C36X2T33UZQMIU7PV5N8FIF3X3WF78M57MTF8&url=https://cod.tracker.gg/warzone/profile/atvi/Iron%236056064/overview

		$res = $client->request('GET', $url);

		$data = json_decode($res->getBody());

		return response()->json([
			'avatarUrl' => $data->data->platformInfo->avatarUrl,
			'kills' => $data->data->segments[0]->stats->kills->value,
			'deaths' => $data->data->segments[0]->stats->deaths->value,
			'kdRatio' => $data->data->segments[0]->stats->kdRatio->value,
			'winRatio' => $data->data->segments[0]->stats->wlRatio->value
		]);
	}
}
