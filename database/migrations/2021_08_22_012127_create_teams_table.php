<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTeamsTable extends Migration{
  /**
   * Run the migrations.
   *
   * @return void
   */
  public function up(){
    Schema::create('teams', function (Blueprint $table) {
      $table->id();
			$table->string('name');
			$table->unsignedBigInteger('tournament_id');
			$table->foreign('tournament_id')->references('id')->on('tournaments')->onDelete('cascade');
      $table->timestamps();
    });
  }

  /**
   * Reverse the migrations.
   *
   * @return void
   */
  public function down()
  {
    Schema::dropIfExists('teams');
  }
}
