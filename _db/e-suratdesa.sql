-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Okt 2024 pada 19.20
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
-- Database: `e-suratdesa`
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
(55, 'Yuki Setsuna', '3212101201020004', '1bbd886460827015e5d605ed44252251', 'user', '3212101201020004', '6289608183742', 'Halaman Laporan.png', 'Halaman Status Surat.png', 1, '377129', 1729583266);

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
  `nama_ibu` varchar(50) NOT NULL,
  `id_dusun` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penduduk`
--

INSERT INTO `penduduk` (`id_penduduk`, `nik`, `nama`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `agama`, `jalan`, `dusun`, `rt`, `rw`, `desa`, `kecamatan`, `kota`, `no_kk`, `pend_kk`, `pend_terakhir`, `pend_ditempuh`, `pekerjaan`, `status_perkawinan`, `status_dlm_keluarga`, `kewarganegaraan`, `nama_ayah`, `nama_ibu`, `id_dusun`) VALUES
(98, '3212101201020002', 'Mohammad Jindan Dubbay Al Faresh', 'indramayu', '2002-01-12', 'Laki-laki', 'islam', 'Jl. Merpati', 'Grojogan', '003', '001', 'grogol', 'Kapetakan', 'Kabupaten Cirebon', '234354323435', 'SLTA/SEDERAJAT', 'SLTA/SEDERAJAT', 'S1/SEDERAJAT', 'wirasawasta', 'Belum Menikah', 'Anak', 'WNI', 'Jhon', 'Yuuki', NULL),
(99, '3212101201020004', 'Yuki Setsuna', 'indramayu', '2011-07-06', 'Perempuan', 'islam', 'Jl. Merpati', 'Grojogan', '003', '002', 'grogol', 'karangamoel', 'Kabupaten Cirebon', '234354323434', 'D3/SEDERAJAT', 'D3/SEDERAJAT', 'S1/SEDERAJAT', 'Mahasiswa', 'Belum Menikah', 'Anak', 'WNI', 'Jhon', 'Yuuki', NULL),
(102, '3212101201020007', 'Syawal Saputra', 'Samarinda', '2024-10-17', 'Perempuan', 'islam', 'Jl. Merpati', 'Nganggring', '002', '001', 'grogol', 'Kapetakan', 'Kabupaten Cirebon', '234354323435', 'SLTP/SEDERAJAT', 'SLTP/SEDERAJAT', 'SLTP/SEDERAJAT', 'wirasawasta', 'Belum Menikah', 'Anak', 'WNI', 'Jhon', 'Yuuki', NULL);

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
(206, 'Surat Keterangan KTP Sementara', '01/323/12', '3212101201020004', '6289608183742', '2024-10-15 14:00:31', 1, 'selesai', 1, ''),
(207, 'Surat Keterangan KTP Sementara', '01/323/12', '3212101201020004', '6289608183742', '2024-10-15 14:26:54', 1, 'TERTOLAK', 1, 'jj'),
(208, 'Surat Keterangan KTP Sementara', '01/323/12', '3212101201020004', '6289608183742', '2024-10-19 13:44:00', 1, 'TERTOLAK', 1, 'dd'),
(209, 'Surat Keterangan KTP Sementara', '01/323/12', '3212101201020004', '6289608183742', '2024-10-20 16:24:05', 1, 'selesai', 1, '');

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

--
-- Dumping data untuk tabel `surat_keterangan_domisili`
--

INSERT INTO `surat_keterangan_domisili` (`id_skd`, `jenis_surat`, `no_surat`, `nik`, `whatsapp`, `tanggal_surat`, `id_pejabat_desa`, `status_surat`, `alasan_tolak`, `id_profil_desa`) VALUES
(37, 'Surat Keterangan Domisili', '01/323/12', '3212101201020004', '6289608183742', '2024-10-15 14:00:44', 1, 'selesai', '', 1),
(38, 'Surat Keterangan Domisili', '01/323/12', '3212101201020004', '6289608183742', '2024-10-15 14:27:02', 1, 'TERTOLAK', 'iuuu', 1);

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

--
-- Dumping data untuk tabel `surat_keterangan_kehilangan`
--

INSERT INTO `surat_keterangan_kehilangan` (`id_skk`, `jenis_surat`, `no_surat`, `nik`, `whatsapp`, `barang_hilang`, `lokasi_hilang`, `tanggal_hilang`, `keperluan`, `tanggal_surat`, `id_pejabat_desa`, `status_surat`, `alasan_tolak`, `id_profil_desa`) VALUES
(31, 'Surat Keterangan Kehilangan', '01/323/12', '3212101201020004', '6289608183742', 'dompet', 'rumah pelapor', '2024-10-22', 'Melapor ke polisi', '2024-10-22 18:08:37', 2, 'selesai', '', 1);

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

--
-- Dumping data untuk tabel `surat_keterangan_tidak_mampu`
--

INSERT INTO `surat_keterangan_tidak_mampu` (`id_sktm`, `jenis_surat`, `no_surat`, `nik`, `whatsapp`, `nama_ortu`, `agama_ortu`, `nik_ortu`, `jenis_kelamin_ortu`, `tempat_lahir_ortu`, `pekerjaan_ortu`, `tanggal_lahir_ortu`, `alamat_ortu`, `tanggal_surat`, `id_pejabat_desa`, `status_surat`, `alasan_tolak`, `id_profil_desa`) VALUES
(21, 'Surat Keterangan Tidak Mampu', '01/323/12', '3212101201020004', '6289608183742', 'lisa', 'islam', '800000', 'Perempuan', 'bandung', 'mahasiswa', '2024-10-15', 'Jl. Merpati, RT003/RW001, Dusun Grojogan, Desa grogol, Kecamatan Kapetakan, Kabupaten Cirebon', '2024-10-15 14:01:07', 1, 'selesai', '', 1),
(22, 'Surat Keterangan Tidak Mampu', '12133232', '3212101201020004', '6289608183742', 'lisa', 'islam', '700000', 'Laki-laki', 'bandung', 'mahasiswa', '2024-10-15', 'Jl. Merpati, RT003/RW001, Dusun Grojogan, Desa grogol, Kecamatan Kapetakan, Kabupaten Cirebon', '2024-10-15 14:27:24', 2, 'TERTOLAK', 'jjjjiii', 1),
(23, 'Surat Keterangan Tidak Mampu', '01/323/12', '3212101201020004', '6289608183742', 'Jindan', 'Islam', '23232323', 'Laki-laki', 'Indramayu', 'Wiraswasta', '2024-10-15', 'Jl. Merpati, RT003/RW001, Dusun Grojogan, Desa grogol, Kecamatan Kapetakan, Kabupaten Cirebon', '2024-10-15 14:38:21', 1, 'selesai', '', 1),
(24, 'Surat Keterangan Tidak Mampu', '12133232', '3212101201020002', '', 'Jindan', 'Islam', '232434', 'Laki-laki', 'Indramayu', 'Wiraswasta', '2024-10-17', 'Jl. Merpati, RT003/RW001, Dusun Grojogan, Desa grogol, Kecamatan Kapetakan, Kabupaten Cirebon', '2024-10-17 21:17:48', 2, 'TERTOLAK', 'dddddddd', 1),
(25, 'Surat Keterangan Tidak Mampu', '01/323/12', '3212101201020004', '6289608183742', 'Jindan', 'Islam', '211212', 'Perempuan', 'Indramayu', 'Wiraswasta', '2024-10-17', 'Jl. Merpati, RT003/RW001, Dusun Grojogan, Desa grogol, Kecamatan Kapetakan, Kabupaten Cirebon', '2024-10-17 22:07:24', 1, 'TERTOLAK', '4444444444444', 1);

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

--
-- Dumping data untuk tabel `surat_keterangan_usaha`
--

INSERT INTO `surat_keterangan_usaha` (`id_sku`, `jenis_surat`, `no_surat`, `nik`, `whatsapp`, `usaha`, `tanggal_surat`, `id_pejabat_desa`, `status_surat`, `alasan_tolak`, `id_profil_desa`) VALUES
(20, 'Surat Keterangan Usaha', '01/323/12', '3212101201020004', '6289608183742', 'sembako', '2024-10-15 14:01:31', 1, 'selesai', '', 1),
(21, 'Surat Keterangan Usaha', '01/323/12', '3212101201020004', '6289608183742', 'Kue', '2024-10-15 14:27:39', 1, 'TERTOLAK', 'dhsffsgdf', 1);

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

--
-- Dumping data untuk tabel `surat_keterangan_wali_murid`
--

INSERT INTO `surat_keterangan_wali_murid` (`id_skwm`, `jenis_surat`, `no_surat`, `nik`, `whatsapp`, `nama_anak`, `nik_anak`, `jenis_kelamin_anak`, `tempat_lahir_anak`, `tanggal_lahir_anak`, `asal_sekolah`, `kelas`, `tanggal_surat`, `id_pejabat_desa`, `status_surat`, `alasan_tolak`, `id_profil_desa`) VALUES
(12, 'Surat Keterangan Wali Murid', '01/323/12', '3212101201020004', '6289608183742', 'Mohammad Jindan Dubbay al faresh', '2000016101', 'Laki-laki', 'Indramayu', '2024-10-17', 'SMAN 1 Krangakeng', '12 ( dua belas )', '2024-10-17 22:03:55', 1, 'TERTOLAK', 'sssssss', 1),
(13, 'Surat Keterangan Wali Murid', '01/323/12', '3212101201020007', '', 'Mohammad Jindan Dubbay al faresh', '2323', 'Perempuan', 'Indramayu', '2024-10-17', 'SMAN 1 Krangakeng', '12 ( dua belas )', '2024-10-17 22:10:01', 1, 'selesai', '', 1),
(14, 'Surat Keterangan Wali Murid', '01/323/12', '3212101201020004', '6289608183742', 'Mohammad Jindan Dubbay al faresh', '2000016101', 'Laki-laki', 'Indramayu', '2024-10-18', 'SMAN 1 Krangakeng', '12 ( dua belas )', '2024-10-18 16:46:38', 1, 'selesai', '', 1);

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

--
-- Dumping data untuk tabel `surat_lahir`
--

INSERT INTO `surat_lahir` (`id_sl`, `jenis_surat`, `no_surat`, `nik`, `whatsapp`, `bukti_nikah`, `data_saksi1`, `data_saksi2`, `nama_ibu_anak`, `nama_ayah_anak`, `nama_anak`, `umur_ibu`, `umur_ayah`, `pekerjaan_ayah`, `alamat_lahir`, `hari_lahir`, `tanggal_lahir_anak`, `nomor_anak`, `tanggal_surat`, `id_pejabat_desa`, `status_surat`, `alasan_tolak`, `id_profil_desa`) VALUES
(28, 'Surat Kelahiran', '01/323/12', '3212101201020004', '6289608183742', 'Halaman Tambah Data Penduduk.png', 'Halaman Verifikasi Akun.png', 'Halaman Laporan.png', 'rose', 'william smith', 'Aristia', 45, 45, 'Wiraswasta', 'Jl. Merpati, RT003/RW001, Dusun Grojogan, Desa grogol, Kecamatan Kapetakan, Kabupaten Cirebon', 'minggu', '2024-10-22', '2 ( dua )', '2024-10-22 21:43:38', 1, 'BELUM SELESAI', '', 1);

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

--
-- Dumping data untuk tabel `surat_mati`
--

INSERT INTO `surat_mati` (`id_sm`, `jenis_surat`, `no_surat`, `nik`, `whatsapp`, `ktp_meninggal`, `kk_meninggal`, `suket_kematian`, `surat_pengantar`, `nama_meninggal`, `nik_meninggal`, `jenis_kelamin_meninggal`, `status_perkawinan_meninggal`, `kewarganegaraan_meninggal`, `pekerjaan_meninggal`, `alamat_meninggal`, `sebab_meninggal`, `tanggal_meninggal`, `tempat_pemakaman`, `hari_meninggal`, `tempat_meninggal`, `tanggal_surat`, `id_pejabat_desa`, `status_surat`, `alasan_tolak`, `id_profil_desa`) VALUES
(49, 'Surat Kematian', '01/323/12', '3212101201020004', '6289608183742', 'Halaman Dashboard.png', 'Halaman Verifikasi Akun.png', 'Halaman Utama.png', 'Halaman Informasi Surat.png', 'william smith', '2000016101', 'Laki-laki', 'Menikah', 'WNI', 'progammer', 'Jl. Merpati, RT003/RW001, Dusun Grojogan, Desa grogol, Kecamatan Kapetakan, Kabupaten Cirebon', 'Stroke', '2024-10-20', 'Dekulab', 'Minggu', 'rumah sakit', '2024-10-20 21:19:43', 1, 'selesai', '', 1);

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
-- Dumping data untuk tabel `surat_pengantar_kelakuan_baik`
--

INSERT INTO `surat_pengantar_kelakuan_baik` (`id_spkb`, `jenis_surat`, `no_surat`, `nik`, `keperluan`, `whatsapp`, `tanggal_surat`, `id_pejabat_desa`, `status_surat`, `alasan_tolak`, `id_profil_desa`) VALUES
(46, 'Surat Pengantar Kelakuan Baik', '01/323/12', '3212101201020004', 'Masuk perguruan tinggi Negri ', '6289608183742', '2024-10-15 14:00:38', 1, 'selesai', '', 1),
(47, 'Surat Pengantar Kelakuan Baik', '01/323/12', '3212101201020004', 'Masuk perguruan tinggi Negri ', '6289608183742', '2024-10-15 14:26:59', 1, 'TERTOLAK', 'o0io', 1),
(48, 'Surat Pengantar Kelakuan Baik', '01/323/12', '3212101201020004', 'Masuk perguruan tinggi Negri ', '6289608183742', '2024-10-21 17:47:10', 1, 'BELUM SELESAI', '', 1);

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
  ADD KEY `idx_id_penduduk` (`id_penduduk`),
  ADD KEY `fk_dusun_penduduk` (`id_dusun`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT untuk tabel `pejabat_desa`
--
ALTER TABLE `pejabat_desa`
  MODIFY `id_pejabat_desa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `penduduk`
--
ALTER TABLE `penduduk`
  MODIFY `id_penduduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT untuk tabel `profil_desa`
--
ALTER TABLE `profil_desa`
  MODIFY `id_profil_desa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `surat_keterangan`
--
ALTER TABLE `surat_keterangan`
  MODIFY `id_sk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT untuk tabel `surat_keterangan_domisili`
--
ALTER TABLE `surat_keterangan_domisili`
  MODIFY `id_skd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `surat_keterangan_kehilangan`
--
ALTER TABLE `surat_keterangan_kehilangan`
  MODIFY `id_skk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `surat_keterangan_tidak_mampu`
--
ALTER TABLE `surat_keterangan_tidak_mampu`
  MODIFY `id_sktm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `surat_keterangan_usaha`
--
ALTER TABLE `surat_keterangan_usaha`
  MODIFY `id_sku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
  MODIFY `id_spkb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `fk_nik_penduduk` FOREIGN KEY (`nik`) REFERENCES `penduduk` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `penduduk`
--
ALTER TABLE `penduduk`
  ADD CONSTRAINT `fk_dusun_penduduk` FOREIGN KEY (`id_dusun`) REFERENCES `dusun` (`id_dusun`);

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
