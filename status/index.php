<?php
session_start();
include('../config/koneksi.php');

if (!isset($_SESSION['nik'])) {
    header("location:login.php");
    exit();
}

$nik = $_SESSION['nik'];

// Query untuk mengambil data surat berdasarkan NIK pengguna
$query = "SELECT * FROM surat_keterangan WHERE nik='$nik'";
$result = mysqli_query($connect, $query);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/bootstrap-4.3.1/dist/css/bootstrap.min.css">
    <title>Status Surat</title>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h3 class="text-center">Status Surat yang Anda Ajukan</h3>
        <table class="table table-bordered mt-4">
            <thead class="thead-dark">
                <tr>
                    <th>No. Surat</th>
                    <th>Jenis Surat</th>
                    <th>Tanggal Surat</th>
                    <th>Status Surat</th>
                    <th>Alasan Penolakan</th>
                </tr>
            </thead>
            <tbody>
                <?php
                if (mysqli_num_rows($result) > 0) {
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo "<tr>";
                        echo "<td>" . ($row['no_surat'] ? $row['no_surat'] : 'Belum Diberikan') . "</td>";
                        echo "<td>" . $row['jenis_surat'] . "</td>";
                        echo "<td>" . $row['tanggal_surat'] . "</td>";
                        echo "<td>" . $row['status_surat'] . "</td>";
                        echo "<td>" . ($row['status_surat'] == 'Ditolak' ? $row['alasan_tolak'] : '-') . "</td>";
                        echo "</tr>";
                    }
                } else {
                    echo "<tr><td colspan='5' class='text-center'>Belum ada surat yang diajukan</td></tr>";
                }
                ?>
            </tbody>
        </table>
    </div>
</body>
</html>
