<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class AuthTest extends TestCase{

	/**
	 * A basic feature test example.
	 *
	 * @return void
	 */
	public function test_login(){

		$response = $this->postJson(route('auth.login'), [
			'email' => 'test@g.com',
			'password' => 'secret'
		]);

		$response->dump();
		$response->assertStatus(200);
	}
}
