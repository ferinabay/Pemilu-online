-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Bulan Mei 2019 pada 05.12
-- Versi server: 10.1.31-MariaDB
-- Versi PHP: 7.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pemilunew`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `calon_ketum`
--

CREATE TABLE `calon_ketum` (
  `idcalon` int(11) NOT NULL,
  `nim` int(11) NOT NULL,
  `nama_calon` varchar(100) NOT NULL,
  `tmp_lhr` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `agama` varchar(100) NOT NULL,
  `visi` text NOT NULL,
  `misi` text NOT NULL,
  `CKimage` varchar(120) DEFAULT NULL,
  `id_event` int(11) NOT NULL,
  `id_organisasi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `calon_ketum`
--

INSERT INTO `calon_ketum` (`idcalon`, `nim`, `nama_calon`, `tmp_lhr`, `tgl_lahir`, `agama`, `visi`, `misi`, `CKimage`, `id_event`, `id_organisasi`) VALUES
(1, 1731110001, 'Gita savitri devi', 'Jakarta', '2019-05-01', 'Islam', 'coba', 'coba1', 'img2.jpeg', 2, 310),
(8, 1731710003, 'Abdallah Darussalam', 'Malang', '2000-04-04', 'islam', 'testestest', 'cobaaaa', 'abda.JPG', 1, 206),
(9, 1731710004, 'Johan Budi', 'Tulungagung', '1999-12-05', 'islam', 'coba2', 'cobaaaa', 'johan.JPG', 1, 206),
(10, 1731610002, 'Erlangga ahmad', 'jombang', '1999-12-12', 'islam', 'cobadeh', 'cobajuga', 'erlangga.JPG', 6, 101),
(11, 1731610005, 'andreas', 'kediri', '1996-04-12', 'islam', 'iyaain', 'yes', 'andreas.JPG', 6, 101),
(12, 1631710014, 'Remizar fahrezi', 'Malang', '1997-12-10', 'islam', 'okay', 'iyaa', 'ezho.JPG', 9, 206),
(13, 1631720061, 'Abi zafar', 'Lumajang', '1998-12-05', 'islam', 'ti fast', 'ti fast', 'abi zafar.JPG', 9, 206);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mhs`
--

CREATE TABLE `mhs` (
  `idmhs` int(11) NOT NULL,
  `nim` int(11) NOT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `id_organisasi` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `statuspilih` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mhs`
--

INSERT INTO `mhs` (`idmhs`, `nim`, `nama_lengkap`, `password`, `id_organisasi`, `id_event`, `statuspilih`) VALUES
(7, 1731710161, 'ferina', '9aea5c461b62c8e6021d3611dcffc148', 206, 1, 1),
(8, 1731710161, 'ferina', '9aea5c461b62c8e6021d3611dcffc148', 101, 6, 1),
(9, 1731710049, 'diani', '52f8661282dcf7ce11a3158c26a3a0d7', 310, 2, 0),
(10, 1731710171, 'danin', 'ac465ad4b68fe12642f7806d28cda1c0', 310, 2, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `organisasi`
--

CREATE TABLE `organisasi` (
  `id_organisasi` int(11) NOT NULL,
  `nama_org` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `organisasi`
--

INSERT INTO `organisasi` (`id_organisasi`, `nama_org`) VALUES
(101, 'Badan Eksekutif Mahasiswa'),
(102, 'Dewan Perwakilan Mahasiswa'),
(201, 'Himpunan Mahasiswa Administasi Niaga'),
(202, 'Himpunan Mahasiswa Akuntansi'),
(203, 'Himpunan Mahasiswa Elektro'),
(204, 'Himpunan Mahasiswa Mesin'),
(205, 'Himpunan Mahasiswa Sipil'),
(206, 'Himpunan Mahasiswa Teknologi Informasi'),
(207, 'Himpunan Mahasiswa Kimiaaa'),
(301, 'Bhakti Karya Mahasiswi'),
(302, 'KMK St. John Polinema'),
(303, 'LPM KOMPEN'),
(304, 'Resimen Mahasiswa'),
(305, 'OPA Ganendra Giri'),
(306, 'UKM Olahraga Polinema'),
(307, 'PASTI Polinema'),
(308, 'Radio PLFM'),
(309, 'Pendidikan dan Penalaran Polinema'),
(310, 'Kerohanian Islam Polinema'),
(311, 'Seni Theatrisic'),
(312, 'Talitakum Family Polinema'),
(313, 'USMA Polinema');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblauth`
--

CREATE TABLE `tblauth` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `userType` varchar(20) NOT NULL,
  `id_organisasi` int(11) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblauth`
--

INSERT INTO `tblauth` (`id`, `username`, `password`, `userType`, `id_organisasi`, `CreationDate`, `UpdationDate`) VALUES
(1, 'superadmin', 'ac497cfaba23c4184cb03b97e8c51e0a', 'sa', 101, '2019-05-08 07:43:45', NULL),
(2, 'rispol', '4ab78b251451117bd55054b2264d76d1', 'admin', 310, '2019-05-08 07:44:35', NULL),
(3, 'bkm', '975bdf5f0b6e1c0d55b58effdb7c1373', 'admin', 301, '2019-05-14 03:57:14', NULL),
(4, 'hmti', '4d6931a92abf58e9177a8ee214679c1a', 'admin', 206, '2019-05-14 06:57:24', NULL),
(5, 'bem', 'd3c654d99bdfaf101e012bfe2810679e', 'admin', 101, '2019-05-14 07:21:29', NULL),
(6, 'dpm', 'd868130c1fb5d4f90073b0acf7b22d89', 'admin', 102, '2019-05-14 07:21:42', '2019-05-14 07:22:06'),
(7, 'himania', '4a1769e44bcdf1513e6f81a5227790c6', 'admin', 201, '2019-05-14 07:23:21', NULL),
(8, 'hma', '593bc31f88fb8970c9f9f06d34d62983', 'admin', 202, '2019-05-14 07:23:41', NULL),
(9, 'hme', 'a99eb7a3e15ab14e18f7aff434f91f7e', 'admin', 203, '2019-05-14 07:24:16', NULL),
(10, 'hmm', 'd782221fd1b6439340cb33c44ec25cb6', 'admin', 204, '2019-05-14 07:24:29', NULL),
(11, 'hms', '2671b040b081a2d4cebbcd412c69b7eb', 'admin', 205, '2019-05-14 07:24:43', NULL),
(12, 'hmtk', '0babb197af540a3488a7a07b23744af2', 'admin', 207, '2019-05-14 07:25:04', NULL),
(13, 'kmkst', '2d13e0a68461675b47688bfb861fad6a', 'admin', 302, '2019-05-14 07:26:44', NULL),
(14, 'kompen', '0b0ac851cc5876bb537d76848fa1831d', 'admin', 303, '2019-05-14 07:27:06', NULL),
(15, 'menwa', 'a91dbc1edce3778130717a193dbc7a0e', 'admin', 304, '2019-05-14 07:27:26', NULL),
(16, 'opagg', '36e0ceda4260dd5f685f8523f9fe2f72', 'admin', 305, '2019-05-14 07:27:49', NULL),
(17, 'ukmor', '9b6b4e1929298c8c46b81eceb05b2773', 'admin', 306, '2019-05-14 07:28:29', NULL),
(18, 'pasti', 'fa49312b3a58cf4ad07bde06da087cad', 'admin', 307, '2019-05-14 07:28:47', NULL),
(19, 'plfm', '962699a3348d855cf7f6a929580b4e13', 'admin', 308, '2019-05-14 07:29:05', NULL),
(20, 'ukmpp', 'f01902e411edf44607c14cb02b69d88e', 'admin', 309, '2019-05-14 07:29:30', NULL),
(21, 'ukmseni', '939a85d66448db1673be93ffb2937c23', 'admin', 311, '2019-05-14 07:30:13', NULL),
(22, 'talitakum', '2cfb2597cffc64bc2bbfb68ae6b0a939', 'admin', 312, '2019-05-14 07:30:44', NULL),
(23, 'usma', 'a672068055fa4b8dea6bfcfb9ab4acee', 'admin', 313, '2019-05-14 07:30:58', NULL),
(24, 'bem', '0f7a71d96f408465689dc399011497b9', 'admin', 101, '2019-05-14 08:22:08', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblevent`
--

CREATE TABLE `tblevent` (
  `id_event` int(11) NOT NULL,
  `nama_event` varchar(100) NOT NULL,
  `id_organisasi` int(11) NOT NULL,
  `thn_pemilu` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblevent`
--

INSERT INTO `tblevent` (`id_event`, `nama_event`, `id_organisasi`, `thn_pemilu`) VALUES
(1, 'pemilu hmti 2019', 206, 2019),
(2, 'pemilu Rispol', 310, 2018),
(3, 'pemilu Rispol', 310, 2019),
(4, 'Pemilu BKM 2019', 301, 2019),
(5, 'Pemilu PLFM', 308, 2019),
(6, 'BEM 2019', 101, 2019),
(7, 'pemilu DPM 2019', 102, 2019),
(8, 'Pemilu DPM 2018', 102, 2019),
(9, 'pemilu hmti 2018', 206, 2018);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `calon_ketum`
--
ALTER TABLE `calon_ketum`
  ADD PRIMARY KEY (`idcalon`),
  ADD KEY `id_event` (`id_event`),
  ADD KEY `id_organisasi` (`id_organisasi`);

--
-- Indeks untuk tabel `mhs`
--
ALTER TABLE `mhs`
  ADD PRIMARY KEY (`idmhs`),
  ADD KEY `id_organisasi` (`id_organisasi`),
  ADD KEY `id_event` (`id_event`);

--
-- Indeks untuk tabel `organisasi`
--
ALTER TABLE `organisasi`
  ADD PRIMARY KEY (`id_organisasi`);

--
-- Indeks untuk tabel `tblauth`
--
ALTER TABLE `tblauth`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_organisasi` (`id_organisasi`);

--
-- Indeks untuk tabel `tblevent`
--
ALTER TABLE `tblevent`
  ADD PRIMARY KEY (`id_event`),
  ADD KEY `id_organisasi` (`id_organisasi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `calon_ketum`
--
ALTER TABLE `calon_ketum`
  MODIFY `idcalon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `mhs`
--
ALTER TABLE `mhs`
  MODIFY `idmhs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tblauth`
--
ALTER TABLE `tblauth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `tblevent`
--
ALTER TABLE `tblevent`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `calon_ketum`
--
ALTER TABLE `calon_ketum`
  ADD CONSTRAINT `calon_ketum_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `tblevent` (`id_event`),
  ADD CONSTRAINT `calon_ketum_ibfk_2` FOREIGN KEY (`id_organisasi`) REFERENCES `organisasi` (`id_organisasi`);

--
-- Ketidakleluasaan untuk tabel `mhs`
--
ALTER TABLE `mhs`
  ADD CONSTRAINT `mhs_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `tblevent` (`id_event`),
  ADD CONSTRAINT `mhs_ibfk_2` FOREIGN KEY (`id_organisasi`) REFERENCES `organisasi` (`id_organisasi`);

--
-- Ketidakleluasaan untuk tabel `tblauth`
--
ALTER TABLE `tblauth`
  ADD CONSTRAINT `tblauth_ibfk_1` FOREIGN KEY (`id_organisasi`) REFERENCES `organisasi` (`id_organisasi`);

--
-- Ketidakleluasaan untuk tabel `tblevent`
--
ALTER TABLE `tblevent`
  ADD CONSTRAINT `tblevent_ibfk_1` FOREIGN KEY (`id_organisasi`) REFERENCES `organisasi` (`id_organisasi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
