@extends("la.layouts.app")

@section("contentheader_title", "Piutangs")
@section("contentheader_description", "Piutangs listing")
@section("section", "Piutangs")
@section("sub_section", "Listing")
@section("htmlheader_title", "Piutangs Listing")

@section("headerElems")
@la_access("Piutangs", "create")
	<button class="btn btn-success btn-sm pull-right" data-toggle="modal" data-target="#AddModal">Add Piutang</button>
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
                <th class="sorting">IDPO</th>
                <th class="sorting">Tanggal Pembayaran</th>
                <th class="sorting">Tanggal Pengiriman</th>
                <th class="sorting">Nama Supplier</th>
                <th class="sorting">Total Harga</th>
                <th class="sorting">Cara Bayar</th>
                <th class="sorting">Status</th>
            </tr>
        </thead>
        <tbody>
        @foreach( $piutang as $pt )
            <tr>
                <td>{{ $pt->order_id }}</td>
                <td></td>
                <td>{{ $pt->tanggal_pengiriman }}</td>
                <td>{{ $pt->nama_pembeli }}</td>
                <td></td>
                <td>{{ $pt->cara_pembayaran }}</td>
                <td></td>
            </tr>
		@endforeach
        </tbody>
    </table>
	</div>
</div>

@endsection

@push('styles')
<link rel="stylesheet" type="text/css" href="{{ asset('la-assets/plugins/datatables/datatables.min.css') }}"/>
@endpush

@push('scripts')
<script src="{{ asset('la-assets/plugins/datatables/datatables.min.js') }}"></script>
<script>
$(function () {
	$("#example1").DataTable({
		language: {
			lengthMenu: "_MENU_",
			search: "_INPUT_",
			searchPlaceholder: "Search"
		},
	});
	$("#piutang-add-form").validate({
		
	});
});
</script>
@endpush
