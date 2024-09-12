<?php
	include ('../../../../../config/koneksi.php');

	$id 				= $_POST['id'];
	$no_surat 			= $_POST['fno_surat'];
	$id_pejabat_desa 	= $_POST['ft_tangan'];
	$alasan_tolak      = isset($_POST['alasan_tolak']) ? $_POST['alasan_tolak'] : null;
	
	if (isset($_POST['konfirmasi'])) {
		$status_surat = "BELUM SELESAI";
	} elseif (isset($_POST['tolak'])) {
		$status_surat = "TERTOLAK";
	}

	$qUpdate 	= "UPDATE surat_keterangan_kepemilikan_kendaraan_bermotor SET no_surat='$no_surat', id_pejabat_desa='$id_pejabat_desa', status_surat='$status_surat', alasan_tolak='$alasan_tolak' WHERE id_skkkb='$id'";
	$update 	= mysqli_query($connect, $qUpdate);

	if($update){
		header('location:../../');
	}else{
	 	echo ("<script LANGUAGE='JavaScript'>window.alert('Gagal mengonfirmasi surat'); window.location.href='#'</script>");
	}
?>