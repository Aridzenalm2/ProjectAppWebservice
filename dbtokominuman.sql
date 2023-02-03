-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2022 at 03:00 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbtokominuman`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_brand` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `industri` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `didirikan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pendiri` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kantor_pusat` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produk` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sejarah` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `web` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dokters`
--

CREATE TABLE `dokters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2022_11_21_110223_create_brand_table', 1),
(2, '2022_11_21_112331_create_motor_table', 1),
(3, '2022_11_25_093550_create_pasiens_table', 1),
(4, '2022_11_25_093800_create_dokters_table', 1),
(7, '2022_11_25_103812_create_pelanggan_table', 2),
(9, '2022_11_25_103856_create_minuman_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `minumen`
--

CREATE TABLE `minumen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_minuman` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_minuman` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stok_minuman` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pelanggan_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `minumen`
--

INSERT INTO `minumen` (`id`, `nama_minuman`, `harga_minuman`, `deskripsi`, `stok_minuman`, `pelanggan_id`, `created_at`, `updated_at`) VALUES
(1, 'coffe karamel', '19000', 'perpaduan kopi dengan karamel', '50', 1, '2022-11-25 12:12:28', '2022-11-25 12:12:28'),
(2, 'white coffe', '21000', 'perpaduan kopi dengan susu', '50', 2, '2022-11-25 12:14:23', '2022-11-25 12:14:23'),
(3, 'green coffe', '20000', 'kopi teh hijau', '50', 2, '2022-11-25 13:27:50', '2022-11-25 13:53:16');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_pelanggan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minuman_favorit` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `point_pelanggan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bonus_pembelian` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_pembelian` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Total_pembelian` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `komentar_minuman` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_bonus` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `nama_pelanggan`, `minuman_favorit`, `point_pelanggan`, `bonus_pembelian`, `tanggal_pembelian`, `Total_pembelian`, `komentar_minuman`, `gambar`, `total_bonus`, `created_at`, `updated_at`) VALUES
(1, 'Arid Zenal M', 'white coffe', '70', 'gelas gratis', '24 november 2022', '5', 'kopinya enak sekali manis dan lembut di mulut.', 'whitecoffe.png', '20', '2022-11-24 12:15:35', '2022-11-24 12:15:35'),
(2, 'Yogi Ordano Tamba', 'black coffe', '70', 'gratis satu sachet coffe bubuk aren', '23 november 2022', '7', 'rasa kopinya sangat tajam dan membuat mata jadi melek', 'blackcoffe.png', '5', '2022-11-22 12:18:39', '2022-11-22 12:18:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dokters`
--
ALTER TABLE `dokters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `minumen`
--
ALTER TABLE `minumen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelanggan_id_foregin` (`pelanggan_id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dokters`
--
ALTER TABLE `dokters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `minumen`
--
ALTER TABLE `minumen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
