@extends("la.layouts.app")

@section("contentheader_title", "Retail")
@section("contentheader_description", "Retail listing")
@section("section", "Retail")
@section("sub_section", "Listing")
@section("htmlheader_title", "Retail Listing")

@section("headerElems")
@la_access("Items", "create")
	<button class="btn btn-success btn-sm pull-right" data-toggle="modal" data-target="#AddModal">Add Item</button>
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
		<table id="example" class="table table-bordered">
        <thead>           
            <tr class="success">
                <th class="sorting">Id</th>
                <th class="sorting">Jenis</th>
                <th class="sorting">Merk</th>
                <th class="sorting">KG Karton</th>
                <th class="sorting">KG Retail</th>
                <th class="sorting">Tipe</th>
                <th class="sorting">Nama Jenis</th>
            </tr>
        </thead>
        <tbody>
        @foreach( $stokRetail as $rtl )
            <tr>
                <td>{{ $rtl->id }}</td>
                <td>{{ $rtl->jenis_nama }}</td>
                <td>{{ $rtl->merk_nama }}</td>
                <td>{{ $rtl->kg_carton }}</td>
                <td>{{ $rtl->retail_kg }}</td>
                <td>{{ $rtl->tipe }}</td>
                <td>{{ $rtl->nama_jenis }}</td>
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
    $("#example").DataTable({
        processing: true,
        serverSide: true,
        ajax: "{{ url(config('laraadmin.adminRoute') . '/item_dt_ajax') }}",
        language: {
            lengthMenu: "_MENU_",
            search: "_INPUT_",
            searchPlaceholder: "Search"
        },
    });
    $("#item-add-form").validate({
        
    });
});
</script>
@endpush
