<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Carbon\Carbon;
use GuzzleHttp\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;

class Register extends Controller{

	public function store(Request $request){

		$request->validate([
			'nickname' => ['required', 'string', 'max:255', 'unique:users'],
			'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
			'password' => ['required'],
		]);

		$user = User::create([
			'nickname' => $request->nickname,
			'email' => $request->email,
			'password' => Hash::make($request->password),
		]);

		$tokenResult = $user->createToken('AccessToken');
		$token = $tokenResult->token;

		return response()->json([
			'access_token' => $tokenResult->accessToken,
			'token_type' => 'Bearer',
			'expires_at' => Carbon::parse($token->expires_at)->toDateTimeString(),
			'user' => [
				'email' => $user->email,
				'id' => $user->id
			]
		]);
	}

	public function checkNickname(Request $request){

		//legendary117s

		$client = new Client();
		$nickname = str_replace('#', '%23', $request->nickname);

		$url = env('PROXY_SERVER') . '?api_key=' . env('PROXY_API_KEY') . "&url=https://api.tracker.gg/api/v2/warzone/standard/profile/atvi/$nickname?";

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
