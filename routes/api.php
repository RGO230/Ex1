<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\PaysumController;
use App\Http\Controllers\TransactionController;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout']);
Route::post('/refresh', [AuthController::class, 'refresh']);

Route::group(['middleware' => 'auth:sanctum'], function () {
    Route::post('/employee', [EmployeeController::class, 'create']);
    Route::post('/transaction', [TransactionController::class, 'create']);
    Route::get('/transaction/sum', [TransactionController::class, 'checkSum']);
    Route::post('/transaction/pay', [TransactionController::class, 'pay']);
});
