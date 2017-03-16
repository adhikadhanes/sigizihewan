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
    <td><strong>IDPO </strong></td>
        <td width="20%"> : </td>
        <td style="font-weight: bold;">#SO0001</td>
  </tr>
  <tr>
    <td><strong>Tanggal Penjualan </strong> </td><td width="20%"> : </td>
    <td>{!! Form::date('name', \Carbon\Carbon::now(), ['class' => 'form-control']); !!} </td>
  </tr>
  <tr>
    <td><strong>Nama Pembeli </strong> </td><td width="20%"> : </td>
    <td>{{ Form::select('size', ['L' => 'Large', 'S' => 'Small'], 'S', ['class' => 'form-control', 'name' => 'nama_pembeli']) }}</td>
  </tr>
  <tr>
    <td><strong>Nama Pembeli Retail </strong> </td><td width="20%"> : </td>
        <td>{{ Form::text('hello', '', ['placeholder' => 'Masukkan Nama Pembeli', 'class' => 'form-control', 'id' => 'nama_pembeli_retail'])}}
        </td>
  </tr>
    <tr>
<td><strong>Tanggal Penerimaan </strong> </td><td width="20%"> : </td>
    <td>{!! Form::date('name', \Carbon\Carbon::now(), ['class' => 'form-control']); !!}</td>
  </tr>
</table>

		
		</div>
<div class="col-md-6">
<table>
  <tr>
    <td><strong>Cara Penerimaan </strong> </td><td width="20%"> : </td>
      <td>{{ Form::select('size', ['Pengiriman' => 'Pengiriman', 'Pengambilan' => 'Pengambilan'], 'S', ['class' => 'form-control']) }}</td>
  </tr>
   <tr>
    <td><strong>Gudang Penerimaan </strong> </td><td width="20%"> : </td>
   <td>{{ Form::select('size', ['Cakung' => 'Cakung', 'Cimuning' => 'Cimuning'], 'S', ['class' => 'form-control']) }}</td>
  </tr>
     <tr>
    <td><strong>Cara Pembayaran </strong> </td><td width="20%"> : </td>
  <td>{{ Form::select('size', ['Langsung' => 'Langsung', 'Tempo' => 'Tempo', 'Cicilan' => 'Cicilan'], 'S', ['class' => 'form-control']) }}</td>
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
	<div class="box-header ">DAFTAR BARANG</div>
	<div class="box-body ">
	<!-- <div class="row">
		<div class="col-md-12">
			Masukkan Jumlah Barang yang akan dijual : <input type="number" id="member" name="member" value=""> <button class="btn btn-info" id="btn" onclick="addinputFields()">Tambah</button> | <button type="button" class="btn btn-success" id="add">Tambah</button>
		</div>
	</div> -->

	<div id="container"/>
	</div>

                <div class="form-group">  
                     <form name="add_name" id="add_name">  
                          <div class="table-responsive">  
                               <table class="table">  
                                    <tr>
                                    	<td>Jenis Daging</td>
                                    	<td>Merk Daging</td>
                                    	<td>Berat (KG)</td>
                                    	<td>Karton</td>
                                    	<td>Harga / KG</td>
                                    	<td>Aksi</td>
                                    </tr>


                                    <?php $i = 1; ?>
                                    <tr id="{{ $i }}"><td>{{ Form::select("item", $jenisList, "", ["class" => "selectpicker", "data-show-subtext" => "true", "data-live-search" => "true", "id" => "jd", "name" => "jd"]) }}</td><td><input type="text" name="name[]" placeholder="Merk Daging" class="form-control name_list" id="md" /></td>  <td><input type="text" name="name[]" placeholder="Berat (KG)" class="form-control name_list" id="br" /></td> <td><input type="text" name="name[]" placeholder="Karton" class="form-control name_list" id="kr" /></td>  <td><input type="text" name="name[]" placeholder="Harga / KG" class="form-control name_list" id="hk" /></td><td><button type="button" class="btn btn-success" id="test" >Add</button></td></tr>

                               </table>
                               <table class="table" id="dynamic_field">  
                                  <tr>
                                      <td>Jenis Daging</td>
                                      <td>Merk Daging</td>
                                      <td>Berat (KG)</td>
                                      <td>Karton</td>
                                      <td>Harga / KG</td>
                                      <td>Aksi</td>
                                    </tr>

                               </table>

                               <input type="button" name="submit" id="submit" class="btn btn-info pull-right" value="Submit" />  
                          </div>  
                     </form>  
                </div>  


@endsection

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>

@push('scripts')
<script>
function addinputFields(){
    var number = document.getElementById("member").value;

    for (i=0;i<number;i++){
 
           $('#dynamic_field').append(
           	'<tr id="row'+i+'"><td><input type="text" name="name[]" placeholder="Jenis Daging" class="form-control name_list" /></td><td><input type="text" name="name[]" placeholder="Merk Daging" class="form-control name_list" /></td>  <td><input type="text" name="name[]" placeholder="Berat (KG)" class="form-control name_list" /></td> <td><input type="text" name="name[]" placeholder="Karton" class="form-control name_list" /></td>  <td><input type="text" name="name[]" placeholder="Harga / KG" class="form-control name_list" /></td><td><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove">X</button></td></tr>');  

    }
}



</script>
<script>  
 $(document).ready(function(){  

      var i=0;



      $('#test').click(function(){  
              var jd =  document.getElementById("jd").value;  
              console.log(jd);
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
            '<tr id="row'+i+'"><td>'+'<input type="text" name="name[]" placeholder="Jenis Daging" value="'+jd+'" class="form-control" disabled/>'+'</td><td><input type="text" name="name[]" placeholder="Merk Daging" value="'+md+'" class="form-control name_list" disabled/></td>  <td><input type="text" value="'+br+'"  name="name[]" placeholder="Berat (KG)" class="form-control name_list" /></td> <td><input type="text" value="'+kr+'"  name="name[]" placeholder="Karton" class="form-control name_list" /></td>  <td><input type="text" value="'+hk+'" name="name[]" placeholder="Harga / KG" class="form-control name_list" /></td><td><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove">X</button></td></tr>');  
      }); 

      $('#add').click(function(){  
           i++;  
           $('#dynamic_field').append(
           	'<tr id="row'+i+'"><td>'+'{{ Form::select("item", $jenisList, null, ["class" => "selectpicker form-control", "data-show-subtext" => "true", "data-live-search" => "true"]) }}'+'</td><td><input type="text" name="name[]" placeholder="Merk Daging" class="form-control name_list" /></td>  <td><input type="text" name="name[]" placeholder="Berat (KG)" class="form-control name_list" /></td> <td><input type="text" name="name[]" placeholder="Karton" class="form-control name_list" /></td>  <td><input type="text" name="name[]" placeholder="Harga / KG" class="form-control name_list" /></td><td><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove">X</button></td></tr>');  
      });  
      $(document).on('click', '.btn_remove', function(){  
           var button_id = $(this).attr("id");   
           $('#row'+button_id+'').remove();  
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

          $('select[name ="nama_pembeli"]').change(function () {
              $("#nama_pembeli_retail").prop('disabled', true); 
          });
          $("#nama_pembeli_retail").keyup(function () {
              np.prop('disabled', true); 
          });

      });

             // document.getElementById("nama_pembeli").attr('disabled',true);
             // document.getElementById("nama_pembeli_retail").attr('disabled',true);
 });  
 
   
 </script>

@endpush
