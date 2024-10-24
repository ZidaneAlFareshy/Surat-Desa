<?php
session_start();
include ('../config/koneksi.php');	

$username = $_POST['username'];
$password = $_POST['password']; // Password asli yang dimasukkan oleh user

// Cek apakah username ada di tabel admin_login
$qLoginAdmin = mysqli_query($connect, "SELECT * FROM admin_login WHERE username='$username'");
$rowAdmin = mysqli_num_rows($qLoginAdmin);

// Cek apakah username ada di tabel login (untuk user)
$qLoginUser = mysqli_query($connect, "SELECT * FROM login WHERE username='$username'");
$rowUser = mysqli_num_rows($qLoginUser);

if ($rowAdmin > 0) {
    $login = mysqli_fetch_assoc($qLoginAdmin);
    
    // Verifikasi password menggunakan MD5
    if (md5($password) == $login['password']) {
        // Password benar, cek level akun
        $_SESSION['username'] = $username;
        $_SESSION['lvl'] = "Administrator"; // Selalu untuk admin
        header("location:../admin/");
    } else {
        // Password salah
        header("location:index.php?pesan=password-salah");
    }
} else if ($rowUser > 0) {
    $login = mysqli_fetch_assoc($qLoginUser);

    // Cek apakah akun sudah diverifikasi
    if ($login['status_verifikasi'] == 0) {
        // Jika akun belum diverifikasi
        header("location:index.php?pesan=belum-diverifikasi");
        exit();
    }

    // Verifikasi password menggunakan MD5
    if (md5($password) == $login['password']) {
        // Password benar, cek level akun
        if ($login['level'] == "user") {
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
    // Username tidak ditemukan di kedua tabel
    header("location:index.php?pesan=login-gagal");
}
?>
