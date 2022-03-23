<?php

use App\Http\Controllers\Auth\Register;
use App\Http\Controllers\Profiles;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Tournaments;
use App\Http\Controllers\User\Profile;
use App\Http\Controllers\User\Users;
use App\Http\Controllers\Teams;
use App\Http\Controllers\StripePays;

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

Route::resource('tournaments', Tournaments::class)
	->only(['index', 'show'])
	->parameters([
	'tournaments' => 'id'
]);

Route::middleware(['auth:api'])->group(function(){

	Route::resource('tournaments', Tournaments::class)
		->only(['store', 'update', 'destroy'])
		->parameters([
		'tournaments' => 'id'
	]);

	// Route::get('profile', [Profile::class, 'index'])->name('profile.index');
	// Route::put('profile/nickname', [Profile::class, 'setNickname'])->name('profile.nickname.update');
	Route::get('profile/cod-user', [Profile::class, 'getCodUser']);
	Route::get('users/search', [Users::class, 'search'])->name('users.search');
	Route::post('tournaments/{tournamentId}/teams', [Teams::class, 'store'])->name('tournaments.teams.store');
	Route::get('teams', [Teams::class, 'index'])->name('teams.index');

	Route::post('create-payment-intent', [StripePays::class, 'createPaymentIntent']);
});

require __DIR__.'/auth.php';
