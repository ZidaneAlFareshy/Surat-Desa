<?php
session_start();
include ('../config/koneksi.php');

// Ambil data dari form
$nik = $_POST['nik'];
$password = $_POST['password'];
$whatsapp = $_POST['whatsapp'];
$ktp = $_FILES['ktp'];
$kk = $_FILES['kk'];

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

    // Cek apakah nomor WhatsApp sudah terdaftar di tabel login
    $sql_check_whatsapp = "SELECT * FROM login WHERE whatsapp = ?";
    $stmt_check_whatsapp = $connect->prepare($sql_check_whatsapp);
    $stmt_check_whatsapp->bind_param("s", $whatsapp);
    $stmt_check_whatsapp->execute();
    $result_check_whatsapp = $stmt_check_whatsapp->get_result();

    if ($result_check_whatsapp->num_rows > 0) {
        // Jika nomor WhatsApp sudah terdaftar
        header("Location: index.php?pesan=whatsapp-sudah-terdaftar");
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
    $ktp_target_file = $target_dir . $ktp_file;
    $ktp_imageFileType = strtolower(pathinfo($ktp_target_file, PATHINFO_EXTENSION));

    // Validasi jenis file KTP (hanya gambar)
    $ktp_check = getimagesize($ktp["tmp_name"]);
    if($ktp_check === false) {
        header("Location: index.php?pesan=file-ktp-bukan-gambar");
        exit();
    }

    // Batasi tipe file yang diizinkan (jpg, png, jpeg) untuk KTP
    if ($ktp_imageFileType != "jpg" && $ktp_imageFileType != "png" && $ktp_imageFileType != "jpeg") {
        header("Location: index.php?pesan=tipe-file-ktp-tidak-valid");
        exit();
    }

    // Cek ukuran file KTP (maks 2MB)
    if ($ktp["size"] > 2000000) {
        header("Location: index.php?pesan=ukuran-file-ktp-terlalu-besar");
        exit();
    }

    // Menyimpan file KTP ke folder upload
    if (!move_uploaded_file($ktp["tmp_name"], $ktp_target_file)) {
        echo "Sorry, there was an error uploading your KTP file.";
        exit();
    }

    // Validasi upload file KK
    $kk_file = basename($kk["name"]);
    $kk_target_file = $target_dir . $kk_file;
    $kk_imageFileType = strtolower(pathinfo($kk_target_file, PATHINFO_EXTENSION));

    // Validasi jenis file KK (hanya gambar)
    $kk_check = getimagesize($kk["tmp_name"]);
    if ($kk_check === false) {
        header("Location: index.php?pesan=file-kk-bukan-gambar");
        exit();
    }

    // Batasi tipe file yang diizinkan (jpg, png, jpeg) untuk KK
    if ($kk_imageFileType != "jpg" && $kk_imageFileType != "png" && $kk_imageFileType != "jpeg") {
        header("Location: index.php?pesan=tipe-file-kk-tidak-valid");
        exit();
    }

    // Cek ukuran file KK (maks 2MB)
    if ($kk["size"] > 2000000) {
        header("Location: index.php?pesan=ukuran-file-kk-terlalu-besar");
        exit();
    }

    // Menyimpan file KK ke folder upload
    if (!move_uploaded_file($kk["tmp_name"], $kk_target_file)) {
        echo "Sorry, there was an error uploading your KK file.";
        exit();
    }

    // Simpan data ke tabel login
    $sql = "INSERT INTO login (nama, username, password, level, nik, whatsapp, ktp, kk, status_verifikasi, otp, waktu) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $connect->prepare($sql);

    // Data yang akan disimpan
    $username = $nik; // Username diisi dengan NIK
    $level = 'user'; // Level user default
    $status_verifikasi = 0; // Status verifikasi default adalah 0 (belum terverifikasi)
    $waktu = time();

    // Generate OTP dan waktu
    $otp = rand(100000, 999999);
    $stmt->bind_param("ssssssssssi", $nama, $username, $hashed_password, $level, $nik, $whatsapp, $ktp_file, $kk_file, $status_verifikasi, $otp, $waktu);

    if ($stmt->execute()) {
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
        echo "Maaf, terjadi kesalahan saat menyimpan data Anda.";
    }
}

$connect->close();
?>
