@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/piutangs') }}">Piutang</a> :
@endsection
@section("contentheader_description", $piutang->$view_col)
@section("section", "Piutangs")
@section("section_url", url(config('laraadmin.adminRoute') . '/piutangs'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Piutangs Edit : ".$piutang->$view_col)

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
				{!! Form::model($piutang, ['route' => [config('laraadmin.adminRoute') . '.piutangs.update', $piutang->id ], 'method'=>'PUT', 'id' => 'piutang-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'tanggal_pembayaran')
					@la_input($module, 'tanggal_pengiriman')
					@la_input($module, 'total_harga')
					@la_input($module, 'cara_bayar')
					@la_input($module, 'order_id')
					@la_input($module, 'nama_customer')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/piutangs') }}">Cancel</a></button>
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
	$("#piutang-edit-form").validate({
		
	});
});
</script>
@endpush
