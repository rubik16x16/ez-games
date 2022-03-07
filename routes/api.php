<?php

use App\Http\Controllers\Auth\Register;
use App\Http\Controllers\Profiles;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Tournaments;
use App\Http\Controllers\Profile;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
  return $request->user();
});

Route::middleware(['auth:api'])->group(function(){

	Route::resource('tournaments', Tournaments::class)->parameters([
		'tournaments' => 'id'
	]);

	Route::get('profile', [Profile::class, 'index'])->name('profile.index');
	Route::put('profile/nickname', [Profile::class, 'setNickname'])->name('profile.nickname.update');
});


Route::get('check-nickname', [Register::class, 'checkNickname']);

require __DIR__.'/auth.php';
