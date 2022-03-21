<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class Login extends Controller{

	public function authenticate(Request $request){

		$validator = Validator::make($request->all(), [
			'email' => ['required', 'email'],
			'password' => ['required'],
		]);

		if ($validator->fails()) {
			return response()->json($validator->messages(), 400);
		}

		if(Auth::attempt($validator->valid())){

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
			'Email' => ['these credentials do not match our records']
		], 401);
	}

	public function logout(Request $request){

		$request->user()->token()->revoke();
		return response()->json([
			'message' => 'Successfully logged out'
		]);
	}
}
