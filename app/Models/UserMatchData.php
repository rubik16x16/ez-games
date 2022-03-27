<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserMatchData extends Model{
	use HasFactory;

	protected $table = 'user_match_data';
	protected $fillable = [
		'kills', 'deaths', 'kdratio'
	];

	public function match(){

		return $this->belongsTo(TournamentMatch::class);
	}

	public function user(){

		return $this->belongsTo(User::class);
	}
}
