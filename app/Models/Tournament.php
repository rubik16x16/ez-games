<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tournament extends Model{
    use HasFactory;

		protected $table = 'tournaments';
		protected $fillable = [
			'name', 'start', 'end'
		];

		public function teams(){

			return $this->hasMany(Team::class);
		}

		public function winner(){

			return $this->belongsTo(Team::class, 'winner_id');
		}
}
