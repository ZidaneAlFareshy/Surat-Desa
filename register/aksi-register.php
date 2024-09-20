<?php
session_start();
include ('../config/koneksi.php');	

// Ambil data dari form
$nik = $_POST['nik'];
$password = $_POST['password'];
$whatsapp = $_POST['whatsapp'];
$ktp = $_FILES['ktp'];

// Validasi input NIK (hanya angka, 16 digit)
if (!preg_match("/^[0-9]{16}$/", $nik)) {
    header("Location: index.php?pesan=nik-tidak-valid");
    exit();
}

// Cek NIK di tabel penduduk
$sql = "SELECT * FROM penduduk WHERE nik = ?";
$stmt = $connect->prepare($sql);
$stmt->bind_param("s", $nik);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows == 0) {
    // Jika NIK tidak ditemukan
    header("Location: index.php?pesan=nik-tidak-ditemukan");
    exit();
} else {
    // Cek apakah NIK sudah terdaftar di tabel login
    $sql_check_login = "SELECT * FROM login WHERE nik = ?";
    $stmt_check_login = $connect->prepare($sql_check_login);
    $stmt_check_login->bind_param("s", $nik);
    $stmt_check_login->execute();
    $result_check_login = $stmt_check_login->get_result();

    if ($result_check_login->num_rows > 0) {
        // Jika NIK sudah terdaftar
        header("Location: index.php?pesan=nik-sudah-terdaftar");
        exit();
    }

    // Ambil data penduduk
    $data_penduduk = $result->fetch_assoc();
    $nama = $data_penduduk['nama']; // Ambil nama dari tabel penduduk

    // Jika NIK ditemukan dan belum terdaftar, lanjutkan proses registrasi
    $hashed_password = md5($password);

    // Validasi upload file KTP
    $target_dir = "uploads/";
    $ktp_file = basename($ktp["name"]);
    $target_file = $target_dir . $ktp_file;
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    // Validasi jenis file (hanya gambar)
    $check = getimagesize($ktp["tmp_name"]);
    if($check === false) {
        header("Location: index.php?pesan=file-bukan-gambar");
        exit();
    }

    // Batasi tipe file yang diizinkan (jpg, png, jpeg)
    if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg") {
        header("Location: index.php?pesan=tipe-file-tidak-valid");
        exit();
    }

    if (!preg_match("/^62[0-9]{9,}$/", $whatsapp)) {
        header("Location: index.php?pesan=whatsapp-tidak-valid");
        exit();
    }

    // Cek ukuran file (maks 2MB)
    if ($ktp["size"] > 2000000) {
        header("Location: index.php?pesan=ukuran-file-terlalu-besar");
        exit();
    }

    // Menyimpan file KTP ke folder upload
    if (move_uploaded_file($ktp["tmp_name"], $target_file)) {
        // Simpan data ke tabel login
        $sql = "INSERT INTO login (nama, username, email, password, level, nik, whatsapp, ktp, status_verifikasi, otp, waktu) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $connect->prepare($sql);

        // Data yang akan disimpan
        $username = $nik; // Username diisi dengan NIK
        $email = ''; // Ganti sesuai kebutuhan
        $level = 'user'; // Level user default
        $status_verifikasi = 0; // Status verifikasi default adalah 0 (belum terverifikasi)
        $waktu = time();
        
        // Generate OTP dan waktu
        $otp = rand(100000, 999999);
        $stmt->bind_param("ssssssssssi", $nama, $username, $email, $hashed_password, $level, $nik, $whatsapp, $ktp_file, $status_verifikasi, $otp, $waktu);

        $stmt->execute();

        // Kirim OTP melalui Fonnte
        $data = [
            'target' => $whatsapp,
            'message' => "Kode OTP Anda untuk verifikasi adalah: $otp"
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

        // Arahkan ke halaman verifikasi OTP
        header("Location: verifikasi-otp.php?whatsapp=$whatsapp");
        exit();
    } else {
        // Jika gagal upload foto KTP
        echo "Sorry, there was an error uploading your file.";
    }
}

$connect->close();
?>
