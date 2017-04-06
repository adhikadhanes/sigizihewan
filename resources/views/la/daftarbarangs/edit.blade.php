@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/daftarbarangs') }}">DaftarBarang</a> :
@endsection
@section("contentheader_description", $daftarbarang->$view_col)
@section("section", "DaftarBarangs")
@section("section_url", url(config('laraadmin.adminRoute') . '/daftarbarangs'))
@section("sub_section", "Edit")

@section("htmlheader_title", "DaftarBarangs Edit : ".$daftarbarang->$view_col)

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

<div class="box">
	<div class="box-header">
		
	</div>
	<div class="box-body">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				{!! Form::model($daftarbarang, ['route' => [config('laraadmin.adminRoute') . '.daftarbarangs.update', $daftarbarang->id ], 'method'=>'PUT', 'id' => 'daftarbarang-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'order_id')
					@la_input($module, 'nama_supplier')
					@la_input($module, 'tanggal_terima')
					@la_input($module, 'jenis_barang')
					@la_input($module, 'merk_daging')
					@la_input($module, 'berat_pembelian')
					@la_input($module, 'berat_aktual')
					@la_input($module, 'jumlah_karton')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/daftarbarangs') }}">Cancel</a></button>
					</div>
				{!! Form::close() !!}
			</div>
		</div>
	</div>
</div>

@endsection

@push('scripts')
<script>
$(function () {
	$("#daftarbarang-edit-form").validate({
		
	});
});
</script>
@endpush
