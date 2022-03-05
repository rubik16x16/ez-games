<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\User;
use App\Models\Tournament;

class TournamentsTest extends TestCase{

	/**
	 * A basic feature test example.
	 *
	 * @return void
	 */
	public function test_list(){

		$user = User::find(1);
		$response = $this->actingAs($user, 'api')->getJson(route('tournaments.index'));
		$response->assertStatus(200);
	}

	public function test_store(){

		$user = User::find(1);
		$response = $this->actingAs($user, 'api')->postJson(route('tournaments.index'), [
			'name' => 'Tournamentx',
			'start' => '2022-03-04 12:00:00',
			'end' => '2022-03-05 12:00:00'
		]);

		$response->assertCreated();
	}

	public function test_show(){

		$user = User::find(1);
		$response = $this->actingAs($user, 'api')
			->getJson(route('tournaments.show', ['id' => 1]));
		$response->assertStatus(200);
	}

	public function test_update(){

		$user = User::find(1);
		$response = $this->actingAs($user, 'api')
			->putJson(route('tournaments.update', ['id' => 1]), [
			'name' => 'Tournament edited',
			'start' => '2022-03-05 12:00:00',
			'end' => '2022-03-06 12:00:00'
		]);

		$response->assertStatus(204);
	}

	public function test_delete(){

		$user = User::find(1);
		$tournament = Tournament::orderBy('created_at', 'DESC')->first();
		$response = $this->actingAs($user, 'api')
			->deleteJson(route('tournaments.destroy', ['id' => $tournament->id]));
		$response->assertStatus(204);

		$this->assertEquals(Tournament::find($tournament->id), null);
	}
}
