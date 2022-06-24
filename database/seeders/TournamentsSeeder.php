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
				'name' => 'BR TRIOS Rebirth Trios',
				'start' => '2022-06-15 20:00:00',
				'end' => '2022-06-15 21:30:00',
				'type' => 'duos',
				'image' => 'storage/images/tournaments/Tournament-Cards-1.png',
				'num_players' => 3,
				'entry' => 0,
				'reward' => 30
			],
		]);
	}
}
