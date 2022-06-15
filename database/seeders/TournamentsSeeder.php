<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Tournament;

class TournamentsSeeder extends Seeder{
	/**
	 * Run the database seeds.
	 *
	 * @return void
	 */
	public function run(){

		Tournament::insert([
			[
				'name' => 'BR SOLO Rebirth Solo',
				'start' => '2022-06-15 20:00:00',
				'end' => '2022-06-16 00:00:00',
				'image' => 'storage/images/tournaments/Tournament-Cards-1.png',
				'num_players' => 1,
				'entry' => 0,
				'reward' => 30
			],
		]);
	}
}
