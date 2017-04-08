@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/hutangs') }}">Hutang</a> :
@endsection
@section("contentheader_description", $hutang->$view_col)
@section("section", "Hutangs")
@section("section_url", url(config('laraadmin.adminRoute') . '/hutangs'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Hutangs Edit : ".$hutang->$view_col)

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
				{!! Form::model($hutang, ['route' => [config('laraadmin.adminRoute') . '.hutangs.update', $hutang->id ], 'method'=>'PUT', 'id' => 'hutang-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'po_id')
					@la_input($module, 'tanggal_pembayaran')
					@la_input($module, 'tanggal_penerimaan')
					@la_input($module, 'nama_supplier')
					@la_input($module, 'total_harga')
					@la_input($module, 'cara_bayar')
					@la_input($module, 'status')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/hutangs') }}">Cancel</a></button>
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
	$("#hutang-edit-form").validate({
		
	});
});
</script>
@endpush
