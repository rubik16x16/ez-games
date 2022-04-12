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
				'start' => '2022-03-27 12:00:00',
				'end' => '2022-03-27 14:00:00',
				'image' => 'storage/images/tournaments/tournaments-games-1.png',
				'num_players' => 1,
				'entry' => null,
				'reward' => 30
			],
			[
				'name' => 'BR DUOS Rebirth Duos',
				'start' => '2022-03-27 12:00:00',
				'end' => '2022-03-27 14:00:00',
				'image' => 'storage/images/tournaments/tournaments-games-2.png',
				'num_players' => 2,
				'entry' => null,
				'reward' => 30
			],
			[
				'name' => 'BR TRIOS Rebirth Trios',
				'start' => '2022-03-27 12:00:00',
				'end' => '2022-03-27 14:00:00',
				'image' => 'storage/images/tournaments/tournaments-games-3.png',
				'num_players' => 3,
				'entry' => null,
				'reward' => 30
			]
		]);
	}
}
