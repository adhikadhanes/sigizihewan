@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/barangins') }}">BarangIn</a> :
@endsection
@section("contentheader_description", $barangin->$view_col)
@section("section", "BarangIns")
@section("section_url", url(config('laraadmin.adminRoute') . '/barangins'))
@section("sub_section", "Edit")

@section("htmlheader_title", "BarangIns Edit : ".$barangin->$view_col)

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
				{!! Form::model($barangin, ['route' => [config('laraadmin.adminRoute') . '.barangins.update', $barangin->id ], 'method'=>'PUT', 'id' => 'barangin-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'po_id')
					@la_input($module, 'jenis')
					@la_input($module, 'merk')
					@la_input($module, 'karton')
					@la_input($module, 'harga_kg')
					@la_input($module, 'berat_kg')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/barangins') }}">Cancel</a></button>
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
	$("#barangin-edit-form").validate({
		
	});
});
</script>
@endpush
