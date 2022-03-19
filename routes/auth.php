<?php

use App\Http\Controllers\Auth\Login;
use App\Http\Controllers\Auth\Register;
use Illuminate\Support\Facades\Route;

Route::post('/register', [Register::class, 'store']);
Route::post('/login', [Login::class, 'authenticate'])->name('auth.login');
Route::post('/logout', [Login::class, 'destroy'])->name('auth.logout');
Route::get('/verify-email/{token}', [Register::class, 'verifyEmail'])->name('verify-email');
