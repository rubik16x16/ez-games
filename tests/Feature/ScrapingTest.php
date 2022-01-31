<?php

namespace Tests\Feature;

use GuzzleHttp\Client;
use GuzzleHttp\Exception\ClientException;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ScrapingTest extends TestCase
{
    /**
     * A basic feature test example.
     *
     * @return void
     */
    public function test_scraping(){

			$client = new Client();
			$res = $client->request('GET', 'https://api.tracker.gg/api/v2/warzone/standard/matches/atvi/Iron%236056064?type=wz');

			$body = $res->getBody();

			dd($body);
    }
}
