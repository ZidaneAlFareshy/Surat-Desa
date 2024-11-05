<?php
	include ('../../config/koneksi.php');

	$id		= $_GET['id'];
	try {
		$qHapus = mysqli_query($connect, "DELETE FROM penduduk WHERE id_penduduk = '$id'");
		
		if ($qHapus) {
			header('location:index.php?pesan=berhasil-menghapus');
		} else {
			header('location:index.php?pesan=gagal-menghapus');
		}
	} catch (mysqli_sql_exception $e) {
		// Redirect ke halaman index dengan pesan error khusus jika gagal karena constraint
		header('location:index.php?pesan=gagal-menghapus');
	}
?>