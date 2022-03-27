<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMatchesTable extends Migration{

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up(){

		Schema::create('matches', function (Blueprint $table) {
			$table->bigInteger('id');
			$table->primary('id');
			$table->integer('duration')->nullable();
			$table->integer('player_count')->nullable();
			$table->string('map_name')->nullable();
			$table->string('mode_name')->nullable();
			$table->unsignedBigInteger('tournament_id');
			$table->foreign('tournament_id')->references('id')->on('tournaments');
			$table->timestamps();
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down(){

		Schema::dropIfExists('matches');
	}
}
