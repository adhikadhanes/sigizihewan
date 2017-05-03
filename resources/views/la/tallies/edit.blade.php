@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/tallies') }}">Tally</a> :
@endsection
@section("contentheader_description", $tally->$view_col)
@section("section", "Tallies")
@section("section_url", url(config('laraadmin.adminRoute') . '/tallies'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Tallies Edit : ".$tally->$view_col)

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
				{!! Form::model($tally, ['route' => [config('laraadmin.adminRoute') . '.tallies.update', $tally->id ], 'method'=>'PUT', 'id' => 'tally-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'jenis_daging')
					@la_input($module, 'merk_daging')
					@la_input($module, 'berat')
					@la_input($module, 'pembelian')
					@la_input($module, 'id_barang')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/tallies') }}">Cancel</a></button>
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
	$("#tally-edit-form").validate({
		
	});
});
</script>
@endpush
