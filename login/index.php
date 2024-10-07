<?php
session_start();

if (isset($_SESSION['admin'])) {
    header('location:../admin/dashboard/');
} else if (isset($_SESSION['kades'])) {
    header('location:../admin/dashboard/');
} else if (isset($_SESSION['user'])) {
    header('location:../index.php');
}
?>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="../assets/img/mini-logo.png">
    <title>Login Page</title>
    <link rel="stylesheet" href="../assets/bootstrap-4.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
        body {
            background-color: #f5f5f5;
            font-family: 'Arial', sans-serif;
        }

        .container {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            width: 100%;
            max-width: 400px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 2rem;
        }

        .card-header {
            text-align: center;
            margin-bottom: 1rem;
            background-color: white;
        }

        .card-header h3 {
            font-size: 1.5rem;
            margin: 0;
            font-weight: 600;
        }

        .card-header img {
            width: 100px; /* Ukuran logo */
            margin-bottom: 1rem;
        }

        .input-group {
            margin-bottom: 1rem;
            position: relative;
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #ced4da;
            padding-right: 40px; /* Untuk memberikan ruang pada icon */
        }

        .input-group .fas {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
        }

        .login_btn {
            background-color: #007bff;
            border: none;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            width: 100%;
            cursor: pointer;
        }

        .login_btn:hover {
            background-color: #0056b3;
        }

        .card-footer {
            text-align: center;
            margin-top: 1rem;
        }

        .card-footer a {
            color: #007bff;
            text-decoration: none;
        }

        .card-footer a:hover {
            text-decoration: underline;
        }

        .alert {
            margin-bottom: 1rem;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <img src="../assets/img/logo-cirebon.png" alt="Logo">
                <h3>Masuk <span class="text-primary">SUKET-ON</span></h3>
            </div>
            <div class="card-body">
                <form method="post" action="aksi-login.php">

                    <!-- Pengecekan alert biasa dan tampilkan di atas input NIK -->
                    <?php
                    if (isset($_GET['pesan'])) {
                        if ($_GET['pesan'] == "nik-tidak-ditemukan") {
                            echo "<div class='alert alert-danger text-center'>NIK tidak ditemukan, harap periksa kembali!</div>";
                        } elseif ($_GET['pesan'] == "password-salah") {
                            echo "<div class='alert alert-danger text-center'>Password salah. Harap coba lagi.</div>";
                        } elseif ($_GET['pesan'] == "login-gagal") {
                            echo "<div class='alert alert-danger text-center'>Username atau Password Anda salah!</div>";
                        }
                    }
                    ?>

                    <div class="input-group">
                        <input type="text" class="form-control" name="username" placeholder="NIK" required>
                    </div>
                    <div class="input-group">
                        <input type="password" class="form-control" name="password" id="password" placeholder="Password" required>
                        <i class="fas fa-eye" style="opacity: 50%" id="togglePassword"></i>
                    </div>
                    <div class="input-group">
                        <span><a href="../forgot/forgot-password.php">Lupa password?</a></span>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Login" class="btn login_btn">
                    </div>
                </form>
            </div>
            <div class="card-footer">
                <span>Belum punya akun? <a href="../register/index.php">Daftar disini</a></span>
            </div>
            <br>
            <div class="text-center">
                <a href="../index.php" class="back-to-login">
                    <i class="fas fa-arrow-left"></i> Kembali ke halaman utama
                </a>
            </div>
        </div>
    </div>

    <!-- Pengecekan SweetAlert -->
    <?php
    if (isset($_GET['pesan'])) {
        if ($_GET['pesan'] == "register-sukses") {
            echo "
            <script>
            swal({
                title: 'Registrasi Berhasil!',
                text: 'Silahkan tunggu akun Anda diverifikasi oleh admin dalam waktu 1x24 jam.',
                icon: 'success',
                button: 'OK',
            }).then(function() {
                window.location.href = 'index.php'; // Redirect untuk menghapus parameter
            });
            </script>";
        } elseif ($_GET['pesan'] == "belum-diverifikasi") {
            echo "
            <script>
            swal({
                title: 'Belum Diverifikasi',
                text: 'Akun Anda belum diverifikasi oleh admin. Harap tunggu konfirmasi.',
                icon: 'warning',
                button: 'OK',
            }).then(function() {
                window.location.href = 'index.php'; // Redirect untuk menghapus parameter
            });
            </script>";
        }
    }
    ?>

    <script>
        const togglePassword = document.querySelector('#togglePassword');
        const password = document.querySelector('#password');

        togglePassword.addEventListener('click', function (e) {
            // Toggle tipe input password
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            
            // Toggle icon
            this.classList.toggle('fa-eye');
            this.classList.toggle('fa-eye-slash');
        });
    </script>
</body>
</html>
