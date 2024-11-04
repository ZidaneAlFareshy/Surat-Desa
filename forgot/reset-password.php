<?php
session_start();
include('../config/koneksi.php');

if (isset($_POST['submit-reset'])) {
    $whatsapp = $_POST['whatsapp'];
    $password = $_POST['password'];

    // Validasi panjang password
    if (strlen($password) < 8) {
        header("Location: reset-password.php?whatsapp=" . urlencode($whatsapp) . "&pesan=password-kurang");
        exit();
    }

    // Enkripsi password menggunakan md5
    $password_encrypted = md5($password);

    // Update password di database
    $sql = "UPDATE login SET password = ? WHERE whatsapp = ?";
    $stmt = $connect->prepare($sql);
    $stmt->bind_param("ss", $password_encrypted, $whatsapp);
    if ($stmt->execute()) {
        // Redirect ke halaman login dengan pesan sukses
        header("Location: ../login/index.php?pesan=reset-sukses");
        exit();
    } else {
        echo "Gagal memperbarui password.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../assets/img/mini-logo.png">
    <title>Reset Password</title>
    <link rel="stylesheet" href="../assets/bootstrap-4.3.1/dist/css/bootstrap.min.css">
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
            <div class="card-body">
                <h3 class="text-center">Reset Password</h3>
                <?php
                if (isset($_GET['pesan']) && $_GET['pesan'] == "password-kurang") {
                    echo "<div class='alert alert-danger text-center'>Password harus minimal 8 karakter</div>";
                }
                ?>
                <form method="POST" action="">
                    <div class="form-group">
                        <label for="password">Password Baru</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password Baru" required>
                        <small id="passwordError" class="text-danger" style="display:none;">Password harus minimal 8 karakter</small>
                        <input type="hidden" name="whatsapp" value="<?php echo htmlspecialchars($_GET['whatsapp'], ENT_QUOTES, 'UTF-8'); ?>">
                    </div>
                    <button type="submit" class="btn btn-primary" name="submit-reset">Reset Password</button>
                </form>
            </div>
        </div>
    </div>

    <script>
    document.getElementById('password').addEventListener('input', function() {
        var passwordInput = document.getElementById('password');
        var passwordError = document.getElementById('passwordError');
        var passwordValue = passwordInput.value;

        // Validasi panjang password
        if (passwordValue.length < 8) {
            passwordError.style.display = 'block';
            passwordInput.style.borderColor = 'red'; 
        } else {
            passwordError.style.display = 'none';
            passwordInput.style.borderColor = ''; 
        }
    });
    </script>
</body>
</html>
