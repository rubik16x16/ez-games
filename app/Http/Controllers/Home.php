<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class Home extends Controller{

	public function index(){

		return response('Hello world!');
		// return view('index');
	}
}
