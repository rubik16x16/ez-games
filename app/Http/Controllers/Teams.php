<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Team;
use App\Models\Tournament;

class Teams extends Controller{

  /**
   * Display a listing of the resource.
   *
   * @return \Illuminate\Http\Response
   */
  public function index(){

  	return response()->json(Team::all());
  }

  /**
   * Show the form for creating a new resource.
   *
   * @return \Illuminate\Http\Response
   */
  public function create()
  {
      //
  }

  /**
   * Store a newly created resource in storage.
   *
   * @param  \Illuminate\Http\Request  $request
   * @return \Illuminate\Http\Response
   */
  public function store(Request $request, $tournamentId){

  	try {

			DB::beginTransaction();
			$tournament = Tournament::find($tournamentId);
			$team = new Team(['name' => $request->name]);
			$tournament->teams()->save($team);
			$players = collect($request->players)->map(function($item) {
	  		return $item['id'];
	  	});

	  	$players->push($request->user()->id);
	  	$team->players()->attach($players);

			DB::commit();
		} catch (\Exception $e) {

			DB::rollback();
			return response()->json($e->getMessage());
		}

		return response()->json(null, 201);
  }

  /**
   * Display the specified resource.
   *
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
  public function show($id)
  {
      //
  }

  /**
   * Show the form for editing the specified resource.
   *
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
  public function edit($id)
  {
      //
  }

  /**
   * Update the specified resource in storage.
   *
   * @param  \Illuminate\Http\Request  $request
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
  public function update(Request $request, $id)
  {
      //
  }

  /**
   * Remove the specified resource from storage.
   *
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
  public function destroy($id)
  {
      //
  }
}
