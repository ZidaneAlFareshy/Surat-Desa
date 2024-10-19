<?php 
	include ('../../permintaan_surat/konfirmasi/part/akses.php');
  	include ('../../../../config/koneksi.php');

	// Ubah format tanggal menjadi format Indonesia
	function formatTanggalIndonesia($tanggal) {
		// Mengambil bagian tahun, bulan, dan hari dari tanggal
		$tanggalExplode = explode('-', $tanggal);
		// Mengembalikan format DD-MM-YYYY
		return $tanggalExplode[2] . '-' . str_pad($tanggalExplode[1], 2, '0', STR_PAD_LEFT) . '-' . $tanggalExplode[0];
	}

  	$id = $_GET['id'];
  	$qCek = mysqli_query($connect,"SELECT penduduk.*, surat_lapor_hajatan.* FROM penduduk LEFT JOIN surat_lapor_hajatan ON surat_lapor_hajatan.nik = penduduk.nik WHERE surat_lapor_hajatan.id_slh='$id'");
  	while($row = mysqli_fetch_array($qCek)){

  		$qTampilDesa = mysqli_query($connect, "SELECT * FROM profil_desa WHERE id_profil_desa = '1'");
        foreach($qTampilDesa as $rows){

			$id_pejabat_desa = $row['id_pejabat_desa'];
		  	$qCekPejabatDesa = mysqli_query($connect,"SELECT pejabat_desa.jabatan, pejabat_desa.nama_pejabat_desa FROM pejabat_desa LEFT JOIN surat_lapor_hajatan ON surat_lapor_hajatan.id_pejabat_desa = pejabat_desa.id_pejabat_desa WHERE surat_lapor_hajatan.id_pejabat_desa = '$id_pejabat_desa' AND surat_lapor_hajatan.id_slh='$id'");
		  	while($rowss = mysqli_fetch_array($qCekPejabatDesa)){
?>

<html>
<head>
	<link rel="shortcut icon" href="../../../../assets/img/mini-logo.png">
	<title>CETAK SURAT</title>
	<link href="../../../../assets/formsuratCSS/formsurat.css" rel="stylesheet" type="text/css"/>
	<style type="text/css" media="print">
	    @page { margin: 0; }
  		body { 
  			margin: 1cm;
  			margin-left: 2cm;
  			margin-right: 2cm;
  			font-family: "Times New Roman", Times, serif;
  		}
	</style>
</head>
<body>
<div>
<table width="100%">
		<tr><img src="../../../../assets/img/logo-cirebon-90x90.png" alt="" class="logo"></tr>
		<div class="header" style="padding-bottom: 10px;">
			<h4 class="kop" style="text-transform: uppercase">PEMERINTAH <?php echo $rows['kota']; ?></h4>
			<h4 class="kop" style="text-transform: uppercase">KECAMATAN <?php echo $rows['kecamatan']; ?></h4>
			<h4 class="kop" style="text-transform: uppercase">KANTOR KUWU <?php echo $rows['nama_desa']; ?></h4>
			<h5 class="kop2" style="text-transform: capitalize;">Alamat: <?php echo $rows['alamat']; ?></h5>
			<h5 class="kop2" style="margin-top: 10px;">Website: www.grogolkapetakan.desa.cirebonkab.go.id E-mail: ds.grogol@hotmail.com</h5>
			<div style="text-align: center; padding-top: 5px;">
				<hr>
			</div>
		</div>
		<br>
		<div align="center" style="padding-top: 20px;"><u><h3>SURAT KELAHIRAN</h3></u></div>
		<div align="center"><h4 class="kop3">Nomor :&nbsp;&nbsp;&nbsp;<?php echo $row['no_surat']; ?></h4></div>
	</table>
	<div class="clear"></div>
	<div id="isi3">
		<table width="100%">
			<tr>
				<td class="indentasi">Yang bertanda tangan di bawah ini, menerangkan
				</td>
			</tr>
			<tr>
				<td>Bahwa pada :</td>
			</tr>
		</table>
		<table width="100%" style="text-transform: capitalize;">
			<tr>
				<td width="30%" class="indentasi">Hari</td>
				<td width="2%">:</td>
				<td width="68%" style="text-transform: uppercase;"><?php echo $row['hari_lahir']; ?></td>
			</tr>
			<tr>
				<td class="indentasi">Tanggal</td>
				<td>:</td>
				<td><?php echo formatTanggalIndonesia($row['tanggal_lahir_anak']); ?></td>
			</tr>
			<tr>
				<td class="indentasi">Di</td>
				<td>:</td>
				<td><?php echo $row['alamat_lahir']; ?></td>
			</tr>
		</table>
		<br>
		<table width="100%">
			<tr>
				<td>Telah Lahir Seorang Anak Laki Laki / Perempuan :
				</td>
			</tr>
		</table>
		<table width="100%" style="text-transform: capitalize;">
			<tr>
				<td width="30%" class="indentasi">Bernama</td>
				<td width="2%">:</td>
				<td width="68%" style="text-transform: uppercase; font-weight: bold;"><?php echo $row['nama_anak']; ?></td>
			</tr>
			<tr>
				<td class="indentasi">Anak Ke</td>
				<td>:</td>
				<td><?php echo $row['nomor_anak']; ?></td>
			</tr>
		</table>
		<br>
		<table width="100%">
			<tr>
				<td>Dari Seorang Ibu :
				</td>
			</tr>
		</table>
		<table width="100%" style="text-transform: capitalize;">
			<tr>
				<td width="30%" class="indentasi">N&nbsp;&nbsp;&nbsp;A&nbsp;&nbsp;&nbsp;M&nbsp;&nbsp;&nbsp;A</td>
				<td width="2%">:</td>
				<td width="68%" style="text-transform: uppercase; font-weight: bold;"><?php echo $row['nama_ibu']; ?></td>
			</tr>
			<tr>
				<td class="indentasi">Umur</td>
				<td>:</td>
				<td><?php echo $row['umur_ibu']; ?> Tahun</td>
			</tr>
		</table>
		<br>
		<table width="100%">
			<tr>
				<td>Istri Dari :
				</td>
			</tr>
		</table>
		<table width="100%" style="text-transform: capitalize;">
			<tr>
				<td width="30%" class="indentasi">N&nbsp;&nbsp;&nbsp;A&nbsp;&nbsp;&nbsp;M&nbsp;&nbsp;&nbsp;A</td>
				<td width="2%">:</td>
				<td width="68%" style="text-transform: uppercase; font-weight: bold;"><?php echo $row['nama_ayah']; ?></td>
			</tr>
			<tr>
				<td class="indentasi">Umur</td>
				<td>:</td>
				<td><?php echo $row['umur_ayah']; ?> Tahun</td>
			</tr>
			<tr>
				<td class="indentasi">Agama</td>
				<td>:</td>
				<td><?php echo $row['agama']; ?></td>
			</tr>
			<tr>
				<td class="indentasi">Pekerjaan</td>
				<td>:</td>
				<td><?php echo $row['pekerjaan_ayah']; ?></td>
			</tr>
			<tr>
				<td class="indentasi">Alamat</td>
				<td>:</td>
				<td><?php echo $row['alamat']; ?></td>
			</tr>
		</table>
		<br>
		<table width="100%">
			<tr>
				<td class="indentasi">Surat Keterangan Ini Di Buat Atas Dasar Yang Sebenarnya.
				</td>
			</tr>
		</table>
		<br>
	</div>
	<br>
	<table width="100%" style="text-transform: capitalize;">
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr>
			<td width="10%"></td>
			<td width="30%"></td>
			<td width="10%"></td>
			<td align="center">
				<?php echo $rows['nama_desa']; ?>, 
				<?php
					$tanggal = date('d F Y');
					$bulan = date('F', strtotime($tanggal));
					$bulanIndo = array(
					    'January' => 'Januari',
					    'February' => 'Februari',
					    'March' => 'Maret',
					    'April' => 'April',
					    'May' => 'Mei',
					    'June' => 'Juni',
					    'July' => 'Juli',
					    'August' => 'Agustus',
					    'September' => 'September',
					    'October' => 'Oktober',
					    'November' => 'November',
					    'December' => 'Desember'
					);
					echo date('d ') . $bulanIndo[$bulan] . date(' Y');
				?>
			</td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td align="center"><?php echo $rowss['jabatan'] . " " . $rows['nama_desa']; ?></td>
		</tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td align="center" style="text-transform: uppercase;"><u><b><?php echo $rowss['nama_pejabat_desa']; ?></b></u></td>
		</tr>
	</table>
</div>
<script>
	window.print();
</script>
</body>
</html>

<?php
			}
		}
  	}
?>