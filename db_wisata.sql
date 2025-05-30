-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 30, 2025 at 10:25 AM
-- Server version: 8.0.30
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_wisata`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_admin` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `no_tlp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_admin`, `email`, `no_tlp`) VALUES
(1, 'admin', 'admin123', 'Administrator Utama', 'admin@example.com', '081234567890'),
(2, 'jeri', 'jeri123', 'jeri', 'wilagajeri@gmail.com', '087700889263');

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `id_hotel` varchar(20) NOT NULL,
  `nama_hotel` varchar(100) DEFAULT NULL,
  `id_kab` varchar(20) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `deskripsi` text,
  `fasilitas` text,
  `alamat` text,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`id_hotel`, `nama_hotel`, `id_kab`, `latitude`, `longitude`, `deskripsi`, `fasilitas`, `alamat`, `gambar`) VALUES
('1', 'Reddorz Pringsewu', '1', -7.7914550, 110.3741560, 'sangat banyak', 'banyak', 'pringsewu selatan', 'GH1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_km`
--

CREATE TABLE `jenis_km` (
  `id_jeniskm` varchar(20) NOT NULL,
  `nama_jeniskm` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jenis_km`
--

INSERT INTO `jenis_km` (`id_jeniskm`, `nama_jeniskm`) VALUES
('1', 'kamar VIP');

-- --------------------------------------------------------

--
-- Table structure for table `kabupaten`
--

CREATE TABLE `kabupaten` (
  `id_kab` varchar(20) NOT NULL,
  `nama_kab` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kabupaten`
--

INSERT INTO `kabupaten` (`id_kab`, `nama_kab`) VALUES
('1', 'Pringsewu'),
('2', 'Pesawaran');

-- --------------------------------------------------------

--
-- Table structure for table `km_hotel`
--

CREATE TABLE `km_hotel` (
  `id_kamar` varchar(20) NOT NULL,
  `id_hotel` varchar(20) DEFAULT NULL,
  `id_jeniskm` varchar(20) DEFAULT NULL,
  `jumlah` int DEFAULT '0',
  `harga` decimal(15,2) DEFAULT '0.00',
  `gamkamar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `km_hotel`
--

INSERT INTO `km_hotel` (`id_kamar`, `id_hotel`, `id_jeniskm`, `jumlah`, `harga`, `gamkamar`) VALUES
('1', '1', '1', 34, 200000.00, 'GMK1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `mk_kuliner`
--

CREATE TABLE `mk_kuliner` (
  `id_mkkuliner` varchar(20) NOT NULL,
  `nama_mkkuliner` varchar(100) NOT NULL,
  `id_tpkuliner` varchar(20) DEFAULT NULL,
  `harga` decimal(15,2) DEFAULT '0.00',
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mk_kuliner`
--

INSERT INTO `mk_kuliner` (`id_mkkuliner`, `nama_mkkuliner`, `id_tpkuliner`, `harga`, `gambar`) VALUES
('1', 'Pringsewu Hils', '1', 200000.00, 'GMK1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tempat_kuliner`
--

CREATE TABLE `tempat_kuliner` (
  `id_tpkuliner` varchar(20) NOT NULL,
  `nama_tpkuliner` varchar(100) NOT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `id_kab` varchar(20) DEFAULT NULL,
  `deskripsi` text,
  `alamat` text,
  `jam_buka` time DEFAULT NULL,
  `jam_tutup` time DEFAULT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tempat_kuliner`
--

INSERT INTO `tempat_kuliner` (`id_tpkuliner`, `nama_tpkuliner`, `latitude`, `longitude`, `id_kab`, `deskripsi`, `alamat`, `jam_buka`, `jam_tutup`, `gambar`) VALUES
('1', 'bakso soni', -7.7914550, 110.3741560, '1', 'sangat bantak', NULL, '18:57:00', '16:02:00', 'GTK1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tempat_wisata`
--

CREATE TABLE `tempat_wisata` (
  `id_tpwisata` varchar(20) NOT NULL,
  `nama_tpwisata` varchar(100) NOT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `id_kab` varchar(20) DEFAULT NULL,
  `deskripsi` text,
  `harga_tiket` decimal(15,2) DEFAULT '0.00',
  `alamat` text NOT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tempat_wisata`
--

INSERT INTO `tempat_wisata` (`id_tpwisata`, `nama_tpwisata`, `latitude`, `longitude`, `id_kab`, `deskripsi`, `harga_tiket`, `alamat`, `gambar`) VALUES
('1', 'ssss', -7.7914550, 110.3741560, '1', 'sbanha', 20000.00, 'pringsewu selatan', 'GW1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `transjogja`
--

CREATE TABLE `transjogja` (
  `id_transjogja` varchar(20) NOT NULL,
  `nama_transjogja` varchar(100) NOT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `alamat` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transjogja`
--

INSERT INTO `transjogja` (`id_transjogja`, `nama_transjogja`, `latitude`, `longitude`, `alamat`) VALUES
('1', 'Pringsewu Hils', -7.7914550, 110.3741560, 'pringsewu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id_hotel`),
  ADD KEY `fk_hotel_kab` (`id_kab`);

--
-- Indexes for table `jenis_km`
--
ALTER TABLE `jenis_km`
  ADD PRIMARY KEY (`id_jeniskm`);

--
-- Indexes for table `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD PRIMARY KEY (`id_kab`);

--
-- Indexes for table `km_hotel`
--
ALTER TABLE `km_hotel`
  ADD PRIMARY KEY (`id_kamar`),
  ADD KEY `fk_kmhotel_hotel` (`id_hotel`),
  ADD KEY `fk_kmhotel_jeniskm` (`id_jeniskm`);

--
-- Indexes for table `mk_kuliner`
--
ALTER TABLE `mk_kuliner`
  ADD PRIMARY KEY (`id_mkkuliner`),
  ADD KEY `fk_mkkuliner_tpkuliner` (`id_tpkuliner`);

--
-- Indexes for table `tempat_kuliner`
--
ALTER TABLE `tempat_kuliner`
  ADD PRIMARY KEY (`id_tpkuliner`),
  ADD KEY `fk_tempatkuliner_kab` (`id_kab`);

--
-- Indexes for table `tempat_wisata`
--
ALTER TABLE `tempat_wisata`
  ADD PRIMARY KEY (`id_tpwisata`),
  ADD KEY `fk_tempatwisata_kab` (`id_kab`);

--
-- Indexes for table `transjogja`
--
ALTER TABLE `transjogja`
  ADD PRIMARY KEY (`id_transjogja`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `fk_hotel_kab` FOREIGN KEY (`id_kab`) REFERENCES `kabupaten` (`id_kab`);

--
-- Constraints for table `km_hotel`
--
ALTER TABLE `km_hotel`
  ADD CONSTRAINT `fk_kmhotel_hotel` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`id_hotel`),
  ADD CONSTRAINT `fk_kmhotel_jeniskm` FOREIGN KEY (`id_jeniskm`) REFERENCES `jenis_km` (`id_jeniskm`);

--
-- Constraints for table `mk_kuliner`
--
ALTER TABLE `mk_kuliner`
  ADD CONSTRAINT `fk_mkkuliner_tpkuliner` FOREIGN KEY (`id_tpkuliner`) REFERENCES `tempat_kuliner` (`id_tpkuliner`);

--
-- Constraints for table `tempat_kuliner`
--
ALTER TABLE `tempat_kuliner`
  ADD CONSTRAINT `fk_tempatkuliner_kab` FOREIGN KEY (`id_kab`) REFERENCES `kabupaten` (`id_kab`);

--
-- Constraints for table `tempat_wisata`
--
ALTER TABLE `tempat_wisata`
  ADD CONSTRAINT `fk_tempatwisata_kab` FOREIGN KEY (`id_kab`) REFERENCES `kabupaten` (`id_kab`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
