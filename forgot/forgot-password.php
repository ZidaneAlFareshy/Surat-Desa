<?php
session_start();
include('../config/koneksi.php');

if (isset($_POST['submit-nik'])) {
    $nik = mysqli_real_escape_string($connect, $_POST['nik']);
    
    // Cek NIK dalam database
    $query = mysqli_query($connect, "SELECT whatsapp FROM login WHERE nik = '$nik'");
    $result = mysqli_fetch_assoc($query);
    
    if ($result) {
        // Jika NIK ditemukan, ambil nomor WhatsApp
        $whatsapp = $result['whatsapp'];
        
        // Generate kode OTP
        $otp = rand(100000, 999999);
        $waktu = time();
        
        // Hapus OTP lama jika ada
        mysqli_query($connect, "UPDATE login SET otp = NULL, waktu = NULL WHERE whatsapp = '$whatsapp'");
        
        // Update OTP dan waktu di tabel login
        $update_query = mysqli_query($connect, "UPDATE login SET otp = '$otp', waktu = '$waktu' WHERE whatsapp = '$whatsapp'");
        
        if ($update_query) {
            // Kirim OTP melalui Fonnte
            $data = [
                'target' => $whatsapp,
                'message' => "Kode OTP Anda untuk reset password adalah: $otp"
            ];
            
            $curl = curl_init();
            curl_setopt($curl, CURLOPT_HTTPHEADER, array("Authorization: XjZ+MnvtQ+@umWYXxYLq"));
            curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "POST");
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($data));
            curl_setopt($curl, CURLOPT_URL, "https://api.fonnte.com/send");
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0);
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
            $result = curl_exec($curl);
            curl_close($curl);
            
            // Redirect ke halaman OTP
            header("Location: verifikasi-otp.php?whatsapp=$whatsapp");
            exit();
        } else {
            echo "Gagal menyimpan OTP. Silakan coba lagi.";
        }
    } else {
        // Jika NIK tidak ditemukan
        header("Location: forgot-password.php?pesan=nik-tidak-ditemukan");
        exit();
    }
}
?>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="../assets/bootstrap-4.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
        }

        .card-header h3 {
            font-size: 1.5rem;
            margin: 0;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #ced4da;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            width: 100%;
            cursor: pointer;
        }

        .btn-primary:hover {
            background-color: #0056b3;
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
                <h3>Lupa Password</h3>
            </div>
            <div class="card-body">
                <?php
                if (isset($_GET['pesan']) && $_GET['pesan'] == "nik-tidak-ditemukan") {
                    echo "<div class='alert alert-danger text-center'>NIK tidak ditemukan. Harap periksa kembali!</div>";
                }
                ?>
                <form method="POST" action="">
                    <div class="form-group">
                        <label for="nik">Masukkan NIK Anda</label>
                        <input type="text" class="form-control" id="nik" name="nik" placeholder="NIK" required>
                    </div>
                    <button type="submit" class="btn btn-primary" name="submit-nik">Kirim OTP</button>
                    <br>
                    <br>
                    <div class="text-center">
                        <a href="../login/index.php" class="back-to-login">
                            <i class="fas fa-arrow-left"></i> Kembali ke login
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>

