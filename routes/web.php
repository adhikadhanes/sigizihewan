<?php

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
Route::post('/storePenjualan','LA\PenjualansController@storePenjualan');
Route::get('/penjualantest', 'LA\PenjualansController@penjualantest');
Route::get('search',array('as'=>'search','uses'=>'SearchController@search'));
Route::get('autocomplete',array('as'=>'autocomplete','uses'=>'SearchController@autocomplete'));
Route::get('admin/tambahpenjualanretail','LA\PenjualansController@tambahpenjualanretail');
Route::get('admin/stokRetail', 'LA\ItemsController@stokRetail');
Route::get('admin/stokWholesale', 'LA\ItemsController@stokWholesale');
Route::get('admin/tallyCoba', 'LA\BarangInsController@tallyCoba');
Route::post('/tallySimpan','LA\BarangInsController@tallySimpan');


/* ================== Homepage + Admin Routes ================== */

require __DIR__.'/admin_routes.php';
