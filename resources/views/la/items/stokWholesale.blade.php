@extends("la.layouts.app")

@section("contentheader_title", "Wholesale")
@section("contentheader_description", "Wholesale listing")
@section("section", "Wholesale")
@section("sub_section", "Listing")
@section("htmlheader_title", "Wholesale Listing")

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
	<!-- public $wholesale_cols = ['id', 'jenis', 'merk', 'kg_carton', 'wholesale_kg', 'wholesale_carton', 'tipe', 'nama_jenis']; -->

		<table id="example" class="table table-bordered"">
        <thead>           
            <tr class="success">
                <th>Jenis</th>
                <th>Merk</th>
                <th>KG Karton</th>
                <th>KG Wholesale</th>
                <th>Wholesale Karton</th>
            </tr>
        </thead>
        <tbody>
        @foreach( $stokWholesale as $rtl )
            <tr>
                <td>{{ $rtl->jenis_nama }}</td>
                <td>{{ $rtl->merk_nama }}</td>
                <td>{{ $rtl->kg_carton }}</td>
                <td>{{ $rtl->wholesale_kg }}</td>
                <td>{{ $rtl->wholesale_carton }}</td>
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
        language: {
            lengthMenu: "_MENU_",
            search: "_INPUT_",
            searchPlaceholder: "Search"
        },
        "columnDefs": [
            { "visible": false, "targets": 0 }
        ],
        "order": [[ 2, 'asc' ]],
        "displayLength": 25,
        "drawCallback": function ( settings ) {
            var api = this.api();
            var rows = api.rows( {page:'current'} ).nodes();
            var last=null;
 
            api.column(0, {page:'current'} ).data().each( function ( group, i ) {
                if ( last !== group ) {
                    $(rows).eq( i ).before(
                        '<tr class="group"><td colspan="5" style="background-color:rgb(200,200,200);">'+group+'</td></tr>'
                    );
 
                    last = group;
                }
            } );
        }
    });
    $("#item-add-form").validate({
        
    });
    // Order by the grouping
    $('#example tbody').on( 'click', 'tr.group', function () {
        var currentOrder = table.order()[0];
        if ( currentOrder[0] === 2 && currentOrder[1] === 'asc' ) {
            table.order( [ 2, 'desc' ] ).draw();
        }
        else {
            table.order( [ 2, 'asc' ] ).draw();
        }
    } );
});
</script>
@endpush
