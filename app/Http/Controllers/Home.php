<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Mail\DemoEmail;
use Illuminate\Support\Facades\Mail;

class Home extends Controller{

	public function index(){

		Mail::to('drt_mike@hotmail.com')->send(new DemoEmail(['token' => 'test']));
		return response('Hello world!');
		// return view('index');
	}
}
