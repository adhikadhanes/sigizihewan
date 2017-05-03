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
use App\Models\Item;
use App\Models\Merk;
use App\Models\Processing;

class ProcessingsController extends Controller
{
	public $show_action = true;
	public $view_col = 'tgl_processing';
	public $listing_cols = ['id', 'tgl_processing', 'jenis_barang_awal', 'merk_barang_awal', 'berat_perkiraan', 'carton_perkiraan', 'berat_aktual', 'carton_aktual', 'jenis_barang_akhir', 'merk_akhir_akhir', 'berat_perkiraan_akhr', 'berat_aktual_akhir'];

	public function __construct() {
		// Field Access of Listing Columns
		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
			$this->middleware(function ($request, $next) {
				$this->listing_cols = ModuleFields::listingColumnAccessScan('Processings', $this->listing_cols);
				return $next($request);
			});
		} else {
			$this->listing_cols = ModuleFields::listingColumnAccessScan('Processings', $this->listing_cols);
		}
	}

	/**
	 * Display a listing of the Processings.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		$module = Module::get('Processings');

		if(Module::hasAccess($module->id)) {
			return View('la.processings.index', [
				'show_actions' => $this->show_action,
				'listing_cols' => $this->listing_cols,
				'module' => $module
			]);
		} else {
            return redirect(config('laraadmin.adminRoute')."/");
        }
	}

	/**
	 * Show the form for creating a new processing.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created processing in database.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{
		if(Module::hasAccess("Processings", "create")) {

			$rules = Module::validateRules("Processings", $request);

			$validator = Validator::make($request->all(), $rules);

			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();
			}

			$insert_id = Module::insert("Processings", $request);

			return redirect()->route(config('laraadmin.adminRoute') . '.processings.index');

		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}


	public function storePenjualan(Request $request)
	{

		$penjualan = new Penjualan;
		$number = (rand(1,10000));
		$order_id = 'IDSO'.str_pad((int) $number,4,"0",STR_PAD_LEFT);
		// $order_id = generateOrder();

		$penjualan->order_id = $order_id;
		$penjualan->tgl_penjualan = $request->tgl_penjualan;
		$penjualan->nama_pembeli = $request->nama_pembeli;
		$penjualan->gudang_pengiriman = $request->gudang_pengiriman;
		$penjualan->nama_pembeli = $request->nama_pembeli;
		$penjualan->tanggal_pengiriman = $request->tanggal_pengiriman;
		$penjualan->cara_penerimaan = $request->cara_penerimaan;
		$penjualan->gudang_pengiriman = $request->gudang_pengiriman;
		$penjualan->cara_pembayaran = $request->cara_pembayaran;
		$penjualan->tgl_jatuh_tempo = $request->tgl_jatuh_tempo;

		$penjualan->save();
		$id_penjualan = $penjualan->id;

		$form = $_POST['baris'];

		foreach ( $form as $form)
			{
				// here you have access to $diam['top'] and $diam['bottom']

			$barang = new BarangOut;

			$barang->id_penjualan = $id_penjualan;
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
	 * Display the specified processing.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		if(Module::hasAccess("Processings", "view")) {

			$processing = Processing::find($id);
			if(isset($processing->id)) {
				$module = Module::get('Processings');
				$module->row = $processing;

				return view('la.processings.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('processing', $processing);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("processing"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Show the form for editing the specified processing.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
		if(Module::hasAccess("Processings", "edit")) {
			$processing = Processing::find($id);
			if(isset($processing->id)) {
				$module = Module::get('Processings');

				$module->row = $processing;

				return view('la.processings.edit', [
					'module' => $module,
					'view_col' => $this->view_col,
				])->with('processing', $processing);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("processing"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Update the specified processing in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{
		if(Module::hasAccess("Processings", "edit")) {

			$rules = Module::validateRules("Processings", $request, true);

			$validator = Validator::make($request->all(), $rules);

			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();;
			}

			$insert_id = Module::updateRow("Processings", $request, $id);

			return redirect()->route(config('laraadmin.adminRoute') . '.processings.index');

		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Remove the specified processing from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		if(Module::hasAccess("Processings", "delete")) {
			Processing::find($id)->delete();

			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.processings.index');
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
		$values = DB::table('processings')->select($this->listing_cols)->whereNull('deleted_at');
		$out = Datatables::of($values)->make();
		$data = $out->getData();

		$fields_popup = ModuleFields::getModuleFields('Processings');

		for($i=0; $i < count($data->data); $i++) {
			for ($j=0; $j < count($this->listing_cols); $j++) {
				$col = $this->listing_cols[$j];
				if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
					$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
				}
				if($col == $this->view_col) {
					$data->data[$i][$j] = '<a href="'.url(config('laraadmin.adminRoute') . '/processings/'.$data->data[$i][0]).'">'.$data->data[$i][$j].'</a>';
				}
				// else if($col == "author") {
				//    $data->data[$i][$j];
				// }
			}

			if($this->show_action) {
				$output = '';
				if(Module::hasAccess("Processings", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/processings/'.$data->data[$i][0].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}

				if(Module::hasAccess("Processings", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.processings.destroy', $data->data[$i][0]], 'method' => 'delete', 'style'=>'display:inline']);
					$output .= ' <button class="btn btn-danger btn-xs" type="submit"><i class="fa fa-times"></i></button>';
					$output .= Form::close();
				}
				$data->data[$i][] = (string)$output;
			}
		}
		$out->setData($data);
		return $out;
	}

		public function tambahprocessing()
	{
		$merkList = Merk::pluck('nama', 'nama')->all();
		$jenisList = Item::pluck('nama_jenis', 'nama_jenis')->all();
		return view('la.processings.add', compact('jenisList', 'merkList'));

	}

		public function autocomplete(Request $request)
    {
        $data = Item::select("title as name")->where("nama_jenis","LIKE","%{$request->input('query')}%")->get();
        return response()->json($data);
    }
}
