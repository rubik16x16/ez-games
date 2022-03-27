<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TeamMatchData extends Model{
	use HasFactory;

	protected $table = 'team_match_data';
	protected $fillable = [
		'kills', 'deaths', 'kdratio'
	];

	public function match(){

		return $this->belongsTo(TournamentMatch::class);
	}

	public function team(){

		return $this->belongsTo(Team::class);
	}
}
