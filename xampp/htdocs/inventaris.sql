-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2022 at 11:56 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventaris`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `brg_keluar_id` int(10) NOT NULL,
  `kode_barang` varchar(15) NOT NULL,
  `tgl_keluar` date NOT NULL,
  `nama_pengguna` varchar(100) NOT NULL,
  `divisi` varchar(200) NOT NULL,
  `ket_keluar` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang_keluar`
--

INSERT INTO `barang_keluar` (`brg_keluar_id`, `kode_barang`, `tgl_keluar`, `nama_pengguna`, `divisi`, `ket_keluar`) VALUES
(1, 'N.03.09.22.0002', '2022-09-27', 'dodi', 'Keuangan', 'untuk keperluan divisi keuangan');

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `kode_barang` varchar(15) NOT NULL,
  `kategori_barang` varchar(20) NOT NULL,
  `status_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `no_serial` varchar(50) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `terima_dari` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `lokasi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang_masuk`
--

INSERT INTO `barang_masuk` (`kode_barang`, `kategori_barang`, `status_barang`, `nama_barang`, `no_serial`, `tgl_masuk`, `terima_dari`, `keterangan`, `lokasi`) VALUES
('N.01.09.22.0001', '01', 'N', 'lenovo', 'PR092736Dr349', '2022-09-27', 'Sumber jaya komputer', 'barang baru beli', 'Bangka Belitung');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `kategori_id` varchar(3) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori_barang`
--

INSERT INTO `kategori_barang` (`kategori_id`, `nama_kategori`) VALUES
('01', 'Laptop'),
('02', 'Komputer PC'),
('03', 'Printer'),
('04', 'UPS'),
('05', 'Scanner');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `kode_service` int(11) NOT NULL,
  `kode_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `nama_pengguna` varchar(50) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `tgl_keluar` date NOT NULL,
  `kerusakan` varchar(50) NOT NULL,
  `kt_penanganan` varchar(200) NOT NULL,
  `divisi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`kode_service`, `kode_barang`, `nama_barang`, `nama_pengguna`, `tgl_masuk`, `tgl_keluar`, `kerusakan`, `kt_penanganan`, `divisi`) VALUES
(7, 'N.03.09.22.0002', 'Canon', 'dodi', '2022-09-29', '2022-09-30', 'susah nyala', 'BELI baru', 'Keuangan');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `user_lvl` int(11) NOT NULL,
  `nama_user` varchar(100) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `no_tlp` varchar(15) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `tgl_buat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `user_lvl`, `nama_user`, `alamat`, `no_tlp`, `jenis_kelamin`, `tgl_buat`) VALUES
(1, 'superadmin', '12345', 1, 'bima sakti', 'jln gabik no.15', '085288876359', 'laki-laki', '2022-08-10 11:07:48'),
(2, 'admin', '12345', 2, 'andi', 'jln pasir putih no.21', '083176584398', 'Laki-Laki', '2022-09-16 00:00:00'),
(3, 'dicky79', '12345', 1, 'dicky', 'pasir putih', '085268785609', 'laki-laki', '2022-09-27 04:30:41');

-- --------------------------------------------------------

--
-- Table structure for table `user_lvl`
--

CREATE TABLE `user_lvl` (
  `userlvl_id` int(11) NOT NULL,
  `nama_userlvl` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_lvl`
--

INSERT INTO `user_lvl` (`userlvl_id`, `nama_userlvl`) VALUES
(1, 'Super Admin'),
(2, 'Admin'),
(3, 'Pengguna');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`brg_keluar_id`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`kode_service`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_lvl`
--
ALTER TABLE `user_lvl`
  ADD PRIMARY KEY (`userlvl_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  MODIFY `brg_keluar_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `kode_service` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_lvl`
--
ALTER TABLE `user_lvl`
  MODIFY `userlvl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
