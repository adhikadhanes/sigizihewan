@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/barangouts') }}">BarangOut</a> :
@endsection
@section("contentheader_description", $barangout->$view_col)
@section("section", "BarangOuts")
@section("section_url", url(config('laraadmin.adminRoute') . '/barangouts'))
@section("sub_section", "Edit")

@section("htmlheader_title", "BarangOuts Edit : ".$barangout->$view_col)

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
				{!! Form::model($barangout, ['route' => [config('laraadmin.adminRoute') . '.barangouts.update', $barangout->id ], 'method'=>'PUT', 'id' => 'barangout-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'id_penjualan')
					@la_input($module, 'jenis')
					@la_input($module, 'merk')
					@la_input($module, 'karton')
					@la_input($module, 'harga_kg')
					@la_input($module, 'berat_kg')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/barangouts') }}">Cancel</a></button>
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
	$("#barangout-edit-form").validate({
		
	});
});
</script>
@endpush
