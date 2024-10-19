<?php
    include ('../../config/koneksi.php');

    if (isset($_POST['submit'])){
        $jenis_surat = "Surat Keterangan Wali Murid";
        $nik = $_POST['fnik'];
        $nama_anak = addslashes($_POST['fnama_anak']);
        $nik_anak = $_POST['fnik_anak'];
        $jenis_kelamin_anak = $_POST['fjenis_kelamin_anak'];
        $tempat_lahir_anak = addslashes($_POST['ftempat_lahir_anak']);
        $tanggal_lahir_anak = $_POST['ftanggal_lahir_anak'];
        $asal_sekolah = $_POST['fasal_sekolah'];
        $kelas = $_POST['fkelas'];
        $status_surat = "PENDING";
        $id_profil_desa = "1";

        $query = "SELECT whatsapp FROM login WHERE nik = '$nik'";
        $result = mysqli_query($connect, $query);
        $row = mysqli_fetch_assoc($result);
        $whatsapp = $row['whatsapp'];

        $qTambahSurat = "INSERT INTO surat_keterangan_wali_murid (jenis_surat, nik, whatsapp, nama_anak, nik_anak, jenis_kelamin_anak, tempat_lahir_anak, tanggal_lahir_anak, asal_sekolah, kelas, status_surat, id_profil_desa) VALUES('$jenis_surat', '$nik', '$whatsapp', '$nama_anak', '$nik_anak', '$jenis_kelamin_anak', '$tempat_lahir_anak', '$tanggal_lahir_anak', '$asal_sekolah', '$kelas', '$status_surat', '$id_profil_desa')";
        $TambahSurat = mysqli_query($connect, $qTambahSurat);
        header("location:../index.php?pesan=berhasil");
    }
?>