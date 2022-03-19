<?php

namespace Tests\Feature\User;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\User;

class UsersTest extends TestCase{

  /**
   * A basic feature test example.
   *
   * @return void
   */
  public function test_search(){

    $user = User::find(1);
		$response = $this->actingAs($user, 'api')->getJson(route('users.search', ['email' => '']));

		$response->dump();
		$response->assertStatus(200);
  }
}
