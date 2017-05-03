@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/barangkeluars') }}">BarangKeluar</a> :
@endsection
@section("contentheader_description", $barangkeluar->$view_col)
@section("section", "BarangKeluars")
@section("section_url", url(config('laraadmin.adminRoute') . '/barangkeluars'))
@section("sub_section", "Edit")

@section("htmlheader_title", "BarangKeluars Edit : ".$barangkeluar->$view_col)

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
				{!! Form::model($barangkeluar, ['route' => [config('laraadmin.adminRoute') . '.barangkeluars.update', $barangkeluar->id ], 'method'=>'PUT', 'id' => 'barangkeluar-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'order_id')
					@la_input($module, 'nama_supplier')
					@la_input($module, 'tanggal_terima')
					@la_input($module, 'jenis_daging')
					@la_input($module, 'merk_daging')
					@la_input($module, 'berat_penjualan')
					@la_input($module, 'berat_aktual')
					@la_input($module, 'jumlah_karton')
					@la_input($module, 'status_keluar')
					@la_input($module, 'status_terkirim')
					@la_input($module, 'tgl_baru')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/barangkeluars') }}">Cancel</a></button>
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
	$("#barangkeluar-edit-form").validate({
		
	});
});
</script>
@endpush
