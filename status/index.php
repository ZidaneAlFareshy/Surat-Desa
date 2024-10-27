<?php
session_start();
include('../config/koneksi.php');

if (!isset($_SESSION['nik'])) {
    header("location:login.php");
    exit();
}

$nik = $_SESSION['nik'];

// Query untuk mengambil data surat berdasarkan NIK pengguna
$query = "SELECT * FROM surat_keterangan WHERE nik='$nik'";
$result = mysqli_query($connect, $query);

?>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="../assets/img/logo-cirebon.png">
	<title>Status Surat</title>
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
		.container-fluid {
            padding: 0;
        }
        .container {
            max-width: 900px;
        }
        .card-body {
            padding: 2rem;
        }
        .card-text {
            line-height: 1.8;
            color: #333;
        }
        label {
            font-size: 1.5rem;
            font-weight: bold;
            color: #333;
        }
        blockquote {
            background: #f9f9f9;
            border-left: 5px solid #007bff;
            margin: 20px 0;
            padding: 10px 20px;
            font-style: italic;
            color: #666;
        }
		.icon-info {
            animation: bounce 2s infinite;
        }
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
		.footer {
            padding: 20px 0;
            margin-top: 40px;
        }
	</style>
</head>
<body class="bg-light">
	<div>
		<nav class="navbar navbar-expand-lg navbar-light bg-light ">
			<a class="navbar-brand ml-4 mt-1" style="font-weight:bold; font-style:italic;" href="../">SUKET-Online</a>
			<button class="navbar-toggler mr-4 mt-3" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
				<ul class="navbar-nav ml-auto mt-lg-3 mr-5 position-relative text-right">
					<li class="nav-item">
						<a class="nav-link" href="../">HOME</a>
					</li>
					<li class="nav-item">
						<?php
						if (session_status() == PHP_SESSION_NONE) {
							session_start(); // Mulai session hanya jika belum dimulai
						}

						if (isset($_SESSION['username'])) {
							echo '<a class="nav-link" href="../surat/">BUAT SURAT</a>';
						}
						?>
					</li>
					<li class="nav-item active">
						<?php
						if (session_status() == PHP_SESSION_NONE) {
							session_start(); // Mulai session hanya jika belum dimulai
						}

						if (isset($_SESSION['username'])) {
							echo '<a class="nav-link" href="#"><i class="fas fa-info-circle icon-info"></i>&nbsp;STATUS SURAT</a>';
						}
						?>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="../tentang/">TENTANG</a>
					</li>
					<li class="nav-item dropdown ml-5">
						<?php
						if (session_status() == PHP_SESSION_NONE) {
							session_start(); // Mulai session hanya jika belum dimulai
						}

						if (empty($_SESSION['username'])) {
							echo '<a class="btn btn-dark" href="login/"><i class="fas fa-sign-in-alt"></i>&nbsp;LOGIN</a>';
						} else if (isset($_SESSION['lvl'])) {
							echo '<a class="nav-link dropdown-toggle btn btn-transparent text-black" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';
							echo '<i class="fa fa-user-cog"></i> '; echo $_SESSION['lvl']; echo '</a>';
							
							echo '<div class="dropdown-menu" aria-labelledby="navbarDropdown">';
							
							// Cek level pengguna, tampilkan "Dashboard" hanya jika level bukan "user"
							if ($_SESSION['lvl'] != 'User') {
								echo '<a class="dropdown-item" href="../admin/">Dashboard</a>';
								echo '<div class="dropdown-divider"></div>';
							}
							
							echo '<a class="dropdown-item text-danger" href="../login/logout.php"><i class="fas fa-power-off"></i> Logout</a>';
							echo '</div>';
						}
						?>
					</li>
				</ul>
			</div>
		</nav>
	</div>
	<div class="container-fluid">
        <h3 class="text-center">Status Surat yang Anda Ajukan</h3>
        <table class="table table-bordered mt-4">
            <thead class="thead-dark">
                <tr>
                    <th>No. Surat</th>
                    <th>Jenis Surat</th>
                    <th>Tanggal Surat</th>
                    <th>Status Surat</th>
                    <th>Alasan Penolakan</th>
                </tr>
            </thead>
            <tbody>
                <?php
                if (mysqli_num_rows($result) > 0) {
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo "<tr>";
                        echo "<td>" . ($row['no_surat'] ? $row['no_surat'] : 'Belum Diberikan') . "</td>";
                        echo "<td>" . $row['jenis_surat'] . "</td>";
                        echo "<td>" . $row['tanggal_surat'] . "</td>";
                        echo "<td>" . $row['status_surat'] . "</td>";
                        echo "<td>" . ($row['status_surat'] == 'Ditolak' ? $row['alasan_tolak'] : '-') . "</td>";
                        echo "</tr>";
                    }
                } else {
                    echo "<tr><td colspan='5' class='text-center'>Belum ada surat yang diajukan</td></tr>";
                }
                ?>
            </tbody>
        </table>
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
