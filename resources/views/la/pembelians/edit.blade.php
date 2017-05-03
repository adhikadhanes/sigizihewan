@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/pembelians') }}">Pembelian</a> :
@endsection
@section("contentheader_description", $pembelian->$view_col)
@section("section", "Pembelians")
@section("section_url", url(config('laraadmin.adminRoute') . '/pembelians'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Pembelians Edit : ".$pembelian->$view_col)

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
				{!! Form::model($pembelian, ['route' => [config('laraadmin.adminRoute') . '.pembelians.update', $pembelian->id ], 'method'=>'PUT', 'id' => 'pembelian-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'po_id')
					@la_input($module, 'tgl_pembelian')
					@la_input($module, 'nama_penjual')
					@la_input($module, 'tanggal_penerimaan')
					@la_input($module, 'cara_penerimaan')
					@la_input($module, 'cara_pembayaran')
					@la_input($module, 'tgl_jatuh_tempo')
					@la_input($module, 'gdg_penerimaan')
					@la_input($module, 'status')
					@la_input($module, 'status_penerimaan')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/pembelians') }}">Cancel</a></button>
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
	$("#pembelian-edit-form").validate({
		
	});
});
</script>
@endpush
