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

<head>
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
   <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />
 </head>

<div class="box box-success box-solid">
	<div class="box-header ">TAMBAH PENJUALAN</div>
	<div class="box-body ">
	<div class="row">
		<div class="col-md-6">

<table>
  <tr>
    <td width="40%"><strong>IDSO </strong></td>
        <td width="10%"> : </td>
        <td style="font-weight: bold;">#SO0001</td>
  </tr>
  <tr>
    <td><strong>Tanggal Penjualan </strong> </td><td> : </td>
    <td width="80%">{!! Form::date('name', \Carbon\Carbon::now(), ['class' => 'form-control']); !!} </td>
  </tr>
  <tr>
    <td><strong>Nama Pembeli </strong> </td><td width="20%"> : </td>
    <td>{{ Form::select('Relations', $relationList, null, ['class' => 'selectpicker', 'data-show-subtext' => 'true', 'data-live-search' => 'true' , 'name' => 'nama_pembeli']) }}</td>
  </tr>
  <tr>
    <td><strong>Nama Pembeli Retail </strong> </td><td width="20%"> : </td>
        <td>{{ Form::text('hello', '', ['placeholder' => 'Masukkan Nama Pembeli', 'class' => 'form-control', 'id' => 'nama_pembeli_retail'])}}
        </td>
  </tr>
    <tr>
<td><strong>Tanggal Penerimaan </strong> </td><td> : </td>
    <td>{!! Form::date('name', \Carbon\Carbon::now(), ['class' => 'form-control']); !!}</td>
  </tr>
</table>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>

		</div>
<div class="col-md-6">
<table>
  <tr>
    <td width=35%><strong>Cara Pengiriman </strong> </td><td width="5%"> : </td>
      <td width="80%">{{ Form::select('size', ['Pengiriman' => 'Pengiriman', 'Pengambilan' => 'Pengambilan'], 'S', ['class' => 'form-control']) }}</td>
  </tr>
   <tr>
    <td><strong>Gudang Pengiriman </strong> </td><td> : </td>
   <td>{{ Form::select('size', ['Cakung' => 'Cakung', 'Cimuning' => 'Cimuning'], 'S', ['class' => 'form-control']) }}</td>
  </tr>
     <tr>
    <td><strong>Cara Pembayaran </strong> </td><td> : </td>
  <td>{{ Form::select('size', ['Langsung' => 'Langsung', 'Tempo' => 'Tempo', 'Cicilan' => 'Cicilan'], 'S', ['class' => 'form-control']) }}</td>
  </tr>
     <tr>
    <td><strong>Tgl Jatuh Tempo </strong> </td><td> : </td>
    <td>{!! Form::date('name', \Carbon\Carbon::now(), ['class' => 'form-control']); !!}

      <!-- {{ Form::select("item", $jenisList, null, ["class" => "selectpicker", "data-show-subtext" => "true", "data-live-search" => "true"]) }} -->
    </td>
    <td></td>
  <tr>
</table>

		</div>

	</div>
</div>
</div>

<div class="box box-info box-solid">
	<div class="box-header ">DAFTAR BARANG</div>
	<div class="box-body ">

                
                          <div class="table-responsive">  
                               <table class="table">  
                                    <tr>
                                    	<td>Jenis Daging</td>
                                    	<td>Merk Daging</td>
                                    	<td>Berat (kg)</td>
                                    	<td>Karton</td>
                                    	<td>Harga/kg</td>
                                    	<td>Aksi</td>
                                    </tr>

                                    <?php $i = 1; ?>
                                    <tr id="{{ $i }}"><td>{{ Form::select("item", $jenisList, "", ["class" => "selectpicker", "data-show-subtext" => "true", "data-live-search" => "true", "id" => "jd", "name" => "jd"]) }}</td><td>
                                    {{ Form::select("item", $merkList, "", ["class" => "selectpicker", "data-show-subtext" => "true", "data-live-search" => "true", "id" => "md", "name" => "md"]) }}</td>  <td><input type="text" name="name[]" placeholder="Berat (KG)" class="form-control name_list" id="br" /></td> <td><input type="text" name="name[]" placeholder="Karton" class="form-control name_list" id="kr" /></td>  <td><input type="text" name="name[]" placeholder="Harga / KG" class="form-control name_list" id="hk" /></td><td><button type="button" class="btn btn-success" id="test" >Add</button></td></tr>

                               </table>

                          {!! Form::open(['url' => '/storeTally', 'class' => 'form-horizontal']) !!}
                               <table class="table" id="dynamic_field">  

                                  <tr>
                                      <td>Jenis Daging</td>
                                      <td>Merk Daging</td>
                                      <td>Berat (kg)</td>
                                      <td>Karton</td>
                                      <td>Harga/kg</td>
                                      <td>Aksi</td>
                                    </tr>

                               </table>

                               {!! Form::submit('Submit', ['class' => 'btn btn-primary form-control pull-right']) !!}

                          </div>  
                          {!! Form::close() !!}
                     </form>  
              



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
 $(document).ready(function(){

      $(document).on('click', '.btn_remove', function(){
           var button_id = $(this).attr("id");
           $('#row'+button_id+'').remove();
      });

      var i=0;

      $('#test').click(function(){  
              var jd =  document.getElementById("jd").value;  
              var md = document.getElementById("md").value;
              var br = document.getElementById("br").value;
              var kr = document.getElementById("kr").value;
              var hk = document.getElementById("hk").value;

              document.getElementById("jd").value = "";
              document.getElementById("md").value = "";
              document.getElementById("br").value = "";
              document.getElementById("kr").value = "";
              document.getElementById("hk").value = "";

           i++;
           $('#dynamic_field').append(
            '<tr id="row'+i+'"><input type="hidden" name="nomor" value="'+i+'" class="form-control name_list" /><td>'+'<input type="text" name="jenis_daging'+i+'" value="'+jd+'" placeholder="Jenis Daging" class="form-control" />'+'</td><td><input type="text" name="merk_daging'+i+'" value="'+md+'" placeholder="Merk Daging" class="form-control name_list" /></td><td><input type="text" name="berat'+i+'" value="'+br+'"  placeholder="Berat (KG)" class="form-control name_list" /></td><td><input type="text" name="karton'+i+'" value="'+kr+'"  placeholder="Karton" class="form-control name_list" /></td><td><input type="text" name="harga_kg'+i+'" value="'+hk+'" placeholder="Harga / KG" class="form-control name_list" /></td><td><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove">X</button></td></tr>');  
      }); 


      $('#submit').click(function(){            
           $.ajax({  
                url:"name.php",  
                method:"POST",  
                data:$('#add_name').serialize(),  
                success:function(data)  
                {  
                     alert(data);  
                     $('#add_name')[0].reset();  
                }  
           });  
      });

      $(function () {
          var np = $('select[name="nama_pembeli"]');
          np.prop('disabled', false); 
         
          $("#nama_pembeli_retail").prop('disabled', false); 

          $('select[name="nama_pembeli"]').change(function () {
              $("#nama_pembeli_retail").prop('disabled', true); 
          });
          $("#nama_pembeli_retail").keyup(function () {
              np.prop('disabled', true); 
          });

      });

 </script>

@endpush
