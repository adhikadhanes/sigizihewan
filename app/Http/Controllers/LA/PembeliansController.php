<?php
/**
 * Controller genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App\Http\Controllers\LA;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests;
use Auth;
use DB;
use Validator;
use Datatables;
use Collective\Html\FormFacade as Form;
use Dwij\Laraadmin\Models\Module;
use Dwij\Laraadmin\Models\ModuleFields;

use App\Models\Pembelian;
use Illuminate\Support\Facades\Input;
use App\Models\Item;
use App\Models\Jeni;
use App\Models\Relation;
use App\Models\Gudang;
use App\Models\BarangIn;

use App\Models\Merk;



class PembeliansController extends Controller
{
	public $show_action = true;
	public $view_col = 'po_id';
	public $listing_cols = ['id', 'po_id', 'tgl_pembelian', 'nama_penjual', 'tanggal_penerimaan', 'cara_penerimaan', 'cara_pembayaran', 'gdg_penerimaan', 'status', 'status_penerimaan'];

	public function __construct() {
		// Field Access of Listing Columns
		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
			$this->middleware(function ($request, $next) {
				$this->listing_cols = ModuleFields::listingColumnAccessScan('Pembelians', $this->listing_cols);
				return $next($request);
			});
		} else {
			$this->listing_cols = ModuleFields::listingColumnAccessScan('Pembelians', $this->listing_cols);
		}
	}

	public function tambahpembelian()
	{
		$jenisList = Jeni::pluck('nama', 'id')->all();
		$merkList = Merk::pluck('nama', 'id')->all();
		$gudangList = Gudang::pluck('name', 'id')->all();
		$relationList = Relation::pluck('nama', 'id')->all();
		return view('la.pembelians.add', compact('relationList','jenisList', 'merkList','gudangList'));

	}
	/**
	 * Display a listing of the Pembelians.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		$module = Module::get('Pembelians');

		if(Module::hasAccess($module->id)) {
			return View('la.pembelians.index', [
				'show_actions' => $this->show_action,
				'listing_cols' => $this->listing_cols,
				'module' => $module
			]);
		} else {
            return redirect(config('laraadmin.adminRoute')."/");
        }
	}

	/**
	 * Show the form for creating a new pembelian.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created pembelian in database.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{
		if(Module::hasAccess("Pembelians", "create")) {

			$rules = Module::validateRules("Pembelians", $request);

			$validator = Validator::make($request->all(), $rules);

			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();
			}

			$insert_id = Module::insert("Pembelians", $request);

			return redirect()->route(config('laraadmin.adminRoute') . '.pembelians.index');

		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	function generateOrder() {

	 $number = (rand(1,10000));
	 $po_id = 'IDPO'.str_pad((int) $number,4,"0",STR_PAD_LEFT);
	 return $po_id;

 }

	public function storePembelian(Request $request)
	{

		$pembelian = new Pembelian;
		$number = (rand(1,10000));
		$po_id = 'IDPO'.str_pad((int) $number,4,"0",STR_PAD_LEFT);
		// $order_id = generateOrder();

		$pembelian->po_id = $po_id;
		$pembelian->tgl_pembelian = $request->tgl_pembelian;
		$pembelian->nama_penjual = $request->nama_penjual;
		$pembelian->gdg_penerimaan = $request->gdg_penerimaan;
		$pembelian->tanggal_penerimaan = $request->tanggal_penerimaan;
		$pembelian->cara_penerimaan = $request->cara_penerimaan;
		$pembelian->cara_pembayaran = $request->cara_pembayaran;
		$pembelian->tgl_jatuh_tempo = $request->tgl_jatuh_tempo;

		$pembelian->save();
		$po_id = $pembelian->id;

		$form = $_POST['baris'];

		foreach ( $form as $form)
			{
				// here you have access to $diam['top'] and $diam['bottom']

			$barang = new BarangIn;

			$barang->po_id = $po_id;
					$barang->jenis = $form['jenis_daging'];
					$barang->merk = $form['merk_daging'];
					$barang->berat_kg = $form['berat'];
					$barang->karton = $form['karton'];
					$barang->harga_kg = $form['harga_kg'];

				$barang->save();

			}

			return redirect(config('laraadmin.adminRoute')."/");

	}

	/**
	 * Display the specified pembelian.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		if(Module::hasAccess("Pembelians", "view")) {

			$pembelian = Pembelian::find($id);
			if(isset($pembelian->id)) {
				$module = Module::get('Pembelians');
				$module->row = $pembelian;

				return view('la.pembelians.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('pembelian', $pembelian);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("pembelian"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Show the form for editing the specified pembelian.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
		if(Module::hasAccess("Pembelians", "edit")) {
			$pembelian = Pembelian::find($id);
			if(isset($pembelian->id)) {
				$module = Module::get('Pembelians');

				$module->row = $pembelian;

				return view('la.pembelians.edit', [
					'module' => $module,
					'view_col' => $this->view_col,
				])->with('pembelian', $pembelian);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("pembelian"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Update the specified pembelian in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{
		if(Module::hasAccess("Pembelians", "edit")) {

			$rules = Module::validateRules("Pembelians", $request, true);

			$validator = Validator::make($request->all(), $rules);

			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();;
			}

			$insert_id = Module::updateRow("Pembelians", $request, $id);

			return redirect()->route(config('laraadmin.adminRoute') . '.pembelians.index');

		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Remove the specified pembelian from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		if(Module::hasAccess("Pembelians", "delete")) {
			Pembelian::find($id)->delete();

			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.pembelians.index');
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Datatable Ajax fetch
	 *
	 * @return
	 */
	public function dtajax()
	{
		$values = DB::table('pembelians')->select($this->listing_cols)->whereNull('deleted_at');
		$out = Datatables::of($values)->make();
		$data = $out->getData();

		$fields_popup = ModuleFields::getModuleFields('Pembelians');

		for($i=0; $i < count($data->data); $i++) {
			for ($j=0; $j < count($this->listing_cols); $j++) {
				$col = $this->listing_cols[$j];
				if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
					$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
				}
				if($col == $this->view_col) {
					$data->data[$i][$j] = '<a href="'.url(config('laraadmin.adminRoute') . '/pembelians/'.$data->data[$i][0]).'">'.$data->data[$i][$j].'</a>';
				}
				// else if($col == "author") {
				//    $data->data[$i][$j];
				// }
			}

			if($this->show_action) {
				$output = '';
				if(Module::hasAccess("Pembelians", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/pembelians/'.$data->data[$i][0].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}

				if(Module::hasAccess("Pembelians", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.pembelians.destroy', $data->data[$i][0]], 'method' => 'delete', 'style'=>'display:inline']);
					$output .= ' <button class="btn btn-danger btn-xs" type="submit"><i class="fa fa-times"></i></button>';
					$output .= Form::close();
				}
				$data->data[$i][] = (string)$output;
			}
		}
		$out->setData($data);
		return $out;
	}
}
