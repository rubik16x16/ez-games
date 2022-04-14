<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Faker\Factory;

class UserSeeder extends Seeder{
	/**
	 * Run the database seeds.
	 *
	 * @return void
	 */
	public function run(){
		User::insert([
			[
				'nickname' => 'Iron#6056064',
				'email' => 'test@g.com',
				'password' => '$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',
				'platform' => 'atvi',
			],
			[
				'nickname' => 'damqge#9252117',
				'email' => 'test1@g.com',
				'password' => '$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',
				'platform' => 'psn',
			],
			// [
			// 	'nickname' => 'snowChild',
			// 	'email' => 'drt_mike@hotmail.com',
			// 	'password' => '$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',
			// 	'platform' => 'psn',
			// ]
		]);

		$faker = Factory::create();
		for($i = 0; $i < 100; $i++){

			User::insert([
				[
					'nickname' => "{$faker->word(6, false)}#{$faker->randomNumber(5, true)}",
					'email' => $faker->email(),
					'password' => '$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',
					'platform' => 'psn',
				]
			]);
		}
	}
}
