<?php

/* ================== Homepage ================== */
Route::get('/', 'HomeController@index');
Route::get('/home', 'HomeController@index');
Route::auth();

/* ================== Access Uploaded Files ================== */
Route::get('files/{hash}/{name}', 'LA\UploadsController@get_file');

/*
|--------------------------------------------------------------------------
| Admin Application Routes
|--------------------------------------------------------------------------
*/

$as = "";
if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
	$as = config('laraadmin.adminRoute').'.';

	// Routes for Laravel 5.3
	Route::get('/logout', 'Auth\LoginController@logout');
}

Route::group(['as' => $as, 'middleware' => ['auth', 'permission:ADMIN_PANEL']], function () {

	/* ================== Dashboard ================== */

	Route::get(config('laraadmin.adminRoute'), 'LA\DashboardController@index');
	Route::get(config('laraadmin.adminRoute'). '/dashboard', 'LA\DashboardController@index');

	/* ================== Users ================== */
	Route::resource(config('laraadmin.adminRoute') . '/users', 'LA\UsersController');
	Route::get(config('laraadmin.adminRoute') . '/user_dt_ajax', 'LA\UsersController@dtajax');

	/* ================== Uploads ================== */
	Route::resource(config('laraadmin.adminRoute') . '/uploads', 'LA\UploadsController');
	Route::post(config('laraadmin.adminRoute') . '/upload_files', 'LA\UploadsController@upload_files');
	Route::get(config('laraadmin.adminRoute') . '/uploaded_files', 'LA\UploadsController@uploaded_files');
	Route::post(config('laraadmin.adminRoute') . '/uploads_update_caption', 'LA\UploadsController@update_caption');
	Route::post(config('laraadmin.adminRoute') . '/uploads_update_filename', 'LA\UploadsController@update_filename');
	Route::post(config('laraadmin.adminRoute') . '/uploads_update_public', 'LA\UploadsController@update_public');
	Route::post(config('laraadmin.adminRoute') . '/uploads_delete_file', 'LA\UploadsController@delete_file');

	/* ================== Roles ================== */
	Route::resource(config('laraadmin.adminRoute') . '/roles', 'LA\RolesController');
	Route::get(config('laraadmin.adminRoute') . '/role_dt_ajax', 'LA\RolesController@dtajax');
	Route::post(config('laraadmin.adminRoute') . '/save_module_role_permissions/{id}', 'LA\RolesController@save_module_role_permissions');

	/* ================== Permissions ================== */
	Route::resource(config('laraadmin.adminRoute') . '/permissions', 'LA\PermissionsController');
	Route::get(config('laraadmin.adminRoute') . '/permission_dt_ajax', 'LA\PermissionsController@dtajax');
	Route::post(config('laraadmin.adminRoute') . '/save_permissions/{id}', 'LA\PermissionsController@save_permissions');

	/* ================== Departments ================== */
	Route::resource(config('laraadmin.adminRoute') . '/departments', 'LA\DepartmentsController');
	Route::get(config('laraadmin.adminRoute') . '/department_dt_ajax', 'LA\DepartmentsController@dtajax');

	/* ================== Employees ================== */
	Route::resource(config('laraadmin.adminRoute') . '/employees', 'LA\EmployeesController');
	Route::get(config('laraadmin.adminRoute') . '/employee_dt_ajax', 'LA\EmployeesController@dtajax');
	Route::post(config('laraadmin.adminRoute') . '/change_password/{id}', 'LA\EmployeesController@change_password');

	/* ================== Organizations ================== */
	Route::resource(config('laraadmin.adminRoute') . '/organizations', 'LA\OrganizationsController');
	Route::get(config('laraadmin.adminRoute') . '/organization_dt_ajax', 'LA\OrganizationsController@dtajax');

	/* ================== Backups ================== */
	Route::resource(config('laraadmin.adminRoute') . '/backups', 'LA\BackupsController');
	Route::get(config('laraadmin.adminRoute') . '/backup_dt_ajax', 'LA\BackupsController@dtajax');
	Route::post(config('laraadmin.adminRoute') . '/create_backup_ajax', 'LA\BackupsController@create_backup_ajax');
	Route::get(config('laraadmin.adminRoute') . '/downloadBackup/{id}', 'LA\BackupsController@downloadBackup');

	/* ================== Trucks ================== */
	Route::resource(config('laraadmin.adminRoute') . '/trucks', 'LA\TrucksController');
	Route::get(config('laraadmin.adminRoute') . '/truck_dt_ajax', 'LA\TrucksController@dtajax');

	/* ================== Relations ================== */
	Route::resource(config('laraadmin.adminRoute') . '/relations', 'LA\RelationsController');
	Route::get(config('laraadmin.adminRoute') . '/relation_dt_ajax', 'LA\RelationsController@dtajax');

	/* ================== Jenis ================== */
	Route::resource(config('laraadmin.adminRoute') . '/jenis', 'LA\JenisController');
	Route::get(config('laraadmin.adminRoute') . '/jeni_dt_ajax', 'LA\JenisController@dtajax');


	/* ================== Merks ================== */
	Route::resource(config('laraadmin.adminRoute') . '/merks', 'LA\MerksController');
	Route::get(config('laraadmin.adminRoute') . '/merk_dt_ajax', 'LA\MerksController@dtajax');

	/* ================== Items ================== */
	Route::resource(config('laraadmin.adminRoute') . '/items', 'LA\ItemsController');
	Route::get(config('laraadmin.adminRoute') . '/item_dt_ajax', 'LA\ItemsController@dtajax');

	/* ================== Penjualans ================== */
	Route::get('admin/tambahpenjualan','LA\PenjualansController@tambahpenjualan');

	//route buat faktur
	Route::get('admin/penjualans/showfaktur/{id}','LA\PenjualansController@showfaktur');

	//route buat surat jalan
	Route::get('admin/penjualans/showsuratjalan/{id}','LA\PenjualansController@showsuratjalan');

	Route::resource(config('laraadmin.adminRoute') . '/penjualans', 'LA\PenjualansController');
	Route::get(config('laraadmin.adminRoute') . '/penjualan_dt_ajax', 'LA\PenjualansController@dtajax');

	/* ================== Pembelians ================== */
	Route::get('admin/tambahpembelian','LA\PembeliansController@tambahpembelian');

	Route::resource(config('laraadmin.adminRoute') . '/pembelians', 'LA\PembeliansController');
	Route::get(config('laraadmin.adminRoute') . '/pembelian_dt_ajax', 'LA\PembeliansController@dtajax');


	/* ================== Gudangs ================== */
	Route::resource(config('laraadmin.adminRoute') . '/gudangs', 'LA\GudangsController');
	Route::get(config('laraadmin.adminRoute') . '/gudang_dt_ajax', 'LA\GudangsController@dtajax');

	/* ================== Tallies ================== */
	Route::resource(config('laraadmin.adminRoute') . '/tallies', 'LA\TalliesController');
	Route::get(config('laraadmin.adminRoute') . '/tally_dt_ajax', 'LA\TalliesController@dtajax');

	/* ================== Warehouses ================== */
	Route::resource(config('laraadmin.adminRoute') . '/warehouses', 'LA\WarehousesController');
	Route::get(config('laraadmin.adminRoute') . '/warehouse_dt_ajax', 'LA\WarehousesController@dtajax');

    /* ================== Relations ================== */
	Route::resource(config('laraadmin.adminRoute') . '/relations', 'LA\RelationsController');
	Route::get(config('laraadmin.adminRoute') . '/relation_dt_ajax', 'LA\RelationsController@dtajax');


	/* ================== Processings ================== */
	Route::get('admin/tambahprocessing','LA\ProcessingsController@tambahprocessing');

	Route::resource(config('laraadmin.adminRoute') . '/processings', 'LA\ProcessingsController');
	Route::get(config('laraadmin.adminRoute') . '/processing_dt_ajax', 'LA\ProcessingsController@dtajax');

	/* ================== TransferStocks ================== */
	Route::get('admin/transferstock','LA\TransferStocksController@transferstock');

	Route::resource(config('laraadmin.adminRoute') . '/transferstocks', 'LA\TransferStocksController');
	Route::get(config('laraadmin.adminRoute') . '/transferstock_dt_ajax', 'LA\TransferStocksController@dtajax');

	/* ================== Pembelians ================== */
	Route::resource(config('laraadmin.adminRoute') . '/pembelians', 'LA\PembeliansController');
	Route::get(config('laraadmin.adminRoute') . '/pembelian_dt_ajax', 'LA\PembeliansController@dtajax');


	/* ================== DaftarBarangs ================== */
	Route::resource(config('laraadmin.adminRoute') . '/daftarbarangs', 'LA\DaftarBarangsController');
	Route::get(config('laraadmin.adminRoute') . '/daftarbarang_dt_ajax', 'LA\DaftarBarangsController@dtajax');

	/* ================== BarangKeluars ================== */
	Route::resource(config('laraadmin.adminRoute') . '/barangkeluars', 'LA\BarangKeluarsController');
	Route::get(config('laraadmin.adminRoute') . '/barangkeluar_dt_ajax', 'LA\BarangKeluarsController@dtajax');



	/* ================== BarangOuts ================== */
	Route::resource(config('laraadmin.adminRoute') . '/barangouts', 'LA\BarangOutsController');
	Route::get(config('laraadmin.adminRoute') . '/barangout_dt_ajax', 'LA\BarangOutsController@dtajax');



	/* ================== Piutangs ================== */
	Route::resource(config('laraadmin.adminRoute') . '/piutangs', 'LA\PiutangsController');
	Route::get(config('laraadmin.adminRoute') . '/piutang_dt_ajax', 'LA\PiutangsController@dtajax');

	/* ================== Pembelians ================== */
	Route::resource(config('laraadmin.adminRoute') . '/pembelians', 'LA\PembeliansController');
	Route::get(config('laraadmin.adminRoute') . '/pembelian_dt_ajax', 'LA\PembeliansController@dtajax');

	/* ================== Hutangs ================== */
	Route::resource(config('laraadmin.adminRoute') . '/hutangs', 'LA\HutangsController');
	Route::get(config('laraadmin.adminRoute') . '/hutang_dt_ajax', 'LA\HutangsController@dtajax');

	/* ================== BarangIns ================== */
	Route::resource(config('laraadmin.adminRoute') . '/barangins', 'LA\BarangInsController');
	Route::get(config('laraadmin.adminRoute') . '/barangin_dt_ajax', 'LA\BarangInsController@dtajax');

});
