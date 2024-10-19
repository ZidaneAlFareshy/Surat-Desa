<?php 
	include ('../../permintaan_surat/konfirmasi/part/akses.php');
  	include ('../../../../config/koneksi.php');

  	$id = $_GET['id'];
  	$qCek = mysqli_query($connect,"SELECT penduduk.*, surat_keterangan_kehilangan.* FROM penduduk LEFT JOIN surat_keterangan_kehilangan ON surat_keterangan_kehilangan.nik = penduduk.nik WHERE surat_keterangan_kehilangan.id_skk='$id'");
  	while($row = mysqli_fetch_array($qCek)){

  		$qTampilDesa = mysqli_query($connect, "SELECT * FROM profil_desa WHERE id_profil_desa = '1'");
        foreach($qTampilDesa as $rows){

			$id_pejabat_desa = $row['id_pejabat_desa'];
		  	$qCekPejabatDesa = mysqli_query($connect,"SELECT pejabat_desa.jabatan, pejabat_desa.nama_pejabat_desa FROM pejabat_desa LEFT JOIN surat_keterangan_kehilangan ON surat_keterangan_kehilangan.id_pejabat_desa = pejabat_desa.id_pejabat_desa WHERE surat_keterangan_kehilangan.id_pejabat_desa = '$id_pejabat_desa' AND surat_keterangan_kehilangan.id_skk='$id'");
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
		<div class="header" style="padding-bottom: 10px; text-align: center;">
			<h4 class="kop" style="text-transform: uppercase">PEMERINTAH <?php echo $rows['kota']; ?></h4>
			<h4 class="kop" style="text-transform: uppercase">KECAMATAN <?php echo $rows['kecamatan']; ?></h4>
			<h4 class="kop" style="text-transform: uppercase">kANTOR KUWU <?php echo $rows['nama_desa']; ?></h4>
			<h5 class="kop2" style="text-transform: capitalize;">Alamat: <?php echo $rows['alamat']; ?></h5>
			<h5 class="kop2" style="margin-top: 10px;">Website: www.grogolkapetakan.desa.cirebonkab.go.id E-mail: ds.grogol@hotmail.com</h5>
			<div style="text-align: center; padding-top: 7px;">
				<hr>
			</div>
		</div>
		<br>
		<div align="center" style="padding-top: 20px;"><u><h3>SURAT KETERANGAN KEHILANGAN</h3></u></div>
		<div align="center"><h4 class="kop3">Nomor :&nbsp;&nbsp;&nbsp;<?php echo $row['no_surat']; ?></h4></div>
	</table>
	<br>
	<div class="clear"></div>
	<div id="isi3">
		<table width="100%">
			<tr>
				<td class="indentasi">Yang bertanda tangan di bawah ini, <a style="text-transform: capitalize;"><?php echo $rowss['jabatan'] . " " . $rows['nama_desa']; ?>, Kecamatan <?php echo $rows['kecamatan']; ?>, <?php echo $rows['kota']; ?></a>, dengan ini menerangkan bahwa :
				</td>
			</tr>
		</table>
		<br><br>
		<table width="100%" style="text-transform: capitalize;">
			<tr>
				<td width="30%" class="indentasi">N&nbsp;&nbsp;&nbsp;A&nbsp;&nbsp;&nbsp;M&nbsp;&nbsp;&nbsp;A</td>
				<td width="2%">:</td>
				<td width="68%" style="text-transform: uppercase; font-weight: bold;"><?php echo $row['nama']; ?></td>
			</tr>
			<?php
				$tgl_lhr = date($row['tgl_lahir']);
				$tgl = date('d ', strtotime($tgl_lhr));
				$bln = date('F', strtotime($tgl_lhr));
				$thn = date(' Y', strtotime($tgl_lhr));
				$blnIndo = array(
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
			?>
			<tr>
				<td class="indentasi">Tempat/Tgl. Lahir</td>
				<td>:</td>
				<td><?php echo $row['tempat_lahir'] . ", " . $tgl . $blnIndo[$bln] . $thn; ?></td>
			</tr>
			<tr>
				<td class="indentasi">NIK</td>
				<td>:</td>
				<td><?php echo $row['nik']; ?></td>
			</tr>
			<tr>
				<td class="indentasi">Jenis Kelamin</td>
				<td>:</td>
				<td><?php echo $row['jenis_kelamin']; ?></td>
			</tr>
			<tr>
				<td class="indentasi">Status Perkawinan</td>
				<td>:</td>
				<td style="text-transform: capitalize;"><?php echo $row['status_perkawinan']; ?></td>
			</tr>
			<tr>
				<td class="indentasi">Kewarganegaraan</td>
				<td>:</td>
				<td style="text-transform: uppercase;"><?php echo $row['kewarganegaraan']; ?></td>
			</tr>
			<tr>
				<td class="indentasi">Pekerjaan</td>
				<td>:</td>
				<td><?php echo $row['pekerjaan']; ?></td>
			</tr>
			<tr>
				<td class="indentasi">Alamat</td>
				<td>:</td>
				<td><?php echo $row['jalan'] . ", RT" . $row['rt'] . "/RW" . $row['rw'] . ", Dusun " . $row['dusun'] . ", Desa " . $row['desa'] . ", Kecamatan " . $row['kecamatan'] . ", " . $row['kota']; ?></td>
			</tr>
		</table>
		<br>
		<!-- <table width="100%">
			<tr>
				<td><b><u>MENERANGKAN BAHWA :</u></b></td>
			</tr>
		</table><br>
		<table width="100%">
			<tr>
				<td width="3%"></td>
				<td width="3%">-</td>
				<td width="94%">Menurut pengakuannya orang tersebut diatas benar-benar mempunyai sebuah perhiasan <a style="text-transform: capitalize;"><?php echo $row['jenis_perhiasan']; ?></a> yang berupa <a style="text-transform: uppercase;"><?php echo $row['nama_perhiasan']; ?></a> <?php echo $row['jenis_perhiasan']; ?> dengan berat ± <?php echo $row['berat']; ?> Gram, yang berasal dari toko emas <a style="text-transform: uppercase;"><b><?php echo $row['toko_perhiasan']; ?></b></a> di 	<a style="text-transform: uppercase;"><?php echo $row['lokasi_toko_perhiasan']; ?></a>, adapun barang tersebut akan diJual.</td>
			</tr>
			<tr>
				<td></td>
				<td>-</td>
				<td>Surat Keterangan / Nota Pembelian dari toko yang asli telah hilang.</td>
			</tr>
			<tr>
				<td></td>
				<td>-</td>
				<td>Surat Keterangan ini bukan sebagai pengganti Surat Keterangan / Nota Pembelian Asli dari toko yang telah hilang.</td>
			</tr>
		</table><br>
		<table width="100%">
			<tr>
				<td width="31%">Surat ini dipergunakan untuk</td>
				<td width="2%">:</td>
				<td width="73%">Menerangkan kebenaran nama diatas sesuai pengakuannya yang sedang menguasai perhiasan tersebut.</td>
			</tr>
			<tr>
				<td>Guna keperluan</td>
				<td>:</td>
				<td style="text-transform: capitalize;"><b><?php echo $row['keperluan']; ?></b></td>
			</tr>
		</table><br>
		<table width="100%">
			<tr>
				<td class="indentasi">Demikian surat keterangan ini dibuat dengan sebenar-benarnya dan digunakan sebagaimana mestinya.
				</td>
			</tr>
		</table>
	</div> -->
	<table width="100%">
			<tr>
			<?php
			function tgl_indo($tanggal){
				$bulan = array(
        			1 => 'Januari',
        			'Februari',
					'Maret',
					'April',
					'Mei',
					'Juni',
					'Juli',
					'Agustus',
					'September',
					'Oktober',
					'November',
					'Desember'
				);
				$hari = array(
					'Sunday' => 'Minggu',
					'Monday' => 'Senin',
					'Tuesday' => 'Selasa',
					'Wednesday' => 'Rabu',
					'Thursday' => 'Kamis',
					'Friday' => 'Jumat',
					'Saturday' => 'Sabtu'
				);
				
				$pecahkan = explode('-', $tanggal);
				$nama_hari = date('l', strtotime($tanggal));
				return $hari[$nama_hari] . ', ' . $pecahkan[2] . ' ' . $bulan[(int)$pecahkan[1]] . ' ' . $pecahkan[0];
			}
			?>
				<td class="indentasi">Bahwa benar orang tersebut di atas adalah warga penduduk Desa kami, yang mengaku telah kehilangan sebuah <b><?php echo $row['barang']; ?></b> a/n pelapor, diketahui hilang di <b style="text-transform: capitalize;"><?php echo $row['lokasi']; ?></b> pada hari <b style="text-transform: capitalize;"><?php echo tgl_indo($row['tanggal']); ?>.</b></td>
			</tr>
		</table><br>
		<table width="100%">
			<tr>
				<td class="indentasi">Surat Keterangan ini dibuat untuk <b style="text-transform: capitalize;"><?php echo $row['keperluan']; ?></b></td>
			</tr>
		</table><br>
		<table width="100%">
			<tr>
				<td class="indentasi">Demikian surat keterangan kehilangan ini kami buat dengan sebenar-benarnya dan untuk dapat dipergunakan seperlunya.</td>
			</tr>
		</table>
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