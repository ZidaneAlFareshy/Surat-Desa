<?php
session_start();
include('../config/koneksi.php');

if (!isset($_SESSION['nik'])) {
    header("location:login.php");
    exit();
}

$nik = $_SESSION['nik'];

// Query untuk mengambil data surat berdasarkan NIK pengguna dan mengecualikan status 'Selesai'
$query = "
    SELECT 'Surat Keterangan' AS jenis_surat, no_surat, tanggal_surat, status_surat, alasan_tolak FROM surat_keterangan WHERE nik='$nik' AND status_surat != 'Selesai'
    UNION
    SELECT 'Surat Keterangan Domisili' AS jenis_surat, no_surat, tanggal_surat, status_surat, alasan_tolak FROM surat_keterangan_domisili WHERE nik='$nik' AND status_surat != 'Selesai'
    UNION
    SELECT 'Surat Keterangan Usaha' AS jenis_surat, no_surat, tanggal_surat, status_surat, alasan_tolak FROM surat_keterangan_usaha WHERE nik='$nik' AND status_surat != 'Selesai'
    UNION
    SELECT 'Surat Keterangan Kehilangan' AS jenis_surat, no_surat, tanggal_surat, status_surat, alasan_tolak FROM surat_keterangan_kehilangan WHERE nik='$nik' AND status_surat != 'Selesai'
    UNION
    SELECT 'Surat Keterangan Tidak Mampu' AS jenis_surat, no_surat, tanggal_surat, status_surat, alasan_tolak FROM surat_keterangan_tidak_mampu WHERE nik='$nik' AND status_surat != 'Selesai'
    UNION
    SELECT 'Surat Keterangan Wali Murid' AS jenis_surat, no_surat, tanggal_surat, status_surat, alasan_tolak FROM surat_keterangan_wali_murid WHERE nik='$nik' AND status_surat != 'Selesai'
    UNION
    SELECT 'Surat Pengantar Kelakuan Baik' AS jenis_surat, no_surat, tanggal_surat, status_surat, alasan_tolak FROM surat_pengantar_kelakuan_baik WHERE nik='$nik' AND status_surat != 'Selesai'
    UNION
    SELECT 'Surat Kelahiran' AS jenis_surat, no_surat, tanggal_surat, status_surat, alasan_tolak FROM surat_lahir WHERE nik='$nik' AND status_surat != 'Selesai'
    UNION
    SELECT 'Surat Kematian' AS jenis_surat, no_surat, tanggal_surat, status_surat, alasan_tolak FROM surat_mati WHERE nik='$nik' AND status_surat != 'Selesai'
";
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
            max-width: 1000px;
            padding-top: 2rem;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .table thead th {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
        }
        .status-diterima {
            color: #28a745;
            font-weight: bold;
        }
        .status-ditolak {
            color: #dc3545;
            font-weight: bold;
        }
        .status-menunggu {
            color: #ffc107;
            font-weight: bold;
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

		.status-menunggu {
        color: #ffc107;
        font-weight: bold;
		}
		.status-dalam-proses {
			color: #17a2b8;
			font-weight: bold;
		}
		.status-dapat-diambil {
			color: #28a745;
			font-weight: bold;
		}
		.status-ditolak {
			color: #dc3545;
			font-weight: bold;
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
	<div class="container">
        <h3 class="text-center mb-4">Status Surat yang Anda Ajukan</h3>
        <div class="card">
            <div class="card-body">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>No. Surat</th>
                            <th>Jenis Surat</th>
                            <th>Tanggal Surat</th>
                            <th>Status Surat</th>
                            <th>Alasan Penolakan</th>
                            <th>Keterangan</th>
                        </tr>
                    </thead>
                    <tbody>
						<?php if (mysqli_num_rows($result) > 0): ?>
							<?php while ($row = mysqli_fetch_assoc($result)): ?>
								<tr>
									<td><?= $row['no_surat'] ?: 'Belum Diberikan' ?></td>
									<td><?= $row['jenis_surat'] ?></td>
									<td><?= $row['tanggal_surat'] ?></td>
									<td class="<?php
										switch ($row['status_surat']) {
											case 'Pending':
												echo 'status-menunggu';
												break;
											case 'Dalam Proses':
												echo 'status-dalam-proses';
												break;
											case 'Dapat Diambil':
												echo 'status-dapat-diambil';
												break;
											case 'Tertolak':
												echo 'status-ditolak';
												break;
											default:
												echo 'status-unknown';
										}
									?>">
										<?= $row['status_surat'] ?>
									</td>
									<td><?= $row['status_surat'] == 'TERTOLAK' ? $row['alasan_tolak'] : '-' ?></td>
									<td>
										<?php
											if ($row['status_surat'] == 'DALAM PROSES') {
												echo "Surat sedang dalam proses tanda tangan";
											} elseif ($row['status_surat'] == 'DAPAT DIAMBIL') {
												echo "Surat sudah selesai. Harap mengambil surat di kantor desa dengan membawa KTP, KK, dan persyaratan yang ada";
											} else {
												echo "-";
											}
										?>
									</td>
								</tr>
							<?php endwhile; ?>
						<?php else: ?>
							<tr><td colspan="6" class="text-center">Belum ada surat yang diajukan</td></tr>
						<?php endif; ?>
					</tbody>
                </table>
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
