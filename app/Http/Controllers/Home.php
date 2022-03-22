<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class Home extends Controller{

	public function index(){

		$stripe = new \Stripe\StripeClient(
		  env('STRIPE_SECRET_KEY')
		);

		$payment = $stripe->paymentIntents->retrieve(
		  'pi_3KfuD9CzfGR8PWZf1iaoKlOG',
		  []
		);

		dd($payment);

		return view('index');
	}
}
