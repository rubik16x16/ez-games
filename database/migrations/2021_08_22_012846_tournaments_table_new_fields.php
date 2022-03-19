<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class TournamentsTableNewFields extends Migration{

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up(){

		Schema::table('tournaments', function(Blueprint $table){

			$table->unsignedBigInteger('winner_id')->nullable();
			$table->foreign('winner_id')->references('id')->on('teams')->onDelete('set null');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down(){

		Schema::table('tournaments', function(Blueprint $table){

			$table->dropForeign('tournaments_winner_id_foreign');
			$table->dropColumn('winner_id');
		});
	}
}
