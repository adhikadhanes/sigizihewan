@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/trucks') }}">Truck</a> :
@endsection
@section("contentheader_description", $truck->$view_col)
@section("section", "Trucks")
@section("section_url", url(config('laraadmin.adminRoute') . '/trucks'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Trucks Edit : ".$truck->$view_col)

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
				{!! Form::model($truck, ['route' => [config('laraadmin.adminRoute') . '.trucks.update', $truck->id ], 'method'=>'PUT', 'id' => 'truck-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'name')
					@la_input($module, 'nomor_polisi')
					@la_input($module, 'kapasitas')
					@la_input($module, 'status')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/trucks') }}">Cancel</a></button>
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
	$("#truck-edit-form").validate({
		
	});
});
</script>
@endpush
