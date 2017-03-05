@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/warehouses') }}">Warehouse</a> :
@endsection
@section("contentheader_description", $warehouse->$view_col)
@section("section", "Warehouses")
@section("section_url", url(config('laraadmin.adminRoute') . '/warehouses'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Warehouses Edit : ".$warehouse->$view_col)

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
				{!! Form::model($warehouse, ['route' => [config('laraadmin.adminRoute') . '.warehouses.update', $warehouse->id ], 'method'=>'PUT', 'id' => 'warehouse-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'nama_gudang')
					@la_input($module, 'alamat')
					@la_input($module, 'telepon')
					@la_input($module, 'kapasitas')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/warehouses') }}">Cancel</a></button>
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
	$("#warehouse-edit-form").validate({
		
	});
});
</script>
@endpush
