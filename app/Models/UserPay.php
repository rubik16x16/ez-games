<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserPay extends Model{
	use HasFactory;

	protected $table = 'user_pay';
	protected $fillable = ['payment_id', 'amount'];
}
