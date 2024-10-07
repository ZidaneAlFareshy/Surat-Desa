<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="../assets/img/logo-cirebon.png">
	<title>SuratDesaOnline</title>
  	<link rel="stylesheet" href="../assets/fontawesome-5.10.2/css/all.css">
	<link rel="stylesheet" href="../assets/bootstrap-4.3.1/dist/css/bootstrap.min.css">
	<style>
		.navbar {
			background-color: #00A658;
		}

		/* Card Styling */
		.card {
			border: none;
			border-radius: 15px;
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
			transition: transform 0.2s ease-in-out;
		}

		.card:hover {
			transform: translateY(-10px);
			box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
		}

		.card img {
			border-top-left-radius: 15px;
			border-top-right-radius: 15px;
		}

		.card-body {
			padding: 20px;
		}

		.card-title {
			font-size: 1.25rem;
			font-weight: 600;
			margin-bottom: 1rem;
			color: #333;
		}

		.card-text {
			font-size: 0.95rem;
			color: #555;
		}

		.btn {
			border-radius: 25px;
			padding: 10px 20px;
			background-color: #00A658;
			color: white;
			transition: background-color 0.3s ease;
		}

		.btn:hover {
			background-color: #007F45;
			color: white;
		}

		/* Responsive Styling */
		@media (max-width: 576px) {
			.card-title {
				font-size: 1rem;
			}
			.card-body {
				padding: 15px;
			}
			.btn {
				padding: 8px 15px;
			}
		}
	</style>
</head>
<body class="bg-light">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  	<a class="navbar-brand ml-4 mt-1" href="../"><img src="../assets/img/logo-surat.png"></a>
	  	<button class="navbar-toggler mr-4 mt-3" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
	    	<span class="navbar-toggler-icon"></span>
	  	</button>

	  	<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
	    	<ul class="navbar-nav ml-auto mt-lg-3 mr-5 position-relative text-right">
	      		<li class="nav-item">
	        		<a class="nav-link" href="../">HOME</a>
	      		</li>
	      		<li class="nav-item active">
	        		<a class="nav-link" href="#"><i class="fas fa-envelope"></i>&nbsp;BUAT SURAT</a>
	      		</li>
	      		<li class="nav-item">
	        		<a class="nav-link" href="../tentang/">TENTANG</a>
	      		</li>
	      		<li class="nav-item active ml-5">
	      			<?php
						session_start();

						if(empty($_SESSION['username'])){
						    echo '<a class="btn btn-light text-info" href="../login/"><i class="fas fa-sign-in-alt"></i>&nbsp;LOGIN</a>';
						}else if(isset($_SESSION['lvl'])){
							echo '<a class="btn btn-transparent text-black" href="../admin/"><i class="fa fa-user-cog"></i> '; echo $_SESSION['lvl']; echo '</a>';
							echo '<a class="btn btn-transparent text-black" href="../login/logout.php"><i class="fas fa-power-off"></i></a>';
						}
					?>
	      		</li>
	    	</ul>
	  	</div>
	</nav>
	
<div class="container-fluid">
	<div style="max-height:cover; padding-top:30px; padding-bottom:60px; position:relative; min-height: 100%;">
		<div>
			<?php 
   	        	if(isset($_GET['pesan'])){
                   	if($_GET['pesan']=="berhasil"){
                  		echo "<div class='alert alert-success'><center>Berhasil membuat surat. Silahkan tunggu pesan dari kami dalam 2-3 hari kerja!</center></div>";
              		}
              	}
           	?>
		</div>
		<div class="row">
			<div class="col-sm-3 mt-4">
		    	<div class="card">
		      		<img src="../assets/img/list-surat.png" class="card-img-top" alt="...">
		      		<div class="card-body text-center">
		        		<h5 class="card-title">SURAT KETERANGAN KTP SEMENTARA</h5><br><br>
		        		<?php
						if (session_status() == PHP_SESSION_NONE) {
							session_start(); // Mulai session hanya jika belum dimulai
						}

						if (isset($_SESSION['lvl'])) {
							if ($_SESSION['lvl'] == 'Administrator') {
								echo '<a href="surat_keterangan/" class="btn btn-info">BUAT SURAT</a>';
							} elseif ($_SESSION['lvl'] == 'User') {
								// Menyertakan NIK yang ada di session jika sudah login
								$nik = isset($_SESSION['nik']) ? $_SESSION['nik'] : '';
								echo '<form action="surat_keterangan/info-surat.php" method="post">';
								echo '<input type="hidden" name="fnik" value="' . $nik . '">';
								echo '<button type="submit" class="btn btn-info">BUAT SURAT</button>';
								echo '</form>';
							}
						} else {
							echo '<a href="../login.php" class="btn btn-info">LOGIN UNTUK BUAT SURAT</a>';
						}
						?>
		      		</div>
		    	</div>
		  	</div>
		  	<div class="col-sm-3 mt-4">
		    	<div class="card">
		      		<img src="../assets/img/list-surat.png" class="card-img-top" alt="...">
		      		<div class="card-body text-center">
		        		<h5 class="card-title">SURAT PENGANTAR KELAKUAN BAIK</h5><br>
						<?php
						if (session_status() == PHP_SESSION_NONE) {
							session_start(); // Mulai session hanya jika belum dimulai
						}

						if (isset($_SESSION['lvl'])) {
							if ($_SESSION['lvl'] == 'Administrator') {
								echo '<a href="surat_keterangan_berkelakuan_baik/" class="btn btn-info">BUAT SURAT</a>';
							} elseif ($_SESSION['lvl'] == 'User') {
								// Menyertakan NIK yang ada di session jika sudah login
								$nik = isset($_SESSION['nik']) ? $_SESSION['nik'] : '';
								echo '<form action="surat_keterangan_berkelakuan_baik/info-surat.php" method="post">';
								echo '<input type="hidden" name="fnik" value="' . $nik . '">';
								echo '<button type="submit" class="btn btn-info">BUAT SURAT</button>';
								echo '</form>';
							}
						} else {
							echo '<a href="../login.php" class="btn btn-info">LOGIN UNTUK BUAT SURAT</a>';
						}
						?>
		      		</div>
		    	</div>
		  	</div>
		  	<div class="col-sm-3 mt-4">
		    	<div class="card">
		      		<img src="../assets/img/list-surat.png" class="card-img-top" alt="...">
		      		<div class="card-body text-center">
		        		<h5 class="card-title">SURAT KETERANGAN DOMISILI</h5><br>
						<?php
						if (session_status() == PHP_SESSION_NONE) {
							session_start(); // Mulai session hanya jika belum dimulai
						}

						if (isset($_SESSION['lvl'])) {
							if ($_SESSION['lvl'] == 'Administrator') {
								echo '<a href="surat_keterangan_domisili/" class="btn btn-info">BUAT SURAT</a>';
							} elseif ($_SESSION['lvl'] == 'User') {
								// Menyertakan NIK yang ada di session jika sudah login
								$nik = isset($_SESSION['nik']) ? $_SESSION['nik'] : '';
								echo '<form action="surat_keterangan_domisili/info-surat.php" method="post">';
								echo '<input type="hidden" name="fnik" value="' . $nik . '">';
								echo '<button type="submit" class="btn btn-info">BUAT SURAT</button>';
								echo '</form>';
							}
						} else {
							echo '<a href="../login.php" class="btn btn-info">LOGIN UNTUK BUAT SURAT</a>';
						}
						?>
		      		</div>
		    	</div>
		  	</div>
		  	<div class="col-sm-3 mt-4">
		    	<div class="card">
		      		<img src="../assets/img/list-surat.png" class="card-img-top" alt="...">
		      		<div class="card-body text-center">
		        		<h5 class="card-title">SURAT KETERANGAN TIDAK MAMPU</h5>
						<?php
						if (session_status() == PHP_SESSION_NONE) {
							session_start(); // Mulai session hanya jika belum dimulai
						}

						if (isset($_SESSION['lvl'])) {
							if ($_SESSION['lvl'] == 'Administrator') {
								echo '<a href="surat_keterangan_kepemilikan_kendaraan_bermotor/" class="btn btn-info">BUAT SURAT</a>';
							} elseif ($_SESSION['lvl'] == 'User') {
								// Menyertakan NIK yang ada di session jika sudah login
								$nik = isset($_SESSION['nik']) ? $_SESSION['nik'] : '';
								echo '<form action="surat_keterangan_kepemilikan_kendaraan_bermotor/info-surat.php" method="post">';
								echo '<input type="hidden" name="fnik" value="' . $nik . '">';
								echo '<button type="submit" class="btn btn-info">BUAT SURAT</button>';
								echo '</form>';
							}
						} else {
							echo '<a href="../login.php" class="btn btn-info">LOGIN UNTUK BUAT SURAT</a>';
						}
						?>
		      		</div>
		    	</div>
		  	</div>
		  	<div class="col-sm-3 mt-4">
		    	<div class="card">
		      		<img src="../assets/img/list-surat.png" class="card-img-top" alt="...">
		      		<div class="card-body text-center">
		        		<h5 class="card-title">SURAT KETERANGAN KEHILANGAN</h5><br>
						<?php
						if (session_status() == PHP_SESSION_NONE) {
							session_start(); // Mulai session hanya jika belum dimulai
						}

						if (isset($_SESSION['lvl'])) {
							if ($_SESSION['lvl'] == 'Administrator') {
								echo '<a href="surat_keterangan_perhiasan/" class="btn btn-info">BUAT SURAT</a>';
							} elseif ($_SESSION['lvl'] == 'User') {
								// Menyertakan NIK yang ada di session jika sudah login
								$nik = isset($_SESSION['nik']) ? $_SESSION['nik'] : '';
								echo '<form action="surat_keterangan_perhiasan/info-surat.php" method="post">';
								echo '<input type="hidden" name="fnik" value="' . $nik . '">';
								echo '<button type="submit" class="btn btn-info">BUAT SURAT</button>';
								echo '</form>';
							}
						} else {
							echo '<a href="../login.php" class="btn btn-info">LOGIN UNTUK BUAT SURAT</a>';
						}
						?>
		      		</div>
		    	</div>
		  	</div>
		  	<div class="col-sm-3 mt-4">
		    	<div class="card">
		      		<img src="../assets/img/list-surat.png" class="card-img-top" alt="...">
		      		<div class="card-body text-center">
		        		<h5 class="card-title">SURAT KETERANGAN USAHA</h5><br>
						<?php
						if (session_status() == PHP_SESSION_NONE) {
							session_start(); // Mulai session hanya jika belum dimulai
						}

						if (isset($_SESSION['lvl'])) {
							if ($_SESSION['lvl'] == 'Administrator') {
								echo '<a href="surat_keterangan_usaha/" class="btn btn-info">BUAT SURAT</a>';
							} elseif ($_SESSION['lvl'] == 'User') {
								// Menyertakan NIK yang ada di session jika sudah login
								$nik = isset($_SESSION['nik']) ? $_SESSION['nik'] : '';
								echo '<form action="surat_keterangan_usaha/info-surat.php" method="post">';
								echo '<input type="hidden" name="fnik" value="' . $nik . '">';
								echo '<button type="submit" class="btn btn-info">BUAT SURAT</button>';
								echo '</form>';
							}
						} else {
							echo '<a href="../login.php" class="btn btn-info">LOGIN UNTUK BUAT SURAT</a>';
						}
						?>
		      		</div>
		    	</div>
		  	</div>
		  	<div class="col-sm-3 mt-4">
		    	<div class="card">
		      		<img src="../assets/img/list-surat.png" class="card-img-top" alt="...">
		      		<div class="card-body text-center">
		        		<h5 class="card-title">SURAT LAPOR HAJATAN</h5><br><br>
		        		<a href="surat_lapor_hajatan/" class="btn btn-info">BUAT SURAT</a>
		      		</div>
		    	</div>
		  	</div>
		  	<div class="col-sm-3 mt-4">
		    	<div class="card">
		      		<img src="../assets/img/list-surat.png" class="card-img-top" alt="...">
		      		<div class="card-body text-center">
		        		<h5 class="card-title">SURAT KEMATIAN</h5><br><br>
		        		<a href="surat_pengantar_skck/" class="btn btn-info">BUAT SURAT</a>
		      		</div>
		    	</div>
		  	</div>
		</div>
	</div>
</div>
<div class="footer text-center">
	<span class="text-black"><strong>Copyright &copy; 2024 <a href="#" class="text-decoration-none">Universitas Ahmad Dahlan</a>.</strong>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="content-script.js"></script>
</html>