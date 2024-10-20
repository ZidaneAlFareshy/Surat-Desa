<?php
    include ('../../config/koneksi.php');

    if (isset($_POST['submit'])){
        $jenis_surat = "Surat Kematian";
        $nik = $_POST['fnik'];
        
        // Menyimpan file
        $ktp_meninggal = uploadFile('fktp_meninggal');
        $kk_meninggal = uploadFile('fkk_meninggal');
        $suket_kematian = uploadFile('fsuket_kematian');
        $surat_pengantar = uploadFile('fsurat_pengantar');

        // Jika ada file yang gagal diupload (misalnya format tidak valid atau terlalu besar), hentikan eksekusi
        if ($ktp_meninggal === null || $kk_meninggal === null || $suket_kematian === null || $surat_pengantar === null) {
            exit(); // Hentikan eksekusi jika upload gagal
        }

        $nama_meninggal = $_POST['fnama_meninggal'];
        $nik_meninggal = $_POST['fnik_meninggal'];
        $jenis_kelamin_meninggal = $_POST['fjenis_kelamin_meninggal'];
        $status_perkawinan_meninggal = $_POST['fstatus_perkawinan_meninggal'];
        $kewarganegaraan_meninggal = $_POST['fkewarganegaraan_meninggal'];
        $pekerjaan_meninggal = $_POST['fpekerjaan_meninggal'];
        $alamat_meninggal = addslashes($_POST['falamat_meninggal']);
        $sebab_meninggal = $_POST['fsebab_meninggal'];
        $tanggal_meninggal = $_POST['ftanggal_meninggal'];
        $tempat_pemakaman = $_POST['ftempat_pemakaman'];
        $hari_meninggal = $_POST['fhari_meninggal'];
        $tempat_meninggal = addslashes($_POST['ftempat_meninggal']);
        $status_surat = "PENDING";
        $id_profil_desa = "1";

        $query = "SELECT whatsapp FROM login WHERE nik = '$nik'";
        $result = mysqli_query($connect, $query);
        $row = mysqli_fetch_assoc($result);
        $whatsapp = $row['whatsapp'];

        $qTambahSurat = "INSERT INTO surat_mati (jenis_surat, nik, whatsapp, ktp_meninggal, kk_meninggal, suket_kematian, surat_pengantar, nama_meninggal, nik_meninggal, jenis_kelamin_meninggal, status_perkawinan_meninggal, kewarganegaraan_meninggal, pekerjaan_meninggal, alamat_meninggal, sebab_meninggal, tanggal_meninggal, tempat_pemakaman, hari_meninggal, tempat_meninggal, status_surat, id_profil_desa) VALUES ('$jenis_surat', '$nik', '$whatsapp', '$ktp_meninggal', '$kk_meninggal', '$suket_kematian', '$surat_pengantar', '$nama_meninggal', '$nik_meninggal', '$jenis_kelamin_meninggal', '$status_perkawinan_meninggal', '$kewarganegaraan_meninggal', '$pekerjaan_meninggal', '$alamat_meninggal', '$sebab_meninggal', '$tanggal_meninggal', '$tempat_pemakaman', '$hari_meninggal', '$tempat_meninggal', '$status_surat', '$id_profil_desa')";
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