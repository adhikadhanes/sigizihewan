@extends('la.layouts.app')

@section('htmlheader_title')
	Penjualan View
@endsection


@section('main-content')
<div id="page-content" class="profile2">
	
	<ul data-toggle="ajax-tab" class="nav nav-tabs profile" role="tablist">
		<li class=""><a href="{{ url(config('laraadmin.adminRoute') . '/penjualans') }}" data-toggle="tooltip" data-placement="right" title="Back to Penjualans"><i class="fa fa-chevron-left"></i></a></li>
		<li class="active"><a role="tab" data-toggle="tab" class="active" href="#tab-general-info" data-target="#tab-info"><i class="fa fa-bars"></i> General Info</a></li>

	</ul>

	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active fade in" id="tab-info">
			<div class="tab-content">
				<div class="panel infolist">
					<div class="panel-default panel-heading">

			@la_access("Penjualans", "edit")
				<a href="{{ url(config('laraadmin.adminRoute') . '/penjualans/'.$penjualan->id.'/edit') }}" class="btn btn-warning"><i class="fa fa-pencil white"></i></a>
			@endla_access

			@la_access("Penjualans", "delete")
				{{ Form::open(['route' => [config('laraadmin.adminRoute') . '.penjualans.destroy', $penjualan->id], 'method' => 'delete', 'style'=>'display:inline']) }}
					<button class="btn btn-danger btn-large" type="submit"><i class="fa fa-times"></i></button>
				<button type="button" class="btn btn-success pull-right" id="test" >Faktur Penjualan</button>
                   <button type="button" class="btn btn-success pull-right" id="test" >Surat Jalan</button>
				{{ Form::close() }}
			@endla_access

					</div>
					<div class="panel-body">
						@la_display($module, 'order_id')
						@la_display($module, 'tgl_penjualan')
						@la_display($module, 'nama_pembeli')
						@la_display($module, 'nama_pembeli_retail')
						@la_display($module, 'tanggal_pengiriman')
						@la_display($module, 'cara_penerimaan')
						@la_display($module, 'cara_pembayaran')
						@la_display($module, 'tgl_jatuh_tempo')
						@la_display($module, 'gudang_pengiriman')

					</div>
				
					<table class="table">
										<tr>
                                      <td><strong>No</strong></td>
                                      <td><strong>Jenis Barang</strong></td>
                                      <td><strong>Merk Barang</strong></td>
                                      <td><strong>Karton</strong></td>
                                      <td><strong>Kg</strong></td>
                                      <td><strong>Harga</strong></td>
                                      <td><strong>Jumlah</strong></td>
                                      
                                      </tr>
                                      
                                      @foreach ($barangOut as $barang)
                                      <tr>
                                      <td>
                                      {{ $barang->id }}
                                      </td>
                                      <td>
                                      {{ $barang->jenis }}
                                      </td>
                                      <td>
                                      {{ $barang->merk}}
                                      </td>
                                      <td>
                                      {{ $barang->karton }}
                                      </td>
                                      <td>
                                      {{ $barang->berat_kg }}
                                      </td>
                                      <td>
                                      {{ $barang->harga_kg }}
                                      </td>
                                 		<td>
                                      100
                                      </td>
                                      </tr>
                                      @endforeach
                                      
                                
                                </table>
				</div>
			</div>
		</div>


		
	</div>
	</div>
	</div>
</div>
@endsection
