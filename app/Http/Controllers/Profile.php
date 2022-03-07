<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

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
}
