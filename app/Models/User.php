<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Auth\Passwords\CanResetPassword;
use Laravel\Passport\HasApiTokens;
use App\Notifications\ResetPasswordNotification;

class User extends Authenticatable{

	use HasFactory, Notifiable, HasApiTokens, CanResetPassword;

	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = [
		'nickname',
		'email',
		'password',
	];

	/**
	 * The attributes that should be hidden for arrays.
	 *
	 * @var array
	 */
	protected $hidden = [
		'password',
		'remember_token',
	];

	/**
	 * The attributes that should be cast to native types.
	 *
	 * @var array
	 */
	protected $casts = [
		'email_verified_at' => 'datetime',
	];

	public function teams(){

		return $this->belongsToMany(Team::class, 'user_team')->withPivot('confirmed');
	}

	public function pays(){

		return $this->hasMany(UserPay::class);
	}

	public function teamsCaptain(){

		return $this->hasMany(Team::class, 'captain_id');
	}

	public function matchesData(){

		return $this->hasMany(UserMatchData::class);
	}

	/**
	 * Send a password reset notification to the user.
	 *
	 * @param  string  $token
	 * @return void
	 */
	public function sendPasswordResetNotification($token){

		$this->notify(new ResetPasswordNotification([
			'token' => $token,
			'email' => $this->email
		]));
	}
}
