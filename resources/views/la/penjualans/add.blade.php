@extends("la.layouts.app")

@section("contentheader_title", "Penjualans")
@section("contentheader_description", "Penjualans listing")
@section("section", "Penjualans")
@section("sub_section", "Listing")
@section("htmlheader_title", "Penjualans Listing")

@section("headerElems")
@la_access("Penjualans", "create")

@endla_access
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

<div class="box box-success box-solid">
	<div class="box-header ">TAMBAH PENJUALAN</div>
	<div class="box-body ">
	<div class="row">
		<div class="col-md-6">

<table>
  <tr>
    <td><strong>IDPO </strong></td>
        <td width="20%"> : </td>
        <td>#SO0001</td>
  </tr>
  <tr>
    <td><strong>Tanggal Penjualan </strong> </td><td width="20%"> : </td>
    <td>{!! Form::date('name', \Carbon\Carbon::now(), ['class' => 'form-control']); !!} </td>
  </tr>
  <tr>
    <td><strong>Nama Pembeli </strong> </td><td width="20%"> : </td>
    <td>{{ Form::select('size', ['L' => 'Large', 'S' => 'Small'], 'S', ['class' => 'form-control']) }}</td>
  </tr>
  <tr>
    <td><strong>Nama Pembeli Retail </strong> </td><td width="20%"> : </td>
        <td>{{ Form::select('size', ['L' => 'Large', 'S' => 'Small'], 'S' , ['class' => 'form-control']) }}</td>
  </tr>
    <tr>
<td><strong>Tanggal Penerimaan </strong> </td><td width="20%"> : </td>
    <td>{!! Form::date('name', \Carbon\Carbon::now(), ['class' => 'form-control']); !!}</td>
  </tr>
  <tr>
</table>
		
		</div>
		
<div class="col-md-6">
<table>
  <tr>
    <td><strong>Cara Penerimaan </strong> </td><td width="20%"> : </td>
    <td>{{ Form::select('size', ['L' => 'Large', 'S' => 'Small'], 'S', ['class' => 'form-control']) }}</td>
  </tr>
   <tr>
    <td><strong>Gudang Penerimaan </strong> </td><td width="20%"> : </td>
    <td>{{ Form::select('size', ['L' => 'Large', 'S' => 'Small'], 'S', ['class' => 'form-control']) }}</td>
  </tr>
     <tr>
    <td><strong>Cara Pembayaran </strong> </td><td width="20%"> : </td>
    <td>{{ Form::select('size', ['L' => 'Large', 'S' => 'Small'], 'S', ['class' => 'form-control']) }}</td>
  </tr>
     <tr>
    <td><strong>Tgl Jatuh Tempo </strong> </td><td width="20%"> : </td>
    <td>{!! Form::date('name', \Carbon\Carbon::now(), ['class' => 'form-control']); !!}</td>
  <tr>
</table>
		
		</div>

	</div>
</div>
</div>

<div class="box box-info box-solid">
	<div class="box-header ">TAMBAH PENJUALAN</div>
	<div class="box-body ">
	<div class="row">
		<div class="col-md-12">
			Masukkan Jumlah Barang yang akan dijual:<input type="number" id="member" name="member" value=""> <button class="btn btn-info" id="btn" onclick="addinputFields()">Button</button> | <button type="button" class="btn btn-success" onclick="add()">Tambah</button>
		</div>
	</div>
<hr />
	<div class="row">
		<div class="col-md-2">
		No.
		</div>
		<div class="col-md-2">
		Jenis Daging
		</div>
		<div class="col-md-2">
		Merk Daging
		</div>
		<div class="col-md-2">
		Berat(KG)
		</div>
		<div class="col-md-2">
		Karton
		</div>
		<div class="col-md-2">
		Harga / KG
		</div>
	</div>
	<div id="container"/>
	</div>



@la_access("Penjualans", "create")
<div class="modal fade" id="AddModal" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">Add Penjualan</h4>
			</div>
			{!! Form::open(['action' => 'LA\PenjualansController@store', 'id' => 'penjualan-add-form']) !!}
			<div class="modal-body">
				<div class="box-body">
                    
	                {{ Form::select('size', ['L' => 'Large', 'S' => 'Small'], 'S') }}

				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				{!! Form::submit( 'Submit', ['class'=>'btn btn-success']) !!}
			</div>
			{!! Form::close() !!}
		</div>
	</div>
</div>
@endla_access

@endsection

@push('scripts')

<script>
function addinputFields(){
    var number = document.getElementById("member").value;

    for (i=0;i<number;i++){

        var input = document.createElement("input");
        input.type = "text";
        input.placeholder = "Jenis Daging";
        container.appendChild(input);
        container.appendChild(document.createElement("br"));
    }
}

function add(){

        var input = document.createElement("input");
        input.type = "text";
        input.placeholder = "Jenis Daging";
        container.appendChild(input);
        container.appendChild(document.createElement("br"));
}

</script>
@endpush
