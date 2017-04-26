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
{!! Form::open(['url' => '/storePenjualan', 'class' => 'form-horizontal']) !!}
<div class="box box-success box-solid">
	<div class="box-header ">TAMBAH PENJUALAN</div>
	<div class="box-body ">
	<div class="row">
		<div class="col-md-6">

<table>
  <tr>
    <td><strong>Tanggal Penjualan </strong> </td><td> : </td>
    <td width="10%">{!! Form::date('tgl_penjualan', \Carbon\Carbon::today()->toDateString(), ['class' => 'form-control']); !!} </td>
  </tr>
  <tr>

    <td><strong>Nama Pembeli </strong> </td><td width="20%"> : </td>
    <td>{{ Form::select('nama_pembeli', $relationList, null, ['class' => 'selectpicker', 'data-show-subtext' => 'true', 'data-live-search' => 'true']) }}</td>
  </tr>

    <tr>
<td><strong>Tanggal Pengiriman </strong> </td><td> : </td>
    <td>{!! Form::date('tanggal_pengiriman', \Carbon\Carbon::today()->toDateString(), ['class' => 'form-control']); !!}</td>
  </tr>
</table>

		</div>
<div class="col-md-6">
<table>
  <tr>
    <td width=35%><strong>Cara Penerimaan </strong> </td><td width="5%"> : </td>
      <td width="80%">{{ Form::select('cara_penerimaan', ['Pengiriman' => 'Pengiriman', 'Pengambilan' => 'Pengambilan'], null, ['class' => 'form-control']) }}</td>
  </tr>
   <tr>
    <td><strong>Gudang Pengiriman</strong> </td><td> : </td>
   <td>{{ Form::select('gudang_pengiriman', $gudangList, null, ['class' => 'form-control']) }}</td>
  </tr>
     <tr>
    <td><strong>Cara Pembayaran </strong> </td><td> : </td>
  <td>{{ Form::select('cara_pembayaran', ['Langsung' => 'Langsung', 'Tempo' => 'Tempo', 'Cicilan' => 'Cicilan'], 'S', ['class' => 'form-control']) }}</td>
  </tr>
     <tr>
    <td><strong>Tgl Jatuh Tempo </strong> </td><td> : </td>
    <td>{!! Form::date('tgl_jatuh_tempo', \Carbon\Carbon::today()->toDateString(), ['class' => 'form-control']); !!}

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
                                    {{ Form::select("item", $merkList, "", ["class" => "selectpicker", "data-show-subtext" => "true", "data-live-search" => "true", "id" => "md", "name" => "md"]) }}</td>  <td><input type="number" step="0.01" name="name[]" placeholder="Berat (KG)" class="form-control name_list" id="br" /></td> <td><input type="number" name="name[]" placeholder="Karton" class="form-control name_list" id="kr" /></td>  <td><input type="number" step="0.01" name="name[]" placeholder="Harga / KG" class="form-control name_list" id="hk" /></td><td><button type="button" class="btn btn-success" id="test" >Add</button></td></tr>

                               </table>

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
                          </div>  
                          </div>  
                          {!! Form::close() !!} 
              



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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>

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

              var jdnama = ""; 
              var mdnama = "";

              // $.get('getJenis/' + jd, function (data) {
              //             //success data
              //             jdnama = String(data.nama);
              //             alert(data.nama);
              //         }) 
              
              
              // alert(jdnama);


              var br = document.getElementById("br").value;
              var kr = document.getElementById("kr").value;
              var hk = document.getElementById("hk").value;

              if(br == "" && br == "" && br == "") {
                alert('Kolom Berat, Karton, Kilogram ada yang belum diisi.');
                return;
              }

              document.getElementById("br").value = "";
              document.getElementById("kr").value = "";
              document.getElementById("hk").value = "";

           i++;
           $('#dynamic_field').append(
            '<tr id="row'+i+'"><input type="hidden" name="nomor" value="'+i+'" class="form-control name_list" /><td>'+
            '<input type="hidden" name="baris['+i+'][jenis_daging]" value="'+jd+'" class="form-control name_list" />'+
            '<input type="hidden" name="baris['+i+'][merk_daging]" value="'+md+'" class="form-control name_list" />'+
            '<input type="text" value="'+jdnama+'" placeholder="Jenis Daging" class="form-control" readonly/></td><td>'+
            '<input type="text"  value="'+mdnama+'" placeholder="Merk Daging" class="form-control name_list" readonly/></td><td><input type="number" name="baris['+i+'][berat]" value="'+br+'"  placeholder="Berat (KG)" class="form-control name_list" /></td><td><input type="number" name="baris['+i+'][karton]" value="'+kr+'"  placeholder="Karton" class="form-control name_list" /></td><td><input type="number" name="baris['+i+'][harga_kg]" value="'+hk+'" placeholder="Harga / KG" class="form-control name_list" /></td><td><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove">X</button></td></tr>');  
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
            });

 </script>

@endpush
