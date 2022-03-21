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
				'name' => 'BR DUOS Rebirth Duos',
				'start' => '2022-03-04 12:00:00',
				'end' => '2022-03-06 12:00:00',
				'entry' => 15,
				'reward' => 350
			],
			[
				'name' => 'BR TRIOS Rebirth TRIOS',
				'start' => '2022-03-04 12:00:00',
				'end' => '2022-03-06 12:00:00',
				'entry' => 20,
				'reward' => 575
			],
			[
				'name' => 'BR QUADS Rebirth Quads',
				'start' => '2022-03-04 12:00:00',
				'end' => '2022-03-06 12:00:00',
				'entry' => null,
				'reward' => 30
			]
		]);
	}
}
