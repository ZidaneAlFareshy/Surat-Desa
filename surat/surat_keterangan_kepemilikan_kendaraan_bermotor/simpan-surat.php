<?php
    include ('../../config/koneksi.php');

    if (isset($_POST['submit'])){
        $jenis_surat = "Surat Keterangan Tidak Mampu";
        $nik = $_POST['fnik'];
        $telepon = $_POST['ftelepon'];
        $nama_second = addslashes($_POST['fnama_second']);
        $agama_second = $_POST['fagama_second'];
        $nik_second = $_POST['fnik_second'];
        $jenis_kelamin_second = $_POST['fjenis_kelamin_second'];
        $tempat_lahir_second = addslashes($_POST['ftempat_lahir_second']);
        $pekerjaan_second = $_POST['fpekerjaan_second'];
        $tanggal_lahir_second = $_POST['ftanggal_lahir_second'];
        $alamat_second = addslashes($_POST['falamat_second']);
        $status_surat = "PENDING";
        $id_profil_desa = "1";

        $qTambahSurat = "INSERT INTO surat_keterangan_kepemilikan_kendaraan_bermotor (jenis_surat, nik, telepon, nama_second, agama_second, nik_second, jenis_kelamin_second, tempat_lahir_second, pekerjaan_second, tanggal_lahir_second, alamat_second, status_surat, id_profil_desa) VALUES('$jenis_surat', '$nik', '$telepon', '$nama_second', '$agama_second', '$nik_second', '$jenis_kelamin_second', '$tempat_lahir_second', '$pekerjaan_second', '$tanggal_lahir_second', '$alamat_second', '$status_surat', '$id_profil_desa')";
        $TambahSurat = mysqli_query($connect, $qTambahSurat);
        header("location:../index.php?pesan=berhasil");
    }
?>