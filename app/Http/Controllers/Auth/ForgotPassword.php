<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Password;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\TournamentRegister;
use Illuminate\Support\Facades\Hash;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Support\Facades\DB;

class ForgotPassword extends Controller{

	public function sendEmail(Request $request){

		$status = Password::sendResetLink(
			['email' => $request->email]
		);

		return response()->json($status);
	}

	public function resetPassword(Request $request){

		$status = Password::reset(
			[
				'email' => $request->email,
				'password' => $request->password,
				'token' => $request->token,
			],
			function ($user, $password) {
				$user->forceFill([
						'password' => Hash::make($password)
				]);

				$user->save();

				event(new PasswordReset($user));
			}
		);

		return response()->json($status);
	}
}
