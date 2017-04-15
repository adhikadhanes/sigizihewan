@extends('la.layouts.app')

@section('htmlheader_title')
	Penjualan View
@endsection


@section('main-content')
<head>
	<title>Faktur Penjualan</title>
</head>
<div class="col-sm-12">
<STRONG>Kepada Yth:</STRONG>
{{$nama_pembeli}}</div>

<table class="table">
<div class="col-sm-6">
	<tr>
		<td><strong>No</strong></td>
        <td><strong>Nama Barang</strong></td>
        <td><strong>Karton</strong></td>
        <td><strong>Kg</strong></td>
        <td><strong>Harga</strong></td>
        <td><strong>Jumlah</strong></td>
	</tr>
</div>
<div class="col-sm-6">
<tr>
		<?php $nomor = 1; ?>
		@foreach ($barangout as $barangout)
		<td>{{$nomor++}}</td>
		<td>{{ $barangout->jenis }} {{ $barangout->merk }}</td>
		<td>{{ $barangout->karton }}</td>
		<td>{{ $barangout->berat_kg }}</td>
		<td>{{ $barangout->harga_kg }}</td>
		<td>{{ $barangout->harga_kg*$barangout->berat_kg }}</td>
		@endforeach
	</tr>
</div>



</table>

@endsection
