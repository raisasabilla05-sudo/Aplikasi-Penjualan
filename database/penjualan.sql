-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Waktu pembuatan: 06 Jul 2026 pada 07.52
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `kdbrg` varchar(6) NOT NULL,
  `nmbrg` varchar(40) NOT NULL,
  `jenis` varchar(25) NOT NULL,
  `hargabeli` int(20) NOT NULL,
  `hargajual` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`kdbrg`, `nmbrg`, `jenis`, `hargabeli`, `hargajual`) VALUES
('B001', 'Roti', 'Makanan ', 3000, 5000),
('B002', 'Aqua', 'Minuman', 1500, 2000),
('B003', 'Teh Pucuk', 'Minuman', 3000, 3500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `isi`
--

CREATE TABLE `isi` (
  `idnota` varchar(6) NOT NULL,
  `kdbrg` varchar(6) NOT NULL,
  `harga_b` int(11) DEFAULT NULL,
  `harga_j` bigint(20) DEFAULT NULL,
  `qty` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `isi`
--

INSERT INTO `isi` (`idnota`, `kdbrg`, `harga_b`, `harga_j`, `qty`) VALUES
('IN0001', 'B001', 3000, 5000, 2),
('IN0006', 'B003', 3000, 3500, 4),
('IN002', 'B002', 1500, 2000, 2),
('IN003', 'B003', 3000, 3500, 2),
('IN005', 'B001', 3000, 5000, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kasir`
--

CREATE TABLE `kasir` (
  `id_kasir` varchar(6) NOT NULL,
  `nmkasir` varchar(40) NOT NULL,
  `jekel` varchar(20) DEFAULT NULL,
  `no_tlpn` varchar(20) NOT NULL,
  `agama` varchar(10) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kasir`
--

INSERT INTO `kasir` (`id_kasir`, `nmkasir`, `jekel`, `no_tlpn`, `agama`, `alamat`, `password`) VALUES
('K001', 'Raisa', 'Perempuan', '085748715261', 'Islam', 'JKT', '190905'),
('K002', 'Fuad', 'Laki-Laki', '085787868567', 'Islam', 'Depok', '12345'),
('K003', 'Raina', 'Perempuan', '007657645', 'Kristen ', 'Bogor', '7890');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nota`
--

CREATE TABLE `nota` (
  `idnota` varchar(6) NOT NULL,
  `tglnota` date DEFAULT NULL,
  `id` varchar(6) DEFAULT NULL,
  `id_kasir` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `nota`
--

INSERT INTO `nota` (`idnota`, `tglnota`, `id`, `id_kasir`) VALUES
('IN0001', '2026-06-22', 'P001', 'K001'),
('IN0004', '2026-07-05', 'P001', 'K001'),
('IN0006', '2026-07-05', 'P002', 'K001'),
('IN002', '2026-06-29', 'P002', 'K002'),
('IN003', '2026-07-05', 'P003 ', 'K003'),
('IN005', '2026-07-05', 'P002', 'K001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` varchar(6) NOT NULL,
  `nmplgn` varchar(40) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `nmplgn`, `jenis`, `telepon`, `alamat`) VALUES
('P001', 'Ditho', 'Laki-Laki', '0897-87098978', 'DPK'),
('P002', 'Aida', 'Perempuan', '0812345778', 'Jakarta'),
('P003 ', 'Della', 'Perempuan', '085817661200', 'Jakarta');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kdbrg`);

--
-- Indeks untuk tabel `isi`
--
ALTER TABLE `isi`
  ADD PRIMARY KEY (`idnota`) USING BTREE;

--
-- Indeks untuk tabel `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id_kasir`);

--
-- Indeks untuk tabel `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`idnota`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `isi`
--
ALTER TABLE `isi`
  ADD CONSTRAINT `isi_ibfk_1` FOREIGN KEY (`idnota`) REFERENCES `nota` (`idnota`),
  ADD CONSTRAINT `isi_ibfk_2` FOREIGN KEY (`kdbrg`) REFERENCES `barang` (`kdbrg`);

--
-- Ketidakleluasaan untuk tabel `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `noksir` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id_kasir`) ON UPDATE CASCADE,
  ADD CONSTRAINT `nota_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pelanggan` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
