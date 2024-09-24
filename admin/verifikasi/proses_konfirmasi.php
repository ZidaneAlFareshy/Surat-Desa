<?php
session_start();
include('../../config/koneksi.php');

// Ambil NIK dari form atau URL
$nik = $_POST['nik'];

// Update status verifikasi di database
$sql = "UPDATE login SET status_verifikasi = 1 WHERE nik = ?";
$stmt = $connect->prepare($sql);
$stmt->bind_param("s", $nik);
$stmt->execute();

// Cek apakah status berhasil diupdate
if ($stmt->affected_rows > 0) {
    // Ambil data pengguna
    $sql_select = "SELECT nama, whatsapp FROM login WHERE nik = ?";
    $stmt_select = $connect->prepare($sql_select);
    $stmt_select->bind_param("s", $nik);
    $stmt_select->execute();
    $result = $stmt_select->get_result();
    $user = $result->fetch_assoc();
    $nama = $user['nama'];
    $whatsapp = $user['whatsapp'];

    // Kirim pesan konfirmasi melalui Fonnte
    $data = [
        'target' => $whatsapp,
        'message' => "Halo $nama, akun Anda telah berhasil diverifikasi. Anda sekarang dapat login ke dalam sistem."
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

    // Redirect ke halaman verifikasi dengan pesan sukses
    header("Location: index.php?pesan=akun-berhasil-diverifikasi");
} else {
    // Redirect jika terjadi error
    header("Location: index.php?pesan=error-verifikasi-akun");
}

$connect->close();
?>
