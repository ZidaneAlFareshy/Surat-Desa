<?php
session_start();
include('../../config/koneksi.php');

// Ambil NIK dari URL
$nik = $_GET['nik'];

// Ambil data pengguna dan file gambar KTP serta KK sebelum menghapus
$sql_select = "SELECT nama, whatsapp, ktp, kk FROM login WHERE nik = ?";
$stmt_select = $connect->prepare($sql_select);
$stmt_select->bind_param("s", $nik);
$stmt_select->execute();
$result = $stmt_select->get_result();
$user = $result->fetch_assoc();
$nama = $user['nama'];
$whatsapp = $user['whatsapp'];
$ktp_file = $user['ktp'];
$kk_file = $user['kk'];

// Tentukan path file gambar KTP dan KK
$ktp_path = "../../register/uploads/" . $ktp_file;
$kk_path = "../../register/uploads/" . $kk_file;

// Hapus file KTP dari folder uploads jika ada
if (file_exists($ktp_path)) {
    if (!unlink($ktp_path)) {
        error_log("Gagal menghapus file KTP: " . $ktp_path);
    }
}

// Hapus file KK dari folder uploads jika ada
if (file_exists($kk_path)) {
    if (!unlink($kk_path)) {
        error_log("Gagal menghapus file KK: " . $kk_path);
    }
}

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
        'message' => "Halo $nama, pendaftaran Anda ditolak karena foto KTP atau KK tidak sesuai. Silakan coba mendaftar ulang dengan foto KTP yang valid."
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
