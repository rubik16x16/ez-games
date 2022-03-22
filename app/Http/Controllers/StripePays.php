<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class StripePays extends Controller{

	public function createPaymentIntent(Request $request){

		$stripe = new \Stripe\StripeClient(
		  env('STRIPE_SECRET_KEY')
		);

		$paymentObject = $stripe->paymentIntents->create([
		  'amount' => $request->amount * 100,
		  'currency' => 'usd',
		  'payment_method_types' => ['card'],
		]);

		return response()->json($paymentObject);
	}

	public function checkPay(Request $request){

		$stripe = new \Stripe\StripeClient(
		  env('STRIPE_SECRET_KEY')
		);

		$payment = $stripe->paymentIntents->retrieve(
		  $request->id,
		  []
		);

		return response()->json($payment);
	}
}
