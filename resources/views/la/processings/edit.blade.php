@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/processings') }}">Processing</a> :
@endsection
@section("contentheader_description", $processing->$view_col)
@section("section", "Processings")
@section("section_url", url(config('laraadmin.adminRoute') . '/processings'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Processings Edit : ".$processing->$view_col)

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
				{!! Form::model($processing, ['route' => [config('laraadmin.adminRoute') . '.processings.update', $processing->id ], 'method'=>'PUT', 'id' => 'processing-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'pcg_id')
					@la_input($module, 'tgl_processing')
					@la_input($module, 'jenis_barang_awal')
					@la_input($module, 'merk_barang_awal')
					@la_input($module, 'berat_perkiraan')
					@la_input($module, 'carton_perkiraan')
					@la_input($module, 'jenis_barang_akhir')
					@la_input($module, 'merk_akhir_akhir')
					@la_input($module, 'berat_akhir')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/processings') }}">Cancel</a></button>
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
	$("#processing-edit-form").validate({
		
	});
});
</script>
@endpush
