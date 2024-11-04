<?php
session_start();
include('../config/koneksi.php');

if (isset($_POST['submit-otp'])) {
    $otp = $_POST['otp'];
    $whatsapp = $_POST['whatsapp'];

    // Cek OTP di database
    $sql = "SELECT otp, waktu FROM login WHERE whatsapp = ? AND otp = ?";
    $stmt = $connect->prepare($sql);
    $stmt->bind_param("ss", $whatsapp, $otp);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        $data = $result->fetch_assoc();
        
        // Cek apakah OTP masih berlaku (5 menit)
        if (time() - $data['waktu'] <= 300) {
            // OTP benar dan belum kedaluwarsa
            echo "OTP berhasil diverifikasi. Silakan reset password Anda.";
            
            // Hapus OTP setelah berhasil verifikasi
            $sql_update = "UPDATE login SET otp = NULL, waktu = NULL WHERE whatsapp = ?";
            $stmt_update = $connect->prepare($sql_update);
            $stmt_update->bind_param("s", $whatsapp);
            $stmt_update->execute();
            
            // Redirect atau tampilkan form untuk reset password
            header("Location: reset-password.php?whatsapp=$whatsapp");
            exit();
        } else {
            echo "OTP telah kedaluwarsa.";
        }
    } else {
        // Jika OTP salah
        header("Location: verifikasi-otp.php?whatsapp=" . urlencode($whatsapp) . "&pesan=otp-salah");
        exit();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../assets/img/mini-logo.png">
    <title>Verifikasi OTP</title>
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
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h3>Verifikasi OTP</h3>
            </div>
            <div class="card-body">
                <?php
                if (isset($_GET['pesan']) && $_GET['pesan'] == "otp-salah") {
                    echo "<div class='alert alert-danger text-center'>Kode OTP salah. Silakan coba lagi.</div>";
                }

                // Menampilkan keterangan kode OTP telah terkirim
                if (isset($_GET['whatsapp'])) {
                    $whatsapp = $_GET['whatsapp'];
                    // Menyembunyikan angka di tengah dengan menggunakan substr
                    $whatsapp_tersembunyi = substr($whatsapp, 0, 4) . '******' . substr($whatsapp, -3);
                    echo "<div class='alert alert-success text-center'>Kode OTP telah dikirim ke nomor +$whatsapp_tersembunyi</div>";
                }
                ?>
                <form method="POST" action="">
                    <div class="form-group">
                        <label for="otp">Masukkan Kode OTP</label>
                        <input type="text" class="form-control" id="otp" name="otp" placeholder="Kode OTP" required>
                        <input type="hidden" name="whatsapp" value="<?php echo htmlspecialchars($_GET['whatsapp'], ENT_QUOTES, 'UTF-8'); ?>">
                    </div>
                    <button type="submit" class="btn btn-primary" name="submit-otp">Verifikasi</button>
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
