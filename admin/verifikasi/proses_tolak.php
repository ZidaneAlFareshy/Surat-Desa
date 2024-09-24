<?php
session_start();
include('../../config/koneksi.php');

// Ambil NIK dari URL
$nik = $_GET['nik'];

// Ambil data pengguna sebelum menghapus
$sql_select = "SELECT nama, whatsapp FROM login WHERE nik = ?";
$stmt_select = $connect->prepare($sql_select);
$stmt_select->bind_param("s", $nik);
$stmt_select->execute();
$result = $stmt_select->get_result();
$user = $result->fetch_assoc();
$nama = $user['nama'];
$whatsapp = $user['whatsapp'];

// Hapus data dari tabel login berdasarkan NIK
$sql_delete = "DELETE FROM login WHERE nik = ?";
$stmt_delete = $connect->prepare($sql_delete);
$stmt_delete->bind_param("s", $nik);
$stmt_delete->execute();

// Cek apakah data berhasil dihapus
if ($stmt_delete->affected_rows > 0) {
    // Kirim pesan penolakan melalui Fonnte
    $data = [
        'target' => $whatsapp,
        'message' => "Halo $nama, pendaftaran Anda ditolak karena foto KTP tidak sesuai. Silakan coba mendaftar ulang dengan foto KTP yang valid."
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
    header("Location: index.php?pesan=akun-berhasil-ditolak");
} else {
    // Redirect jika terjadi error
    header("Location: index.php?pesan=error-menghapus-akun");
}

$connect->close();
?>
