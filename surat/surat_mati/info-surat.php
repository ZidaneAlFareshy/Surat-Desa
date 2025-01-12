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
							<a class="col-sm-6"><h5><b>SURAT KEMATIAN</b></h5></a>
							<a class="col-sm-6"><h5><b>NOMOR SURAT : -</b></h5></a>
						</div>
					</div>
					<hr>
					<form method="post" action="simpan-surat.php" enctype="multipart/form-data">
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
						<div class="row">
							<div class="col-sm-6">
							    <div class="form-group">
						           	<label class="col-sm-12" style="font-weight: 500;">Pekerjaan</label>
						           	<div class="col-sm-12">
						               	<input type="text" name="fpekerjaan" class="form-control" style="text-transform: capitalize;" value="<?php echo $data['pekerjaan']; ?>" readonly>
						           	</div>
						        </div>
							</div>
							<div class="col-sm-6">
						      	<div class="form-group">
						           	<label class="col-sm-12" style="font-weight: 500;">NIK</label>
						           	<div class="col-sm-12">
						               	<input type="text" name="fnik" class="form-control" value="<?php echo $data['nik']; ?>" readonly>
						           	</div>
						        </div>
						  	</div>
						  	<div class="col-sm-6">
						      	<div class="form-group">
						           	<label class="col-sm-12" style="font-weight: 500;">Alamat</label>
						           	<div class="col-sm-12">
						               	<textarea type="text" name="falamat" class="form-control" style="text-transform: capitalize;" readonly><?php echo $data['jalan'] . ", RT" . $data['rt'] . "/RW" . $data['rw'] . ", Dusun " . $data['dusun'] . ",\nDesa " . $data['desa'] . ", Kecamatan " . $data['kecamatan'] . ", " . $data['kota']; ?></textarea>
						           	</div>
						        </div>
						  	</div>
							<div class="col-sm-6">
							    <div class="form-group">
						           	<label class="col-sm-12" style="font-weight: 500;">Kewarganegaraan</label>
						           	<div class="col-sm-12">
						               	<input type="text" name="fkewarganegaraan" class="form-control" style="text-transform: uppercase;" value="<?php echo $data['kewarganegaraan']; ?>" readonly>
						           	</div>
						        </div>
							</div>
						</div>
						<br>
						<h6 class="container-fluid" align="right"><i class="fas fa-edit"></i> Formulir Persyaratan</h6><hr width="97%">
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-sm-12" style="font-weight: 500;">KTP Orang Meninggal</label>
									<div class="col-sm-12">
										<input type="file" name="fktp_meninggal" class="form-control" required>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-sm-12" style="font-weight: 500;">Surat Keterangan Kematian dari Dokter/Rumah Sakit/Kepolisian</label>
									<div class="col-sm-12">
										<input type="file" name="fsuket_kematian" class="form-control" required>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-sm-12" style="font-weight: 500;">KK Orang Meninggal</label>
									<div class="col-sm-12">
										<input type="file" name="fkk_meninggal" class="form-control" required>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-sm-12" style="font-weight: 500;">Surat Pengantar RT diketahui RW</label>
									<div class="col-sm-12">
										<input type="file" name="fsurat_pengantar" class="form-control" required>
									</div>
								</div>
							</div>
						</div>
						<br>
						<h6 class="container-fluid" align="right"><i class="fas fa-edit"></i> Formulir Orang Meninggal</h6><hr width="97%">
						<div class="row">
							<div class="col-sm-6">
						    	<div class="form-group">
						           	<label class="col-sm-12" style="font-weight: 500;">Nama</label>
						           	<div class="col-sm-12">
						               	<input type="text" name="fnama_meninggal" class="form-control" style="text-transform: capitalize;" placeholder="Masukkan Nama" required>
						           	</div>
						        </div>
						    </div>
							<div class="col-sm-6">
						      	<div class="form-group">
						           	<label class="col-sm-12" style="font-weight: 500;">Alamat</label>
						           	<div class="col-sm-12">
						               	<input type="text" name="falamat_meninggal" class="form-control" style="text-transform: capitalize;" placeholder="Masukkan Alamat" required>
						           	</div>
						        </div>
						  	</div>
						  	<div class="col-sm-6">
						      	<div class="form-group">
						           	<label class="col-sm-12" style="font-weight: 500;">NIK</label>
						           	<div class="col-sm-12">
						               	<input type="number" name="fnik_meninggal" class="form-control" style="text-transform: capitalize;" placeholder="Masukkan NIK" required>
						           	</div>
						        </div>
						  	</div>
						  	<div class="col-sm-6">
							  	<div class="form-group">
           							<label class="col-sm-12" style="font-weight: 500;">Jenis Kelamin</label>
           							<div class="col-sm-12">
               							<select name="fjenis_kelamin_meninggal" class="form-control" required>
											<option value="">Pilih Jenis Kelamin</option>
											<option value="Laki-laki">Laki-laki</option>
											<option value="Perempuan">Perempuan</option>
               							</select>
           							</div>
        						</div>
						  	</div>
						  	<div class="col-sm-6">
							  	<div class="form-group">
           							<label class="col-sm-12" style="font-weight: 500;">Status Perkawinan</label>
           							<div class="col-sm-12">
               							<select name="fstatus_perkawinan_meninggal" class="form-control" required>
											<option value="">Status Perkawinan</option>
											<option value="Belum Menikah">Belum Menikah</option>
											<option value="Menikah">Menikah</option>
											<option value="Cerai">Cerai</option>
               							</select>
           							</div>
        						</div>
						  	</div>
						  	<div class="col-sm-6">
							  	<div class="form-group">
           							<label class="col-sm-12" style="font-weight: 500;">Kewarganegaraan</label>
           							<div class="col-sm-12">
               							<select name="fkewarganegaraan_meninggal" class="form-control" required>
											<option value="">Kewarganegaraan</option>
											<option value="WNI">WNI</option>
											<option value="WNA">WNA</option>
               							</select>
           							</div>
        						</div>
						  	</div>
							  <div class="col-sm-6">
						      	<div class="form-group">
						           	<label class="col-sm-12" style="font-weight: 500;">Pekerjaan</label>
						           	<div class="col-sm-12">
						               	<input type="text" name="fpekerjaan_meninggal" class="form-control" style="text-transform: capitalize;" placeholder="Masukkan Pekerjaan" required>
						           	</div>
						        </div>
						  	</div>
						</div>
						<br>
						<h6 class="container-fluid" align="right"><i class="fas fa-edit"></i> Formulir Keterangan Meninggal</h6><hr width="97%">
						<div class="row">
							<div class="col-sm-6">
						    	<div class="form-group">
						           	<label class="col-sm-12" style="font-weight: 500;">Sebab Meninggal</label>
						           	<div class="col-sm-12">
						               	<input type="text" name="fsebab_meninggal" class="form-control" style="text-transform: capitalize;" placeholder="Masukkan Sebab Meninggal" required>
						           	</div>
						        </div>
						    </div>
							<div class="col-sm-6">
      							<div class="form-group">
           							<label class="col-sm-12" style="font-weight: 500;">Tanggal Meninggal</label>
           							<div class="col-sm-12">
               							<input type="date" name="ftanggal_meninggal" class="form-control" required>
           							</div>
       		 					</div>
  							</div>
						  	<div class="col-sm-6">
						      	<div class="form-group">
						           	<label class="col-sm-12" style="font-weight: 500;">Tempat Pemakaman</label>
						           	<div class="col-sm-12">
						               	<input type="text" name="ftempat_pemakaman" class="form-control" style="text-transform: capitalize;" placeholder="Masukkan Tempat Pemakaman" required>
						           	</div>
						        </div>
						  	</div>
						  	<div class="col-sm-6">
						      	<div class="form-group">
						           	<label class="col-sm-12" style="font-weight: 500;">Hari Meninggal</label>
						           	<div class="col-sm-12">
						               	<input type="text" name="fhari_meninggal" class="form-control" style="text-transform: capitalize;" placeholder="Masukkan Hari Meninggal" required>
						           	</div>
						        </div>
						  	</div>
						  	<div class="col-sm-6">
						      	<div class="form-group">
						           	<label class="col-sm-12" style="font-weight: 500;">Tempat Meninggal</label>
						           	<div class="col-sm-12">
						               	<input type="text" name="ftempat_meninggal" class="form-control" style="text-transform: capitalize;" placeholder="Masukkan Tempat Meninggal" required>
						           	</div>
						        </div>
						  	</div>
						</div>
						<hr width="97%">
						<div class="container-fluid">
		                	<input type="reset" class="btn btn-danger" value="Batal">
		                	<input type="submit" name="submit" class="btn btn-primary" value="Submit">
		              	</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

<?php 
		}
	}else{
		header("location:index.php?pesan=gagal");
	}

	include ('../part/footer.php');
?>