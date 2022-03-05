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
				'name' => 'Tournament1',
				'start' => '2022-03-04 12:00:00',
				'end' => '2022-03-06 12:00:00'
			],
			[
				'name' => 'Tournament2',
				'start' => '2022-03-04 12:00:00',
				'end' => '2022-03-06 12:00:00'
			]
		]);
	}
}
