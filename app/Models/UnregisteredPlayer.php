<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UnregisteredPlayer extends Model{
  use HasFactory;

  protected $table = 'unregistered_players';
  protected $fillable = [
  	'email'
  ];

  public function team(){

  	return $this->belongsTo(Team::class);
  }
}
