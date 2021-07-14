<?php

namespace App\Http\Controllers;

use GuzzleHttp\Client;
use GuzzleHttp\Exception\ClientException;
use Illuminate\Http\Request;

class Profiles extends Controller{

    public function getUser($user){


        try{

            $client = new Client();
            $res = $client->request('GET', env('PROXY_SERVER') . '?api_key=' . env('PROXY_API_KEY') .  '&url=https://api.tracker.gg/api/v2/warzone/standard/profile/atvi/' . str_replace('#', '%23', $user) .'?');

            $body = $res->getBody();

        }catch(ClientException $e){

            $statusCode = $e->getCode();
            if($statusCode == 404){

                return response()->json('User not found', 404);
            }
        }

        return response($body->getContents())->header('Content-Type', 'application/json');
    }
}
