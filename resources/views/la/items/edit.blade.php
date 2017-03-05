@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/items') }}">Item</a> :
@endsection
@section("contentheader_description", $item->$view_col)
@section("section", "Items")
@section("section_url", url(config('laraadmin.adminRoute') . '/items'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Items Edit : ".$item->$view_col)

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
				{!! Form::model($item, ['route' => [config('laraadmin.adminRoute') . '.items.update', $item->id ], 'method'=>'PUT', 'id' => 'item-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'jenis')
					@la_input($module, 'merk')
					@la_input($module, 'kg_carton')
					@la_input($module, 'wholesale_kg')
					@la_input($module, 'wholesale_carton')
					@la_input($module, 'retail_kg')
					@la_input($module, 'tipe')
					@la_input($module, 'nama_jenis')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/items') }}">Cancel</a></button>
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
	$("#item-edit-form").validate({
		
	});
});
</script>
@endpush
