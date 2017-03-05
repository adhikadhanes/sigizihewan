@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/merks') }}">Merk</a> :
@endsection
@section("contentheader_description", $merk->$view_col)
@section("section", "Merks")
@section("section_url", url(config('laraadmin.adminRoute') . '/merks'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Merks Edit : ".$merk->$view_col)

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
				{!! Form::model($merk, ['route' => [config('laraadmin.adminRoute') . '.merks.update', $merk->id ], 'method'=>'PUT', 'id' => 'merk-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'nama')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/merks') }}">Cancel</a></button>
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
	$("#merk-edit-form").validate({
		
	});
});
</script>
@endpush
