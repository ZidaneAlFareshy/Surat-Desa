<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="../../assets/img/logo-cirebon.png">
	<title>SUKET-ON</title>
	<link rel="stylesheet" href="../../assets/fontawesome-5.10.2/css/all.css">
	<link rel="stylesheet" href="../../assets/bootstrap-4.3.1/dist/css/bootstrap.min.css">
	
	<style>
		.navbar {
			background-color: #00A658;
		}
		.footer {
            padding: 20px 0;
            margin-top: 40px;
        }

		.icon-info {
            animation: bounce 2s infinite;
        }
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
	</style>
</head>
<body class="bg-light">
 	<navbar class="navbar navbar-expand-lg navbar-light bg-light" >
   	<a class="navbar-brand ml-4 mt-1" style="font-weight: bold; font-style: italic;" href="../../">SUKET-Online</a>
   	<button class="navbar-toggler mr-4 mt-3" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
   		<span class="navbar-toggler-icon"></span>
   	</button>
   	<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
   		<ul class="navbar-nav ml-auto mt-lg-3 mr-5 position-relative text-right">
     		<li class="nav-item">
     			<a class="nav-link" href="../../">HOME</a>
     		</li>
     		<li class="nav-item active">
     			<a class="nav-link" href="../index.php"><i class="fas fa-envelope icon-info"></i>&nbsp;BUAT SURAT</a>
     		</li>
     		<li class="nav-item">
			<?php
			if (session_status() == PHP_SESSION_NONE) {
				session_start(); 
			}
			
			if (isset($_SESSION['username']) && isset($_SESSION['lvl']) && $_SESSION['lvl'] == 'User') {
				echo '<a style="color: black" class="nav-link" href="../../status/">STATUS SURAT</a>';
			}
			?>
     		</li>
     		<li class="nav-item">
     			<a class="nav-link" href="../../tentang/">TENTANG </a>
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
					echo '<a class="dropdown-item" href="../../admin/">Dashboard</a>';
					echo '<div class="dropdown-divider"></div>';
				}
				echo '<a class="dropdown-item text-danger" href="../../login/logout.php"><i class="fas fa-power-off"></i> Logout</a>';
				echo '</div>';
				}
				?>
			</li>
   		</ul>
   	</div>
 	</navbar>