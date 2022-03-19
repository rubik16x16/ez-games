<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class Login extends Controller{

	public function authenticate(Request $request){

		$credentials = $request->validate([
			'email' => ['required', 'email'],
			'password' => ['required'],
		]);

		if(Auth::attempt($credentials)){

			$user = $request->user();
			$tokenResult = $user->createToken('AccessToken');
			$token = $tokenResult->token;

			return response()->json([
				'access_token' => $tokenResult->accessToken,
				'token_type' => 'Bearer',
				'expires_at' => Carbon::parse($token->expires_at)->toDateTimeString(),
				'user' => $user
			]);
		}

		return response()->json([
			'message' => 'Unauthorized'
		], 401);
	}

	public function logout(Request $request){

		$request->user()->token()->revoke();
		return response()->json([
			'message' => 'Successfully logged out'
		]);
	}
}
