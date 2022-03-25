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
				'start' => '2022-03-27 12:00:00',
				'end' => '2022-03-27 14:00:00',
				'entry' => null,
				'reward' => 30
			],
			[
				'name' => 'Special custom trios',
				'start' => '2022-03-27 12:00:00',
				'end' => '2022-03-27 14:00:00',
				'entry' => null,
				'reward' => 30
			]
		]);
	}
}
