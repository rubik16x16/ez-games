<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;

class Users extends Controller{

	public function search(Request $request){

		$usersSelectedIds = explode('-', $request->playersSelected);

		$users = User::where('email', 'LIKE', "%{$request->email}%")
			->where('id', '!=', $request->user()->id)
			->whereNotIn('id', $usersSelectedIds)
			->limit(5)->get();
		return response()->json($users);
	}
}
