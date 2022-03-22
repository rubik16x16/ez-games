<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Team;
use App\Models\Tournament;
use App\Models\UserPay;

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

  	$tournament = Tournament::find($tournamentId);
  	$user = $request->user();

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

					return respponse()->json('pay duplicated', 400);
				}

				if($payment->amount_received != ($tournament->entry * 100)){

					return respponse()->json('invalid amount received', 400);
				}

				$user->pays()->save(new UserPay([
					'amount' => $tournament->entry,
					'payment_id' => $request->paymentId
				]));
	  	}

			$team = new Team(['name' => $request->name]);
			$tournament->teams()->save($team);
			$players = collect($request->players)->map(function($item) {
	  		return $item['id'];
	  	});

	  	$team->players()->attach($players);
	  	$team->players()->attach($user->id, ['confirmed' => true]);

			DB::commit();
		}catch(Stripe\Exception\InvalidRequestException $e){

  		return respponse()->json('invalid pay', 400);
  	}catch(\Exception $e){

			DB::rollback();
			return response()->json($e->getMessage());
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
