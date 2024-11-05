-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Nov 2024 pada 20.24
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `suket-on`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_login`
--

CREATE TABLE `admin_login` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `level` varchar(10) NOT NULL,
  `whatsapp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin_login`
--

INSERT INTO `admin_login` (`id`, `nama`, `username`, `email`, `password`, `level`, `whatsapp`) VALUES
(1, 'Administrator', 'admin', 'admin@e-suratdesa.com', '21232f297a57a5a743894a0e4a801fc3', 'admin', ''),
(2, 'Kepala Desa', 'kades', 'kepaladesa@desa.id', '0cfa66469d25bd0d9e55d7ba583f9f2f', 'kades', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dusun`
--

CREATE TABLE `dusun` (
  `id_dusun` int(11) NOT NULL,
  `nama_dusun` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `dusun`
--

INSERT INTO `dusun` (`id_dusun`, `nama_dusun`) VALUES
(1, 'Grojogan'),
(2, 'Nganggring');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `level` varchar(10) NOT NULL,
  `nik` varchar(20) DEFAULT NULL,
  `whatsapp` varchar(15) NOT NULL,
  `ktp` varchar(255) NOT NULL,
  `kk` varchar(255) NOT NULL,
  `status_verifikasi` tinyint(1) NOT NULL DEFAULT 0,
  `otp` varchar(6) NOT NULL,
  `waktu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`id`, `nama`, `username`, `password`, `level`, `nik`, `whatsapp`, `ktp`, `kk`, `status_verifikasi`, `otp`, `waktu`) VALUES
(72, 'Mohammad Jindan Dubbay Al Fare', '7312109601020001', '1bbd886460827015e5d605ed44252251', 'user', '7312109601020001', '6289608183742', '', '', 1, '500406', 1730804911);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pejabat_desa`
--

CREATE TABLE `pejabat_desa` (
  `id_pejabat_desa` int(11) NOT NULL,
  `nama_pejabat_desa` varchar(50) NOT NULL,
  `jabatan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pejabat_desa`
--

INSERT INTO `pejabat_desa` (`id_pejabat_desa`, `nama_pejabat_desa`, `jabatan`) VALUES
(1, 'SUYATNO', 'Kuwu'),
(2, 'Muhammad Suryanto', 'Plt. Kepala Desa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penduduk`
--

CREATE TABLE `penduduk` (
  `id_penduduk` int(11) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `agama` varchar(15) NOT NULL,
  `jalan` varchar(100) NOT NULL,
  `dusun` varchar(50) NOT NULL,
  `rt` varchar(5) NOT NULL,
  `rw` varchar(5) NOT NULL,
  `desa` varchar(50) NOT NULL,
  `kecamatan` varchar(50) NOT NULL,
  `kota` varchar(50) NOT NULL,
  `no_kk` varchar(20) NOT NULL,
  `pend_kk` varchar(20) NOT NULL,
  `pend_terakhir` varchar(20) NOT NULL,
  `pend_ditempuh` varchar(20) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `status_perkawinan` varchar(20) NOT NULL,
  `status_dlm_keluarga` varchar(20) NOT NULL,
  `kewarganegaraan` varchar(5) NOT NULL,
  `nama_ayah` varchar(50) NOT NULL,
  `nama_ibu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penduduk`
--

INSERT INTO `penduduk` (`id_penduduk`, `nik`, `nama`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `agama`, `jalan`, `dusun`, `rt`, `rw`, `desa`, `kecamatan`, `kota`, `no_kk`, `pend_kk`, `pend_terakhir`, `pend_ditempuh`, `pekerjaan`, `status_perkawinan`, `status_dlm_keluarga`, `kewarganegaraan`, `nama_ayah`, `nama_ibu`) VALUES
(114, '7312109601020001', 'Mohammad Jindan Dubbay Al Faresh', 'indramayu', '2002-01-12', 'Laki-laki', 'islam', 'Jl. Merpati', 'Grojogan', '002', '002', 'Grogol', 'karangamoel', 'Kabupaten Cirebon', '234354323434', 'D1/SEDERAJAT', 'SLTA/SEDERAJAT', 'SD/SEDERAJAT', 'Mahasiswa', 'Menikah', 'Ayah', 'WNI', 'William', 'Yuuki');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil_desa`
--

CREATE TABLE `profil_desa` (
  `id_profil_desa` int(11) NOT NULL,
  `nama_desa` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telpon` varchar(20) NOT NULL,
  `kecamatan` varchar(50) NOT NULL,
  `kota` varchar(50) NOT NULL,
  `provinsi` varchar(20) NOT NULL,
  `kode_pos` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `profil_desa`
--

INSERT INTO `profil_desa` (`id_profil_desa`, `nama_desa`, `alamat`, `no_telpon`, `kecamatan`, `kota`, `provinsi`, `kode_pos`) VALUES
(1, 'Grogol', 'Jln. Raya Sunan Gunung Jati KM. 18 Kec. Kapetakan Kab. Cirebon Kode Pos 45152', '082330827777', 'Kapetakan', 'Kabupaten Cirebon', 'Jawa Barat', '61454');

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_keterangan`
--

CREATE TABLE `surat_keterangan` (
  `id_sk` int(11) NOT NULL,
  `jenis_surat` varchar(50) NOT NULL,
  `no_surat` varchar(20) DEFAULT NULL,
  `nik` varchar(20) NOT NULL,
  `whatsapp` varchar(15) DEFAULT NULL,
  `tanggal_surat` datetime NOT NULL DEFAULT current_timestamp(),
  `id_pejabat_desa` int(11) DEFAULT NULL,
  `status_surat` varchar(15) NOT NULL,
  `id_profil_desa` int(11) DEFAULT NULL,
  `alasan_tolak` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `surat_keterangan`
--

INSERT INTO `surat_keterangan` (`id_sk`, `jenis_surat`, `no_surat`, `nik`, `whatsapp`, `tanggal_surat`, `id_pejabat_desa`, `status_surat`, `id_profil_desa`, `alasan_tolak`) VALUES
(222, 'Surat Keterangan KTP Sementara', '01/323/12', '7312109601020001', '', '2024-11-05 18:00:25', 1, 'SELESAI', 1, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_keterangan_domisili`
--

CREATE TABLE `surat_keterangan_domisili` (
  `id_skd` int(11) NOT NULL,
  `jenis_surat` varchar(50) NOT NULL,
  `no_surat` varchar(20) DEFAULT NULL,
  `nik` varchar(20) NOT NULL,
  `whatsapp` varchar(15) DEFAULT NULL,
  `tanggal_surat` datetime NOT NULL DEFAULT current_timestamp(),
  `id_pejabat_desa` int(11) DEFAULT NULL,
  `status_surat` varchar(15) NOT NULL,
  `alasan_tolak` text DEFAULT NULL,
  `id_profil_desa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_keterangan_kehilangan`
--

CREATE TABLE `surat_keterangan_kehilangan` (
  `id_skk` int(11) NOT NULL,
  `jenis_surat` varchar(50) NOT NULL,
  `no_surat` varchar(20) DEFAULT NULL,
  `nik` varchar(20) NOT NULL,
  `whatsapp` varchar(15) DEFAULT NULL,
  `barang_hilang` varchar(100) NOT NULL,
  `lokasi_hilang` varchar(100) NOT NULL,
  `tanggal_hilang` date NOT NULL,
  `keperluan` varchar(50) NOT NULL,
  `tanggal_surat` datetime NOT NULL DEFAULT current_timestamp(),
  `id_pejabat_desa` int(11) DEFAULT NULL,
  `status_surat` varchar(15) NOT NULL,
  `alasan_tolak` text DEFAULT NULL,
  `id_profil_desa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_keterangan_tidak_mampu`
--

CREATE TABLE `surat_keterangan_tidak_mampu` (
  `id_sktm` int(11) NOT NULL,
  `jenis_surat` varchar(50) NOT NULL,
  `no_surat` varchar(20) DEFAULT NULL,
  `nik` varchar(20) NOT NULL,
  `whatsapp` varchar(15) DEFAULT NULL,
  `nama_ortu` varchar(100) DEFAULT NULL,
  `agama_ortu` varchar(30) DEFAULT NULL,
  `nik_ortu` varchar(20) DEFAULT NULL,
  `jenis_kelamin_ortu` varchar(20) DEFAULT NULL,
  `tempat_lahir_ortu` varchar(100) NOT NULL,
  `pekerjaan_ortu` varchar(30) NOT NULL,
  `tanggal_lahir_ortu` date NOT NULL,
  `alamat_ortu` varchar(100) NOT NULL,
  `tanggal_surat` datetime NOT NULL DEFAULT current_timestamp(),
  `id_pejabat_desa` int(11) DEFAULT NULL,
  `status_surat` varchar(15) NOT NULL,
  `alasan_tolak` text DEFAULT NULL,
  `id_profil_desa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_keterangan_usaha`
--

CREATE TABLE `surat_keterangan_usaha` (
  `id_sku` int(11) NOT NULL,
  `jenis_surat` varchar(50) NOT NULL,
  `no_surat` varchar(20) DEFAULT NULL,
  `nik` varchar(20) NOT NULL,
  `whatsapp` varchar(15) DEFAULT NULL,
  `usaha` varchar(30) DEFAULT NULL,
  `tanggal_surat` datetime NOT NULL DEFAULT current_timestamp(),
  `id_pejabat_desa` int(11) DEFAULT NULL,
  `status_surat` varchar(15) NOT NULL,
  `alasan_tolak` text DEFAULT NULL,
  `id_profil_desa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_keterangan_wali_murid`
--

CREATE TABLE `surat_keterangan_wali_murid` (
  `id_skwm` int(11) NOT NULL,
  `jenis_surat` varchar(50) NOT NULL,
  `no_surat` varchar(20) DEFAULT NULL,
  `nik` varchar(20) NOT NULL,
  `whatsapp` varchar(15) DEFAULT NULL,
  `nama_anak` varchar(100) DEFAULT NULL,
  `nik_anak` varchar(20) DEFAULT NULL,
  `jenis_kelamin_anak` varchar(30) DEFAULT NULL,
  `tempat_lahir_anak` varchar(100) NOT NULL,
  `tanggal_lahir_anak` date NOT NULL,
  `asal_sekolah` varchar(100) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  `tanggal_surat` datetime DEFAULT current_timestamp(),
  `id_pejabat_desa` int(11) DEFAULT NULL,
  `status_surat` varchar(15) NOT NULL,
  `alasan_tolak` text DEFAULT NULL,
  `id_profil_desa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_lahir`
--

CREATE TABLE `surat_lahir` (
  `id_sl` int(11) NOT NULL,
  `jenis_surat` varchar(50) NOT NULL,
  `no_surat` varchar(20) DEFAULT NULL,
  `nik` varchar(20) NOT NULL,
  `whatsapp` varchar(15) DEFAULT NULL,
  `bukti_nikah` varchar(255) NOT NULL,
  `data_saksi1` varchar(255) NOT NULL,
  `data_saksi2` varchar(255) NOT NULL,
  `nama_ibu_anak` varchar(100) NOT NULL,
  `nama_ayah_anak` varchar(100) NOT NULL,
  `nama_anak` varchar(100) NOT NULL,
  `umur_ibu` int(11) NOT NULL,
  `umur_ayah` int(11) NOT NULL,
  `pekerjaan_ayah` varchar(100) NOT NULL,
  `alamat_lahir` varchar(100) NOT NULL,
  `hari_lahir` varchar(50) NOT NULL,
  `tanggal_lahir_anak` date NOT NULL,
  `nomor_anak` varchar(50) NOT NULL,
  `tanggal_surat` datetime NOT NULL DEFAULT current_timestamp(),
  `id_pejabat_desa` int(11) DEFAULT NULL,
  `status_surat` varchar(15) NOT NULL,
  `alasan_tolak` text DEFAULT NULL,
  `id_profil_desa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_mati`
--

CREATE TABLE `surat_mati` (
  `id_sm` int(11) NOT NULL,
  `jenis_surat` varchar(50) NOT NULL,
  `no_surat` varchar(20) DEFAULT NULL,
  `nik` varchar(20) NOT NULL,
  `whatsapp` varchar(15) DEFAULT NULL,
  `ktp_meninggal` varchar(255) NOT NULL,
  `kk_meninggal` varchar(255) NOT NULL,
  `suket_kematian` varchar(255) NOT NULL,
  `surat_pengantar` varchar(255) NOT NULL,
  `nama_meninggal` varchar(100) NOT NULL,
  `nik_meninggal` varchar(20) NOT NULL,
  `jenis_kelamin_meninggal` varchar(20) NOT NULL,
  `status_perkawinan_meninggal` varchar(20) NOT NULL,
  `kewarganegaraan_meninggal` varchar(20) NOT NULL,
  `pekerjaan_meninggal` varchar(100) NOT NULL,
  `alamat_meninggal` varchar(100) NOT NULL,
  `sebab_meninggal` varchar(100) NOT NULL,
  `tanggal_meninggal` date NOT NULL,
  `tempat_pemakaman` varchar(100) NOT NULL,
  `hari_meninggal` varchar(50) NOT NULL,
  `tempat_meninggal` varchar(100) NOT NULL,
  `tanggal_surat` datetime NOT NULL DEFAULT current_timestamp(),
  `id_pejabat_desa` int(11) DEFAULT NULL,
  `status_surat` varchar(15) NOT NULL,
  `alasan_tolak` text DEFAULT NULL,
  `id_profil_desa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_pengantar_kelakuan_baik`
--

CREATE TABLE `surat_pengantar_kelakuan_baik` (
  `id_spkb` int(11) NOT NULL,
  `jenis_surat` varchar(50) NOT NULL,
  `no_surat` varchar(20) DEFAULT NULL,
  `nik` varchar(20) NOT NULL,
  `keperluan` varchar(50) NOT NULL,
  `whatsapp` varchar(15) DEFAULT NULL,
  `tanggal_surat` datetime NOT NULL DEFAULT current_timestamp(),
  `id_pejabat_desa` int(11) DEFAULT NULL,
  `status_surat` varchar(15) NOT NULL,
  `alasan_tolak` text DEFAULT NULL,
  `id_profil_desa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin_login`
--
ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `dusun`
--
ALTER TABLE `dusun`
  ADD PRIMARY KEY (`id_dusun`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nik` (`nik`) USING BTREE;

--
-- Indeks untuk tabel `pejabat_desa`
--
ALTER TABLE `pejabat_desa`
  ADD PRIMARY KEY (`id_pejabat_desa`);

--
-- Indeks untuk tabel `penduduk`
--
ALTER TABLE `penduduk`
  ADD PRIMARY KEY (`nik`),
  ADD KEY `idx_id_penduduk` (`id_penduduk`);

--
-- Indeks untuk tabel `profil_desa`
--
ALTER TABLE `profil_desa`
  ADD PRIMARY KEY (`id_profil_desa`);

--
-- Indeks untuk tabel `surat_keterangan`
--
ALTER TABLE `surat_keterangan`
  ADD PRIMARY KEY (`id_sk`),
  ADD KEY `idx_nik` (`nik`),
  ADD KEY `idx_id_pejabat_desa` (`id_pejabat_desa`),
  ADD KEY `idx_id_profil_desa` (`id_profil_desa`);

--
-- Indeks untuk tabel `surat_keterangan_domisili`
--
ALTER TABLE `surat_keterangan_domisili`
  ADD PRIMARY KEY (`id_skd`),
  ADD KEY `idx_nik` (`nik`),
  ADD KEY `idx_id_pejabat_desa` (`id_pejabat_desa`),
  ADD KEY `idx_id_profil_desa` (`id_profil_desa`);

--
-- Indeks untuk tabel `surat_keterangan_kehilangan`
--
ALTER TABLE `surat_keterangan_kehilangan`
  ADD PRIMARY KEY (`id_skk`),
  ADD KEY `idx_nik` (`nik`),
  ADD KEY `idx_id_pejabat_desa` (`id_pejabat_desa`),
  ADD KEY `idx_id_profil_desa` (`id_profil_desa`);

--
-- Indeks untuk tabel `surat_keterangan_tidak_mampu`
--
ALTER TABLE `surat_keterangan_tidak_mampu`
  ADD PRIMARY KEY (`id_sktm`),
  ADD KEY `idx_nik` (`nik`),
  ADD KEY `idx_id_pejabat_desa` (`id_pejabat_desa`),
  ADD KEY `idx_id_profil_desa` (`id_profil_desa`);

--
-- Indeks untuk tabel `surat_keterangan_usaha`
--
ALTER TABLE `surat_keterangan_usaha`
  ADD PRIMARY KEY (`id_sku`),
  ADD KEY `idx_nik` (`nik`),
  ADD KEY `idx_id_pejabat_desa` (`id_pejabat_desa`),
  ADD KEY `idx_id_profil_desa` (`id_profil_desa`);

--
-- Indeks untuk tabel `surat_keterangan_wali_murid`
--
ALTER TABLE `surat_keterangan_wali_murid`
  ADD PRIMARY KEY (`id_skwm`),
  ADD KEY `idx_nik` (`nik`),
  ADD KEY `idx_id_pejabat_desa` (`id_pejabat_desa`),
  ADD KEY `idx_id_profil_desa` (`id_profil_desa`);

--
-- Indeks untuk tabel `surat_lahir`
--
ALTER TABLE `surat_lahir`
  ADD PRIMARY KEY (`id_sl`),
  ADD KEY `idx_id_profil_desa` (`id_profil_desa`),
  ADD KEY `idx_id_pejabat_desa` (`id_pejabat_desa`),
  ADD KEY `idx_nik` (`nik`);

--
-- Indeks untuk tabel `surat_mati`
--
ALTER TABLE `surat_mati`
  ADD PRIMARY KEY (`id_sm`),
  ADD KEY `idx_id_pejabat_desa` (`id_pejabat_desa`),
  ADD KEY `idx_nik` (`nik`),
  ADD KEY `idx_id_profil_desa` (`id_profil_desa`);

--
-- Indeks untuk tabel `surat_pengantar_kelakuan_baik`
--
ALTER TABLE `surat_pengantar_kelakuan_baik`
  ADD PRIMARY KEY (`id_spkb`),
  ADD KEY `idx_id_pejabat_desa` (`id_pejabat_desa`),
  ADD KEY `idx_nik` (`nik`),
  ADD KEY `idx_id_profil_desa` (`id_profil_desa`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dusun`
--
ALTER TABLE `dusun`
  MODIFY `id_dusun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT untuk tabel `pejabat_desa`
--
ALTER TABLE `pejabat_desa`
  MODIFY `id_pejabat_desa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `penduduk`
--
ALTER TABLE `penduduk`
  MODIFY `id_penduduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT untuk tabel `profil_desa`
--
ALTER TABLE `profil_desa`
  MODIFY `id_profil_desa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `surat_keterangan`
--
ALTER TABLE `surat_keterangan`
  MODIFY `id_sk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT untuk tabel `surat_keterangan_domisili`
--
ALTER TABLE `surat_keterangan_domisili`
  MODIFY `id_skd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT untuk tabel `surat_keterangan_kehilangan`
--
ALTER TABLE `surat_keterangan_kehilangan`
  MODIFY `id_skk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `surat_keterangan_tidak_mampu`
--
ALTER TABLE `surat_keterangan_tidak_mampu`
  MODIFY `id_sktm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `surat_keterangan_usaha`
--
ALTER TABLE `surat_keterangan_usaha`
  MODIFY `id_sku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `surat_keterangan_wali_murid`
--
ALTER TABLE `surat_keterangan_wali_murid`
  MODIFY `id_skwm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `surat_lahir`
--
ALTER TABLE `surat_lahir`
  MODIFY `id_sl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `surat_mati`
--
ALTER TABLE `surat_mati`
  MODIFY `id_sm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT untuk tabel `surat_pengantar_kelakuan_baik`
--
ALTER TABLE `surat_pengantar_kelakuan_baik`
  MODIFY `id_spkb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `fk_nik_penduduk` FOREIGN KEY (`nik`) REFERENCES `penduduk` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `surat_keterangan`
--
ALTER TABLE `surat_keterangan`
  ADD CONSTRAINT `fk_id_pejabat_desa_sk` FOREIGN KEY (`id_pejabat_desa`) REFERENCES `pejabat_desa` (`id_pejabat_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_profil_desa_sk` FOREIGN KEY (`id_profil_desa`) REFERENCES `profil_desa` (`id_profil_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nik_sk` FOREIGN KEY (`nik`) REFERENCES `penduduk` (`nik`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `surat_keterangan_domisili`
--
ALTER TABLE `surat_keterangan_domisili`
  ADD CONSTRAINT `fi_id_profil_desa_skd` FOREIGN KEY (`id_profil_desa`) REFERENCES `profil_desa` (`id_profil_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_pejabat_desa_skd` FOREIGN KEY (`id_pejabat_desa`) REFERENCES `pejabat_desa` (`id_pejabat_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nik_skd` FOREIGN KEY (`nik`) REFERENCES `penduduk` (`nik`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `surat_keterangan_kehilangan`
--
ALTER TABLE `surat_keterangan_kehilangan`
  ADD CONSTRAINT `fk_id_pejabat_desa_skp` FOREIGN KEY (`id_pejabat_desa`) REFERENCES `pejabat_desa` (`id_pejabat_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_profil_desa_skp` FOREIGN KEY (`id_profil_desa`) REFERENCES `profil_desa` (`id_profil_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nik_skp` FOREIGN KEY (`nik`) REFERENCES `penduduk` (`nik`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `surat_keterangan_tidak_mampu`
--
ALTER TABLE `surat_keterangan_tidak_mampu`
  ADD CONSTRAINT `fk_id_pejabat_desa_skkkb` FOREIGN KEY (`id_pejabat_desa`) REFERENCES `pejabat_desa` (`id_pejabat_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_profil_desa_skkkb` FOREIGN KEY (`id_profil_desa`) REFERENCES `profil_desa` (`id_profil_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nik_skkkb` FOREIGN KEY (`nik`) REFERENCES `penduduk` (`nik`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `surat_keterangan_usaha`
--
ALTER TABLE `surat_keterangan_usaha`
  ADD CONSTRAINT `fi_id_profil_desa_sku` FOREIGN KEY (`id_profil_desa`) REFERENCES `profil_desa` (`id_profil_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_pejabat_desa_sku` FOREIGN KEY (`id_pejabat_desa`) REFERENCES `pejabat_desa` (`id_pejabat_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nik_sku` FOREIGN KEY (`nik`) REFERENCES `penduduk` (`nik`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `surat_keterangan_wali_murid`
--
ALTER TABLE `surat_keterangan_wali_murid`
  ADD CONSTRAINT `fk_id_pejabat_desa_sps` FOREIGN KEY (`id_pejabat_desa`) REFERENCES `pejabat_desa` (`id_pejabat_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_profil_desa_sps` FOREIGN KEY (`id_profil_desa`) REFERENCES `profil_desa` (`id_profil_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nik_sps` FOREIGN KEY (`nik`) REFERENCES `penduduk` (`nik`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `surat_lahir`
--
ALTER TABLE `surat_lahir`
  ADD CONSTRAINT `fk_id_pejabat_desa_slh` FOREIGN KEY (`id_pejabat_desa`) REFERENCES `pejabat_desa` (`id_pejabat_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_profil_desa_slh` FOREIGN KEY (`id_profil_desa`) REFERENCES `profil_desa` (`id_profil_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nik_slh` FOREIGN KEY (`nik`) REFERENCES `penduduk` (`nik`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `surat_mati`
--
ALTER TABLE `surat_mati`
  ADD CONSTRAINT `fi_id_profil_desa_sm` FOREIGN KEY (`id_profil_desa`) REFERENCES `profil_desa` (`id_profil_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_pejabat_desa_sm` FOREIGN KEY (`id_pejabat_desa`) REFERENCES `pejabat_desa` (`id_pejabat_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nik_sm` FOREIGN KEY (`nik`) REFERENCES `penduduk` (`nik`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `surat_pengantar_kelakuan_baik`
--
ALTER TABLE `surat_pengantar_kelakuan_baik`
  ADD CONSTRAINT `fi_id_profil_desa_skbb` FOREIGN KEY (`id_profil_desa`) REFERENCES `profil_desa` (`id_profil_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_pejabat_desa_skbb` FOREIGN KEY (`id_pejabat_desa`) REFERENCES `pejabat_desa` (`id_pejabat_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nik_skbb` FOREIGN KEY (`nik`) REFERENCES `penduduk` (`nik`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
