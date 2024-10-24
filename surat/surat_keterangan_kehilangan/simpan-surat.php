<?php
    include ('../../config/koneksi.php');

    if (isset($_POST['submit'])){
        $jenis_surat = "Surat Keterangan Kehilangan";
        $nik = $_POST['fnik'];
        $keperluan = addslashes($_POST['fkeperluan']);
        $barang_hilang = addslashes($_POST['fbarang_hilang']);
        $lokasi_hilang = addslashes($_POST['flokasi_hilang']);
        $tanggal_hilang = $_POST['ftanggal_hilang'];
        $status_surat = "PENDING";
        $id_profil_desa = "1";

        $query = "SELECT whatsapp FROM login WHERE nik = '$nik'";
        $result = mysqli_query($connect, $query);
        $row = mysqli_fetch_assoc($result);
        $whatsapp = $row['whatsapp'];

        $qTambahSurat = "INSERT INTO surat_keterangan_kehilangan (jenis_surat, nik, whatsapp, barang_hilang, lokasi_hilang, tanggal_hilang, keperluan, status_surat, id_profil_desa) VALUES('$jenis_surat', '$nik', '$whatsapp', '$barang_hilang', '$lokasi_hilang', '$tanggal_hilang', '$keperluan', '$status_surat', '$id_profil_desa')";
        $TambahSurat = mysqli_query($connect, $qTambahSurat);
        header("location:../index.php?pesan=berhasil");
    }
?>