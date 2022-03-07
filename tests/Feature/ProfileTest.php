<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\User;

class ProfileTest extends TestCase{
	/**
	 * A basic feature test example.
	 *
	 * @return void
	 */
	public function test_get_profile(){

		$user = User::find(1);
		$response = $this->actingAs($user, 'api')->getJson(route('profile.index'));
		$response->assertStatus(200);
	}

	public function test_update_nickname(){

		$user = User::find(1);
		$response = $this->actingAs($user, 'api')->putJson(route('profile.nickname.update'), [
			'nickname' => 'test'
		]);
		$response->assertStatus(200);
	}
}
