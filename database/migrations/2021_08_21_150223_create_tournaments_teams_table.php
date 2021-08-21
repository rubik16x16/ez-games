<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTournamentsTeamsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tournaments_teams', function (Blueprint $table) {
            $table->id();
						$table->unsignedBigInteger('tournament_id');
						$table->unsignedBigInteger('team_id');
						$table->foreign('tournament_id')->references('id')->on('tournaments')->onDelete('cascade');
						$table->foreign('team_id')->references('id')->on('teams')->onDelete('cascade');
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
        Schema::dropIfExists('tournaments_teams');
    }
}
