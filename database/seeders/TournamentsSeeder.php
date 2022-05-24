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
				'start' => '2022-06-24 12:00:00',
				'end' => '2022-03-27 14:00:00',
				'image' => 'storage/images/tournaments/Tournament-Cards-1.png',
				'num_players' => 1,
				'entry' => 100,
				'reward' => 30
			],
			[
				'name' => 'BR DUOS Rebirth Duos',
				'start' => '2022-06-25 12:00:00',
				'end' => '2022-03-27 14:00:00',
				'image' => 'storage/images/tournaments/Tournament-Cards-2.png',
				'num_players' => 2,
				'entry' => 200,
				'reward' => 30
			],
			[
				'name' => 'BR TRIOS Rebirth Trios',
				'start' => '2022-06-26 12:00:00',
				'end' => '2022-03-27 14:00:00',
				'image' => 'storage/images/tournaments/Tournament-Cards-1.png',
				'num_players' => 3,
				'entry' => 300,
				'reward' => 30
			]
		]);
	}
}
