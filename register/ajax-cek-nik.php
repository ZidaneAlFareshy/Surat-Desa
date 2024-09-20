<?php
include ('../config/koneksi.php');    

if (isset($_POST['nik'])) {
    $nik = $_POST['nik'];

    // Validasi input NIK (hanya angka, 16 digit)
    if (!preg_match("/^[0-9]{16}$/", $nik)) {
        echo json_encode(['status' => 'invalid', 'message' => 'NIK tidak valid']);
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
        echo json_encode(['status' => 'not_found', 'message' => 'NIK tidak ditemukan']);
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
            echo json_encode(['status' => 'registered', 'message' => 'NIK sudah terdaftar']);
            exit();
        }

        // Jika NIK ditemukan dan belum terdaftar
        echo json_encode(['status' => 'valid', 'message' => 'NIK valid dan belum terdaftar']);
        exit();
    }
}
?>
