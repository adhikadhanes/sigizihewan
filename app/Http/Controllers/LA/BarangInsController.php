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

use App\Models\BarangIn;

class BarangInsController extends Controller
{
	public $show_action = true;
	public $view_col = 'po_id';
	public $listing_cols = ['id', 'po_id', 'jenis', 'merk', 'karton', 'harga_kg', 'berat_kg'];
	
	public function __construct() {
		// Field Access of Listing Columns
		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
			$this->middleware(function ($request, $next) {
				$this->listing_cols = ModuleFields::listingColumnAccessScan('BarangIns', $this->listing_cols);
				return $next($request);
			});
		} else {
			$this->listing_cols = ModuleFields::listingColumnAccessScan('BarangIns', $this->listing_cols);
		}
	}
	
	/**
	 * Display a listing of the BarangIns.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		$barangins = DB::table('barangins')
		->select('pembelians.po_id as poid', 'jenis', 'merk', 'karton', 'harga_kg', 'berat_kg', 'tanggal_penerimaan')
		->join('pembelians', 'pembelians.id', '=', 'barangins.po_id')
		->get();
		
		return view('la.barangins.index', compact('barangins'));

	}

	public function index_lama()
	{
		$module = Module::get('BarangIns');
		
		if(Module::hasAccess($module->id)) {
			return View('la.barangins.index_lama', [
				'show_actions' => $this->show_action,
				'listing_cols' => $this->listing_cols,
				'module' => $module
			]);
		} else {
            return redirect(config('laraadmin.adminRoute')."/");
        }
	}

	/**
	 * Show the form for creating a new barangin.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created barangin in database.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{
		if(Module::hasAccess("BarangIns", "create")) {
		
			$rules = Module::validateRules("BarangIns", $request);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();
			}
			
			$insert_id = Module::insert("BarangIns", $request);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.barangins.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Display the specified barangin.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		if(Module::hasAccess("BarangIns", "view")) {
			
			$barangin = BarangIn::find($id);
			if(isset($barangin->id)) {
				$module = Module::get('BarangIns');
				$module->row = $barangin;
				
				return view('la.barangins.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('barangin', $barangin);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("barangin"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Show the form for editing the specified barangin.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
		if(Module::hasAccess("BarangIns", "edit")) {			
			$barangin = BarangIn::find($id);
			if(isset($barangin->id)) {	
				$module = Module::get('BarangIns');
				
				$module->row = $barangin;
				
				return view('la.barangins.edit', [
					'module' => $module,
					'view_col' => $this->view_col,
				])->with('barangin', $barangin);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("barangin"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Update the specified barangin in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{
		if(Module::hasAccess("BarangIns", "edit")) {
			
			$rules = Module::validateRules("BarangIns", $request, true);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();;
			}
			
			$insert_id = Module::updateRow("BarangIns", $request, $id);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.barangins.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Remove the specified barangin from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		if(Module::hasAccess("BarangIns", "delete")) {
			BarangIn::find($id)->delete();
			
			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.barangins.index');
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
		$values = DB::table('barangins')->select($this->listing_cols)->whereNull('deleted_at');
		$out = Datatables::of($values)->make();
		$data = $out->getData();

		$fields_popup = ModuleFields::getModuleFields('BarangIns');
		
		for($i=0; $i < count($data->data); $i++) {
			for ($j=0; $j < count($this->listing_cols); $j++) { 
				$col = $this->listing_cols[$j];
				if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
					$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
				}
				if($col == $this->view_col) {
					$data->data[$i][$j] = '<a href="'.url(config('laraadmin.adminRoute') . '/barangins/'.$data->data[$i][0]).'">'.$data->data[$i][$j].'</a>';
				}
				// else if($col == "author") {
				//    $data->data[$i][$j];
				// }
			}
			
			if($this->show_action) {
				$output = '';
				if(Module::hasAccess("BarangIns", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/barangins/'.$data->data[$i][0].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}
				
				if(Module::hasAccess("BarangIns", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.barangins.destroy', $data->data[$i][0]], 'method' => 'delete', 'style'=>'display:inline']);
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
