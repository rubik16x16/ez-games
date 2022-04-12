<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\Login;
use App\Http\Controllers\Auth\Register;
use App\Http\Controllers\Auth\ForgotPassword;

Route::post('/register', [Register::class, 'store']);
Route::post('/login', [Login::class, 'authenticate'])->name('auth.login');
Route::post('/logout', [Login::class, 'destroy'])->name('auth.logout');
Route::get('/verify-email/{token}', [Register::class, 'verifyEmail'])->name('verify-email');
Route::get('/reset-password', [ForgotPassword::class, 'sendEmail'])->name('reset-password.sendEmail');
Route::post('/reset-password', [ForgotPassword::class, 'resetPassword'])->name('reset-password.resetPassword');
