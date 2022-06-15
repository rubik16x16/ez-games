<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Tournament;
use App\Models\Team;

class Tournaments extends Controller{

	public function getMyTournaments(Request $request){

		$user = $request->user();

		return response()->json($user->teams);
	}

	public function getMyTournament(Request $request, $id){

		$user = $request->user();
		$team = Team::with([
			'players', 'captain', 'unregisteredPlayers'
		])->find($id);

		$currentPlayer = $team->players->first(function($item) use($user){

			return $item->id = $user->id;
		});

		$team->confirmed = $currentPlayer->pivot->confirmed ? true : false;
		return response()->json($team);
	}

	public function confirmMyTournament(Request $request, $id){

		$user = $request->user();
		$team = $user->teams()->where('teams.id', $id)->first();

		$team->players()->updateExistingPivot($user->id, [
			'confirmed' => true,
		]);

		return response()->json();
	}

	public function dropPlayer(Request $request, $teamId, $playerId){

		$user = $request->user();
		$team = $user->teams()->where('teams.id', $teamId)->first();

		if($team->captain->id == $user->id){

			if($request->unregistered){

				$team->unregisteredPlayers()->where('id', $teamId)->delete();
				return response()->json();
			}

			$team->players()->detach($playerId);
		}

		return response()->json();
	}
}
