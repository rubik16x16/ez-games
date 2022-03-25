<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\UserVerificationToken;
use App\Mail\DemoEmail;
use Carbon\Carbon;
use GuzzleHttp\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class Register extends Controller{

	public function store(Request $request){

		$validator = Validator::make($request->all(), [
			// 'captchaResponse' => ['required'],
			'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
			'password' => ['required', 'max:30'],
			'nickname' => ['required', 'max:30', 'unique:users']
		]);

		if ($validator->fails()) {
			return response()->json($validator->messages(), 400);
		}

		// $client = new Client();
		// $res = $client->post('https://www.google.com/recaptcha/api/siteverify', [
		// 	'form_params' => [
		// 		'secret' => env('CAPTCHA_SECRET'),
		// 		'response' => $request->captchaResponse
		// 	]
		// ]);

		// $body = $res->getBody();
		// $content = json_decode($body->getContents());

		// if(!$content->success){

		// 	return response()->json([
		// 		'errors' => [
		// 			'captcha' =>['Invalid captchaResponse']
		// 		]
		// 	], 400);
		// }

		try {

			DB::beginTransaction();
			$user = User::create([
				'email' => $request->email,
				'password' => Hash::make($request->password),
				'nickname' => $request->nickname
			]);

			$UserVerificationToken = new UserVerificationToken([
				'token' => bin2hex(random_bytes(30))
			]);

			$UserVerificationToken->user()->associate($user);
			$UserVerificationToken->save();
			$tokenResult = $user->createToken('AccessToken');
			DB::commit();
		} catch (\Exception $e) {

			DB::rollback();
			return response()->json([
				'message' => $e->getMessage(),
				'trace' => $e->getTrace()
			], 500);
		}

		$token = $tokenResult->token;
		Mail::to($user->email)->send(new DemoEmail(['token' => $UserVerificationToken->token
		]));

		return response()->json([
			'access_token' => $tokenResult->accessToken,
			'token_type' => 'Bearer',
			'expires_at' => Carbon::parse($token->expires_at)->toDateTimeString(),
			'user' => $user
		]);
	}

	public function verifyEmail(Request $request, $token){

		$token = UserVerificationToken::with(['user'])
			->where('token', $token)->first();

		if($token){

			try {

				DB::beginTransaction();
				$token->enable = false;
				$token->save();

				$token->user->email_verified_at = new Carbon();
				$token->user->save();
				DB::commit();
			} catch (\Exception $e) {

				DB::rollback();
				return response()->json($e->getMessage());
			}

			return response()->json([
				'user' => $token->user
			]);
		}

		return response()->json('invalid token', 400);
	}
}
