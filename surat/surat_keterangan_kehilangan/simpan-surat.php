<?php
    include ('../../config/koneksi.php');

    if (isset($_POST['submit'])){
        $jenis_surat = "Surat Keterangan Kehilangan";
        $nik = $_POST['fnik'];
        $keperluan = addslashes($_POST['fkeperluan']);
        $barang = addslashes($_POST['fbarang']);
        $lokasi = addslashes($_POST['flokasi']);
        $tanggal = $_POST['ftanggal'];
        $status_surat = "PENDING";
        $id_profil_desa = "1";

        $query = "SELECT whatsapp FROM login WHERE nik = '$nik'";
        $result = mysqli_query($connect, $query);
        $row = mysqli_fetch_assoc($result);
        $whatsapp = $row['whatsapp'];

        $qTambahSurat = "INSERT INTO surat_keterangan_kehilangan (jenis_surat, nik, whatsapp, barang, lokasi, tanggal, keperluan, status_surat, id_profil_desa) VALUES('$jenis_surat', '$nik', '$whatsapp', '$barang', '$lokasi', '$tanggal', '$keperluan', '$status_surat', '$id_profil_desa')";
        $TambahSurat = mysqli_query($connect, $qTambahSurat);
        header("location:../index.php?pesan=berhasil");
    }
?>