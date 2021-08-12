<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// add update product
Route::match(array('GET', 'POST'), 'add-update-product/{id?}', [UserController::class, 'add_update_product']);

// view product
Route::get('view-product', [UserController::class, 'view_product']);

// delete product
Route::get('delete-product/{id}', [UserController::class, 'delete_product']);

// cart-view
Route::get('cart-view', [UserController::class, 'cart_view']);
Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
