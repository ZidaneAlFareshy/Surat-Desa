<?php
session_start();
include ('../config/koneksi.php');	

$username = $_POST['username'];
$password = $_POST['password']; // Password asli yang dimasukkan oleh user

// Cek apakah username ada di database
$qLogin = mysqli_query($connect, "SELECT * FROM login WHERE username='$username'");
$row = mysqli_num_rows($qLogin);

if($row > 0){
    $login = mysqli_fetch_assoc($qLogin);
    
    // Cek apakah akun sudah diverifikasi
    if($login['status_verifikasi'] == 0) {
        // Jika akun belum diverifikasi
        header("location:index.php?pesan=belum-diverifikasi");
        exit();
    }

    // Verifikasi password menggunakan MD5
    if (md5($password) == $login['password']) {
        // Password benar, cek level akun
        if($login['level'] == "admin"){
            $_SESSION['username'] = $username;
            $_SESSION['lvl'] = "Administrator";
            header("location:../admin/");
        } else if($login['level'] == "kades"){
            $_SESSION['username'] = $username;
            $_SESSION['lvl'] = "Kepala Desa";
            header("location:../admin/");
        } else if($login['level'] == "user"){
            $_SESSION['username'] = $username;
            $_SESSION['lvl'] = "User";
            $_SESSION['nik'] = $login['nik'];  // Simpan NIK pengguna ke session
            header("location:../index.php");  // Arahkan ke halaman info-surat user
        } else {
            header("location:index.php?pesan=login-gagal");
        }
    } else {
        // Password salah
        header("location:index.php?pesan=password-salah");
    }
} else {
    // Username tidak ditemukan
    header("location:index.php?pesan=login-gagal");
}
?>
