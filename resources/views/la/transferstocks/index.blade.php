@extends("la.layouts.app")

@section("contentheader_title", "TransferStocks")
@section("contentheader_description", "TransferStocks listing")
@section("section", "TransferStocks")
@section("sub_section", "Listing")
@section("htmlheader_title", "TransferStocks Listing")

@section("headerElems")
@la_access("TransferStocks", "create")
	<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#AddModal">Add TransferStock</button> | <a href="transferstock" class="btn btn-info " role="button">Add Tranfer Stock</a>
@endla_access
@endsection

@section("main-content")

@if (count($errors) > 0)
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

<div class="box box-success">
	<!--<div class="box-header"></div>-->
	<div class="box-body">
		<table id="example1" class="table table-bordered">
		<thead>
		<tr class="success">
			@foreach( $listing_cols as $col )
			<th>{{ $module->fields[$col]['label'] or ucfirst($col) }}</th>
			@endforeach
			@if($show_actions)
			<th>Actions</th>
			@endif
		</tr>
		</thead>
		<tbody>
			
		</tbody>
		</table>
		
		<table class="table" id="dynamic_field">  
                                  <tr>
                                      <td>No</td>
                                      <td>
                                      <td>ID</td>
                                      <td>Tanggal Keluar</td>
                                      <td>Gudang Asal</td>
                                      <td>Gudang Tujuan</td>
                                      <td>No</td>
                                      <td>
                                      <td>Jenis</td>
                                      <td>Merk</td>
                                      <td>Berat (KG)</td>
                                      <td>Karton</td>
                                      <td>Status</td>
                                    </tr>
                               </table>
	</div>
</div>

@la_access("TransferStocks", "create")
<div class="modal fade" id="AddModal" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">Add TransferStock</h4>
			</div>
			{!! Form::open(['action' => 'LA\TransferStocksController@store', 'id' => 'transferstock-add-form']) !!}
			<div class="modal-body">
				<div class="box-body">
                    @la_form($module)
					
					{{--
					@la_input($module, 'jenis')
					@la_input($module, 'merk')
					@la_input($module, 'Berat')
					@la_input($module, 'Karton')
					--}}
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				{!! Form::submit( 'Submit', ['class'=>'btn btn-success']) !!}
			</div>
			{!! Form::close() !!}
		</div>
	</div>
</div>
@endla_access

@endsection

@push('styles')
<link rel="stylesheet" type="text/css" href="{{ asset('la-assets/plugins/datatables/datatables.min.css') }}"/>
@endpush

@push('scripts')
<script src="{{ asset('la-assets/plugins/datatables/datatables.min.js') }}"></script>
<script>
$(function () {
	$("#example1").DataTable({
		processing: true,
        serverSide: true,
        ajax: "{{ url(config('laraadmin.adminRoute') . '/transferstock_dt_ajax') }}",
		language: {
			lengthMenu: "_MENU_",
			search: "_INPUT_",
			searchPlaceholder: "Search"
		},
		@if($show_actions)
		columnDefs: [ { orderable: false, targets: [-1] }],
		@endif
	});
	$("#transferstock-add-form").validate({
		
	});
});
</script>
@endpush
