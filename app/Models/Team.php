<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Team extends Model{
	use HasFactory;

	protected $table = 'teams';
	protected $fillable = [
		'name'
	];

	public function tournament(){

		return $this->belongsTo(Tournament::class);
	}

	public function players(){

		return $this->belongsToMany(User::class, 'user_team')->withPivot('confirmed');
	}

	public function captain(){

		return $this->belongsTo(User::class, 'captain_id');
	}

	public function matchesData(){

		return $this->hasMany(TeamMatchData::class);
	}

	public function unregisteredPlayers(){

		return $this->hasMany(UnregisteredPlayer::class);
	}
}
