<?php
session_start();
include('../../config/koneksi.php');


// Ambil NIK dari form POST
$nik = isset($_POST['nik']) ? $_POST['nik'] : null;

// Update status verifikasi di database
$sql = "UPDATE login SET status_verifikasi = 1 WHERE nik = ?";
$stmt = $connect->prepare($sql);
$stmt->bind_param("s", $nik);
$stmt->execute();

// Cek apakah status berhasil diupdate
if ($stmt->affected_rows > 0) {
    // Ambil data pengguna dan file gambar KTP serta KK
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
        if (unlink($ktp_path)) {
            // Hapus nama file KTP dari database jika berhasil dihapus
            $sql_delete_ktp = "UPDATE login SET ktp = NULL WHERE nik = ?";
            $stmt_delete_ktp = $connect->prepare($sql_delete_ktp);
            $stmt_delete_ktp->bind_param("s", $nik);
            $stmt_delete_ktp->execute();
        } else {
            error_log("Gagal menghapus file KTP: " . $ktp_path);
        }
    }

    // Hapus file KK dari folder uploads jika ada
    if (file_exists($kk_path)) {
        if (unlink($kk_path)) {
            // Hapus nama file KK dari database jika berhasil dihapus
            $sql_delete_kk = "UPDATE login SET kk = NULL WHERE nik = ?";
            $stmt_delete_kk = $connect->prepare($sql_delete_kk);
            $stmt_delete_kk->bind_param("s", $nik);
            $stmt_delete_kk->execute();
        } else {
            error_log("Gagal menghapus file KK: " . $kk_path);
        }
    }

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
