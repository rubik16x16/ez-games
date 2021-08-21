<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(){

			User::insert([
				[
					'name' => 'WARZONESKINS#1664935',
					'email' => 'test@g.com',
					'password' => '$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',
					'platform' => 'atvi',
				],
				[
					'name' => 'honrado858catre',
					'email' => 'test1@g.com',
					'password' => '$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',
					'platform' => 'psn',
				]
			]);
    }
}
