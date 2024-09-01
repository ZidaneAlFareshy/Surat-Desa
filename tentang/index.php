<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="../assets/img/logo-cirebon.png">
	<title>e-SuratDesa</title>
	<link rel="stylesheet" href="../assets/fontawesome-5.10.2/css/all.css">
	<link rel="stylesheet" href="../assets/bootstrap-4.3.1/dist/css/bootstrap.min.css">
	<style type="text/css">
		.img-circle{
			width: 150px;
			height: 150px;
			border-radius: 100%;
		}
		.navbar {
			background-color: #00A658;
		}
	</style>
</head>
<body class="bg-light">
	<div>
		<nav class="navbar navbar-expand-lg navbar-dark ">
			<a class="navbar-brand ml-4 mt-1" href="../"><img src="../assets/img/logo-surat.png"></a>
			<button class="navbar-toggler mr-4 mt-3" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
				<ul class="navbar-nav ml-auto mt-lg-3 mr-5 position-relative text-right">
					<li class="nav-item">
						<a class="nav-link" href="../">HOME</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="../surat">BUAT SURAT</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="#"><i class="fas fa-info-circle"></i>&nbsp;TENTANG <b>e-SuratDesa</b></a>
					</li>
					<li class="nav-item active ml-5">
						<?php
						session_start();

						if(empty($_SESSION['username'])){
							echo '<a class="btn btn-light text-info" href="../login/"><i class="fas fa-sign-in-alt"></i>&nbsp;LOGIN</a>';
						}else if(isset($_SESSION['lvl'])){
							echo '<a class="btn btn-transparent text-light" href="../admin/"><i class="fa fa-user-cog"></i> '; echo $_SESSION['lvl']; echo '</a>';
							echo '<a class="btn btn-transparent text-light" href="../login/logout.php"><i class="fas fa-power-off"></i></a>';
						}
						?>
					</li>
				</ul>
			</div>
		</nav>
	</div>
	<div class="container-fluid">
		<div class="container shadow p-3 mb-5 mt-lg-5 bg-white rounded">
			<div style="max-height:cover; padding-top:30px; padding-bottom:60px; position:relative; min-height: 100%;">
				<div class="card-body">
					<div class="card-text">
						<p>
							<label style="font-weight: 700;font-size: 25px"><i class="fas fa-info-circle"></i> APA ITU e-SuratDesa?</label>
							<hr>
							<blockquote>
								Web Aplikasi untuk pelayanan surat administrasi desa untuk mempermudah penduduk dalam pembuatan surat administrasi desa secara online.
								<br>
								<br>
							</blockquote>
						</p>
						<br>
						<p class="card-text">
							<label style="font-weight: 700;font-size: 25px"><i class="fas fa-shield-alt"></i> PANDUAN</label>
						</p>
						<hr>
						
						<blockquote>
							Klik tombol atau menu BUAT SURAT<br>
							Tampil halaman pilihan jenis surat<br>
							Klik tombol BUAT SURAT<br>
							Masukkan NIK<br>
							Klik tombol CEK NIK<br>
							Bila NIK sesuia tampil data identitas<br>
							Bila NIK sesuia tampil data identitas<br>
							Isi baris Keperluan Surat<br>
							Klik Submit<br>
							Setelah berhasil akan tampil pesan<br>
							Berhasil membuat surat. Silahkan ambil surat di Kantor Desa dalam 2-3 hari kerja!<br>
							<br>
							<br>
						</blockquote>
					</div>
				</div>
			</div>
		</div>
		<div class="footer bg-dark text-center">
			<span class="text-light"><strong>Copyright &copy; 2023 <a href="../" class="text-decoration-none text-white">e-SuratDesa</a>.</strong> All rights reserved.</span>
		</div>
	</body>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="content-script.js"></script>
	</html>