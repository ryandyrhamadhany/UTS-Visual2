-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Jul 2024 pada 07.24
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penjualan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `ID` int(8) NOT NULL,
  `Name` char(100) DEFAULT NULL,
  `Harga Jual` bigint(20) DEFAULT NULL,
  `Barkode` int(20) DEFAULT NULL,
  `Harga Beli` bigint(20) DEFAULT NULL,
  `Stok` int(10) DEFAULT NULL,
  `Kategori_id` int(8) DEFAULT NULL,
  `Satuan_id` int(8) DEFAULT NULL,
  `Supplier_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`ID`, `Name`, `Harga Jual`, `Barkode`, `Harga Beli`, `Stok`, `Kategori_id`, `Satuan_id`, `Supplier_id`, `user_id`) VALUES
(1, 'Minyak Goreng', 25000, 131344, 25000, 200, 1, 2, 1, 4),
(2, 'Tepung', 15000, 897987, 15000, 500, 1, 2, 2, 1),
(3, 'Baju', 30000, 736328, 30000, 200, 2, 1, 3, 2),
(4, 'Kuaci', 12000, 378284, 12000, 300, 3, 3, 4, 4),
(5, 'Celana Panjang', 40000, 324224, 40000, 200, 2, 1, 2, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(8) NOT NULL,
  `name` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `name`) VALUES
(1, 'Bahan Mentah'),
(2, 'Pakaian'),
(3, 'Makanan Ringan'),
(4, 'Properti'),
(5, 'bahan bangunan'),
(12, 'Cemilan'),
(14, 'elektronik'),
(15, 'Minuman'),
(16, 'Liter');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kustomer`
--

CREATE TABLE `kustomer` (
  `id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `email` char(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kustomer`
--

INSERT INTO `kustomer` (`id`, `nik`, `name`, `telp`, `email`, `alamat`) VALUES
(1, 61100, 'Riyan', 'Jln pemuda. Gg 5. No', '085566778899', 'riyan@gmail.com'),
(2, 304400, 'Aldi', 'Jln pemuda. Gg 5. no', '086655443322', 'Aldi@gmail.com'),
(3, 775544, 'Amat', 'Jln sudirman Gg 10', '082255662211', 'Amat@gmail.com'),
(4, 332200, 'Adul', 'Jln mahakam. Gg 6. n', '081155779912', 'Adul@gmail.com'),
(5, 112233, 'Asep', 'Jln pinggir banyu. n', '086677778811', 'Asep@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(8) NOT NULL,
  `invoice` int(20) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `bayar` bigint(11) DEFAULT NULL,
  `diskripsi` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `supplier_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id`, `invoice`, `total`, `bayar`, `diskripsi`, `tanggal`, `supplier_id`, `user_id`) VALUES
(1, 324352, 50000, 50000, 'Minyak Goreng', '2024-05-05', 1, 1),
(2, 657533, 80000, 80000, 'Celana Panjang', '2023-07-23', 3, 4),
(3, 765354, 36000, 36000, 'Kuaci', '2023-03-30', 4, 1),
(4, 548275, 60000, 60000, 'baju', '2023-01-22', 3, 4),
(5, 234231, 75000, 75000, 'Tepung', '2020-02-10', 2, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_detail`
--

CREATE TABLE `pembelian_detail` (
  `id` int(8) NOT NULL,
  `Barang_id` int(8) DEFAULT NULL,
  `pembelian_id` int(8) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `qty` int(10) DEFAULT NULL,
  `Subtotal` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembelian_detail`
--

INSERT INTO `pembelian_detail` (`id`, `Barang_id`, `pembelian_id`, `harga`, `qty`, `Subtotal`) VALUES
(1, 1, 1, 25000, 2, 50000),
(2, 2, 5, 15000, 5, 75000),
(3, 3, 4, 30000, 2, 60000),
(4, 4, 3, 12000, 3, 36000),
(5, 5, 2, 40000, 2, 80000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(8) NOT NULL,
  `invoice` int(20) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `bayar` bigint(11) DEFAULT NULL,
  `kembali` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `kostumer_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`id`, `invoice`, `total`, `bayar`, `kembali`, `tanggal`, `kostumer_id`, `user_id`) VALUES
(1, 234231, 50000, 50000, 0, '2024-05-05', 3, 1),
(2, 345232, 80000, 80000, 0, '2023-07-23', 5, 4),
(3, 543432, 36000, 36000, 0, '2023-03-30', 2, 1),
(4, 564343, 60000, 60000, 0, '2023-01-22', 2, 4),
(5, 987676, 75000, 75000, 0, '2020-02-10', 4, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan_detail`
--

CREATE TABLE `penjualan_detail` (
  `id` int(8) NOT NULL,
  `Barang_id` int(8) DEFAULT NULL,
  `Penjual_id` int(8) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `qty` int(10) DEFAULT NULL,
  `Subtotal` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penjualan_detail`
--

INSERT INTO `penjualan_detail` (`id`, `Barang_id`, `Penjual_id`, `harga`, `qty`, `Subtotal`) VALUES
(1, 1, 1, 25000, 2, 50000),
(2, 2, 5, 15000, 5, 75000),
(3, 3, 4, 30000, 2, 60000),
(4, 4, 3, 12000, 3, 36000),
(5, 5, 2, 40000, 2, 80000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `satuan`
--

CREATE TABLE `satuan` (
  `id` int(8) NOT NULL,
  `name` char(100) DEFAULT NULL,
  `diskripsi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `satuan`
--

INSERT INTO `satuan` (`id`, `name`, `diskripsi`) VALUES
(1, 'pcs', 'untuk pakaian'),
(2, 'kg', 'untuk bahan mentah'),
(3, 'buah', 'untuk benda'),
(4, 'm', 'untuk ukuran'),
(5, 'cm', 'untuk ukuran'),
(7, 'Liter', 'ukuran air');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id` int(8) NOT NULL,
  `nik` char(16) DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `perusahaan` varchar(150) DEFAULT NULL,
  `nama_bank` varchar(150) DEFAULT NULL,
  `nama_akun_bank` varchar(150) DEFAULT NULL,
  `no_akun_bank` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id`, `nik`, `name`, `telp`, `email`, `alamat`, `perusahaan`, `nama_bank`, `nama_akun_bank`, `no_akun_bank`) VALUES
(1, '774455', 'Jojo', '089595123425', 'Jln Jepang. Gg 6. no7', 'jojo@gmail.com', 'PT.Minyak', 'BNI', 'Jojo', '1100'),
(2, '332211', 'Gojo', '082342453352', 'Jln Jawa. Gg 6. no.1', 'Gojo@gmail.com', 'PT.Bahan Baku', 'BRI', 'Gojo', '2200'),
(3, '660077', 'Putri', '087747235987', 'Jln Jawa. Gg 6. no.6', 'Putri@gmail.com', 'PT. Belanja', 'BNI', 'Putri', '0077'),
(4, '552255', 'Bunga', '089323429142', 'Jln Pinggir Laut. no 6', 'Bunga@gmail.com', 'PT. Makanan Ringan', 'BNI', 'Bunga', '4421'),
(5, '113399', 'susanto', '086347354533', 'Jln jauh. no 23', 'susanto@gmail.com', 'PT. Belanja', 'Syariah', 'susanto', '5244');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(8) NOT NULL,
  `NIK` char(16) DEFAULT NULL,
  `Username` char(100) DEFAULT NULL,
  `Full_name` char(150) DEFAULT NULL,
  `Password` char(255) DEFAULT NULL,
  `role` char(20) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `is_active` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `NIK`, `Username`, `Full_name`, `Password`, `role`, `Email`, `Address`, `telp`, `is_active`) VALUES
(1, '062200', 'Dina', 'Dina Lestari', '205500', 'Penjual', 'Dina@gmail.com', 'Jln Kalimantan. Gg 2. no 2', '089977665511', 'active'),
(2, '403300', 'Dio', 'Dio hoho', '009977', 'admin', 'Dio@gmail.com', 'Jln Jawa. Gg 3. no.14', '089696776551', 'active'),
(3, '774455', 'Jojo', 'jojo', '888001', 'supplier', 'jojo@gmail.com', 'Jln Jepang. Gg 6. no7', '089595123425', 'active'),
(4, '002233', 'Taiju', 'Taiju Okki Jelly Drink', '552233', 'Penjual', 'Taiju@gmail.com', 'Jln Kalimantan. Gg 5. no 10', '089793439621', 'active'),
(5, '332211', 'Gojo', 'Gojo Satoru', '111122', 'supplier', 'Gojo@gmail.com', 'Jln Jawa. Gg 6. no.1', '082342453352', 'active');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Kategori_id` (`Kategori_id`),
  ADD KEY `Supplier_id` (`Supplier_id`),
  ADD KEY `Satuan_id` (`Satuan_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kustomer`
--
ALTER TABLE `kustomer`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indeks untuk tabel `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Barang_id` (`Barang_id`),
  ADD KEY `pembelian_id` (`pembelian_id`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kostumer_id` (`kostumer_id`);

--
-- Indeks untuk tabel `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Barang_id` (`Barang_id`),
  ADD KEY `Penjual_id` (`Penjual_id`);

--
-- Indeks untuk tabel `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `kustomer`
--
ALTER TABLE `kustomer`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`Kategori_id`) REFERENCES `kategori` (`id`),
  ADD CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`Supplier_id`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `barang_ibfk_3` FOREIGN KEY (`Satuan_id`) REFERENCES `satuan` (`id`),
  ADD CONSTRAINT `barang_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ketidakleluasaan untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`);

--
-- Ketidakleluasaan untuk tabel `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  ADD CONSTRAINT `pembelian_detail_ibfk_1` FOREIGN KEY (`Barang_id`) REFERENCES `barang` (`ID`),
  ADD CONSTRAINT `pembelian_detail_ibfk_2` FOREIGN KEY (`pembelian_id`) REFERENCES `pembelian` (`id`);

--
-- Ketidakleluasaan untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`kostumer_id`) REFERENCES `kustomer` (`id`);

--
-- Ketidakleluasaan untuk tabel `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD CONSTRAINT `penjualan_detail_ibfk_1` FOREIGN KEY (`Barang_id`) REFERENCES `barang` (`ID`),
  ADD CONSTRAINT `penjualan_detail_ibfk_2` FOREIGN KEY (`Penjual_id`) REFERENCES `penjualan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
