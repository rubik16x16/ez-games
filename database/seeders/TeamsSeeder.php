<?php

namespace Database\Seeders;

use App\Models\Team;
use App\Models\Tournament;
use App\Models\User;
use Illuminate\Database\Seeder;

class TeamsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(){

			$teams = 2;
			$users = User::all();
			$chunk = $users->chunk($teams);
			$tournament = Tournament::find(1);

			foreach($chunk as $index => $teamPlayers){

				$playersIds = $teamPlayers->map(function($item){

					return $item->id;
				});

				$team = new Team(['name' => 'team'. $index]);
				$team->tournament()->associate($tournament);
				$team->captain()->associate($teamPlayers->values()[0]);
				$team->save();
				$team->players()->attach($playersIds);
			}
    }
}
