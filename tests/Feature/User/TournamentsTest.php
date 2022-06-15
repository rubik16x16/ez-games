<?php

namespace Tests\Feature\User;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\User;

class TournamentsTest extends TestCase{

  public function test_get_my_tournaments(){

		$user = User::find(1);
		$response = $this->actingAs($user, 'api')->getJson(route('my-tournaments.index'));

		// $response->dump();
		$response->assertStatus(200);
	}

	public function test_get_my_tournament(){

		$user = User::find(1);
		$team = $user->teams->first();
		$response = $this->actingAs($user, 'api')->getJson(route('my-tournaments.show', ['id' => $team->id]));

		// $response->dump();
		$response->assertStatus(200);
	}

	public function test_confirm_my_tournament(){

		$user = User::find(1);
		$team = $user->teams->first();
		$response = $this->actingAs($user, 'api')->getJson(route('my-tournaments.confirm', ['id' => $team->id]));

		// $response->dump();
		$response->assertStatus(200);
	}

	public function test_drop_player(){

		$user = User::find(1);
		$team = $user->teams->first();
		$player = $team->players->first();

		$response = $this->actingAs($user, 'api')->deleteJson(route('my-tournaments.drop-player', [
			'teamId' => $team->id,
			'playerId' => $player->id
		]));

		$response->dump();
		$response->assertStatus(200);
	}
}
