<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class UserVerificationToken extends Model{
	use HasFactory;

	protected $table = 'user_verification_tokens';
	protected $fillable = ['token'];

	public function user(){

		return $this->belongsTo(User::class);
	}
}
