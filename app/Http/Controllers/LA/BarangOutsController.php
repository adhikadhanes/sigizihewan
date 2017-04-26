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

use App\Models\BarangOut;

class BarangOutsController extends Controller
{
	public $show_action = true;
	public $view_col = 'id_penjualan';
	public $listing_cols = ['id', 'id_penjualan', 'jenis', 'merk', 'karton', 'harga_kg', 'berat_kg'];
	
	public function __construct() {
		// Field Access of Listing Columns
		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
			$this->middleware(function ($request, $next) {
				$this->listing_cols = ModuleFields::listingColumnAccessScan('BarangOuts', $this->listing_cols);
				return $next($request);
			});
		} else {
			$this->listing_cols = ModuleFields::listingColumnAccessScan('BarangOuts', $this->listing_cols);
		}
	}
	
	/**
	 * Display a listing of the BarangOuts.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		$barangouts = DB::table('barangouts')
		->select('penjualans.order_id as soid', 'jenis', 'merk', 'karton', 'harga_kg', 'berat_kg', 'penjualans.created_at as created_at')
		->join('penjualans', 'penjualans.id', '=', 'barangouts.id_penjualan')
		->get();
		
		return view('la.barangouts.index', compact('barangouts'));

	}

	public function index_lama()
	{
		$module = Module::get('BarangOuts');
		
		if(Module::hasAccess($module->id)) {
			return View('la.barangouts.index_lama', [
				'show_actions' => $this->show_action,
				'listing_cols' => $this->listing_cols,
				'module' => $module
			]);
		} else {
            return redirect(config('laraadmin.adminRoute')."/");
        }
	}

	/**
	 * Show the form for creating a new barangout.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created barangout in database.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{
		if(Module::hasAccess("BarangOuts", "create")) {
		
			$rules = Module::validateRules("BarangOuts", $request);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();
			}
			
			$insert_id = Module::insert("BarangOuts", $request);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.barangouts.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Display the specified barangout.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		if(Module::hasAccess("BarangOuts", "view")) {
			
			$barangout = BarangOut::find($id);
			if(isset($barangout->id)) {
				$module = Module::get('BarangOuts');
				$module->row = $barangout;
				
				return view('la.barangouts.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('barangout', $barangout);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("barangout"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Show the form for editing the specified barangout.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
		if(Module::hasAccess("BarangOuts", "edit")) {			
			$barangout = BarangOut::find($id);
			if(isset($barangout->id)) {	
				$module = Module::get('BarangOuts');
				
				$module->row = $barangout;
				
				return view('la.barangouts.edit', [
					'module' => $module,
					'view_col' => $this->view_col,
				])->with('barangout', $barangout);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("barangout"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Update the specified barangout in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{
		if(Module::hasAccess("BarangOuts", "edit")) {
			
			$rules = Module::validateRules("BarangOuts", $request, true);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();;
			}
			
			$insert_id = Module::updateRow("BarangOuts", $request, $id);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.barangouts.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Remove the specified barangout from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		if(Module::hasAccess("BarangOuts", "delete")) {
			BarangOut::find($id)->delete();
			
			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.barangouts.index');
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
		$values = DB::table('barangouts')->select($this->listing_cols)->whereNull('deleted_at');
		$out = Datatables::of($values)->make();
		$data = $out->getData();

		$fields_popup = ModuleFields::getModuleFields('BarangOuts');
		
		for($i=0; $i < count($data->data); $i++) {
			for ($j=0; $j < count($this->listing_cols); $j++) { 
				$col = $this->listing_cols[$j];
				if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
					$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
				}
				if($col == $this->view_col) {
					$data->data[$i][$j] = '<a href="'.url(config('laraadmin.adminRoute') . '/barangouts/'.$data->data[$i][0]).'">'.$data->data[$i][$j].'</a>';
				}
				// else if($col == "author") {
				//    $data->data[$i][$j];
				// }
			}
			
			if($this->show_action) {
				$output = '';
				if(Module::hasAccess("BarangOuts", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/barangouts/'.$data->data[$i][0].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}
				
				if(Module::hasAccess("BarangOuts", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.barangouts.destroy', $data->data[$i][0]], 'method' => 'delete', 'style'=>'display:inline']);
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
