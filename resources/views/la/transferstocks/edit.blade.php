@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/transferstocks') }}">TransferStock</a> :
@endsection
@section("contentheader_description", $transferstock->$view_col)
@section("section", "TransferStocks")
@section("section_url", url(config('laraadmin.adminRoute') . '/transferstocks'))
@section("sub_section", "Edit")

@section("htmlheader_title", "TransferStocks Edit : ".$transferstock->$view_col)

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
				{!! Form::model($transferstock, ['route' => [config('laraadmin.adminRoute') . '.transferstocks.update', $transferstock->id ], 'method'=>'PUT', 'id' => 'transferstock-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'Jenis')
					@la_input($module, 'Merk')
					@la_input($module, 'Berat')
					@la_input($module, 'Karton')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/transferstocks') }}">Cancel</a></button>
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
	$("#transferstock-edit-form").validate({
		
	});
});
</script>
@endpush
