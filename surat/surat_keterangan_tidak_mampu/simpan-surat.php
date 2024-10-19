<?php
    include ('../../config/koneksi.php');

    if (isset($_POST['submit'])){
        $jenis_surat = "Surat Keterangan Tidak Mampu";
        $nik = $_POST['fnik'];
        $nama_ortu = addslashes($_POST['fnama_ortu']);
        $agama_ortu = $_POST['fagama_ortu'];
        $nik_ortu = $_POST['fnik_ortu'];
        $jenis_kelamin_ortu = $_POST['fjenis_kelamin_ortu'];
        $tempat_lahir_ortu = addslashes($_POST['ftempat_lahir_ortu']);
        $pekerjaan_ortu = $_POST['fpekerjaan_ortu'];
        $tanggal_lahir_ortu = $_POST['ftanggal_lahir_ortu'];
        $alamat_ortu = addslashes($_POST['falamat_ortu']);
        $status_surat = "PENDING";
        $id_profil_desa = "1";

        $query = "SELECT whatsapp FROM login WHERE nik = '$nik'";
        $result = mysqli_query($connect, $query);
        $row = mysqli_fetch_assoc($result);
        $whatsapp = $row['whatsapp'];

        $qTambahSurat = "INSERT INTO surat_keterangan_tidak_mampu (jenis_surat, nik, whatsapp, nama_ortu, agama_ortu, nik_ortu, jenis_kelamin_ortu, tempat_lahir_ortu, pekerjaan_ortu, tanggal_lahir_ortu, alamat_ortu, status_surat, id_profil_desa) VALUES('$jenis_surat', '$nik', '$whatsapp', '$nama_ortu', '$agama_ortu', '$nik_ortu', '$jenis_kelamin_ortu', '$tempat_lahir_ortu', '$pekerjaan_ortu', '$tanggal_lahir_ortu', '$alamat_ortu', '$status_surat', '$id_profil_desa')";
        $TambahSurat = mysqli_query($connect, $qTambahSurat);
        header("location:../index.php?pesan=berhasil");
    }
?>