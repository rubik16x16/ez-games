<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Carbon\Carbon;
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
}
