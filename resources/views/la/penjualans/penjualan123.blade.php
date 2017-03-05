@extends("la.layouts.app")

@section("contentheader_title", "Penjualan 123")
@section("contentheader_description", "Penjualan 123")
@section("section", "Penjualan 123")
@section("sub_section", "123")
@section("htmlheader_title", "Penjualans 123")

@section("headerElems")

@endsection

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

<head>
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
   <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />
 </head>

<div class="box box-success">
	<!--<div class="box-header"></div>-->
	<div class="box-body">
		 <div class="row-fluid">
		 {{ Form::select('item', $jenisList, null, ['class' => 'selectpicker', 'data-show-subtext' => 'true', 'data-live-search' => 'true']) }

    	</div> 
	</div>
</div>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>


@endsection

@push('styles')
<link rel="stylesheet" type="text/css" href="{{ asset('la-assets/plugins/datatables/datatables.min.css') }}"/>
@endpush

@push('scripts')

@endpush
