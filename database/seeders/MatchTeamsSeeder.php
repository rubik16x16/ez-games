<?php

namespace Database\Seeders;

use App\Models\Team;
use App\Models\Tournament;
use App\Models\User;
use Illuminate\Database\Seeder;
use GuzzleHttp\Client;
use Faker\Factory;

class MatchTeamsSeeder extends Seeder{

	/**
	 * Run the database seeds.
	 *
	 * @return void
	 */
	public function run(){

		$tournament = Tournament::find(1);
		$matchId = '2021675361410879950';
		$client = new Client();
		$url = env('PROXY_SERVER') . '?api_key=' . env('PROXY_API_KEY') . "&premium_proxy=True" . "&url=https://api.tracker.gg/api/v2/warzone/standard/matches/{$matchId}";

		$res = $client->request('GET', $url);
		$data = json_decode($res->getBody());
		$team = collect();
		$teamPlayerCount = 0;
		$teamCount = 1;
		$faker = Factory::create();

		foreach($data->data->segments as $index => $playerData){

			if($teamPlayerCount == 3){

				$newTeam = new Team([
					'name' => 'Team ' . $teamCount
				]);

				$tournament->teams()->save($newTeam);
				foreach($team as $newPlayerData){

					$newPlayer = User::create($newPlayerData);
					$newPlayer->teams()->attach($newTeam);
				}

				$teamCount++;
				$team = collect();
				$teamPlayerCount = 0;
			}

			$team->push([
				'nickname' => $playerData->metadata->platformUserHandle,
				'email' => $faker->email(),
				'password' => '$2y$10$DPo9W89uwQsIqOFmsXDnl.cvW6sfYf/UGRN8GUURUQfk5hB/dIjGG',
				'platform' => 'psn',
			]);

			$teamPlayerCount++;
		}

		$newTeam = new Team([
			'name' => 'Team ' . $teamCount
		]);

		$tournament->teams()->save($newTeam);
		foreach($team as $newPlayerData){

			$newPlayer = User::create($newPlayerData);
			$newPlayer->teams()->attach($newTeam);
		}
	}
}
