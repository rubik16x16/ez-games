<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use App\Mail\TournamentRegister;
use App\Models\Team;
use App\Models\Tournament;
use App\Models\UserPay;
use App\Models\UnregisteredPlayer;

class Teams extends Controller{

	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index(){

		return response()->json(Team::all());
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
			//
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request, $tournamentId){

		$validator = Validator::make($request->all(), [
			'name' => ['required', 'max:30', 'unique:teams'],
			'players' => ['array', 'between:0,5']
		]);

		if ($validator->fails()) {
			return response()->json($validator->messages(), 400);
		}

		$tournament = Tournament::find($tournamentId);
		$user = $request->user();

		$playerIds = collect($request->players)->map(function($item) {

			return $item['id'];
		})->filter(function($value, $key){

			return $value != null;
		});

		$allPlayerIds = clone $playerIds;
		$allPlayerIds->push($user->id);

		// if($user->teamsCaptain->count() > 0){

		// 	return response()->json([
			// 	'user' => ["you already created a team"]
		// 	], 400);
		// }

		// if($allPlayerIds->countBy()->count() != $playerIds->count() + 1){

		// 	return response()->json([
			// 	'players' => ['only unique players']
		// 	], 400);
		// }

		try {

			DB::beginTransaction();

			if($tournament->entry){

				$stripe = new \Stripe\StripeClient(
					env('STRIPE_SECRET_KEY')
				);

				$payment = $stripe->paymentIntents->retrieve(
					$request->paymentId,
					[]
				);

				$userPayment = UserPay::where('payment_id', $request->paymentId)->first();

				if($userPayment){

					return response()->json('pay duplicated', 400);
				}

				if($payment->amount_received != ($tournament->entry * 100)){

					return response()->json('invalid amount received', 400);
				}

				$user->pays()->save(new UserPay([
					'amount' => $tournament->entry,
					'payment_id' => $request->paymentId
				]));
			}

			$team = new Team(['name' => $request->name]);
			$team->captain()->associate($user);
			$tournament->teams()->save($team);

			$team->players()->attach($playerIds);
			$team->players()->attach($user->id, ['confirmed' => false]);

			$emailPlayers = collect($request->players);
			$emailPlayers->push($user->toArray());

			foreach($emailPlayers as $player){

				if($player['id']){

					$registered = true;
				}else{

					$registered = false;
					$unregisteredPlayer = new UnregisteredPlayer($player);
					$team->unregisteredPlayers()->save($unregisteredPlayer);
				}

				Mail::to($player['email'])->send(new TournamentRegister([
					'tournament' => $tournament,
					'registered' => $registered
				]));
			}

			DB::commit();
		}catch(\Stripe\Exception\InvalidRequestException $e){

			return response()->json('invalid pay', 400);
		}catch(\Exception $e){

			DB::rollback();
			return response()->json([
				'message' => $e->getMessage(),
				'trace' => $e->getTrace()
			], 500);
		}

		return response()->json(null, 201);
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
			//
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
			//
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{
			//
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
			//
	}
}
