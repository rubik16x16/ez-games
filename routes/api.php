<?php

use App\Http\Controllers\Auth\Register;
use App\Http\Controllers\MatchesController;
use App\Http\Controllers\Profiles;
use App\Http\Controllers\ScrapingTest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Tournaments;
use App\Http\Controllers\User\Profile;
use App\Http\Controllers\User\Users;
use App\Http\Controllers\Teams;
use App\Http\Controllers\StripePays;
use App\Http\Controllers\User\Tournaments as UserTournaments;

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

Route::get('get-matches-data', [ScrapingTest::class, 'getMatchesData']);
Route::get('store-teams-data/{tournamentId}', [MatchesController::class, 'storeTeamsData']);
Route::get('tournaments/{id}/get-data', [MatchesController::class, 'getData']);

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

	Route::get('profile', [Profile::class, 'index'])->name('profile.index');
	// Route::put('profile/nickname', [Profile::class, 'setNickname'])->name('profile.nickname.update');
	Route::get('profile/cod-user', [Profile::class, 'getCodUser']);
	Route::get('users/search', [Users::class, 'search'])->name('users.search');
	Route::post('tournaments/{tournamentId}/teams', [Teams::class, 'store'])->name('tournaments.teams.store');
	Route::get('teams', [Teams::class, 'index'])->name('teams.index');

	Route::post('create-payment-intent', [StripePays::class, 'createPaymentIntent']);

	//UserTournaments

	Route::get('my-tournaments', [UserTournaments::class, 'getMyTournaments'])->name('my-tournaments.index');
	Route::get('my-tournaments/{id}', [UserTournaments::class, 'getMyTournament'])->name('my-tournaments.show');
	Route::post('my-tournaments/{id}/confirm', [UserTournaments::class, 'confirmMyTournament'])->name('my-tournaments.confirm');

	Route::delete('my-tournaments/{teamId}/drop-player/{playerId}', [UserTournaments::class, 'dropPlayer'])->name('my-tournaments.drop-player');
});

require __DIR__.'/auth.php';
