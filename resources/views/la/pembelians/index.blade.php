@extends("la.layouts.app")

@section("contentheader_title", "Pembelians")
@section("contentheader_description", "Pembelians listing")
@section("section", "Pembelians")
@section("sub_section", "Listing")
@section("htmlheader_title", "Pembelians Listing")

@section("headerElems")
@la_access("Pembelians", "create")
	<button class="btn btn-success btn-sm pull-right" data-toggle="modal" data-target="#AddModal">Add Pembelian</button>
		<a href="tambahpembelian" class="btn btn-info" role="button">Tambah Pembelian</a>
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
	</div>
</div>

@la_access("Pembelians", "create")
<div class="modal fade" id="AddModal" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">Add Pembelian</h4>
			</div>
			{!! Form::open(['action' => 'LA\PembeliansController@store', 'id' => 'pembelian-add-form']) !!}
			<div class="modal-body">
				<div class="box-body">
                    @la_form($module)

					{{--
					@la_input($module, 'po_id')
					@la_input($module, 'tgl_pembelian')
					@la_input($module, 'nama_penjual')
					@la_input($module, 'tanggal_penerimaan')
					@la_input($module, 'cara_penerimaan')
					@la_input($module, 'cara_pembayaran')
					@la_input($module, 'tgl_jatuh_tempo')
					@la_input($module, 'gdg_penerimaan')
					@la_input($module, 'status')
					@la_input($module, 'status_penerimaan')
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
        ajax: "{{ url(config('laraadmin.adminRoute') . '/pembelian_dt_ajax') }}",
		language: {
			lengthMenu: "_MENU_",
			search: "_INPUT_",
			searchPlaceholder: "Search"
		},
		@if($show_actions)
		columnDefs: [ { orderable: false, targets: [-1] }],
		@endif
	});
	$("#pembelian-add-form").validate({

	});
});
</script>
@endpush
