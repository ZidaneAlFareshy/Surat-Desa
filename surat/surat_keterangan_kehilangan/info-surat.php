<?php
	include ('../../config/koneksi.php');
	include ('../part/header.php');
		 
	if (session_status() == PHP_SESSION_NONE) {
        session_start(); // Mulai session hanya jika belum dimulai
    }

    // Cek apakah NIK dikirim dari form di halaman sebelumnya
    if (isset($_POST['fnik'])) {
        $nik = $_POST['fnik']; // Ambil NIK dari form POST

        // Simpan NIK di session agar bisa digunakan di halaman lain (jika diperlukan)
        $_SESSION['nik'] = $nik;

        // Query untuk mendapatkan data penduduk berdasarkan NIK
        $qCekNik = mysqli_query($connect, "SELECT * FROM penduduk WHERE nik = '$nik'");
        $row = mysqli_num_rows($qCekNik);

        if ($row > 0) {
            $data = mysqli_fetch_assoc($qCekNik);
?>
<body class="bg-light">
	<div class="container" style="max-height:cover; padding-top:30px;  padding-bottom:60px; position:relative; min-height: 100%;">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<h5 class="card-header bg-white"><i class="fas fa-envelope"></i> INFORMASI SURAT</h5>
					<br>
					<div class="container-fluid">
						<div class="row">
							<a class="col-sm-6"><h5><b>SURAT KETERANGAN KEHILANGAN</b></h5></a>
							<a class="col-sm-6"><h5><b>NOMOR SURAT : -</b></h5></a>
						</div>
					</div>
					<hr>
					<form method="post" action="simpan-surat.php">
						<h6 class="container-fluid" align="right"><i class="fas fa-user"></i> Informasi Pribadi</h6><hr width="97%">
						<div class="row">
							<div class="col-sm-6">
							    <div class="form-group">
						           	<label class="col-sm-12" style="font-weight: 500;">Nama Lengkap</label>
						           	<div class="col-sm-12">
						               	<input type="text" name="fnama" class="form-control" style="text-transform: capitalize;" value="<?php echo $data['nama']; ?>" readonly>
						           	</div>
						        </div>
							</div>
							<div class="col-sm-6">
							    <div class="form-group">
						           	<label class="col-sm-12" style="font-weight: 500;">Jenis Kelamin</label>
						           	<div class="col-sm-12">
						               	<input type="text" name="fjenis_kelamin" class="form-control" style="text-transform: capitalize;" value="<?php echo $data['jenis_kelamin']; ?>" readonly>
						           	</div>
						        </div>
							</div>
							<div class="col-sm-6">
							    <div class="form-group">
						           	<label class="col-sm-12" style="font-weight: 500;">Tempat, Tgl Lahir</label>
						           	<div class="col-sm-12">
						           		<?php
											$tgl_lhr = date($data['tgl_lahir']);
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
						               	<input type="text" name="ftempat_tgl_lahir" class="form-control" style="text-transform: capitalize;" value="<?php echo $data['tempat_lahir'], ", ", $tgl . $blnIndo[$bln] . $thn; ?>" readonly>
						           	</div>
						        </div>
							</div>
							<div class="col-sm-6">
							    <div class="form-group">
						           	<label class="col-sm-12" style="font-weight: 500;">Agama</label>
						           	<div class="col-sm-12">
						               	<input type="text" name="fagama" class="form-control" style="text-transform: capitalize;" value="<?php echo $data['agama']; ?>" readonly>
						           	</div>
						        </div>
							</div>
						</div>
						<br>
						<h6 class="container-fluid" align="right"><i class="fas fa-edit"></i> Formulir Kehilangan</h6><hr width="97%">
						<div class="row">
						  	<div class="col-sm-12">
						      	<div class="form-group">
						           	<label class="col-sm-12" style="font-weight: 500;">Barang Hilang</label>
						           	<div class="col-sm-12">
						               	<input type="text" name="fbarang_hilang" class="form-control" style="text-transform: capitalize;" placeholder="Masukkan Barang Hilang" required>
						           	</div>
						        </div>
						  	</div>
						</div>
						<div class="row">
						  	<div class="col-sm-12">
						      	<div class="form-group">
						           	<label class="col-sm-12" style="font-weight: 500;">Lokasi Hilang</label>
						           	<div class="col-sm-12">
						               	<input type="text" name="flokasi_hilang" class="form-control" style="text-transform: capitalize;" placeholder="Masukkan Lokasi Barang Hilang" required>
						           	</div>
						        </div>
						  	</div>
						</div>
						<div class="row">
    						<div class="col-sm-12">
        						<div class="form-group">
            						<label class="col-sm-12" style="font-weight: 500;">Tanggal Kehilangan</label>
            						<div class="col-sm-12">
                						<input type="date" name="ftanggal_hilang" class="form-control" placeholder="Pilih Tanggal Kehilangan" required>
            						</div>
        						</div>
    						</div>
						</div>
						<br>
						<h6 class="container-fluid" align="right"><i class="fas fa-edit"></i> Formulir Surat</h6><hr width="97%">
						
						<div class="row">
						  	<div class="col-sm-12">
						      	<div class="form-group">
						           	<label class="col-sm-12" style="font-weight: 500;">Keperluan Surat</label>
						           	<div class="col-sm-12">
						               	<input type="text" name="fkeperluan" class="form-control" style="text-transform: capitalize;" placeholder="Masukkan Keperluan Surat" required>
						           	</div>
						        </div>
						  	</div>
						</div>
						<hr width="97%">
						<input type="hidden" name="fnik" value="<?php echo $data['nik']; ?>">
						<div class="container-fluid">
		                	<input type="reset" class="btn btn-warning" value="Batal">
		                	<input type="submit" name="submit" class="btn btn-info" value="Submit">
		              	</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

<?php 
    } else {
        header("location:index.php?pesan=gagal");
    }
} else {
    header("location:../login/index.php");
}
include ('../part/footer.php');
?>