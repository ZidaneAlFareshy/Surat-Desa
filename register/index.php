<?php
if (isset($_SESSION['pesan'])) {
    echo "<script>alert('" . $_SESSION['pesan'] . "');</script>";
    unset($_SESSION['pesan']); // Hapus pesan setelah ditampilkan
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="../assets/img/mini-logo.png">
    <title>Register Page</title>
    <link rel="stylesheet" href="../assets/bootstrap-4.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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

        .form-group {
            margin-bottom: 1rem;
            position: relative;
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #ced4da;
            padding-right: 40px; /* Untuk memberikan ruang pada icon */
        }

        .form-group .fas {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
        }

        .register_btn {
            background-color: #28a745;
            border: none;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            width: 100%;
            cursor: pointer;
        }

        .register_btn:hover {
            background-color: #218838;
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
                <h3>Daftar <span class="text-primary">SUKET-ON</span></h3>
            </div>
            <div class="card-body">
                <form method="post" action="aksi-register.php" enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="text" class="form-control" name="nik" id="nik" placeholder="NIK" required>
                        <small id="nikSuccess" class="text-success" style="display:none;"></small>
                        <small id="nikError" class="text-danger" style="display:none;"></small>
                        <button type="button" id="cekNikBtn" class="btn btn-primary mt-2">Cek NIK</button>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" name="password" id="password" placeholder="Password" required>
                        <i class="fas fa-eye" style="opacity: 50%" id="togglePassword"></i>
                        <small id="passwordError" class="text-danger" style="display:none;">Password harus minimal 8 karakter</small>
                    </div>

                    <div class="form-group">
                        <input type="text" class="form-control" name="whatsapp" id="whatsapp" placeholder="Nomor WhatsApp" required>
                        <small id="whatsappError" class="text-danger" style="display:none;">Nomor WhatsApp harus diawali dengan 62</small>
                    </div>
                    <div class="form-group">
                        <label for="ktp" class="form-label">Upload Foto KTP</label>
                        <input type="file" class="form-control-file" name="ktp" required>
                    </div>
                    <div class="form-group">
                        <label for="kk" class="form-label">Upload Foto KK</label>
                        <input type="file" class="form-control-file" name="kk" required>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Register" class="btn register_btn">
                    </div>
                </form>
            </div>
            <div class="card-footer">
                <span>Sudah punya akun? <a href="../login/index.php">Login disini</a></span>
            </div>
        </div>
    </div>

    <script>
        <?php if(isset($_GET['pesan'])): ?>
            <?php if($_GET['pesan'] == 'register-sukses'): ?>
                Swal.fire({
                    icon: 'success',
                    title: 'Registrasi Berhasil',
                    text: 'Registrasi berhasil! Silakan login.',
                    timer: 3000,
                    showConfirmButton: false
                }).then(function() {
                    window.location.href = '../login/index.php';
                });
            <?php elseif($_GET['pesan'] == 'nik-tidak-valid'): ?>
                Swal.fire({
                    icon: 'error',
                    title: 'NIK Tidak Valid',
                    text: 'Harap masukkan NIK yang valid, hanya angka 16 digit!'
                });
            <?php elseif($_GET['pesan'] == 'nik-sudah-terdaftar'): ?>
                Swal.fire({
                    icon: 'error',
                    title: 'NIK Sudah Terdaftar',
                    text: 'NIK sudah terdaftar, silakan login atau gunakan NIK lain.'
                });
            <?php elseif($_GET['pesan'] == 'tipe-file-ktp-tidak-valid'): ?>
                Swal.fire({
                    icon: 'error',
                    title: 'Tipe File Tidak Falid',
                    text: 'Gunakan tipe file jpg, jpeg atau png',
                    timer: 3000,
                    showConfirmButton: false
                }).then(function() {
                    window.location.href = 'index.php';
                });
            <?php elseif($_GET['pesan'] == 'tipe-file-kk-tidak-valid'): ?>
                Swal.fire({
                    icon: 'error',
                    title: 'Tipe File Tidak Falid',
                    text: 'Gunakan tipe file jpg, jpeg atau png',
                    timer: 3000,
                    showConfirmButton: false
                }).then(function() {
                    window.location.href = 'index.php';
                });
            <?php elseif($_GET['pesan'] == 'file-ktp-bukan-gambar'): ?>
                Swal.fire({
                    icon: 'error',
                    title: 'Tipe File Bukan Gambar',
                    text: 'Gunakan file gambar jpg, jpeg atau png',
                    showConfirmButton: false
                }).then(function() {
                    window.location.href = 'index.php';
                });
            <?php elseif($_GET['pesan'] == 'file-kk-bukan-gambar'): ?>
                Swal.fire({
                    icon: 'error',
                    title: 'Tipe File Bukan Gambar',
                    text: 'Gunakan file gambar jpg, jpeg atau png',
                    showConfirmButton: false
                }).then(function() {
                    window.location.href = 'index.php';
                });
            <?php elseif($_GET['pesan'] == 'whatsapp-sudah-terdaftar'): ?>
                Swal.fire({
                    icon: 'error',
                    title: 'Nomor Whatsapp Sudah Terdaftar',
                    text: 'Gunakan nomor whatsapp yang belum terdaftar',
                    showConfirmButton: false
                }).then(function() {
                    window.location.href = 'index.php';
                });
            <?php endif; ?>

            // Menghapus parameter 'pesan' dari URL setelah alert ditampilkan
            if (typeof window.history.replaceState == 'function') {
                var newURL = window.location.protocol + "//" + window.location.host + window.location.pathname;
                window.history.replaceState(null, null, newURL);
            }
        <?php endif; ?>
    </script>
    <script>
    document.getElementById('whatsapp').addEventListener('input', function() {
        var whatsappInput = document.getElementById('whatsapp');
        var whatsappError = document.getElementById('whatsappError');
        var whatsappValue = whatsappInput.value;

        // Validasi format nomor WhatsApp
        if (!whatsappValue.startsWith('62') && whatsappValue !== '') {
            whatsappError.style.display = 'block';
            whatsappInput.style.borderColor = 'red'; // Ganti border menjadi merah
        } else {
            whatsappError.style.display = 'none';
            whatsappInput.style.borderColor = ''; // Kembalikan border ke default
        }
    });

    // Validasi password minimal 8 karakter
    document.getElementById('password').addEventListener('input', function() {
        var passwordInput = document.getElementById('password');
        var passwordError = document.getElementById('passwordError');
        var passwordValue = passwordInput.value;

        // Validasi panjang password
        if (passwordValue.length < 8 && passwordValue !== '') {
            passwordError.style.display = 'block';
            passwordInput.style.borderColor = 'red'; // Ganti border menjadi merah
        } else {
            passwordError.style.display = 'none';
            passwordInput.style.borderColor = ''; // Kembalikan border ke default
        }
    });

    // Validasi NIK
    document.getElementById('cekNikBtn').addEventListener('click', function() {
        var nikInput = document.getElementById('nik');
        var nikValue = nikInput.value;
        var nikError = document.getElementById('nikError');
        var nikSuccess = document.getElementById('nikSuccess');

        // Reset pesan error dan success
        nikError.style.display = 'none';
        nikSuccess.style.display = 'none';
        nikInput.style.borderColor = '';

        // Kirim permintaan AJAX ke server untuk cek NIK di database
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'ajax-cek-nik.php', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        xhr.onload = function() {
            if (xhr.status === 200) {
                var response = JSON.parse(xhr.responseText);
                
                if (response.status === 'valid') {
                    // Jika NIK valid dan belum terdaftar
                    nikSuccess.style.display = 'block';
                    nikSuccess.textContent = response.message;
                    nikInput.style.borderColor = 'green'; // Ganti border menjadi hijau
                } else {
                    // Jika NIK tidak valid atau sudah terdaftar
                    nikError.style.display = 'block';
                    nikError.textContent = response.message;
                    nikInput.style.borderColor = 'red'; // Ganti border menjadi merah
                }
            }
        };

        xhr.send('nik=' + encodeURIComponent(nikValue));
    });

    // Toggle Password Visibility
    document.getElementById('togglePassword').addEventListener('click', function() {
        var passwordInput = document.getElementById('password');
        var toggleIcon = document.getElementById('togglePassword');

        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            toggleIcon.classList.remove('fa-eye');
            toggleIcon.classList.add('fa-eye-slash');
        } else {
            passwordInput.type = 'password';
            toggleIcon.classList.remove('fa-eye-slash');
            toggleIcon.classList.add('fa-eye');
        }
    });
    </script>
</body>
</html>
