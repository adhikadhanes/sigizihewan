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

use App\Models\Piutang;

class PiutangsController extends Controller
{
	public $show_action = true;
	public $view_col = 'tanggal_pembayaran';
	public $listing_cols = ['id', 'tanggal_pembayaran', 'tanggal_pengiriman', 'nama_customer', 'total_harga', 'cara_bayar', 'status', 'order_id'];
	
	public function __construct() {
		// Field Access of Listing Columns
		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
			$this->middleware(function ($request, $next) {
				$this->listing_cols = ModuleFields::listingColumnAccessScan('Piutangs', $this->listing_cols);
				return $next($request);
			});
		} else {
			$this->listing_cols = ModuleFields::listingColumnAccessScan('Piutangs', $this->listing_cols);
		}
	}
	
	/**
	 * Display a listing of the Piutangs.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		// $module = Module::get('Piutangs');
		
		// if(Module::hasAccess($module->id)) {
		// 	return View('la.piutangs.index', [
		// 		'show_actions' => $this->show_action,
		// 		'listing_cols' => $this->listing_cols,
		// 		'module' => $module
		// 	]);
		// } else {
  //           return redirect(config('laraadmin.adminRoute')."/");
  //       }
		$piutang = DB::table('Penjualans')
		->select('nama_pembeli', 'tanggal_pengiriman', 'cara_pembayaran', 'order_id')
		->get();
		
		return view('la.piutangs.index', compact('piutang'));
	}

	/**
	 * Show the form for creating a new piutang.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created piutang in database.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{
		if(Module::hasAccess("Piutangs", "create")) {
		
			$rules = Module::validateRules("Piutangs", $request);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();
			}
			
			$insert_id = Module::insert("Piutangs", $request);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.piutangs.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Display the specified piutang.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		if(Module::hasAccess("Piutangs", "view")) {
			
			$piutang = Piutang::find($id);
			if(isset($piutang->id)) {
				$module = Module::get('Piutangs');
				$module->row = $piutang;
				
				return view('la.piutangs.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('piutang', $piutang);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("piutang"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Show the form for editing the specified piutang.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
		if(Module::hasAccess("Piutangs", "edit")) {			
			$piutang = Piutang::find($id);
			if(isset($piutang->id)) {	
				$module = Module::get('Piutangs');
				
				$module->row = $piutang;
				
				return view('la.piutangs.edit', [
					'module' => $module,
					'view_col' => $this->view_col,
				])->with('piutang', $piutang);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("piutang"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Update the specified piutang in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{
		if(Module::hasAccess("Piutangs", "edit")) {
			
			$rules = Module::validateRules("Piutangs", $request, true);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();;
			}
			
			$insert_id = Module::updateRow("Piutangs", $request, $id);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.piutangs.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Remove the specified piutang from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		if(Module::hasAccess("Piutangs", "delete")) {
			Piutang::find($id)->delete();
			
			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.piutangs.index');
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
		$values = DB::table('piutangs')->select($this->listing_cols)->whereNull('deleted_at');
		$out = Datatables::of($values)->make();
		$data = $out->getData();

		$fields_popup = ModuleFields::getModuleFields('Piutangs');
		
		for($i=0; $i < count($data->data); $i++) {
			for ($j=0; $j < count($this->listing_cols); $j++) { 
				$col = $this->listing_cols[$j];
				if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
					$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
				}
				if($col == $this->view_col) {
					$data->data[$i][$j] = '<a href="'.url(config('laraadmin.adminRoute') . '/piutangs/'.$data->data[$i][0]).'">'.$data->data[$i][$j].'</a>';
				}
				// else if($col == "author") {
				//    $data->data[$i][$j];
				// }
			}
			
			if($this->show_action) {
				$output = '';
				if(Module::hasAccess("Piutangs", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/piutangs/'.$data->data[$i][0].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}
				
				if(Module::hasAccess("Piutangs", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.piutangs.destroy', $data->data[$i][0]], 'method' => 'delete', 'style'=>'display:inline']);
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
