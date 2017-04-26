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
use App\Models\Jeni;
use App\Models\Relation;
use App\Models\Gudang;
use App\Models\BarangOut;

use App\Models\Merk;
 

class PenjualansController extends Controller
{
	public $show_action = true;
	public $view_col = 'order_id';
	public $listing_cols = ['id', 'tgl_penjualan', 'nama_pembeli', 'nama_pembeli_retail', 'tanggal_pengiriman', 'cara_penerimaan', 'cara_pembayaran', 'tgl_jatuh_tempo', 'gudang_pengiriman', 'order_id','status','keterangan','total_harga'];
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
		$jenisList = Jeni::pluck('nama', 'id')->all();
		$merkList = Merk::pluck('nama', 'id')->all();
		$gudangList = Gudang::pluck('name', 'id')->all();
		$relationList = Relation::pluck('nama', 'id')->all();
		return view('la.penjualans.add', compact('relationList','jenisList', 'merkList','gudangList'));

	}

	public function tallyCoba()
	{
		return view('la.penjualans.addTally');
	}

	public function tallySimpan()
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
		$penjualan->tgl_jatuh_tempo = 		$request->tgl_jatuh_tempo;

		$penjualan->save();
		$id_penjualan = $penjualan->id;

		$form = $_POST['name'];

		foreach ($form as $form) {
			$berat = new Penjualan;

			$berat->id_penjualan = $id_penjualan;
	        $berat->satu = $form['satu'];
	       	$berat->dua = $form['dua'];
	        $berat->tiga = $form['tiga'];
	        $berat->empat = $form['empat'];
	        $berat->lima = $form['lima'];
	        $berat->enam = $form['enam'];
	        $berat->tujuh = $form['tujuh'];
	        $berat->delapan = $form['delapan'];
	        $berat->sembilan = $form['sembilan'];
	        $berat->sepuluh = $form['sepuluh'];

	      $berat->save();

	      $totalBerats = $totalBerats + ($berat->satu + $berat->dua + $berat->tiga + $berat->empat + $berat->lima + $berat->enam + $berat->tujuh + $berat->delapan + $berat->sembilan + $berat->sepuluh);

		}
	}

	public function tambahpenjualanretail()
	{

		$jenisList = Jeni::pluck('nama', 'id')->all();


		$merkList = Merk::pluck('nama', 'id')->all();

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

	 function generateOrder() {

		$number = (rand(1,10000));
		$order_id = 'IDSO'.str_pad((int) $number,4,"0",STR_PAD_LEFT);
		return $order_id;

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
		$penjualan->tgl_jatuh_tempo = 		$request->tgl_jatuh_tempo;

		$penjualan->save();
		$id_penjualan = $penjualan->id;

		$form = $_POST['baris'];

		$total_hargas = 0;

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

	      $total_hargas = $total_hargas + ($barang->berat_kg * $barang->harga_kg);
	      

    	}


    	$penjualan->total_harga = $total_hargas;

    	DB::table('penjualans')
            ->where('id', $id_penjualan)
            ->update(['total_harga' => $total_hargas]);
    	//$penjualan->save();

    	return redirect(config('laraadmin.adminRoute')."/");

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
				$barangOut = BarangOut::where('id_penjualan',$id)->get();

				return view('la.penjualans.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('penjualan', $penjualan)->with('barangOut',$barangOut);
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

	//menampilkan faktur penjualan

	public function showfaktur($id)
	{
		$barangout = DB::table('BarangOuts')
		->select('BarangOuts.id', 'id_penjualan', 'jenis.nama as jenis', 'merks.nama as merk', 'karton', 'harga_kg', 'berat_kg')
		->join('jenis', 'jenis.id', '=', 'BarangOuts.jenis')
		->join('merks', 'merks.id', '=', 'BarangOuts.merk')
		->where('id_penjualan',$id)
		->get();

		$penjualan = Penjualan::find($id);
		
		if(isset($penjualan->nama_pembeli)){
			$nama_pembeli = Relation::find($penjualan->nama_pembeli)->nama;
		}else{
			$nama_pembeli = $penjualan->nama_pembeli_retail;
		}
		return view('la.penjualans.faktur',compact('penjualan', 'barangout', 'nama_pembeli'));
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

	public function getJenis(Request $request) {
		$jd = $request->jd;
      return response()->json(array('nama'=> 'Allana'), 200);

	}

}
