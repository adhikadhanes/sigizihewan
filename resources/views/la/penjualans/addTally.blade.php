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
  <div class="box-header ">TALLY BARANG MASUK (WAREHOUSE)</div>
  <div class="box-body ">
  <div class="row">
<div class="col-md-6">
<table>
  <tr>
    <td><strong>IDPO </strong></td>
        <td width="20%"> : </td>
        <td style="font-weight: bold;"></td>
  </tr>
  <tr>
    <td><strong>Nama Supplier </strong> </td><td width="20%"> : </td>
    <!-- <td>{!! Form::date('name', \Carbon\Carbon::now(), ['class' => 'form-control']); !!} </td> -->
  </tr>
</table>
    </div>

<div class="col-md-6">
<table>
  <tr>
    <td><strong>GUDANG PENERIMAAN </strong></td>
    <td width="20%"> : </td>
    <td style="font-weight: bold;"></td>
  </tr>
  <tr>
    <td><strong>TANGGAL PENERIMAAN </strong></td>
    <td width="20%"> : </td>
    <td style="font-weight: bold;"></td>
  </tr>
</table>
</div>

  </div>
</div>
</div>

<div class="box box-info box-solid">
  <div class="box-header ">DAFTAR BARANG</div>
  <div class="box-body ">

  <div id="container"/>
  </div>

                <div class="form-group">  
                     <form name="add_tally" id="add_tally">  
                          <div class="table-responsive">  
                               <table class="table">  
                                    <tr>
                                      <td>1</td>
                                      <td>2</td>
                                      <td>3</td>
                                      <td>4</td>
                                      <td>5</td>
                                      <td>6</td>
                                      <td>7</td>
                                      <td>8</td>
                                      <td>9</td>
                                      <td>10</td>
                                      <td>Total Berat</td>
                                    </tr>

                                    <?php $i = 1; ?>
                                    <tr id="{{ $i }}">

                                    <td><input type="number" name="name[]" class="form-control name_list tally" id="tally1" /></td>

                                    <td><input type="number" name="name[]" class="form-control name_list tally" id="tally2" /></td>

                                    <td><input type="number" name="name[]" class="form-control name_list tally" id="tally3" /></td>

                                    <td><input type="number" name="name[]" class="form-control name_list tally" id="tally4" /></td>

                                    <td><input type="number" name="name[]" class="form-control name_list tally" id="tally5" /></td>

                                    <td><input type="number" name="name[]" class="form-control name_list tally" id="tally6" /></td>

                                    <td><input type="number" name="name[]" class="form-control name_list tally" id="tally7" /></td>

                                    <td><input type="number" name="name[]" class="form-control name_list tally" id="tally8" /></td>

                                    <td><input type="number" name="name[]" class="form-control name_list tally" id="tally9" /></td>

                                    <td><input type="number" name="name[]" class="form-control name_list tally" id="tally10" /></td>

                                    <td><input type="number" name="name[]" class="form-control name_list total" id="totalBerat" /></td>

                                    <td><button type="button" class="btn btn-success" id="test" >Add</button></td></tr>

                               </table>
                               <table class="table" id="dynamic_field">  
                                  <tr>
                                      <td>1</td>
                                      <td>2</td>
                                      <td>3</td>
                                      <td>4</td>
                                      <td>5</td>
                                      <td>6</td>
                                      <td>7</td>
                                      <td>8</td>
                                      <td>9</td>
                                      <td>10</td>
                                    </tr>

                               </table>

                               <input type="button" name="submit" id="submit" class="btn btn-primary form-control pull-right" value="Submit" />  
                          </div>  
                     </form>  
                </div>  



<!-- @la_access("Processings", "create")
<div class="modal fade" id="AddModal" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Tambah Processing</h4>
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


@endla_access -->


@endsection

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>

@push('scripts')
<script>
 $(document).ready(function(){
      var i = 0;

      $(document).on('click', '.btn_remove', function(){
           var button_id = $(this).attr("id");
           $('#row'+button_id+'').remove();
      });


      $('.tally').on("keyup", function(){
      var tally1 = parseFloat($('#tally1').val()) || 0;
      var tally2 = parseFloat($('#tally2').val()) || 0;
      var tally3 = parseFloat($('#tally3').val()) || 0;
      var tally4 = parseFloat($('#tally4').val()) || 0;
      var tally5 = parseFloat($('#tally5').val()) || 0;
      var tally6 = parseFloat($('#tally6').val()) || 0;
      var tally7 = parseFloat($('#tally7').val()) || 0;
      var tally8 = parseFloat($('#tally8').val()) || 0;
      var tally9 = parseFloat($('#tally9').val()) || 0;
      var tally10 = parseFloat($('#tally10').val()) || 0;
      var totalBerat = tally1 + tally2 + tally3 + tally4 + tally5 + tally6 + tally7 + tally8 + tally9+ tally10;
      $('#totalBerat').val(totalBerat);
      console.log(totalBerat);
      });


      $('#test').click(function(){
              var satu = document.getElementById("tally1").value;
              var dua =  document.getElementById("tally2").value;
              var tiga =  document.getElementById("tally3").value;
              var empat = document.getElementById("tally4").value;
              var lima = document.getElementById("tally5").value;
              var enam = document.getElementById("tally6").value;
              var tujuh = document.getElementById("tally7").value;
              var delapan = document.getElementById("tally8").value;
              var sembilan = document.getElementById("tally9").value;
              var sepuluh = document.getElementById("tally10").value;
              var totalBerat = document.getElementById("totalBerat").value;

              if(bp == "" && kpa == "" && jba == "" && mba == "" && bpa == "") {
                alert('Kolom belum diisi.');
                return;
              }

              document.getElementById("tally1").value = "";
              document.getElementById("tally2").value = "";
              document.getElementById("tally3").value = "";
              document.getElementById("tally4").value = "";
              document.getElementById("tally5").value = "";
              document.getElementById("tally6").value = "";
              document.getElementById("tally7").value = "";
              document.getElementById("tally8").value = "";
              document.getElementById("tally9").value = "";
              document.getElementById("tally10").value = "";
              document.getElementById("totalBerat").value = "";

           i++;  
           $('#dynamic_field').append(
            '<tr id="row'+i+'"><td>'+'<input type="text" name="baris"  value="'+i+'" class="form-control name_list" disabled /> '+' </td><td><input type="text" name="name['+i+'][satu]" value="'+satu+'" class="form-control name_list" disabled /> '+' </td><td><input type="text" name="name['+i+'][dua]" value="'+dua+'" class="form-control name_list" disabled /> '+' </td>  <td><input type="text" name="name['+i+'][tiga]" value="'+tiga+'" class="form-control name_list" disabled /></td> <td><input type="text" name="name['+i+'][empat]" value="'+empat+'" class="form-control name_list" disabled/></td> <td><input type="text" name="name['+i+'][lima]" value="'+lima+'" class="form-control name_list" disabled /></td> <td><input type="text" name="name['+i+'][enam]" value="'+enam+'" class="form-control name_list" disabled/></td> <td><input type="text" name="name['+i+'][tujuh]" value="'+tujuh+'" class="form-control name_list" disabled/></td> <td><input type="text" name="name['+i+'][delapan]" value="'+delapan+'" class="form-control name_list" disabled/></td> <td><input type="text" name="name['+i+'][sembilan]" value="'+sembilan+'" class="form-control name_list" disabled/></td> <td><input type="text" name="name['+i+'][sepuluh]" value="'+sepuluh+'" class="form-control name_list" disabled/></td><td><button type="button" name ="remove" class="btn btn-danger btn_remove" id="'+i+'" >X</button></td></tr>');

      }); 

 });

 </script>

@endpush
