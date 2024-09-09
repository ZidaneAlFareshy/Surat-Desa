<?php
include ('../../../config/koneksi.php');

if (isset($_GET['id']) && isset($_GET['status']) && isset($_GET['jenis_surat'])) {
    $id = $_GET['id'];
    $status = $_GET['status'];
    $jenis_surat = $_GET['jenis_surat'];

    // Menentukan tabel dan kolom yang akan di-update berdasarkan jenis surat
    switch ($jenis_surat) {
        case 'Surat Keterangan KTP Sementara':
            $table = 'surat_keterangan';
            $id_column = 'id_sk';
            break;
        case 'Surat Pengantar Kelakuan Baik':
            $table = 'surat_keterangan_berkelakuan_baik';
            $id_column = 'id_skbb';
            break;
        case 'Surat Keterangan Domisili':
            $table = 'surat_keterangan_domisili';
            $id_column = 'id_skd';
            break;
        case 'Surat Keterangan Tidak Mampu':
            $table = 'surat_keterangan_kepemilikan_kendaraan_bermotor';
            $id_column = 'id_skkkb';
            break;
        case 'Surat Keterangan Kehilangan':
            $table = 'surat_keterangan_perhiasan';
            $id_column = 'id_skp';
            break;
        case 'Surat Keterangan Usaha':
            $table = 'surat_keterangan_usaha';
            $id_column = 'id_sku';
            break;
        case 'Surat Lapor Hajatan':
            $table = 'surat_lapor_hajatan';
            $id_column = 'id_slh';
            break;
        case 'Surat Pengantar SKCK':
            $table = 'surat_pengantar_skck';
            $id_column = 'id_sps';
            break;
        default:
            $table = '';
            $id_column = '';
            break;
    }

    if ($table != '' && $id_column != '') {
        $query = "UPDATE $table SET status_surat = '$status' WHERE $id_column = '$id'";
        
        if (mysqli_query($connect, $query)) {
            echo "<script>
            alert('Status surat berhasil diubah menjadi SELESAI.');
            window.location.href = 'index.php';
            </script>";
        } else {
            echo "<script>
            alert('Gagal mengubah status surat.');
            window.location.href = 'index.php';
            </script>";
        }
    } else {
        echo "<script>
        alert('Jenis surat tidak valid.');
        window.location.href = 'index.php';
        </script>";
    }
}
?>
