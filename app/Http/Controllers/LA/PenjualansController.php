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
use App\Models\Tally;
use Collective\Html\FormFacade as Form;
use Dwij\Laraadmin\Models\Module;
use Dwij\Laraadmin\Models\ModuleFields;

use App\Models\Penjualan;
use Illuminate\Support\Facades\Input;
use App\Models\Item;
use App\Models\Relation;
use App\Models\Merk;

class PenjualansController extends Controller
{
	public $show_action = true;
	public $view_col = 'order_id';
	public $listing_cols = ['id', 'tgl_penjualan', 'nama_pembeli', 'nama_pembeli_retail', 'tanggal_penerimaan', 'cara_penerimaan', 'cara_pembayaran', 'tgl_jatuh_tempo', 'Gdg Pengiriman', 'order_id'];
	// public static $add_rules = array(
	// 	'nama_pembeli' => 'required',
	// 	'nama_pembeli_retail' => 'required'
	// 	);
	public function __construct() {
		// Field Access of Listing Columns
		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
			$this->middleware(function ($request, $next) {
				$this->listing_cols = ModuleFields::listingColumnAccessScan('Penjualans', $this->listing_cols);
				return $next($request);
			});
		} else {
			$this->listing_cols = ModuleFields::listingColumnAccessScan('Penjualans', $this->listing_cols);
		}
	}

	public function tambahpenjualan()
	{
		$jenisList = Item::pluck('nama_jenis', 'nama_jenis')->all();
		$merkList = Item::pluck('nama', 'id')->all();
		$relationList = Relation::pluck('nama', 'id')->all();
		return view('la.penjualans.add', compact('relationList','jenisList', 'merkList'));

	}
	public function tambahpenjualanretail()
	{

		$jenisList = Item::pluck('nama_jenis', 'nama_jenis')->all();
		$merkList = Item::pluck('nama', 'id')->all();
		$relationList = Relation::pluck('nama', 'id')->all();
		return view('la.penjualans.addRetail', compact('relationList','jenisList', 'merkList'));
	}
		public function autocomplete(Request $request)
    {
        $data = Item::select("title as name")->where("nama_jenis","LIKE","%{$request->input('query')}%")->get();
        return response()->json($data);
    }

	/**
	 * Display a listing of the Penjualans.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		$module = Module::get('Penjualans');

		if(Module::hasAccess($module->id)) {
			return View('la.penjualans.index', [
				'show_actions' => $this->show_action,
				'listing_cols' => $this->listing_cols,
				'module' => $module
			]);
		} else {
            return redirect(config('laraadmin.adminRoute')."/");
        }
	}

	/**
	 * Show the form for creating a new penjualan.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		//
	}

	public function penjualantest()
	{
		$jenisList = Item::all();
		return $jenisList;
	}

	/**
	 * Store a newly created penjualan in database.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{
		if(Module::hasAccess("Penjualans", "create")) {

			$rules = Module::validateRules("Penjualans", $request);

			$validator = Validator::make($request->all(), $rules);

			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();
			}

			$insert_id = Module::insert("Penjualans", $request);

			return redirect()->route(config('laraadmin.adminRoute') . '.penjualans.index');

		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	public function storeTally(Request $request)
	{

		$nomor = $request->nomor;

		for ($i=0; $i < $nomor; $i++) {
			$data = array(
				'jenis_daging' => (int)Input::get('jenis_daging'.$i),
				'merk_daging' => (int)Input::get('merk_daging'.$i),
				'berat' => Input::get('berat'.$i),
				'karton' => Input::get('karton'.$i),
				'harga_kg' => '1',
			);

			$flight = new Tally;

	  //       $flight->jenis_daging = $request->jenis_daging;
	  //       	        $flight->merk_daging = $request->merk_daging;
	  //       	        	        $flight->berat = $request->berat;
	  //       	        	        	        $flight->karton = $request->karton;
	  //       	        	        	        	        $flight->harga_kg = $request->harga_kg;

	        $flight->save();

 // DB::table('tallies')->insert(['jenis_daging' => $data['jenis_daging'], 'merk_daging' => $data['merk_daging'], 'berat' => $data['berat'], 'karton' => $data['karton'],]);

			echo $data['jenis_daging'];

		}

		return "success";
	}

	/**
	 * Display the specified penjualan.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		if(Module::hasAccess("Penjualans", "view")) {

			$penjualan = Penjualan::find($id);
			if(isset($penjualan->id)) {
				$module = Module::get('Penjualans');
				$module->row = $penjualan;

				return view('la.penjualans.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('penjualan', $penjualan);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("penjualan"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Show the form for editing the specified penjualan.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
		if(Module::hasAccess("Penjualans", "edit")) {
			$penjualan = Penjualan::find($id);
			if(isset($penjualan->id)) {
				$module = Module::get('Penjualans');

				$module->row = $penjualan;

				return view('la.penjualans.edit', [
					'module' => $module,
					'view_col' => $this->view_col,
				])->with('penjualan', $penjualan);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("penjualan"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Update the specified penjualan in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{
		if(Module::hasAccess("Penjualans", "edit")) {

			$rules = Module::validateRules("Penjualans", $request, true);

			$validator = Validator::make($request->all(), $rules);

			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();;
			}

			$insert_id = Module::updateRow("Penjualans", $request, $id);

			return redirect()->route(config('laraadmin.adminRoute') . '.penjualans.index');

		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Remove the specified penjualan from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		if(Module::hasAccess("Penjualans", "delete")) {
			Penjualan::find($id)->delete();

			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.penjualans.index');
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
		$values = DB::table('penjualans')->select($this->listing_cols)->whereNull('deleted_at');
		$out = Datatables::of($values)->make();
		$data = $out->getData();

		$fields_popup = ModuleFields::getModuleFields('Penjualans');

		for($i=0; $i < count($data->data); $i++) {
			for ($j=0; $j < count($this->listing_cols); $j++) {
				$col = $this->listing_cols[$j];
				if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
					$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
				}
				if($col == $this->view_col) {
					$data->data[$i][$j] = '<a href="'.url(config('laraadmin.adminRoute') . '/penjualans/'.$data->data[$i][0]).'">'.$data->data[$i][$j].'</a>';
				}
				// else if($col == "author") {
				//    $data->data[$i][$j];
				// }
			}

			if($this->show_action) {
				$output = '';
				if(Module::hasAccess("Penjualans", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/penjualans/'.$data->data[$i][0].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}

				if(Module::hasAccess("Penjualans", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.penjualans.destroy', $data->data[$i][0]], 'method' => 'delete', 'style'=>'display:inline']);
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
