<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Mail\DemoEmail;
use Illuminate\Support\Facades\Mail;

class Home extends Controller{

	public function index(){

		// return view('mail.demo-mail', [
		// 	'token' => 'asdasd'
		// ]);
		Mail::to("ekimanthony1996@hotmail.com")->send(new DemoEmail(['token' => 'asd']));
		return view('index');
	}
}
