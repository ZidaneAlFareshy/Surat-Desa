-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Okt 2023 pada 11.11
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-suratdesa`
--

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
(1, 'Menturus'),
(2, 'Menturus 2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `username` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `level` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`id`, `nama`, `username`, `email`, `password`, `level`) VALUES
(1, 'Administrator', 'admin', 'admin@e-suratdesa.com', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(2, 'Kepala Desa', 'kades', 'kepaladesa@desa.id', '0cfa66469d25bd0d9e55d7ba583f9f2f', 'kades');

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
(1, 'H. Moh. Saifuddin', 'Kepala Desa'),
(2, 'Slamet Fitrianto', 'Plt. Kepala Desa');

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
(97, '1000000001100000', 'DWI AJENG ANINDYA', 'Jakarta', '0000-00-00', 'Laki-Laki', 'Islam', 'Jl. Raya 1', 'Dsn 1', '1', '2', 'Desa 1', 'Kec 1', 'Kota 1', '98857577001', 'SD', 'SMA', 'S1', 'Guru', 'Menikah', 'Kepala Keluarga', 'Indon', 'Mark Doe', 'Jane Doe'),
(98, '1000000002100000', 'ERAWATI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 2', 'Dsn 2', '3', '4', 'Desa 2', 'Kec 2', 'Kota 2', '98857577002', 'SMP', 'SMA', 'D3', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(99, '1000000003100000', 'FITRI SUMARNI', 'Jakarta', '0000-00-00', 'Laki-Laki', 'Islam', 'Jl. Raya 1', 'Dsn 1', '1', '2', 'Desa 1', 'Kec 1', 'Kota 1', '98857577003', 'SD', 'SMA', 'S1', 'Guru', 'Menikah', 'Kepala Keluarga', 'Indon', 'Mark Doe', 'Jane Doe'),
(100, '1000000004100000', 'HASANAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 2', 'Dsn 2', '3', '4', 'Desa 2', 'Kec 2', 'Kota 2', '98857577004', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(101, '1000000005100000', 'HAYANAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 3', 'Dsn 3', '3', '4', 'Desa 3', 'Kec 3', 'Kota 3', '98857577005', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(102, '1000000006100000', 'HIKMATULAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 4', 'Dsn 4', '3', '4', 'Desa 4', 'Kec 4', 'Kota 4', '98857577006', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(103, '1000000007100000', 'HOJAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 5', 'Dsn 5', '3', '4', 'Desa 5', 'Kec 5', 'Kota 5', '98857577007', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(104, '1000000008100000', 'ITOH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 6', 'Dsn 6', '3', '4', 'Desa 6', 'Kec 6', 'Kota 6', '98857577008', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(105, '1000000009100000', 'JELITA MIRANTI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 7', 'Dsn 7', '3', '4', 'Desa 7', 'Kec 7', 'Kota 7', '98857577009', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(106, '1000000010100000', 'JUFIKOH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 8', 'Dsn 8', '3', '4', 'Desa 8', 'Kec 8', 'Kota 8', '98857577010', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(107, '1000000011100000', 'LINDA KUSMIYATI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 9', 'Dsn 9', '3', '4', 'Desa 9', 'Kec 9', 'Kota 9', '98857577011', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(108, '1000000012100000', 'MARIYAM NENGSI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 10', 'Dsn 10', '3', '4', 'Desa 10', 'Kec 10', 'Kota 10', '98857577012', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(109, '1000000013100000', 'MARYANAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 11', 'Dsn 11', '3', '4', 'Desa 11', 'Kec 11', 'Kota 11', '98857577013', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(110, '1000000014100000', 'MARYANAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 12', 'Dsn 12', '3', '4', 'Desa 12', 'Kec 12', 'Kota 12', '98857577014', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(111, '1000000015100000', 'MUCHAMMAD NURHUSAENI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 13', 'Dsn 13', '3', '4', 'Desa 13', 'Kec 13', 'Kota 13', '98857577015', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(112, '1000000016100000', 'MUHAMAD RIFKI REZA PRAMUDYA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 14', 'Dsn 14', '3', '4', 'Desa 14', 'Kec 14', 'Kota 14', '98857577016', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(113, '1000000017100000', 'MUHIBIN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 15', 'Dsn 15', '3', '4', 'Desa 15', 'Kec 15', 'Kota 15', '98857577017', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(114, '1000000018100000', 'MULYATI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 16', 'Dsn 16', '3', '4', 'Desa 16', 'Kec 16', 'Kota 16', '98857577018', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(115, '1000000019100000', 'MURNIYATI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 17', 'Dsn 17', '3', '4', 'Desa 17', 'Kec 17', 'Kota 17', '98857577019', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(116, '1000000020100000', 'NADIAH PERMATASARI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 18', 'Dsn 18', '3', '4', 'Desa 18', 'Kec 18', 'Kota 18', '98857577020', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(117, '1000000021100000', 'NENENG SUPRIATIN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 19', 'Dsn 19', '3', '4', 'Desa 19', 'Kec 19', 'Kota 19', '98857577021', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(118, '1000000022100000', 'NYIMAS RISMA YANTI SWADINA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 20', 'Dsn 20', '3', '4', 'Desa 20', 'Kec 20', 'Kota 20', '98857577022', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(119, '1000000023100000', 'RENDI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 21', 'Dsn 21', '3', '4', 'Desa 21', 'Kec 21', 'Kota 21', '98857577023', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(120, '1000000024100000', 'RESTI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 22', 'Dsn 22', '3', '4', 'Desa 22', 'Kec 22', 'Kota 22', '98857577024', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(121, '1000000025100000', 'RISMAWATI DWI ANGGIANI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 23', 'Dsn 23', '3', '4', 'Desa 23', 'Kec 23', 'Kota 23', '98857577025', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(122, '1000000026100000', 'RUMINAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 24', 'Dsn 24', '3', '4', 'Desa 24', 'Kec 24', 'Kota 24', '98857577026', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(123, '1000000027100000', 'SAHIRAH SRIWATI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 25', 'Dsn 25', '3', '4', 'Desa 25', 'Kec 25', 'Kota 25', '98857577027', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(124, '1000000028100000', 'SARI AGUSTINA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 26', 'Dsn 26', '3', '4', 'Desa 26', 'Kec 26', 'Kota 26', '98857577028', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(125, '1000000029100000', 'SITI NURHALIMAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 27', 'Dsn 27', '3', '4', 'Desa 27', 'Kec 27', 'Kota 27', '98857577029', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(126, '1000000030100000', 'SOHARI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 28', 'Dsn 28', '3', '4', 'Desa 28', 'Kec 28', 'Kota 28', '98857577030', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(127, '1000000031100000', 'SRI LESTARI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 29', 'Dsn 29', '3', '4', 'Desa 29', 'Kec 29', 'Kota 29', '98857577031', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(128, '1000000032100000', 'SUHETI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 30', 'Dsn 30', '3', '4', 'Desa 30', 'Kec 30', 'Kota 30', '98857577032', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(129, '1000000033100000', 'TATI SUMIYATI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 31', 'Dsn 31', '3', '4', 'Desa 31', 'Kec 31', 'Kota 31', '98857577033', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(130, '1000000034100000', 'TOMMY RUSTAM MUNAP', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 32', 'Dsn 32', '3', '4', 'Desa 32', 'Kec 32', 'Kota 32', '98857577034', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(131, '1000000035100000', 'WARSINI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 33', 'Dsn 33', '3', '4', 'Desa 33', 'Kec 33', 'Kota 33', '98857577035', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(132, '1000000036100000', 'YUYUN YUNINGSIH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 34', 'Dsn 34', '3', '4', 'Desa 34', 'Kec 34', 'Kota 34', '98857577036', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(133, '1000000037100000', 'AAN ANHARI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 35', 'Dsn 35', '3', '4', 'Desa 35', 'Kec 35', 'Kota 35', '98857577037', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(134, '1000000038100000', 'AAT SUGIATMI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 36', 'Dsn 36', '3', '4', 'Desa 36', 'Kec 36', 'Kota 36', '98857577038', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(135, '1000000039100000', 'ABDULLAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 37', 'Dsn 37', '3', '4', 'Desa 37', 'Kec 37', 'Kota 37', '98857577039', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(136, '1000000040100000', 'ACHMAD NUR ROFI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 38', 'Dsn 38', '3', '4', 'Desa 38', 'Kec 38', 'Kota 38', '98857577040', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(137, '1000000042100000', 'ADRIZAL FIRMANSYAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 40', 'Dsn 40', '3', '4', 'Desa 40', 'Kec 40', 'Kota 40', '98857577042', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(138, '1000000043100000', 'AFAN MAULANA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 41', 'Dsn 41', '3', '4', 'Desa 41', 'Kec 41', 'Kota 41', '98857577043', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(139, '1000000044100000', 'AFIFA SHAFA AZAHRO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 42', 'Dsn 42', '3', '4', 'Desa 42', 'Kec 42', 'Kota 42', '98857577044', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(140, '1000000045100000', 'AGUS SANJAYA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 43', 'Dsn 43', '3', '4', 'Desa 43', 'Kec 43', 'Kota 43', '98857577045', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(141, '1000000046100000', 'AHMAD PUTRA ALL HIDAYAT', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 44', 'Dsn 44', '3', '4', 'Desa 44', 'Kec 44', 'Kota 44', '98857577046', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(142, '1000000047100000', 'AINAYA LINTANG WIJANARKO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 45', 'Dsn 45', '3', '4', 'Desa 45', 'Kec 45', 'Kota 45', '98857577047', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(143, '1000000048100000', 'AINU SIRI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 46', 'Dsn 46', '3', '4', 'Desa 46', 'Kec 46', 'Kota 46', '98857577048', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(144, '1000000049100000', 'AJI ALI SAYUTI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 47', 'Dsn 47', '3', '4', 'Desa 47', 'Kec 47', 'Kota 47', '98857577049', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(145, '1000000050100000', 'AJIE BAGUS SAPUTRA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 48', 'Dsn 48', '3', '4', 'Desa 48', 'Kec 48', 'Kota 48', '98857577050', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(146, '1000000051100000', 'AKMAD FARKHAN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 49', 'Dsn 49', '3', '4', 'Desa 49', 'Kec 49', 'Kota 49', '98857577051', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(147, '1000000052100000', 'AKMAL FADHLURRAHMAN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 50', 'Dsn 50', '3', '4', 'Desa 50', 'Kec 50', 'Kota 50', '98857577052', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(148, '1000000053100000', 'ALANRI HERDIAN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 51', 'Dsn 51', '3', '4', 'Desa 51', 'Kec 51', 'Kota 51', '98857577053', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(149, '1000000054100000', 'ALBERTA HANNI PRAKUSYA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 52', 'Dsn 52', '3', '4', 'Desa 52', 'Kec 52', 'Kota 52', '98857577054', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(150, '1000000055100000', 'ALDIEN TSABIT HIDAYAT', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 53', 'Dsn 53', '3', '4', 'Desa 53', 'Kec 53', 'Kota 53', '98857577055', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(151, '1000000056100000', 'ALDILA MASAYU', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 54', 'Dsn 54', '3', '4', 'Desa 54', 'Kec 54', 'Kota 54', '98857577056', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(152, '1000000057100000', 'ALFINA WULANDARI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 55', 'Dsn 55', '3', '4', 'Desa 55', 'Kec 55', 'Kota 55', '98857577057', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(153, '1000000058100000', 'ALIA NAZWA REGINA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 56', 'Dsn 56', '3', '4', 'Desa 56', 'Kec 56', 'Kota 56', '98857577058', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(154, '1000000059100000', 'ALIF RAMADHAN ARRASYAD', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 57', 'Dsn 57', '3', '4', 'Desa 57', 'Kec 57', 'Kota 57', '98857577059', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(155, '1000000060100000', 'ALIF UMAR SHIDDIQ', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 58', 'Dsn 58', '3', '4', 'Desa 58', 'Kec 58', 'Kota 58', '98857577060', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(156, '1000000061100000', 'ALIYUMI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 59', 'Dsn 59', '3', '4', 'Desa 59', 'Kec 59', 'Kota 59', '98857577061', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(157, '1000000062100000', 'AMALIA FADILAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 60', 'Dsn 60', '3', '4', 'Desa 60', 'Kec 60', 'Kota 60', '98857577062', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(158, '1000000063100000', 'AMMAR WALY', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 61', 'Dsn 61', '3', '4', 'Desa 61', 'Kec 61', 'Kota 61', '98857577063', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(159, '1000000064100000', 'ANA ALFIYAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 62', 'Dsn 62', '3', '4', 'Desa 62', 'Kec 62', 'Kota 62', '98857577064', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(160, '1000000065100000', 'ANA ZULFA HASANAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 63', 'Dsn 63', '3', '4', 'Desa 63', 'Kec 63', 'Kota 63', '98857577065', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(161, '1000000066100000', 'ANE PRIDANDINI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 64', 'Dsn 64', '3', '4', 'Desa 64', 'Kec 64', 'Kota 64', '98857577066', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(162, '1000000067100000', 'ANGGIYA HANAFI PRATAMA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 65', 'Dsn 65', '3', '4', 'Desa 65', 'Kec 65', 'Kota 65', '98857577067', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(163, '1000000068100000', 'ANINDA SAGITA NURLAILA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 66', 'Dsn 66', '3', '4', 'Desa 66', 'Kec 66', 'Kota 66', '98857577068', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(164, '1000000069100000', 'ANIS ELISA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 67', 'Dsn 67', '3', '4', 'Desa 67', 'Kec 67', 'Kota 67', '98857577069', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(165, '1000000070100000', 'ANISMAR SIREGAR', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 68', 'Dsn 68', '3', '4', 'Desa 68', 'Kec 68', 'Kota 68', '98857577070', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(166, '1000000071100000', 'ANJELYE YERMITHA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 69', 'Dsn 69', '3', '4', 'Desa 69', 'Kec 69', 'Kota 69', '98857577071', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(167, '1000000072100000', 'ANNISA MAULIDIA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 70', 'Dsn 70', '3', '4', 'Desa 70', 'Kec 70', 'Kota 70', '98857577072', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(168, '1000000073100000', 'ANTHONY SURYA WIJAYA, TAN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 71', 'Dsn 71', '3', '4', 'Desa 71', 'Kec 71', 'Kota 71', '98857577073', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(169, '1000000074100000', 'AQILAH AZZANOV ANDYANI PUTRI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 72', 'Dsn 72', '3', '4', 'Desa 72', 'Kec 72', 'Kota 72', '98857577074', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(170, '1000000075100000', 'AQILAH PUTRI TSABITAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 73', 'Dsn 73', '3', '4', 'Desa 73', 'Kec 73', 'Kota 73', '98857577075', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(171, '1000000076100000', 'ARDI FEBRIYAN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 74', 'Dsn 74', '3', '4', 'Desa 74', 'Kec 74', 'Kota 74', '98857577076', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(172, '1000000077100000', 'ARDIANSYAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 75', 'Dsn 75', '3', '4', 'Desa 75', 'Kec 75', 'Kota 75', '98857577077', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(173, '1000000078100000', 'ARI AGUSTIN CHAERUDIN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 76', 'Dsn 76', '3', '4', 'Desa 76', 'Kec 76', 'Kota 76', '98857577078', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(174, '1000000079100000', 'ARINI MARSANDA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 77', 'Dsn 77', '3', '4', 'Desa 77', 'Kec 77', 'Kota 77', '98857577079', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(175, '1000000080100000', 'ARIZ FATHUR RACHMAN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 78', 'Dsn 78', '3', '4', 'Desa 78', 'Kec 78', 'Kota 78', '98857577080', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(176, '1000000081100000', 'ARJUNNAJAT', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 79', 'Dsn 79', '3', '4', 'Desa 79', 'Kec 79', 'Kota 79', '98857577081', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(177, '1000000082100000', 'ARYA FADHIL HAKIM', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 80', 'Dsn 80', '3', '4', 'Desa 80', 'Kec 80', 'Kota 80', '98857577082', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(178, '1000000083100000', 'ASEP ENDAN ROSNANDI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 81', 'Dsn 81', '3', '4', 'Desa 81', 'Kec 81', 'Kota 81', '98857577083', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(179, '1000000084100000', 'ASGAR HAERUDIN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 82', 'Dsn 82', '3', '4', 'Desa 82', 'Kec 82', 'Kota 82', '98857577084', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(180, '1000000085100000', 'ASY SYIFA FATIMAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 83', 'Dsn 83', '3', '4', 'Desa 83', 'Kec 83', 'Kota 83', '98857577085', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(181, '1000000086100000', 'ASYAROTUL SHITA FEBRIANTI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 84', 'Dsn 84', '3', '4', 'Desa 84', 'Kec 84', 'Kota 84', '98857577086', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(182, '1000000087100000', 'ATEP GOJALI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 85', 'Dsn 85', '3', '4', 'Desa 85', 'Kec 85', 'Kota 85', '98857577087', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(183, '1000000088100000', 'ATHARIK ARDI WITANTO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 86', 'Dsn 86', '3', '4', 'Desa 86', 'Kec 86', 'Kota 86', '98857577088', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(184, '1000000089100000', 'ATI SUTIHATI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 87', 'Dsn 87', '3', '4', 'Desa 87', 'Kec 87', 'Kota 87', '98857577089', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(185, '1000000090100000', 'ATIK NURHAYATI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 88', 'Dsn 88', '3', '4', 'Desa 88', 'Kec 88', 'Kota 88', '98857577090', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(186, '1000000091100000', 'ATIKA YENI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 89', 'Dsn 89', '3', '4', 'Desa 89', 'Kec 89', 'Kota 89', '98857577091', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(187, '1000000092100000', 'AUDRI DEVIANA YUNIAR', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 90', 'Dsn 90', '3', '4', 'Desa 90', 'Kec 90', 'Kota 90', '98857577092', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(188, '1000000093100000', 'AULIA RAHMA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 91', 'Dsn 91', '3', '4', 'Desa 91', 'Kec 91', 'Kota 91', '98857577093', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(189, '1000000094100000', 'AYUBI DWI RAMADHANI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 92', 'Dsn 92', '3', '4', 'Desa 92', 'Kec 92', 'Kota 92', '98857577094', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(190, '1000000095100000', 'AZIZAH ANDELLA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 93', 'Dsn 93', '3', '4', 'Desa 93', 'Kec 93', 'Kota 93', '98857577095', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(191, '1000000096100000', 'BAGUS RAMADHAN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 94', 'Dsn 94', '3', '4', 'Desa 94', 'Kec 94', 'Kota 94', '98857577096', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(192, '1000000097100000', 'BAHTIAR MAULANA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 95', 'Dsn 95', '3', '4', 'Desa 95', 'Kec 95', 'Kota 95', '98857577097', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(193, '1000000098100000', 'BANGUN HUTAPEA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 96', 'Dsn 96', '3', '4', 'Desa 96', 'Kec 96', 'Kota 96', '98857577098', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(194, '1000000099100000', 'BENO DRAJAT', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 97', 'Dsn 97', '3', '4', 'Desa 97', 'Kec 97', 'Kota 97', '98857577099', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(195, '1000000100100000', 'BINAWAN SEPTIADI SAPUTRO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 98', 'Dsn 98', '3', '4', 'Desa 98', 'Kec 98', 'Kota 98', '98857577100', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(196, '1000000101100000', 'CITRA PUTRI PRANATA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 99', 'Dsn 99', '3', '4', 'Desa 99', 'Kec 99', 'Kota 99', '98857577101', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(197, '1000000102100000', 'DAFFA DZAKY SYAHBANI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 100', 'Dsn 100', '3', '4', 'Desa 100', 'Kec 100', 'Kota 100', '98857577102', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(198, '1000000103100000', 'DAFFA SUWANDI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 101', 'Dsn 101', '3', '4', 'Desa 101', 'Kec 101', 'Kota 101', '98857577103', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(199, '1000000104100000', 'DANANG SASI KIRONO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 102', 'Dsn 102', '3', '4', 'Desa 102', 'Kec 102', 'Kota 102', '98857577104', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(200, '1000000105100000', 'DEDE HERIYATI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 103', 'Dsn 103', '3', '4', 'Desa 103', 'Kec 103', 'Kota 103', '98857577105', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(201, '1000000106100000', 'DESNANI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 104', 'Dsn 104', '3', '4', 'Desa 104', 'Kec 104', 'Kota 104', '98857577106', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(202, '1000000107100000', 'DEVI AULIA RAMADHANY', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 105', 'Dsn 105', '3', '4', 'Desa 105', 'Kec 105', 'Kota 105', '98857577107', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(203, '1000000108100000', 'DEVI PUSPITA SARI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 106', 'Dsn 106', '3', '4', 'Desa 106', 'Kec 106', 'Kota 106', '98857577108', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(204, '1000000109100000', 'DEVIANI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 107', 'Dsn 107', '3', '4', 'Desa 107', 'Kec 107', 'Kota 107', '98857577109', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(205, '1000000110100000', 'DIAN ARDIYANTO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 108', 'Dsn 108', '3', '4', 'Desa 108', 'Kec 108', 'Kota 108', '98857577110', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(206, '1000000111100000', 'DIAN DENTA ALUMI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 109', 'Dsn 109', '3', '4', 'Desa 109', 'Kec 109', 'Kota 109', '98857577111', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(207, '1000000112100000', 'DIKI ALFARIJI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 110', 'Dsn 110', '3', '4', 'Desa 110', 'Kec 110', 'Kota 110', '98857577112', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(208, '1000000113100000', 'DIKI WIJAYA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 111', 'Dsn 111', '3', '4', 'Desa 111', 'Kec 111', 'Kota 111', '98857577113', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(209, '1000000114100000', 'DIMAS DIANDRA ATALLAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 112', 'Dsn 112', '3', '4', 'Desa 112', 'Kec 112', 'Kota 112', '98857577114', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(210, '1000000115100000', 'DIMAS MUHAMMAD HAFIDZ', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 113', 'Dsn 113', '3', '4', 'Desa 113', 'Kec 113', 'Kota 113', '98857577115', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(211, '1000000116100000', 'DINDA CHAIRUNNISA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 114', 'Dsn 114', '3', '4', 'Desa 114', 'Kec 114', 'Kota 114', '98857577116', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(212, '1000000117100000', 'DITO RAHARTO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 115', 'Dsn 115', '3', '4', 'Desa 115', 'Kec 115', 'Kota 115', '98857577117', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(213, '1000000118100000', 'DONNA AFISTA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 116', 'Dsn 116', '3', '4', 'Desa 116', 'Kec 116', 'Kota 116', '98857577118', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(214, '1000000119100000', 'DWI HARYANI LESTARI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 117', 'Dsn 117', '3', '4', 'Desa 117', 'Kec 117', 'Kota 117', '98857577119', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(215, '1000000120100000', 'DWI MUTIARA MAHARANI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 118', 'Dsn 118', '3', '4', 'Desa 118', 'Kec 118', 'Kota 118', '98857577120', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(216, '1000000121100000', 'DWI SYAFA KURNIAWAN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 119', 'Dsn 119', '3', '4', 'Desa 119', 'Kec 119', 'Kota 119', '98857577121', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(217, '1000000122100000', 'EDI JUNAEDI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 120', 'Dsn 120', '3', '4', 'Desa 120', 'Kec 120', 'Kota 120', '98857577122', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(218, '1000000123100000', 'ELENTIKA CHINTIA SARI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 121', 'Dsn 121', '3', '4', 'Desa 121', 'Kec 121', 'Kota 121', '98857577123', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(219, '1000000124100000', 'ELLENA ARDYA CAHYARINI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 122', 'Dsn 122', '3', '4', 'Desa 122', 'Kec 122', 'Kota 122', '98857577124', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(220, '1000000125100000', 'EMI SUSILAWATI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 123', 'Dsn 123', '3', '4', 'Desa 123', 'Kec 123', 'Kota 123', '98857577125', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(221, '1000000126100000', 'EMY SULISTIYANI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 124', 'Dsn 124', '3', '4', 'Desa 124', 'Kec 124', 'Kota 124', '98857577126', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(222, '1000000127100000', 'ENCEP SUPRIATNA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 125', 'Dsn 125', '3', '4', 'Desa 125', 'Kec 125', 'Kota 125', '98857577127', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(223, '1000000128100000', 'ENI SUMIYATI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 126', 'Dsn 126', '3', '4', 'Desa 126', 'Kec 126', 'Kota 126', '98857577128', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(224, '1000000129100000', 'ERIK BENIARDI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 127', 'Dsn 127', '3', '4', 'Desa 127', 'Kec 127', 'Kota 127', '98857577129', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(225, '1000000130100000', 'ERNI SARMINI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 128', 'Dsn 128', '3', '4', 'Desa 128', 'Kec 128', 'Kota 128', '98857577130', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(226, '1000000131100000', 'FAJAR MAULANA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 129', 'Dsn 129', '3', '4', 'Desa 129', 'Kec 129', 'Kota 129', '98857577131', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(227, '1000000132100000', 'FAJRI EKA MAULDY', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 130', 'Dsn 130', '3', '4', 'Desa 130', 'Kec 130', 'Kota 130', '98857577132', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(228, '1000000133100000', 'FALAH DIES ANNISA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 131', 'Dsn 131', '3', '4', 'Desa 131', 'Kec 131', 'Kota 131', '98857577133', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(229, '1000000134100000', 'FANNY SYAHARANI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 132', 'Dsn 132', '3', '4', 'Desa 132', 'Kec 132', 'Kota 132', '98857577134', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(230, '1000000135100000', 'FANSYA DWI KURNIAWAN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 133', 'Dsn 133', '3', '4', 'Desa 133', 'Kec 133', 'Kota 133', '98857577135', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(231, '1000000136100000', 'FATIMAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 134', 'Dsn 134', '3', '4', 'Desa 134', 'Kec 134', 'Kota 134', '98857577136', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(232, '1000000137100000', 'FATIMAH PUTRI EKA LESTARI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 135', 'Dsn 135', '3', '4', 'Desa 135', 'Kec 135', 'Kota 135', '98857577137', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(233, '1000000138100000', 'FENITA SURYANI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 136', 'Dsn 136', '3', '4', 'Desa 136', 'Kec 136', 'Kota 136', '98857577138', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(234, '1000000139100000', 'FIKRI ROSYAAD IZZUDDIN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 137', 'Dsn 137', '3', '4', 'Desa 137', 'Kec 137', 'Kota 137', '98857577139', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(235, '1000000140100000', 'FIRSTEN DIYAN ADHITYA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 138', 'Dsn 138', '3', '4', 'Desa 138', 'Kec 138', 'Kota 138', '98857577140', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(236, '1000000141100000', 'FITHRI BARIKA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 139', 'Dsn 139', '3', '4', 'Desa 139', 'Kec 139', 'Kota 139', '98857577141', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(237, '1000000142100000', 'FUAD ANGGARA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 140', 'Dsn 140', '3', '4', 'Desa 140', 'Kec 140', 'Kota 140', '98857577142', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(238, '1000000143100000', 'GAREENDRA RIZKY SABIL', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 141', 'Dsn 141', '3', '4', 'Desa 141', 'Kec 141', 'Kota 141', '98857577143', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(239, '1000000144100000', 'GEBY SANDOVA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 142', 'Dsn 142', '3', '4', 'Desa 142', 'Kec 142', 'Kota 142', '98857577144', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(240, '1000000145100000', 'GIGIH YUDHA WASISA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 143', 'Dsn 143', '3', '4', 'Desa 143', 'Kec 143', 'Kota 143', '98857577145', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(241, '1000000146100000', 'GILANG PRABOWO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 144', 'Dsn 144', '3', '4', 'Desa 144', 'Kec 144', 'Kota 144', '98857577146', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(242, '1000000147100000', 'GIRI TRICAHYONO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 145', 'Dsn 145', '3', '4', 'Desa 145', 'Kec 145', 'Kota 145', '98857577147', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(243, '1000000148100000', 'HAECHAL FACHAR QISHAS', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 146', 'Dsn 146', '3', '4', 'Desa 146', 'Kec 146', 'Kota 146', '98857577148', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(244, '1000000149100000', 'HAIRUL IQBAL', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 147', 'Dsn 147', '3', '4', 'Desa 147', 'Kec 147', 'Kota 147', '98857577149', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(245, '1000000150100000', 'HAKKI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 148', 'Dsn 148', '3', '4', 'Desa 148', 'Kec 148', 'Kota 148', '98857577150', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(246, '1000000151100000', 'HAMDAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 149', 'Dsn 149', '3', '4', 'Desa 149', 'Kec 149', 'Kota 149', '98857577151', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(247, '1000000152100000', 'HAMIDI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 150', 'Dsn 150', '3', '4', 'Desa 150', 'Kec 150', 'Kota 150', '98857577152', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(248, '1000000153100000', 'HAMISAN HASAN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 151', 'Dsn 151', '3', '4', 'Desa 151', 'Kec 151', 'Kota 151', '98857577153', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(249, '1000000154100000', 'HERMANSYAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 152', 'Dsn 152', '3', '4', 'Desa 152', 'Kec 152', 'Kota 152', '98857577154', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(250, '1000000155100000', 'HILDA NURAFRIDHITA SETIA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 153', 'Dsn 153', '3', '4', 'Desa 153', 'Kec 153', 'Kota 153', '98857577155', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(251, '1000000156100000', 'HILMI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 154', 'Dsn 154', '3', '4', 'Desa 154', 'Kec 154', 'Kota 154', '98857577156', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(252, '1000000157100000', 'HURIYAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 155', 'Dsn 155', '3', '4', 'Desa 155', 'Kec 155', 'Kota 155', '98857577157', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(253, '1000000158100000', 'HUSNATUL AINI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 156', 'Dsn 156', '3', '4', 'Desa 156', 'Kec 156', 'Kota 156', '98857577158', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(254, '1000000159100000', 'IBNU SUHARI ADINATA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 157', 'Dsn 157', '3', '4', 'Desa 157', 'Kec 157', 'Kota 157', '98857577159', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(255, '1000000160100000', 'IDRIS MIRSYAD ABAS SAIRUN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 158', 'Dsn 158', '3', '4', 'Desa 158', 'Kec 158', 'Kota 158', '98857577160', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(256, '1000000161100000', 'IFATUL WULANDARI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 159', 'Dsn 159', '3', '4', 'Desa 159', 'Kec 159', 'Kota 159', '98857577161', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(257, '1000000162100000', 'IGN UNGGUL KRISNOTO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 160', 'Dsn 160', '3', '4', 'Desa 160', 'Kec 160', 'Kota 160', '98857577162', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(258, '1000000163100000', 'IKHSAN RIFQI RAMADHAN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 161', 'Dsn 161', '3', '4', 'Desa 161', 'Kec 161', 'Kota 161', '98857577163', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(259, '1000000164100000', 'IKHSANUDIN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 162', 'Dsn 162', '3', '4', 'Desa 162', 'Kec 162', 'Kota 162', '98857577164', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(260, '1000000165100000', 'ILHAM RAMADAN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 163', 'Dsn 163', '3', '4', 'Desa 163', 'Kec 163', 'Kota 163', '98857577165', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(261, '1000000166100000', 'ILHAM RIDHO AZYUMARDI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 164', 'Dsn 164', '3', '4', 'Desa 164', 'Kec 164', 'Kota 164', '98857577166', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(262, '1000000167100000', 'IMAM NUR ALAM', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 165', 'Dsn 165', '3', '4', 'Desa 165', 'Kec 165', 'Kota 165', '98857577167', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(263, '1000000169100000', 'IMY SYAHROH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 167', 'Dsn 167', '3', '4', 'Desa 167', 'Kec 167', 'Kota 167', '98857577169', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(264, '1000000170100000', 'INTAN NUR AZIZAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 168', 'Dsn 168', '3', '4', 'Desa 168', 'Kec 168', 'Kota 168', '98857577170', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(265, '1000000171100000', 'INTAN PUTRI AMELIA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 169', 'Dsn 169', '3', '4', 'Desa 169', 'Kec 169', 'Kota 169', '98857577171', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(266, '1000000172100000', 'ISA ANGELINA MANURUNG', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 170', 'Dsn 170', '3', '4', 'Desa 170', 'Kec 170', 'Kota 170', '98857577172', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(267, '1000000173100000', 'ITA MUTIANAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 171', 'Dsn 171', '3', '4', 'Desa 171', 'Kec 171', 'Kota 171', '98857577173', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(268, '1000000174100000', 'JAMARA DINDA OKSHELGA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 172', 'Dsn 172', '3', '4', 'Desa 172', 'Kec 172', 'Kota 172', '98857577174', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(269, '1000000175100000', 'JEFRY FRANSZOEL MANURUNG', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 173', 'Dsn 173', '3', '4', 'Desa 173', 'Kec 173', 'Kota 173', '98857577175', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(270, '1000000176100000', 'JEPRI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 174', 'Dsn 174', '3', '4', 'Desa 174', 'Kec 174', 'Kota 174', '98857577176', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith');
INSERT INTO `penduduk` (`id_penduduk`, `nik`, `nama`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `agama`, `jalan`, `dusun`, `rt`, `rw`, `desa`, `kecamatan`, `kota`, `no_kk`, `pend_kk`, `pend_terakhir`, `pend_ditempuh`, `pekerjaan`, `status_perkawinan`, `status_dlm_keluarga`, `kewarganegaraan`, `nama_ayah`, `nama_ibu`) VALUES
(271, '1000000177100000', 'JEPRIYA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 175', 'Dsn 175', '3', '4', 'Desa 175', 'Kec 175', 'Kota 175', '98857577177', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(272, '1000000178100000', 'JERRY FEBRIANSYAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 176', 'Dsn 176', '3', '4', 'Desa 176', 'Kec 176', 'Kota 176', '98857577178', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(273, '1000000179100000', 'JIHANA SYIFA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 177', 'Dsn 177', '3', '4', 'Desa 177', 'Kec 177', 'Kota 177', '98857577179', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(274, '1000000180100000', 'JODY ANDREAS SUDARSO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 178', 'Dsn 178', '3', '4', 'Desa 178', 'Kec 178', 'Kota 178', '98857577180', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(275, '1000000181100000', 'JUARIYAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 179', 'Dsn 179', '3', '4', 'Desa 179', 'Kec 179', 'Kota 179', '98857577181', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(276, '1000000182100000', 'JULEHAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 180', 'Dsn 180', '3', '4', 'Desa 180', 'Kec 180', 'Kota 180', '98857577182', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(277, '1000000183100000', 'JULIAWITA ANDRIENI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 181', 'Dsn 181', '3', '4', 'Desa 181', 'Kec 181', 'Kota 181', '98857577183', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(278, '1000000184100000', 'JUMANI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 182', 'Dsn 182', '3', '4', 'Desa 182', 'Kec 182', 'Kota 182', '98857577184', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(279, '1000000185100000', 'KARTINAYA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 183', 'Dsn 183', '3', '4', 'Desa 183', 'Kec 183', 'Kota 183', '98857577185', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(280, '1000000186100000', 'KENTA PRIGUNA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 184', 'Dsn 184', '3', '4', 'Desa 184', 'Kec 184', 'Kota 184', '98857577186', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(281, '1000000187100000', 'KEVIN WIJAYA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 185', 'Dsn 185', '3', '4', 'Desa 185', 'Kec 185', 'Kota 185', '98857577187', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(282, '1000000188100000', 'KEYLA AULIA RAHMA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 186', 'Dsn 186', '3', '4', 'Desa 186', 'Kec 186', 'Kota 186', '98857577188', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(283, '1000000189100000', 'KEYSA AVRILLIA SAPUTRI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 187', 'Dsn 187', '3', '4', 'Desa 187', 'Kec 187', 'Kota 187', '98857577189', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(284, '1000000190100000', 'KHOIROTUL INAYAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 188', 'Dsn 188', '3', '4', 'Desa 188', 'Kec 188', 'Kota 188', '98857577190', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(285, '1000000191100000', 'KYALA SYAHRAENOOR PUTRI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 189', 'Dsn 189', '3', '4', 'Desa 189', 'Kec 189', 'Kota 189', '98857577191', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(286, '1000000192100000', 'LAELATUN NUFUS', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 190', 'Dsn 190', '3', '4', 'Desa 190', 'Kec 190', 'Kota 190', '98857577192', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(287, '1000000193100000', 'LIA PEMULASARI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 191', 'Dsn 191', '3', '4', 'Desa 191', 'Kec 191', 'Kota 191', '98857577193', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(288, '1000000194100000', 'LINDA YANTI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 192', 'Dsn 192', '3', '4', 'Desa 192', 'Kec 192', 'Kota 192', '98857577194', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(289, '1000000195100000', 'LINDAWATI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 193', 'Dsn 193', '3', '4', 'Desa 193', 'Kec 193', 'Kota 193', '98857577195', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(290, '1000000196100000', 'LUCYANA ROCA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 194', 'Dsn 194', '3', '4', 'Desa 194', 'Kec 194', 'Kota 194', '98857577196', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(291, '1000000197100000', 'M. AFRIYANSYAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 195', 'Dsn 195', '3', '4', 'Desa 195', 'Kec 195', 'Kota 195', '98857577197', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(292, '1000000198100000', 'M. RISNO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 196', 'Dsn 196', '3', '4', 'Desa 196', 'Kec 196', 'Kota 196', '98857577198', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(293, '1000000199100000', 'M. WILDAN AL-GHOFARI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 197', 'Dsn 197', '3', '4', 'Desa 197', 'Kec 197', 'Kota 197', '98857577199', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(294, '1000000200100000', 'MAHMUDI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 198', 'Dsn 198', '3', '4', 'Desa 198', 'Kec 198', 'Kota 198', '98857577200', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(295, '1000000201100000', 'MAHMUDI. B', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 199', 'Dsn 199', '3', '4', 'Desa 199', 'Kec 199', 'Kota 199', '98857577201', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(296, '1000000202100000', 'MARDIYAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 200', 'Dsn 200', '3', '4', 'Desa 200', 'Kec 200', 'Kota 200', '98857577202', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(297, '1000000203100000', 'MARIA ROSLIANA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 201', 'Dsn 201', '3', '4', 'Desa 201', 'Kec 201', 'Kota 201', '98857577203', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(298, '1000000204100000', 'MASLIAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 202', 'Dsn 202', '3', '4', 'Desa 202', 'Kec 202', 'Kota 202', '98857577204', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(299, '1000000205100000', 'MAULANA KHALIS AZZAHRAN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 203', 'Dsn 203', '3', '4', 'Desa 203', 'Kec 203', 'Kota 203', '98857577205', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(300, '1000000206100000', 'MAULANA KHALISH AZZAKY', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 204', 'Dsn 204', '3', '4', 'Desa 204', 'Kec 204', 'Kota 204', '98857577206', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(301, '1000000207100000', 'MEIDINA HIDAYATI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 205', 'Dsn 205', '3', '4', 'Desa 205', 'Kec 205', 'Kota 205', '98857577207', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(302, '1000000208100000', 'MELI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 206', 'Dsn 206', '3', '4', 'Desa 206', 'Kec 206', 'Kota 206', '98857577208', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(303, '1000000209100000', 'MHD. HAMZAH QOSEM', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 207', 'Dsn 207', '3', '4', 'Desa 207', 'Kec 207', 'Kota 207', '98857577209', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(304, '1000000210100000', 'MISFALAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 208', 'Dsn 208', '3', '4', 'Desa 208', 'Kec 208', 'Kota 208', '98857577210', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(305, '1000000211100000', 'MISRIAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 209', 'Dsn 209', '3', '4', 'Desa 209', 'Kec 209', 'Kota 209', '98857577211', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(306, '1000000212100000', 'MOCHAMAD ROMI ASSIDIK', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 210', 'Dsn 210', '3', '4', 'Desa 210', 'Kec 210', 'Kota 210', '98857577212', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(307, '1000000213100000', 'MOHAMAD ILHAM', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 211', 'Dsn 211', '3', '4', 'Desa 211', 'Kec 211', 'Kota 211', '98857577213', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(308, '1000000214100000', 'MOHAMMAD SADDAM', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 212', 'Dsn 212', '3', '4', 'Desa 212', 'Kec 212', 'Kota 212', '98857577214', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(309, '1000000215100000', 'MUH. KHASBIYANTO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 213', 'Dsn 213', '3', '4', 'Desa 213', 'Kec 213', 'Kota 213', '98857577215', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(310, '1000000216100000', 'MUHAMAD ADAM SURYA KELANA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 214', 'Dsn 214', '3', '4', 'Desa 214', 'Kec 214', 'Kota 214', '98857577216', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(311, '1000000217100000', 'MUHAMAD ALIF FAISAL PRATAMA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 215', 'Dsn 215', '3', '4', 'Desa 215', 'Kec 215', 'Kota 215', '98857577217', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(312, '1000000218100000', 'MUHAMAD DAFA ADITYA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 216', 'Dsn 216', '3', '4', 'Desa 216', 'Kec 216', 'Kota 216', '98857577218', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(313, '1000000219100000', 'MUHAMAD FAKAR DZIKRI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 217', 'Dsn 217', '3', '4', 'Desa 217', 'Kec 217', 'Kota 217', '98857577219', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(314, '1000000220100000', 'MUHAMAD HERI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 218', 'Dsn 218', '3', '4', 'Desa 218', 'Kec 218', 'Kota 218', '98857577220', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(315, '1000000221100000', 'MUHAMAD IBNURAHMAN RAMADHAN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 219', 'Dsn 219', '3', '4', 'Desa 219', 'Kec 219', 'Kota 219', '98857577221', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(316, '1000000222100000', 'MUHAMAD SHENDY NURUL FITRAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 220', 'Dsn 220', '3', '4', 'Desa 220', 'Kec 220', 'Kota 220', '98857577222', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(317, '1000000223100000', 'MUHAMMAD ALIF SYAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 221', 'Dsn 221', '3', '4', 'Desa 221', 'Kec 221', 'Kota 221', '98857577223', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(318, '1000000224100000', 'MUHAMMAD FADHIL HANIF', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 222', 'Dsn 222', '3', '4', 'Desa 222', 'Kec 222', 'Kota 222', '98857577224', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(319, '1000000225100000', 'MUHAMMAD FADLI HASAN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 223', 'Dsn 223', '3', '4', 'Desa 223', 'Kec 223', 'Kota 223', '98857577225', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(320, '1000000226100000', 'MUHAMMAD FAZRI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 224', 'Dsn 224', '3', '4', 'Desa 224', 'Kec 224', 'Kota 224', '98857577226', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(321, '1000000227100000', 'MUHAMMAD FAZRIANSYAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 225', 'Dsn 225', '3', '4', 'Desa 225', 'Kec 225', 'Kota 225', '98857577227', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(322, '1000000228100000', 'MUHAMMAD HAIKAL KAMAL', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 226', 'Dsn 226', '3', '4', 'Desa 226', 'Kec 226', 'Kota 226', '98857577228', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(323, '1000000229100000', 'MUHAMMAD IKBAR RIZALUL ASLAM', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 227', 'Dsn 227', '3', '4', 'Desa 227', 'Kec 227', 'Kota 227', '98857577229', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(324, '1000000230100000', 'MUHAMMAD ILHAM AR RAFII', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 228', 'Dsn 228', '3', '4', 'Desa 228', 'Kec 228', 'Kota 228', '98857577230', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(325, '1000000231100000', 'MUHAMMAD ILMANUAFI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 229', 'Dsn 229', '3', '4', 'Desa 229', 'Kec 229', 'Kota 229', '98857577231', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(326, '1000000232100000', 'MUHAMMAD IQBAL ALDIANSYAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 230', 'Dsn 230', '3', '4', 'Desa 230', 'Kec 230', 'Kota 230', '98857577232', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(327, '1000000233100000', 'MUHAMMAD MAULANA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 231', 'Dsn 231', '3', '4', 'Desa 231', 'Kec 231', 'Kota 231', '98857577233', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(328, '1000000234100000', 'MUHAMMAD NAWAWI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 232', 'Dsn 232', '3', '4', 'Desa 232', 'Kec 232', 'Kota 232', '98857577234', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(329, '1000000235100000', 'MUHAMMAD NUR ROSID', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 233', 'Dsn 233', '3', '4', 'Desa 233', 'Kec 233', 'Kota 233', '98857577235', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(330, '1000000236100000', 'MUHAMMAD RAFIF FAUZAN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 234', 'Dsn 234', '3', '4', 'Desa 234', 'Kec 234', 'Kota 234', '98857577236', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(331, '1000000237100000', 'MUHAMMAD RAFLI ARIYANTO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 235', 'Dsn 235', '3', '4', 'Desa 235', 'Kec 235', 'Kota 235', '98857577237', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(332, '1000000238100000', 'MUHAMMAD RAIHAN KENY', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 236', 'Dsn 236', '3', '4', 'Desa 236', 'Kec 236', 'Kota 236', '98857577238', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(333, '1000000239100000', 'MUHAMMAD RIZKY ARDANA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 237', 'Dsn 237', '3', '4', 'Desa 237', 'Kec 237', 'Kota 237', '98857577239', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(334, '1000000240100000', 'MUHAMMAD SYARIF HIDAYATULLOH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 238', 'Dsn 238', '3', '4', 'Desa 238', 'Kec 238', 'Kota 238', '98857577240', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(335, '1000000241100000', 'MUHAMMAD VERREL AURIELLY', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 239', 'Dsn 239', '3', '4', 'Desa 239', 'Kec 239', 'Kota 239', '98857577241', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(336, '1000000242100000', 'MUHAMMAD ZAKIH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 240', 'Dsn 240', '3', '4', 'Desa 240', 'Kec 240', 'Kota 240', '98857577242', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(337, '1000000243100000', 'MUHIBIN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 241', 'Dsn 241', '3', '4', 'Desa 241', 'Kec 241', 'Kota 241', '98857577243', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(338, '1000000244100000', 'MUNIARTI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 242', 'Dsn 242', '3', '4', 'Desa 242', 'Kec 242', 'Kota 242', '98857577244', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(339, '1000000245100000', 'MUSFIROH HAMIDAH SETIADI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 243', 'Dsn 243', '3', '4', 'Desa 243', 'Kec 243', 'Kota 243', '98857577245', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(340, '1000000246100000', 'MUSLIKAN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 244', 'Dsn 244', '3', '4', 'Desa 244', 'Kec 244', 'Kota 244', '98857577246', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(341, '1000000247100000', 'MUSOFAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 245', 'Dsn 245', '3', '4', 'Desa 245', 'Kec 245', 'Kota 245', '98857577247', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(342, '1000000248100000', 'MUSTANIROH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 246', 'Dsn 246', '3', '4', 'Desa 246', 'Kec 246', 'Kota 246', '98857577248', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(343, '1000000249100000', 'MUZAKIL ALA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 247', 'Dsn 247', '3', '4', 'Desa 247', 'Kec 247', 'Kota 247', '98857577249', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(344, '1000000250100000', 'NABIL YASSAAR', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 248', 'Dsn 248', '3', '4', 'Desa 248', 'Kec 248', 'Kota 248', '98857577250', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(345, '1000000251100000', 'NABILAH INTAN YULIANI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 249', 'Dsn 249', '3', '4', 'Desa 249', 'Kec 249', 'Kota 249', '98857577251', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(346, '1000000252100000', 'NADRAH ADINDA ZAHIRAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 250', 'Dsn 250', '3', '4', 'Desa 250', 'Kec 250', 'Kota 250', '98857577252', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(347, '1000000253100000', 'NADYA INTAN KARTIKA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 251', 'Dsn 251', '3', '4', 'Desa 251', 'Kec 251', 'Kota 251', '98857577253', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(348, '1000000254100000', 'NAFIAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 252', 'Dsn 252', '3', '4', 'Desa 252', 'Kec 252', 'Kota 252', '98857577254', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(349, '1000000255100000', 'NAGITA TRIYANI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 253', 'Dsn 253', '3', '4', 'Desa 253', 'Kec 253', 'Kota 253', '98857577255', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(350, '1000000256100000', 'NAHDA ROSIKHO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 254', 'Dsn 254', '3', '4', 'Desa 254', 'Kec 254', 'Kota 254', '98857577256', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(351, '1000000257100000', 'NAHDIYAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 255', 'Dsn 255', '3', '4', 'Desa 255', 'Kec 255', 'Kota 255', '98857577257', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(352, '1000000258100000', 'NATAYA LIANDRA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 256', 'Dsn 256', '3', '4', 'Desa 256', 'Kec 256', 'Kota 256', '98857577258', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(353, '1000000259100000', 'NAUFAILA SALSABILA FIRDAUSI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 257', 'Dsn 257', '3', '4', 'Desa 257', 'Kec 257', 'Kota 257', '98857577259', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(354, '1000000260100000', 'NAZWA SABINA PUTRI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 258', 'Dsn 258', '3', '4', 'Desa 258', 'Kec 258', 'Kota 258', '98857577260', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(355, '1000000261100000', 'NELSON PANDIANGAN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 259', 'Dsn 259', '3', '4', 'Desa 259', 'Kec 259', 'Kota 259', '98857577261', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(356, '1000000262100000', 'NIKE YULYANI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 260', 'Dsn 260', '3', '4', 'Desa 260', 'Kec 260', 'Kota 260', '98857577262', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(357, '1000000263100000', 'NNENG NURRACHMI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 261', 'Dsn 261', '3', '4', 'Desa 261', 'Kec 261', 'Kota 261', '98857577263', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(358, '1000000264100000', 'NOVIA ASTA RINARDI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 262', 'Dsn 262', '3', '4', 'Desa 262', 'Kec 262', 'Kota 262', '98857577264', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(359, '1000000265100000', 'NOVIN ISRA HERDIAN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 263', 'Dsn 263', '3', '4', 'Desa 263', 'Kec 263', 'Kota 263', '98857577265', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(360, '1000000266100000', 'NUR AINI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 264', 'Dsn 264', '3', '4', 'Desa 264', 'Kec 264', 'Kota 264', '98857577266', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(361, '1000000267100000', 'NUR ANISA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 265', 'Dsn 265', '3', '4', 'Desa 265', 'Kec 265', 'Kota 265', '98857577267', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(362, '1000000268100000', 'NUR AZIZAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 266', 'Dsn 266', '3', '4', 'Desa 266', 'Kec 266', 'Kota 266', '98857577268', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(363, '1000000269100000', 'NUR IMAM MAHDIYANTO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 267', 'Dsn 267', '3', '4', 'Desa 267', 'Kec 267', 'Kota 267', '98857577269', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(364, '1000000270100000', 'NURATIAH MAULI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 268', 'Dsn 268', '3', '4', 'Desa 268', 'Kec 268', 'Kota 268', '98857577270', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(365, '1000000271100000', 'NURHASANAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 269', 'Dsn 269', '3', '4', 'Desa 269', 'Kec 269', 'Kota 269', '98857577271', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(366, '1000000272100000', 'NURJANAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 270', 'Dsn 270', '3', '4', 'Desa 270', 'Kec 270', 'Kota 270', '98857577272', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(367, '1000000273100000', 'NURLELA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 271', 'Dsn 271', '3', '4', 'Desa 271', 'Kec 271', 'Kota 271', '98857577273', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(368, '1000000274100000', 'NURUL SALSABILA PUTRI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 272', 'Dsn 272', '3', '4', 'Desa 272', 'Kec 272', 'Kota 272', '98857577274', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(369, '1000000275100000', 'NUZULIA RAHMAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 273', 'Dsn 273', '3', '4', 'Desa 273', 'Kec 273', 'Kota 273', '98857577275', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(370, '1000000276100000', 'PAULA DAPRILIA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 274', 'Dsn 274', '3', '4', 'Desa 274', 'Kec 274', 'Kota 274', '98857577276', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(371, '1000000277100000', 'PUAN SURI GADING', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 275', 'Dsn 275', '3', '4', 'Desa 275', 'Kec 275', 'Kota 275', '98857577277', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(372, '1000000278100000', 'PUPUT MEYLINA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 276', 'Dsn 276', '3', '4', 'Desa 276', 'Kec 276', 'Kota 276', '98857577278', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(373, '1000000279100000', 'PURWONO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 277', 'Dsn 277', '3', '4', 'Desa 277', 'Kec 277', 'Kota 277', '98857577279', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(374, '1000000280100000', 'PUTRI WIDAD SALSABILA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 278', 'Dsn 278', '3', '4', 'Desa 278', 'Kec 278', 'Kota 278', '98857577280', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(375, '1000000281100000', 'PUTU VIJRI FELIX RICARDO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 279', 'Dsn 279', '3', '4', 'Desa 279', 'Kec 279', 'Kota 279', '98857577281', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(376, '1000000282100000', 'RACHMA APRIYANI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 280', 'Dsn 280', '3', '4', 'Desa 280', 'Kec 280', 'Kota 280', '98857577282', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(377, '1000000283100000', 'RAFI ARIEL ASATHIN DAULAY', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 281', 'Dsn 281', '3', '4', 'Desa 281', 'Kec 281', 'Kota 281', '98857577283', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(378, '1000000284100000', 'RAFLI FIRDAUS', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 282', 'Dsn 282', '3', '4', 'Desa 282', 'Kec 282', 'Kota 282', '98857577284', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(379, '1000000285100000', 'RAGA GAGAH WICAKSONO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 283', 'Dsn 283', '3', '4', 'Desa 283', 'Kec 283', 'Kota 283', '98857577285', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(380, '1000000286100000', 'RASTIAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 284', 'Dsn 284', '3', '4', 'Desa 284', 'Kec 284', 'Kota 284', '98857577286', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(381, '1000000287100000', 'RATIH KURNIASARI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 285', 'Dsn 285', '3', '4', 'Desa 285', 'Kec 285', 'Kota 285', '98857577287', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(382, '1000000288100000', 'REAGAN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 286', 'Dsn 286', '3', '4', 'Desa 286', 'Kec 286', 'Kota 286', '98857577288', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(383, '1000000289100000', 'REAGAN RESADITA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 287', 'Dsn 287', '3', '4', 'Desa 287', 'Kec 287', 'Kota 287', '98857577289', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(384, '1000000290100000', 'RENITA DWI ANDINIYANTI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 288', 'Dsn 288', '3', '4', 'Desa 288', 'Kec 288', 'Kota 288', '98857577290', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(385, '1000000291100000', 'REZA ACHMAD DENDIYANTO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 289', 'Dsn 289', '3', '4', 'Desa 289', 'Kec 289', 'Kota 289', '98857577291', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(386, '1000000292100000', 'REZA FAJAR RIEZKY', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 290', 'Dsn 290', '3', '4', 'Desa 290', 'Kec 290', 'Kota 290', '98857577292', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(387, '1000000293100000', 'RIA KURAESIN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 291', 'Dsn 291', '3', '4', 'Desa 291', 'Kec 291', 'Kota 291', '98857577293', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(388, '1000000294100000', 'RIAH JUARIAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 292', 'Dsn 292', '3', '4', 'Desa 292', 'Kec 292', 'Kota 292', '98857577294', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(389, '1000000295100000', 'RINA KARUNIA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 293', 'Dsn 293', '3', '4', 'Desa 293', 'Kec 293', 'Kota 293', '98857577295', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(390, '1000000296100000', 'RINA MULYANTI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 294', 'Dsn 294', '3', '4', 'Desa 294', 'Kec 294', 'Kota 294', '98857577296', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(391, '1000000297100000', 'RISKA CERRY AISYA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 295', 'Dsn 295', '3', '4', 'Desa 295', 'Kec 295', 'Kota 295', '98857577297', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(392, '1000000298100000', 'RISKA NANDA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 296', 'Dsn 296', '3', '4', 'Desa 296', 'Kec 296', 'Kota 296', '98857577298', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(393, '1000000299100000', 'RIYAS ROSID', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 297', 'Dsn 297', '3', '4', 'Desa 297', 'Kec 297', 'Kota 297', '98857577299', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(394, '1000000300100000', 'RIZA SALSABILA WIJAYA PUTRI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 298', 'Dsn 298', '3', '4', 'Desa 298', 'Kec 298', 'Kota 298', '98857577300', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(395, '1000000301100000', 'RIZKI AGUSTIAWAN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 299', 'Dsn 299', '3', '4', 'Desa 299', 'Kec 299', 'Kota 299', '98857577301', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(396, '1000000302100000', 'RIZKI ALFAN FAWAIT', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 300', 'Dsn 300', '3', '4', 'Desa 300', 'Kec 300', 'Kota 300', '98857577302', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(397, '1000000303100000', 'RIZKI ROMADHON', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 301', 'Dsn 301', '3', '4', 'Desa 301', 'Kec 301', 'Kota 301', '98857577303', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(398, '1000000304100000', 'RIZKY NUGROHO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 302', 'Dsn 302', '3', '4', 'Desa 302', 'Kec 302', 'Kota 302', '98857577304', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(399, '1000000305100000', 'ROBBY MAULANA YUSUF', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 303', 'Dsn 303', '3', '4', 'Desa 303', 'Kec 303', 'Kota 303', '98857577305', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(400, '1000000306100000', 'ROBI ILAHI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 304', 'Dsn 304', '3', '4', 'Desa 304', 'Kec 304', 'Kota 304', '98857577306', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(401, '1000000307100000', 'ROISULLAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 305', 'Dsn 305', '3', '4', 'Desa 305', 'Kec 305', 'Kota 305', '98857577307', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(402, '1000000308100000', 'ROSIDAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 306', 'Dsn 306', '3', '4', 'Desa 306', 'Kec 306', 'Kota 306', '98857577308', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(403, '1000000309100000', 'RUSLANDI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 307', 'Dsn 307', '3', '4', 'Desa 307', 'Kec 307', 'Kota 307', '98857577309', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(404, '1000000310100000', 'SAFIRA DEWI MAHARANI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 308', 'Dsn 308', '3', '4', 'Desa 308', 'Kec 308', 'Kota 308', '98857577310', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(405, '1000000311100000', 'SAFITRI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 309', 'Dsn 309', '3', '4', 'Desa 309', 'Kec 309', 'Kota 309', '98857577311', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(406, '1000000312100000', 'SAHRI NURALAMSYAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 310', 'Dsn 310', '3', '4', 'Desa 310', 'Kec 310', 'Kota 310', '98857577312', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(407, '1000000313100000', 'SALMA SABRINA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 311', 'Dsn 311', '3', '4', 'Desa 311', 'Kec 311', 'Kota 311', '98857577313', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(408, '1000000314100000', 'SALWA IZMI SALBILAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 312', 'Dsn 312', '3', '4', 'Desa 312', 'Kec 312', 'Kota 312', '98857577314', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(409, '1000000315100000', 'SAMSUDIN MALIK', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 313', 'Dsn 313', '3', '4', 'Desa 313', 'Kec 313', 'Kota 313', '98857577315', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(410, '1000000316100000', 'SANAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 314', 'Dsn 314', '3', '4', 'Desa 314', 'Kec 314', 'Kota 314', '98857577316', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(411, '1000000317100000', 'SARINAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 315', 'Dsn 315', '3', '4', 'Desa 315', 'Kec 315', 'Kota 315', '98857577317', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(412, '1000000318100000', 'SARNITI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 316', 'Dsn 316', '3', '4', 'Desa 316', 'Kec 316', 'Kota 316', '98857577318', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(413, '1000000319100000', 'SATRIA AKBAR PUTRA NUGROHO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 317', 'Dsn 317', '3', '4', 'Desa 317', 'Kec 317', 'Kota 317', '98857577319', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(414, '1000000320100000', 'SATRIA TITIS TIN ARIFIN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 318', 'Dsn 318', '3', '4', 'Desa 318', 'Kec 318', 'Kota 318', '98857577320', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(415, '1000000321100000', 'SAVIRA KHAERUNNISA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 319', 'Dsn 319', '3', '4', 'Desa 319', 'Kec 319', 'Kota 319', '98857577321', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(416, '1000000322100000', 'SAWAL RIYANTO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 320', 'Dsn 320', '3', '4', 'Desa 320', 'Kec 320', 'Kota 320', '98857577322', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(417, '1000000323100000', 'SEKAR AJENG WULANDARI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 321', 'Dsn 321', '3', '4', 'Desa 321', 'Kec 321', 'Kota 321', '98857577323', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(418, '1000000324100000', 'SENNO ADI PRAKOSO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 322', 'Dsn 322', '3', '4', 'Desa 322', 'Kec 322', 'Kota 322', '98857577324', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(419, '1000000325100000', 'SESTRI OKTAVIANI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 323', 'Dsn 323', '3', '4', 'Desa 323', 'Kec 323', 'Kota 323', '98857577325', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(420, '1000000326100000', 'SETIAWAN WIDYANTO KUSUMAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 324', 'Dsn 324', '3', '4', 'Desa 324', 'Kec 324', 'Kota 324', '98857577326', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(421, '1000000327100000', 'SHELINA NURIYANISA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 325', 'Dsn 325', '3', '4', 'Desa 325', 'Kec 325', 'Kota 325', '98857577327', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(422, '1000000328100000', 'SHERLYTTA ANANOVA', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 326', 'Dsn 326', '3', '4', 'Desa 326', 'Kec 326', 'Kota 326', '98857577328', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(423, '1000000329100000', 'SHILLA AULIA SUHANDI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 327', 'Dsn 327', '3', '4', 'Desa 327', 'Kec 327', 'Kota 327', '98857577329', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(424, '1000000330100000', 'SHOLIHATIN NASIHAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 328', 'Dsn 328', '3', '4', 'Desa 328', 'Kec 328', 'Kota 328', '98857577330', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(425, '1000000331100000', 'SIDDIQ HIBATULLOH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 329', 'Dsn 329', '3', '4', 'Desa 329', 'Kec 329', 'Kota 329', '98857577331', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(426, '1000000332100000', 'SITI ADIRA OCTAVIANI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 330', 'Dsn 330', '3', '4', 'Desa 330', 'Kec 330', 'Kota 330', '98857577332', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(427, '1000000333100000', 'SOLECHAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 331', 'Dsn 331', '3', '4', 'Desa 331', 'Kec 331', 'Kota 331', '98857577333', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(428, '1000000334100000', 'SRI MULYA ASIH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 332', 'Dsn 332', '3', '4', 'Desa 332', 'Kec 332', 'Kota 332', '98857577334', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(429, '1000000335100000', 'SRI TIWI PURNAMAWATI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 333', 'Dsn 333', '3', '4', 'Desa 333', 'Kec 333', 'Kota 333', '98857577335', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(430, '1000000336100000', 'SUFYAN ABDUL LATHIF', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 334', 'Dsn 334', '3', '4', 'Desa 334', 'Kec 334', 'Kota 334', '98857577336', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(431, '1000000337100000', 'SUGENG HARIYANTO', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 335', 'Dsn 335', '3', '4', 'Desa 335', 'Kec 335', 'Kota 335', '98857577337', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(432, '1000000338100000', 'SUKRON', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 336', 'Dsn 336', '3', '4', 'Desa 336', 'Kec 336', 'Kota 336', '98857577338', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(433, '1000000339100000', 'SULEHAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 337', 'Dsn 337', '3', '4', 'Desa 337', 'Kec 337', 'Kota 337', '98857577339', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(434, '1000000340100000', 'SUMEDI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 338', 'Dsn 338', '3', '4', 'Desa 338', 'Kec 338', 'Kota 338', '98857577340', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(435, '1000000341100000', 'SUMO SUHERMAN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 339', 'Dsn 339', '3', '4', 'Desa 339', 'Kec 339', 'Kota 339', '98857577341', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(436, '1000000342100000', 'SURATMI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 340', 'Dsn 340', '3', '4', 'Desa 340', 'Kec 340', 'Kota 340', '98857577342', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(437, '1000000343100000', 'SURATMIN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 341', 'Dsn 341', '3', '4', 'Desa 341', 'Kec 341', 'Kota 341', '98857577343', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(438, '1000000344100000', 'SUSILAWATI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 342', 'Dsn 342', '3', '4', 'Desa 342', 'Kec 342', 'Kota 342', '98857577344', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(439, '1000000345100000', 'SUSILAWATI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 343', 'Dsn 343', '3', '4', 'Desa 343', 'Kec 343', 'Kota 343', '98857577345', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(440, '1000000346100000', 'SYAMSUL BAHAR JAUHAR SYAH', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 344', 'Dsn 344', '3', '4', 'Desa 344', 'Kec 344', 'Kota 344', '98857577346', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(441, '1000000347100000', 'TAMRIN', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 345', 'Dsn 345', '3', '4', 'Desa 345', 'Kec 345', 'Kota 345', '98857577347', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(442, '1000000348100000', 'TANTI NOVIANTI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 346', 'Dsn 346', '3', '4', 'Desa 346', 'Kec 346', 'Kota 346', '98857577348', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith');
INSERT INTO `penduduk` (`id_penduduk`, `nik`, `nama`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `agama`, `jalan`, `dusun`, `rt`, `rw`, `desa`, `kecamatan`, `kota`, `no_kk`, `pend_kk`, `pend_terakhir`, `pend_ditempuh`, `pekerjaan`, `status_perkawinan`, `status_dlm_keluarga`, `kewarganegaraan`, `nama_ayah`, `nama_ibu`) VALUES
(443, '1000000349100000', 'TB. DIDI SUKRIADI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 347', 'Dsn 347', '3', '4', 'Desa 347', 'Kec 347', 'Kota 347', '98857577349', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(444, '1000000350100000', 'TEGAR PRIYADI', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 348', 'Dsn 348', '3', '4', 'Desa 348', 'Kec 348', 'Kota 348', '98857577350', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith'),
(445, '1000000351100000', 'TENTREM', 'Surabaya', '0000-00-00', 'Perempuan', 'Kristen', 'Jl. Raya 349', 'Dsn 349', '3', '4', 'Desa 349', 'Kec 349', 'Kota 349', '98857577351', 'SMP', 'SMA', 'SMA', 'Dokter', 'Belum Menikah', 'Anggota Keluarga', 'Indon', 'David Smith', 'Sarah Smith');

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
(1, 'menturus', 'jl. moestopo no. 05', '082330827777', 'kudu', 'kabupaten jombang', 'jawa timur', '61454');

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_keterangan`
--

CREATE TABLE `surat_keterangan` (
  `id_sk` int(11) NOT NULL,
  `jenis_surat` varchar(50) NOT NULL,
  `no_surat` varchar(20) DEFAULT NULL,
  `nik` varchar(20) NOT NULL,
  `keperluan` varchar(50) NOT NULL,
  `tanggal_surat` datetime NOT NULL DEFAULT current_timestamp(),
  `id_pejabat_desa` int(11) DEFAULT NULL,
  `status_surat` varchar(15) NOT NULL,
  `id_profil_desa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `surat_keterangan`
--

INSERT INTO `surat_keterangan` (`id_sk`, `jenis_surat`, `no_surat`, `nik`, `keperluan`, `tanggal_surat`, `id_pejabat_desa`, `status_surat`, `id_profil_desa`) VALUES
(140, 'Surat Keterangan', '010/SKT/X/2023', '1000000001100000', 'Surat keterangan', '2023-10-21 15:55:45', 1, 'SELESAI', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_keterangan_berkelakuan_baik`
--

CREATE TABLE `surat_keterangan_berkelakuan_baik` (
  `id_skbb` int(11) NOT NULL,
  `jenis_surat` varchar(50) NOT NULL,
  `no_surat` varchar(20) DEFAULT NULL,
  `nik` varchar(20) NOT NULL,
  `keperluan` varchar(50) NOT NULL,
  `tanggal_surat` datetime NOT NULL DEFAULT current_timestamp(),
  `id_pejabat_desa` int(11) DEFAULT NULL,
  `status_surat` varchar(15) NOT NULL,
  `id_profil_desa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `surat_keterangan_berkelakuan_baik`
--

INSERT INTO `surat_keterangan_berkelakuan_baik` (`id_skbb`, `jenis_surat`, `no_surat`, `nik`, `keperluan`, `tanggal_surat`, `id_pejabat_desa`, `status_surat`, `id_profil_desa`) VALUES
(9, 'Surat Keterangan Berkelakuan Baik', '0001/SRKB/X/2023', '1000000002100000', 'SURAT KETERANGAN BERKELAKUAN BAIK', '2023-10-21 15:57:12', 2, 'SELESAI', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_keterangan_domisili`
--

CREATE TABLE `surat_keterangan_domisili` (
  `id_skd` int(11) NOT NULL,
  `jenis_surat` varchar(50) NOT NULL,
  `no_surat` varchar(20) DEFAULT NULL,
  `nik` varchar(20) NOT NULL,
  `tanggal_surat` datetime NOT NULL DEFAULT current_timestamp(),
  `id_pejabat_desa` int(11) DEFAULT NULL,
  `status_surat` varchar(15) NOT NULL,
  `id_profil_desa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `surat_keterangan_domisili`
--

INSERT INTO `surat_keterangan_domisili` (`id_skd`, `jenis_surat`, `no_surat`, `nik`, `tanggal_surat`, `id_pejabat_desa`, `status_surat`, `id_profil_desa`) VALUES
(9, 'Surat Keterangan Domisili', '001/SKD/X/2023', '1000000038100000', '2023-10-21 15:59:02', 1, 'SELESAI', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_keterangan_kepemilikan_kendaraan_bermotor`
--

CREATE TABLE `surat_keterangan_kepemilikan_kendaraan_bermotor` (
  `id_skkkb` int(11) NOT NULL,
  `jenis_surat` varchar(50) NOT NULL,
  `no_surat` varchar(20) DEFAULT NULL,
  `nik` varchar(20) NOT NULL,
  `roda` varchar(20) NOT NULL,
  `merk_type` varchar(30) DEFAULT NULL,
  `jenis_model` varchar(30) DEFAULT NULL,
  `tahun_pembuatan` varchar(30) DEFAULT NULL,
  `cc` varchar(30) DEFAULT NULL,
  `warna_cat` varchar(30) NOT NULL,
  `no_rangka` varchar(30) NOT NULL,
  `no_mesin` varchar(30) NOT NULL,
  `no_polisi` varchar(30) NOT NULL,
  `no_bpkb` varchar(30) NOT NULL,
  `atas_nama_pemilik` varchar(30) NOT NULL,
  `alamat_pemilik` varchar(200) NOT NULL,
  `keperluan` varchar(50) NOT NULL,
  `tanggal_surat` datetime NOT NULL DEFAULT current_timestamp(),
  `id_pejabat_desa` int(11) DEFAULT NULL,
  `status_surat` varchar(15) NOT NULL,
  `id_profil_desa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `surat_keterangan_kepemilikan_kendaraan_bermotor`
--

INSERT INTO `surat_keterangan_kepemilikan_kendaraan_bermotor` (`id_skkkb`, `jenis_surat`, `no_surat`, `nik`, `roda`, `merk_type`, `jenis_model`, `tahun_pembuatan`, `cc`, `warna_cat`, `no_rangka`, `no_mesin`, `no_polisi`, `no_bpkb`, `atas_nama_pemilik`, `alamat_pemilik`, `keperluan`, `tanggal_surat`, `id_pejabat_desa`, `status_surat`, `id_profil_desa`) VALUES
(6, 'Surat Keterangan Kepemilikan Kendaraan Bermotor', '0001/SKKKB/X/2023', '1000000015100000', '', 'HONDA', 'SEDAN', '1945', '1200', 'ORANGE', '3434334343', '34234324', 'A 4444 BB', '3534545', 'MUCHAMMAD NURHUSAENI', 'JL. RAYA NO 01', 'SURAT KETERANGAN KEPEMILIKAN KENDARAAN BERMOTOR', '2023-10-21 16:01:16', 1, 'SELESAI', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_keterangan_perhiasan`
--

CREATE TABLE `surat_keterangan_perhiasan` (
  `id_skp` int(11) NOT NULL,
  `jenis_surat` varchar(50) NOT NULL,
  `no_surat` varchar(20) DEFAULT NULL,
  `nik` varchar(20) NOT NULL,
  `jenis_perhiasan` varchar(20) NOT NULL,
  `nama_perhiasan` varchar(50) NOT NULL,
  `berat` varchar(5) NOT NULL,
  `toko_perhiasan` varchar(50) NOT NULL,
  `lokasi_toko_perhiasan` varchar(50) NOT NULL,
  `keperluan` varchar(50) NOT NULL,
  `tanggal_surat` datetime NOT NULL DEFAULT current_timestamp(),
  `id_pejabat_desa` int(11) DEFAULT NULL,
  `status_surat` varchar(15) NOT NULL,
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
  `usaha` varchar(30) DEFAULT NULL,
  `alamat_usaha` varchar(200) NOT NULL,
  `keperluan` varchar(50) NOT NULL,
  `tanggal_surat` datetime NOT NULL DEFAULT current_timestamp(),
  `id_pejabat_desa` int(11) DEFAULT NULL,
  `status_surat` varchar(15) NOT NULL,
  `id_profil_desa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_lapor_hajatan`
--

CREATE TABLE `surat_lapor_hajatan` (
  `id_slh` int(11) NOT NULL,
  `jenis_surat` varchar(50) NOT NULL,
  `no_surat` varchar(20) DEFAULT NULL,
  `nik` varchar(20) NOT NULL,
  `bukti_ktp` varchar(30) DEFAULT NULL,
  `bukti_kk` varchar(30) DEFAULT NULL,
  `jenis_hajat` varchar(30) NOT NULL,
  `hari` varchar(20) NOT NULL,
  `tanggal` datetime NOT NULL,
  `jenis_hiburan` varchar(50) NOT NULL,
  `pemilik` varchar(30) NOT NULL,
  `alamat_pemilik` varchar(200) NOT NULL,
  `tanggal_surat` datetime NOT NULL DEFAULT current_timestamp(),
  `id_pejabat_desa` int(11) DEFAULT NULL,
  `status_surat` varchar(15) NOT NULL,
  `id_profil_desa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_pengantar_skck`
--

CREATE TABLE `surat_pengantar_skck` (
  `id_sps` int(11) NOT NULL,
  `jenis_surat` varchar(50) NOT NULL,
  `no_surat` varchar(20) DEFAULT NULL,
  `nik` varchar(20) NOT NULL,
  `bukti_ktp` varchar(30) DEFAULT NULL,
  `bukti_kk` varchar(30) DEFAULT NULL,
  `keperluan` varchar(50) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `masa_berlaku` varchar(20) DEFAULT NULL,
  `tanggal_surat` datetime DEFAULT current_timestamp(),
  `id_pejabat_desa` int(11) DEFAULT NULL,
  `status_surat` varchar(15) NOT NULL,
  `id_profil_desa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `surat_pengantar_skck`
--

INSERT INTO `surat_pengantar_skck` (`id_sps`, `jenis_surat`, `no_surat`, `nik`, `bukti_ktp`, `bukti_kk`, `keperluan`, `keterangan`, `masa_berlaku`, `tanggal_surat`, `id_pejabat_desa`, `status_surat`, `id_profil_desa`) VALUES
(6, 'Surat Pengantar SKCK', '0001/SKCK/X/2023', '1000000351100000', '1000000351100000', '1000000351100001', 'Permohonan SKCK', 'LAMAR PEKERJAAN', '3 Hari', '2023-10-21 16:03:05', 1, 'SELESAI', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dusun`
--
ALTER TABLE `dusun`
  ADD PRIMARY KEY (`id_dusun`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

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
-- Indeks untuk tabel `surat_keterangan_berkelakuan_baik`
--
ALTER TABLE `surat_keterangan_berkelakuan_baik`
  ADD PRIMARY KEY (`id_skbb`),
  ADD KEY `idx_id_pejabat_desa` (`id_pejabat_desa`),
  ADD KEY `idx_nik` (`nik`),
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
-- Indeks untuk tabel `surat_keterangan_kepemilikan_kendaraan_bermotor`
--
ALTER TABLE `surat_keterangan_kepemilikan_kendaraan_bermotor`
  ADD PRIMARY KEY (`id_skkkb`),
  ADD KEY `idx_nik` (`nik`),
  ADD KEY `idx_id_pejabat_desa` (`id_pejabat_desa`),
  ADD KEY `idx_id_profil_desa` (`id_profil_desa`);

--
-- Indeks untuk tabel `surat_keterangan_perhiasan`
--
ALTER TABLE `surat_keterangan_perhiasan`
  ADD PRIMARY KEY (`id_skp`),
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
-- Indeks untuk tabel `surat_lapor_hajatan`
--
ALTER TABLE `surat_lapor_hajatan`
  ADD PRIMARY KEY (`id_slh`),
  ADD KEY `idx_id_profil_desa` (`id_profil_desa`),
  ADD KEY `idx_id_pejabat_desa` (`id_pejabat_desa`),
  ADD KEY `idx_nik` (`nik`);

--
-- Indeks untuk tabel `surat_pengantar_skck`
--
ALTER TABLE `surat_pengantar_skck`
  ADD PRIMARY KEY (`id_sps`),
  ADD KEY `idx_nik` (`nik`),
  ADD KEY `idx_id_pejabat_desa` (`id_pejabat_desa`),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pejabat_desa`
--
ALTER TABLE `pejabat_desa`
  MODIFY `id_pejabat_desa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `penduduk`
--
ALTER TABLE `penduduk`
  MODIFY `id_penduduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=446;

--
-- AUTO_INCREMENT untuk tabel `profil_desa`
--
ALTER TABLE `profil_desa`
  MODIFY `id_profil_desa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `surat_keterangan`
--
ALTER TABLE `surat_keterangan`
  MODIFY `id_sk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT untuk tabel `surat_keterangan_berkelakuan_baik`
--
ALTER TABLE `surat_keterangan_berkelakuan_baik`
  MODIFY `id_skbb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `surat_keterangan_domisili`
--
ALTER TABLE `surat_keterangan_domisili`
  MODIFY `id_skd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `surat_keterangan_kepemilikan_kendaraan_bermotor`
--
ALTER TABLE `surat_keterangan_kepemilikan_kendaraan_bermotor`
  MODIFY `id_skkkb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `surat_keterangan_perhiasan`
--
ALTER TABLE `surat_keterangan_perhiasan`
  MODIFY `id_skp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `surat_keterangan_usaha`
--
ALTER TABLE `surat_keterangan_usaha`
  MODIFY `id_sku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `surat_lapor_hajatan`
--
ALTER TABLE `surat_lapor_hajatan`
  MODIFY `id_slh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `surat_pengantar_skck`
--
ALTER TABLE `surat_pengantar_skck`
  MODIFY `id_sps` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `surat_keterangan`
--
ALTER TABLE `surat_keterangan`
  ADD CONSTRAINT `fk_id_pejabat_desa_sk` FOREIGN KEY (`id_pejabat_desa`) REFERENCES `pejabat_desa` (`id_pejabat_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_profil_desa_sk` FOREIGN KEY (`id_profil_desa`) REFERENCES `profil_desa` (`id_profil_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nik_sk` FOREIGN KEY (`nik`) REFERENCES `penduduk` (`nik`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `surat_keterangan_berkelakuan_baik`
--
ALTER TABLE `surat_keterangan_berkelakuan_baik`
  ADD CONSTRAINT `fi_id_profil_desa_skbb` FOREIGN KEY (`id_profil_desa`) REFERENCES `profil_desa` (`id_profil_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_pejabat_desa_skbb` FOREIGN KEY (`id_pejabat_desa`) REFERENCES `pejabat_desa` (`id_pejabat_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nik_skbb` FOREIGN KEY (`nik`) REFERENCES `penduduk` (`nik`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `surat_keterangan_domisili`
--
ALTER TABLE `surat_keterangan_domisili`
  ADD CONSTRAINT `fi_id_profil_desa_skd` FOREIGN KEY (`id_profil_desa`) REFERENCES `profil_desa` (`id_profil_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_pejabat_desa_skd` FOREIGN KEY (`id_pejabat_desa`) REFERENCES `pejabat_desa` (`id_pejabat_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nik_skd` FOREIGN KEY (`nik`) REFERENCES `penduduk` (`nik`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `surat_keterangan_kepemilikan_kendaraan_bermotor`
--
ALTER TABLE `surat_keterangan_kepemilikan_kendaraan_bermotor`
  ADD CONSTRAINT `fk_id_pejabat_desa_skkkb` FOREIGN KEY (`id_pejabat_desa`) REFERENCES `pejabat_desa` (`id_pejabat_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_profil_desa_skkkb` FOREIGN KEY (`id_profil_desa`) REFERENCES `profil_desa` (`id_profil_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nik_skkkb` FOREIGN KEY (`nik`) REFERENCES `penduduk` (`nik`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `surat_keterangan_perhiasan`
--
ALTER TABLE `surat_keterangan_perhiasan`
  ADD CONSTRAINT `fk_id_pejabat_desa_skp` FOREIGN KEY (`id_pejabat_desa`) REFERENCES `pejabat_desa` (`id_pejabat_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_profil_desa_skp` FOREIGN KEY (`id_profil_desa`) REFERENCES `profil_desa` (`id_profil_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nik_skp` FOREIGN KEY (`nik`) REFERENCES `penduduk` (`nik`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `surat_keterangan_usaha`
--
ALTER TABLE `surat_keterangan_usaha`
  ADD CONSTRAINT `fi_id_profil_desa_sku` FOREIGN KEY (`id_profil_desa`) REFERENCES `profil_desa` (`id_profil_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_pejabat_desa_sku` FOREIGN KEY (`id_pejabat_desa`) REFERENCES `pejabat_desa` (`id_pejabat_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nik_sku` FOREIGN KEY (`nik`) REFERENCES `penduduk` (`nik`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `surat_lapor_hajatan`
--
ALTER TABLE `surat_lapor_hajatan`
  ADD CONSTRAINT `fk_id_pejabat_desa_slh` FOREIGN KEY (`id_pejabat_desa`) REFERENCES `pejabat_desa` (`id_pejabat_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_profil_desa_slh` FOREIGN KEY (`id_profil_desa`) REFERENCES `profil_desa` (`id_profil_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nik_slh` FOREIGN KEY (`nik`) REFERENCES `penduduk` (`nik`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `surat_pengantar_skck`
--
ALTER TABLE `surat_pengantar_skck`
  ADD CONSTRAINT `fk_id_pejabat_desa_sps` FOREIGN KEY (`id_pejabat_desa`) REFERENCES `pejabat_desa` (`id_pejabat_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_profil_desa_sps` FOREIGN KEY (`id_profil_desa`) REFERENCES `profil_desa` (`id_profil_desa`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nik_sps` FOREIGN KEY (`nik`) REFERENCES `penduduk` (`nik`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
