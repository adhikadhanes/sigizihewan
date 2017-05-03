@extends("la.layouts.app")

@section("contentheader_title", "BarangIns")
@section("contentheader_description", "BarangIns listing")
@section("section", "BarangIns")
@section("sub_section", "Listing")
@section("htmlheader_title", "BarangIns Listing")

@section("headerElems")
@la_access("BarangIns", "create")
	<button class="btn btn-success btn-sm pull-right" data-toggle="modal" data-target="#AddModal">Add BarangIn</button>
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
<!--barangin -->
<div class="box box-success">
	<!--<div class="box-header"></div>-->
	<div class="box-body">
		<table id="example" class="table table-bordered"">
        <thead>           
            <tr class="success">
                <th>Tanggal</th>
                <th>IDPO</th>
                <th>Jenis</th>
                <th>Merk</th>
                <th>Karton</th>
                <th>Harga/Kg</th>
                <th>Berat (Kg)</th>
                <th>Tally</th>
            </tr>
        </thead>
        <tbody>
        @foreach( $barangins as $brg )
            <tr>
                <td>{{ $brg->tanggal_penerimaan }}</td>
                <td>{{ $brg->poid }}</td>
                <td>{{ $brg->jenis }}</td>
                <td>{{ $brg->merk }}</td>
                <td>{{ $brg->karton }}</td>
                <td>{{ $brg->harga_kg }}</td>
                <td>{{ $brg->berat_kg }}</td>
                <td><a href="#masukkinlinksamaid{{ $brg->is }}" class="pull-right btn btn-sm btn-info" role="button">Tally</a></td>
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
            { 
            "visible": false, 
            "targets": 0 
            }
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
                        '<tr class="group"><td colspan="7" style="background-color:rgb(200,200,200);">'+group+'</td></tr>'
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
