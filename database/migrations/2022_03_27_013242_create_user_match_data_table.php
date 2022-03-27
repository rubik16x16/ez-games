<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserMatchDataTable extends Migration{

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up(){

		Schema::create('user_match_data', function (Blueprint $table) {
			$table->id();
			$table->integer('kills');
			$table->integer('deaths');
			$table->integer('kdratio');
			$table->unsignedBigInteger('user_id');
			$table->bigInteger('match_id');
			$table->foreign('match_id')->references('id')->on('matches')->onDelete('cascade');
			$table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
			$table->timestamps();
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down(){

		Schema::dropIfExists('user_match_data');
	}
}
