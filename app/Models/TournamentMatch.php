<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TournamentMatch extends Model{
	use HasFactory;

	protected $table = 'matches';
	protected $fillable = [
		'duration', 'player_count',
		'map_name', 'mode_name'
	];

	public function tournament(){

		return $this->belongsTo(Tournament::class);
	}
}
