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
            $table = 'surat_pengantar_kelakuan_baik';
            $id_column = 'id_spkb';
            break;
        case 'Surat Keterangan Domisili':
            $table = 'surat_keterangan_domisili';
            $id_column = 'id_skd';
            break;
        case 'Surat Keterangan Tidak Mampu':
            $table = 'surat_keterangan_tidak_mampu';
            $id_column = 'id_sktm';
            break;
        case 'Surat Keterangan Kehilangan':
            $table = 'surat_keterangan_kehilangan';
            $id_column = 'id_skk';
            break;
        case 'Surat Keterangan Usaha':
            $table = 'surat_keterangan_usaha';
            $id_column = 'id_sku';
            break;
        case 'Surat Kelahiran':
            $table = 'surat_lahir';
            $id_column = 'id_sl';
            break;
        case 'Surat Keterangan Wali Murid':
            $table = 'surat_keterangan_wali_murid';
            $id_column = 'id_skwm';
            break;
        case 'Surat Kematian':
            $table = 'surat_mati';
            $id_column = 'id_sm';
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
            alert('Status surat berhasil diubah menjadi DAPAT DIAMBIL.');
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
