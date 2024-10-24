<?php
    include ('../../config/koneksi.php');

    if (isset($_POST['submit'])){
        $jenis_surat = "Surat Kelahiran";
        $nik = $_POST['fnik'];
        
        // Menyimpan file
        $bukti_nikah = uploadFile('fbukti_nikah');
        $data_saksi1 = uploadFile('fdata_saksi1');
        $data_saksi2 = uploadFile('fdata_saksi2');

        // Jika ada file yang gagal diupload (misalnya format tidak valid atau terlalu besar), hentikan eksekusi
        if ($bukti_nikah === null || $data_saksi1 === null || $data_saksi2 === null) {
            exit(); // Hentikan eksekusi jika upload gagal
        }

        $umur_ayah = $_POST['fumur_ayah'];
        $nama_ayah_anak = $_POST['fnama_ayah_anak'];
        $nama_ibu_anak = $_POST['fnama_ibu_anak'];
        $pekerjaan_ayah = $_POST['fpekerjaan_ayah'];
        $umur_ibu = $_POST['fumur_ibu'];
        $nama_anak = $_POST['fnama_anak'];
        $tanggal_lahir_anak = $_POST['ftanggal_lahir_anak'];
        $nomor_anak = $_POST['fnomor_anak'];
        $hari_lahir = $_POST['fhari_lahir'];
        $alamat_lahir = addslashes($_POST['falamat_lahir']);
        $status_surat = "PENDING";
        $id_profil_desa = "1";

        $query = "SELECT whatsapp FROM login WHERE nik = '$nik'";
        $result = mysqli_query($connect, $query);
        $row = mysqli_fetch_assoc($result);
        $whatsapp = $row['whatsapp'];

        $qTambahSurat = "INSERT INTO surat_lahir (jenis_surat, nik, whatsapp, bukti_nikah, data_saksi1, data_saksi2, nama_ibu_anak, nama_ayah_anak, nama_anak, umur_ibu, umur_ayah, pekerjaan_ayah, alamat_lahir, hari_lahir, tanggal_lahir_anak, nomor_anak, status_surat, id_profil_desa) VALUES ('$jenis_surat', '$nik', '$whatsapp', '$bukti_nikah', '$data_saksi1', '$data_saksi2', '$nama_ibu_anak', '$nama_ayah_anak', '$nama_anak', '$umur_ibu', '$umur_ayah', '$pekerjaan_ayah', '$alamat_lahir', '$hari_lahir', '$tanggal_lahir_anak', '$nomor_anak', '$status_surat', '$id_profil_desa')";
        $TambahSurat = mysqli_query($connect, $qTambahSurat);
        header("location:../index.php?pesan=berhasil");
    }

    // Fungsi untuk upload file
    function uploadFile($inputName) {
        $targetDir = "uploads/"; // Pastikan folder ini ada dan writable
        $targetFile = $targetDir . basename($_FILES[$inputName]["name"]);
        $uploadOk = 1;
        $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));

        // Cek ukuran file (maks 2MB)
        if ($_FILES[$inputName]["size"] > 2000000) { // 2MB
            header("Location: ../index.php?pesan=ukuran-file-terlalu-besar");
            exit();
        }

        // Cek format file (hanya jpg, jpeg, dan png)
        if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg") {
            header("Location: ../index.php?pesan=tipe-file-tidak-valid");
            exit();
        }

        // Cek jika $uploadOk == 0 berarti ada masalah
        if ($uploadOk == 0) {
            echo "Maaf, file tidak diupload.";
        } else {
            // Proses upload file
            if (move_uploaded_file($_FILES[$inputName]["tmp_name"], $targetFile)) {
                return basename($_FILES[$inputName]["name"]);
            } else {
                echo "Maaf, terjadi kesalahan saat mengupload file.";
            }
        }
        return null; // Kembalikan null jika file gagal diupload
    }
?>