@@ -0,0 +1,196 @@
@extends("la.layouts.app")

@section("contentheader_title", "Processings")
@section("contentheader_description", "Processings listing")
@section("section", "Processings")
@section("sub_section", "Listing")
@section("htmlheader_title", "Processings Listing")

@section("headerElems")
@la_access("Processings", "create")

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
  <div class="box-header ">MEMBUAT PROCESSING</div>
  <div class="box-body ">
  <div class="row">
    <div class="col-md-6">

<table>
  <tr>
    <td><strong>IDPCG </strong></td>
        <td width="20%"> : </td>
        <td style="font-weight: bold;">#PCG0001</td>
  </tr>
  <tr>
    <td><strong>Tanggal Pengerjaan </strong> </td><td width="20%"> : </td>
    <td>{!! Form::date('name', \Carbon\Carbon::now(), ['class' => 'form-control']); !!} </td>
  </tr>
</table>
    </div>

    <div class="col-md-6">
    <table>
      <tr>
        <td><strong>Gudang Processing </strong> </td><td width="10%"> : </td>
       <td>{{ Form::select('size', ['Cakung' => 'Cakung', 'Cimuning' => 'Cimuning'], 'S', ['class' => 'form-control']) }}</td>
      </tr>
         <tr>
        <td><strong>Keterangan </strong> </td><td width="10%"> : </td>
        <td>{!! Form::textarea('notes', null, ['size' => '30x3']); !!}</td>
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
                                      <td>Jenis Awal</td>
                                      <td>Merk Awal</td>
                                      <td>Berat Awal</td>
                                      <td>Karton Awal</td>
                                      <td>Jenis Akhir</td>
                                      <td>Merk Akhir</td>
                                      <td>Berat Akhir</td>
                                      <td>Aksi</td>
                                    </tr>

                                    <?php $i = 1; ?>
                                    <tr id="{{ $i }}">

                                    <td>{{ Form::select("item", $jenisList, "", ["class" => "selectpicker", "data-show-subtext" => "true", "data-live-search" => "true", "id" => "jb", "name" => "jb", "title" => "Pilih Disini"]) }}</td>

                                    <td>{{ Form::select("item", $merkList, "pilih disini", ["class" => "selectpicker", "data-show-subtext" => "true", "data-live-search" => "true", "id" => "mb", "name" => "mb", "title" => "Pilih Disini"]) }}</td>

                                    <td><input type="text" name="name[]" placeholder="Berat Awal" class="form-control name_list" id="bp" style="width:100px;" /></td>

                                    <td><input type="text" name="name[]" placeholder="Karton Awal" class="form-control name_list" id="kpa" style="width:105px;" /></td>

                                    <td>{{ Form::select("item", $jenisList, "", ["class" => "selectpicker", "data-show-subtext" => "true", "data-live-search" => "true", "id" => "jba", "name" => "jb", "title" => "Pilih Disini"]) }}</td>

                                    <td>{{ Form::select("item", $merkList, "pilih disini", ["class" => "selectpicker", "data-show-subtext" => "true", "data-live-search" => "true", "id" => "mba", "name" => "mb", "title" => "Pilih Disini"]) }}</td>

                                    <td><input type="text" name="name[]" placeholder="Berat Akhir" class="form-control name_list" id="bpa" style="width:100px;" /></td>

                                    <td><button type="button" class="btn btn-success" id="test" >Add</button></td>
                                  </tr>

                               </table>

                               <table class="table" id="dynamic_field">

                                  <tr>
                                     <td>Jenis Awal</td>
                                     <td>Merk Awal</td>
                                     <td>Berat Awal</td>
                                     <td>Karton Awal</td>
                                     <td>Jenis Akhir</td>
                                     <td>Merk Akhir</td>
                                     <td>Berat Akhir</td>
                                     <td>Aksi</td>
                                    </tr>
                            <!--      <tr>
                                      <td><input type="text" name="name[]"class="form-control name_list" id="br"/></td>
                                      <td><input type="text" name="name[]"/></td>
                                      <td><input type="text" name="name[]"/></td>
                                      <td><input type="text" name="name[]"/></td>
                                      <td><input type="text" name="name[]"/></td>
                                      <td><button type="button" class="btn btn-success" id="test" >Faktur Penjualan</button></td>
                                  </tr> -->
                               </table>

                               {!! Form::submit('Submit', ['class' => 'btn btn-primary form-control pull-right']) !!}

                          </div>
                          </div>
                          </div>
                          {!! Form::close() !!}



@la_access("Processings", "create")
<div class="modal fade" id="AddModal" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Tambah Processing</h4>
      </div>
      <!-- {!! Form::open(['action' => 'LA\PenjualansController@store', 'id' => 'penjualan-add-form']) !!} -->
      <div class="modal-body">
        <div class="box-body">

                  {{ Form::select('size', ['L' => 'Large', 'S' => 'Small'], 'S') }}


        </div>
      </div>
      <!-- <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        {!! Form::submit( 'Submit', ['class'=>'btn btn-success']) !!}
      </div> -->
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

      var i = 0;


      $('#test').click(function(){
              var jb = document.getElementById("jb").value;
              var mb =  document.getElementById("mb").value;
              var bp =  document.getElementById("bp").value;
              var kpa = document.getElementById("kpa").value;
              var jba = document.getElementById("jba").value;
              var mba = document.getElementById("mba").value;
              var bpa = document.getElementById("bpa").value;

              if(bp == "" || kpa == "") {
                alert('Kolom Berat atau Karton Awal perlu diisi');
                return;
              }
              if(bpa == "") {
                alert('Kolom Berat Akhir perlu diisi');
                return;
              }

              document.getElementById("jb").value = "";
              document.getElementById("mb").value = "";
              document.getElementById("bp").value = "";
              document.getElementById("kpa").value = "";
              document.getElementById("jba").value = "";
              document.getElementById("mba").value = "";
              document.getElementById("bpa").value = "";

           i++;
           $('#dynamic_field').append(
            '<tr id="row'+i+'"><td>'+'<input type="text" name="name[]" placeholder="Jenis Awal" value="'+jb+'" class="form-control name_list" disabled /> '+' </td><td><input type="text" name="name[]" placeholder="Merk Awal" value="'+bp+'" class="form-control name_list" disabled /> '+' </td><td><input type="text" name="name[]" placeholder="Berat Awal" value="'+bp+'" class="form-control name_list" disabled /> '+' </td>  <td><input type="text" name="name[]" placeholder="Karton Awal" value="'+kpa+'" class="form-control name_list" disabled /></td> <td><input type="text" name="name[]" placeholder="Jenis Akhir" value="'+jba+'" class="form-control name_list" disabled/></td> <td><input type="text" name="name[]" placeholder="Merk Akhir" value="'+mba+'" class="form-control name_list" disabled /></td> <td><input type="text" name="name[]" placeholder="Berat Akhir" value="'+bpa+'" class="form-control name_list" disabled/></td> <td><button type="button" name ="remove" class="btn btn-danger btn_remove" id="'+i+'" >X</button></td></tr>');
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

 });

 </script>

@endpush
