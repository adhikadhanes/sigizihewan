@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/gudangs') }}">Gudang</a> :
@endsection
@section("contentheader_description", $gudang->$view_col)
@section("section", "Gudangs")
@section("section_url", url(config('laraadmin.adminRoute') . '/gudangs'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Gudangs Edit : ".$gudang->$view_col)

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
				{!! Form::model($gudang, ['route' => [config('laraadmin.adminRoute') . '.gudangs.update', $gudang->id ], 'method'=>'PUT', 'id' => 'gudang-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'gambar')
					@la_input($module, 'name')
					@la_input($module, 'stok')
					@la_input($module, 'telefon')
					@la_input($module, 'alamat')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/gudangs') }}">Cancel</a></button>
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
	$("#gudang-edit-form").validate({
		
	});
});
</script>
@endpush
