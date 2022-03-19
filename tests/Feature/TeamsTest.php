<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\User;
use App\Models\Tournament;

class TeamsTest extends TestCase{
  /**
   * A basic feature test example.
   *
   * @return void
   */
  public function test_index(){

    $user = User::find(1);
		$response = $this->actingAs($user, 'api')->getJson(route('teams.index'));

		$response->dump();
		$response->assertStatus(200);
  }

  public function test_store(){

  	$user = User::find(1);
  	$tournament = Tournament::find(1);
  	$players = User::inRandomOrder()->limit(5)->get();

		$response = $this->actingAs($user, 'api')->postJson(route('tournaments.teams.store', [
			'tournamentId' => $tournament->id
		]), [
			'name' => 'test',
			'players' => $players
		]);

		$response->dump();
		$response->assertStatus(201);
  }
}
