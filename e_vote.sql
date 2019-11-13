-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 02, 2019 at 12:33 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_vote`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_admin`
--

CREATE TABLE `t_admin` (
  `id_admin` tinyint(1) NOT NULL,
  `username` varchar(35) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_admin`
--

INSERT INTO `t_admin` (`id_admin`, `username`, `fullname`, `password`) VALUES
(1, 'admin', 'administrator', '$2y$10$5ok3rcIOv/yNIlPIGo49a.cXRAiA5ZsnxbpijFoyy5EuuYyVrZetu');

-- --------------------------------------------------------

--
-- Table structure for table `t_kandidat`
--

CREATE TABLE `t_kandidat` (
  `id_kandidat` smallint(4) NOT NULL,
  `nama_calon` varchar(50) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `visi` varchar(255) NOT NULL,
  `misi` varchar(255) NOT NULL,
  `suara` smallint(4) NOT NULL DEFAULT 0,
  `periode` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_kandidat`
--

INSERT INTO `t_kandidat` (`id_kandidat`, `nama_calon`, `foto`, `visi`, `misi`, `suara`, `periode`) VALUES
(8, 'AGUS SUFIAN', '0.96363900 1540548201(1).png', ' Guru Produktif', 'SMK Nusa Bangsa', 0, '2019/2020'),
(9, 'LINUX', '0.74913700 1572453604.png', 'FREE', 'OPEN SOURCE', 0, '2019/2020'),
(11, 'RAJA UBUR-UBUR', '0.83961900 1540548245(1).jpg', 'Lautan', 'Spongebob', 0, '2019/2020');

-- --------------------------------------------------------

--
-- Table structure for table `t_kelas`
--

CREATE TABLE `t_kelas` (
  `id_kelas` varchar(3) NOT NULL,
  `nama_kelas` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_kelas`
--

INSERT INTO `t_kelas` (`id_kelas`, `nama_kelas`) VALUES
('K01', 'X - IPA'),
('K02', 'X - IPS'),
('K03', 'XI - IPA'),
('K04', 'XI - IPS'),
('K05', 'XII - IPA'),
('K06', 'XII - IPS A'),
('K07', 'XII - IPS B'),
('K1', 'Guru');

-- --------------------------------------------------------

--
-- Table structure for table `t_pemilih`
--

CREATE TABLE `t_pemilih` (
  `nis` varchar(10) CHARACTER SET latin1 NOT NULL,
  `periode` varchar(9) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_user`
--

CREATE TABLE `t_user` (
  `id_user` varchar(10) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `id_kelas` varchar(3) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `pemilih` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`id_user`, `fullname`, `id_kelas`, `jk`, `pemilih`) VALUES
('17001', 'Adhika Nur Achmad Yunianto', 'K05', 'L', 'Y'),
('17002', 'Anis Supriyanto', 'K05', 'L', 'Y'),
('17003', 'Annida Nur Salsabila', 'K05', 'P', 'Y'),
('17004', 'Eny Sriwahyuni', 'K05', 'P', 'Y'),
('17005', 'Hana Fahrun Nisa’', 'K05', 'P', 'Y'),
('17006', 'Ida Maghfiroh', 'K05', 'P', 'Y'),
('17007', 'Irja Zalfana', 'K05', 'P', 'Y'),
('17008', 'Lutfi Hisyam Bahtiar', 'K05', 'L', 'Y'),
('17009', 'Marmi', 'K05', 'P', 'Y'),
('17010', 'Mia Sulistiani', 'K05', 'P', 'Y'),
('17011', 'Nabila Kartika Ningrum', 'K05', 'P', 'Y'),
('17012', 'Hanifatus Sya\'diyah', 'K05', 'P', 'Y'),
('17013', 'Ngindana Zulfa', 'K05', 'P', 'Y'),
('17014', 'Nur Lailatun', 'K05', 'P', 'Y'),
('17016', 'Sabina Aulia', 'K05', 'P', 'Y'),
('17017', 'Siti Maftuhah', 'K05', 'P', 'Y'),
('17018', 'Umi Ulfah', 'K05', 'P', 'Y'),
('17019', 'Wahyu Fika Maulida', 'K05', 'P', 'Y'),
('17020', 'Abdul Khamid', 'K06', 'L', 'Y'),
('17021', 'Afifudin', 'K06', 'L', 'Y'),
('17022', 'Ahmad Rif\'al Setiawan', 'K07', 'L', 'Y'),
('17080', 'Ali Ridho', 'K06', 'L', 'Y'),
('17023', 'Arina Chusnayani', 'K06', 'P', 'Y'),
('17024', 'Chintya Ardiani', 'K06', 'P', 'Y'),
('17025', 'Deni Wahyudi', 'K06', 'L', 'Y'),
('17085', 'Lailatus Sifa', 'K07', 'P', 'Y'),
('17026', 'Desi Linuryana', 'K07', 'P', 'Y'),
('17027', 'Eva Dian Ningsih', 'K06', 'P', 'Y'),
('17028', 'Fina Nur Fitriyani', 'K06', 'P', 'Y'),
('17029', 'Frengky Andreyanto', 'K07', 'L', 'Y'),
('17030', 'Hani Novianti', 'K06', 'P', 'Y'),
('17031', 'Heny Maulida', 'K07', 'P', 'Y'),
('17032', 'Iin Nurfiyana', 'K07', 'P', 'Y'),
('17035', 'Kiki Fatmawati', 'K06', 'P', 'Y'),
('17036', 'Laili Anisa Ramadhani', 'K06', 'P', 'Y'),
('17038', 'Lutfil Chakim', 'K06', 'L', 'Y'),
('17039', 'Muhammad Agus Setiawan', 'K06', 'L', 'Y'),
('17040', 'Muhammad Bagas Prasetyo', 'K06', 'L', 'Y'),
('17041', 'Muhammad Sholikin', 'K07', 'L', 'Y'),
('17042', 'Muhammad Abdul Basar', 'K06', 'L', 'Y'),
('17043', 'Muhammad Taufik', 'K06', 'L', 'Y'),
('17044', 'Nur Hidayatus Syafa\'ah', 'K07', 'P', 'Y'),
('17045', 'Nur Muhammad Ali Imron', 'K06', 'L', 'Y'),
('17046', 'Saidatul Wafiyah', 'K06', 'P', 'Y'),
('17086', 'Revita Aisia Putri', 'K06', 'P', 'Y'),
('17047', 'Siti Annisa', 'K06', 'P', 'Y'),
('17048', 'Siti Aslamiyah', 'K06', 'P', 'Y'),
('17049', 'Siti Sakdiyah', 'K06', 'P', 'Y'),
('17051', 'Suryanti', 'K06', 'P', 'Y'),
('17052', 'Achmad Sukron', 'K07', 'L', 'Y'),
('17055', 'Anang Ma\'arif', 'K07', 'L', 'Y'),
('17057', 'Heri Siswanto', 'K06', 'L', 'Y'),
('17058', 'Indah Sundari', 'K07', 'P', 'Y'),
('17059', 'Muhammad Latif Kurniawan', 'K07', 'L', 'Y'),
('17060', 'Muhammad Abdul Rouf', 'K07', 'L', 'Y'),
('17061', 'Muhammad Ainun Syaifudin', 'K06', 'L', 'Y'),
('17062', 'Muhammad Choirul Anwar', 'K07', 'L', 'Y'),
('17063', 'Muhammad Farid Hanafi', 'K07', 'L', 'Y'),
('17064', 'Muhammad Irsyad', 'K07', 'L', 'Y'),
('17066', 'Muhammad Khoirul Wafi', 'K07', 'L', 'Y'),
('17071', 'Nur Aisah', 'K07', 'P', 'Y'),
('17072', 'Nur Kholis', 'K06', 'L', 'Y'),
('17073', 'Rofiqotul Makkiyyah', 'K07', 'P', 'Y'),
('17074', 'Sartiyah', 'K07', 'P', 'Y'),
('17076', 'Teguh Raharjo', 'K07', 'L', 'Y'),
('17078', 'Widhi Wisnu Nugroho', 'K06', 'L', 'Y'),
('17079', 'Yuliyanti Rosita Dewi', 'K07', 'P', 'Y'),
('17081', 'Agung Dwi Kurniawan', 'K05', 'L', 'Y'),
('17083', 'Oliv Nur Cahyaninrum', 'K07', 'P', 'Y'),
('17084', 'Khasan Al Basri', 'K06', 'L', 'Y'),
('18001', 'Agung Jaya Rhomadon', 'K03', 'L', 'Y'),
('18002', 'Andre Aditya Nugraha', 'K04', 'L', 'Y'),
('18003', 'Annisa Nailun Najah Soraya', 'K03', 'P', 'Y'),
('18004', 'Atina Chifdhoh', 'K03', 'P', 'Y'),
('18005', 'Dewi Arum Sari', 'K03', 'P', 'Y'),
('18006', 'Diah Ambarwati', 'K03', 'P', 'Y'),
('18007', 'Lailatul Mukaromah', 'K03', 'P', 'Y'),
('18008', 'M. Haris Saifuddin', 'K03', 'L', 'Y'),
('18009', 'M. Nur Rokhim', 'K03', 'L', 'Y'),
('18010', 'Meivita Lufira Sari', 'K03', 'P', 'Y'),
('18011', 'Miftakhul Jannah', 'K03', 'P', 'Y'),
('18012', 'Muhammad Miftah Darussalam', 'K03', 'L', 'Y'),
('18013', 'Nadhifah', 'K03', 'P', 'Y'),
('18014', 'Nur Hidayah', 'K03', 'P', 'Y'),
('18015', 'Nur Ikhda Qurrotu\'Aini', 'K03', 'P', 'Y'),
('18016', 'Rajit Septian Hanafi', 'K04', 'L', 'Y'),
('18017', 'Rama Wijaya Santoso', 'K03', 'L', 'Y'),
('18018', 'Shintia Khusnul Arum', 'K03', 'P', 'Y'),
('18019', 'Siti Nur Hidayati', 'K03', 'P', 'Y'),
('18020', 'Siti Puji Istiqomah', 'K03', 'P', 'Y'),
('18021', 'Siti Zuliana Munawaroh', 'K03', 'P', 'Y'),
('18022', 'Tri Bowo Laksono', 'K03', 'L', 'Y'),
('18023', 'Ailenda Neretva Maulida Fitria', 'K04', 'P', 'Y'),
('18024', 'Ali Marzuki', 'K04', 'L', 'Y'),
('18025', 'Amru Naufal', 'K04', 'L', 'Y'),
('18026', 'Arya Faiq Ramadhan', 'K04', 'L', 'Y'),
('18027', 'Dimas Rizkyantoro', 'K04', 'L', 'Y'),
('18028', 'Faisal Rozak', 'K04', 'L', 'Y'),
('18030', 'Ferry Ma\'ruf Irfansyah', 'K04', 'L', 'Y'),
('18032', 'Muhammad Imam Safi\'i', 'K04', 'L', 'Y'),
('18034', 'Muhammad Zidan Ni\'am', 'K04', 'L', 'Y'),
('18035', 'Muhammad Ichsanul Hakim', 'K04', 'L', 'Y'),
('18036', 'Munaji', 'K04', 'L', 'Y'),
('18037', 'Nanang Afiansyah', 'K04', 'L', 'Y'),
('18038', 'Nunung Tri Utami', 'K03', 'P', 'Y'),
('18039', 'Nur Chalim', 'K04', 'L', 'Y'),
('18040', 'Nur Rokhim', 'K04', 'L', 'Y'),
('18041', 'Nurlia Septi Hidayati', 'K04', 'P', 'Y'),
('18042', 'Sarifatun Janatul Ulya', 'K04', 'P', 'Y'),
('18043', 'Siti Qoriyah', 'K04', 'P', 'Y'),
('18046', 'Hani Safitri', 'K04', 'P', 'Y'),
('18047', 'Nelly Agustin', 'K03', 'P', 'Y'),
('18048', 'Yulia Indah Kusuma Ningrum', 'K03', 'P', 'Y'),
('18049', 'Sofa Nur Rahmatika', 'K04', 'P', 'Y'),
('19001', 'Ahmad Viki Ainur Reza', 'K02', 'L', 'Y'),
('19002', 'Anjani Rahma', 'K01', 'P', 'Y'),
('19003', 'Aula Shofaha', 'K01', 'P', 'Y'),
('19004', 'Ayu Lestari', 'K01', 'P', 'Y'),
('19005', 'Diah Wulandari', 'K01', 'P', 'Y'),
('19006', 'Dinda Rahma Juwita', 'K01', 'P', 'Y'),
('19007', 'Gadis Laila Awalia', 'K01', 'P', 'Y'),
('19008', 'Hana Lailatul Jumuah', 'K01', 'P', 'Y'),
('19009', 'Ila Susilowati', 'K01', 'P', 'Y'),
('19010', 'Layinatu Shofa Marwa', 'K01', 'P', 'Y'),
('19011', 'Lisa Febriani', 'K01', 'P', 'Y'),
('19012', 'Luluk Fadhilah', 'K01', 'P', 'Y'),
('19013', 'Masdhoatul Khasanah', 'K01', 'P', 'Y'),
('19014', 'Nailil Munifah', 'K01', 'P', 'Y'),
('19015', 'Nikmatul Mudawamah', 'K01', 'P', 'Y'),
('19016', 'Nila Aflaha', 'K01', 'P', 'Y'),
('19017', 'Puji Lestari', 'K01', 'P', 'Y'),
('19018', 'Rifda Septiana P', 'K01', 'P', 'Y'),
('19019', 'Rinata', 'K01', 'P', 'Y'),
('19020', 'Risma Rahmawati', 'K01', 'P', 'Y'),
('19021', 'Siti Isrokhah', 'K01', 'P', 'Y'),
('19022', 'Wafiq Azizah', 'K01', 'P', 'Y'),
('19023', 'Widya Sofianing Tyas', 'K01', 'P', 'Y'),
('19024', 'Ahmad Agus Munib', 'K02', 'L', 'Y'),
('19025', 'Ahmad Muntaha', 'K02', 'L', 'Y'),
('19026', 'Aldi Saputra Nugroho', 'K02', 'L', 'Y'),
('19027', 'Arif Nur Ikhwan', 'K02', 'L', 'Y'),
('19028', 'Diyah Permatasari', 'K02', 'P', 'Y'),
('19029', 'Dzul Khoidah', 'K02', 'P', 'Y'),
('19030', 'Gita Restu Mara', 'K02', 'L', 'Y'),
('19031', 'Irdatul Karomah', 'K02', 'P', 'Y'),
('19033', 'Jumiati', 'K02', 'P', 'Y'),
('19034', 'Muhammad Iqbal Fahrizal', 'K02', 'L', 'Y'),
('19035', 'Muhammad Nugraha', 'K02', 'L', 'Y'),
('19036', 'Muhammad Albab', 'K02', 'L', 'Y'),
('19037', 'Muhammad Kholilur R.', 'K02', 'L', 'Y'),
('19038', 'Muhammad Thoha', 'K02', 'L', 'Y'),
('19039', 'M. Najiul Umam', 'K02', 'L', 'Y'),
('19040', 'Nailis Sofyati', 'K02', 'P', 'Y'),
('19041', 'Nurul Fitriyah', 'K02', 'P', 'Y'),
('19042', 'Siti Aminah', 'K02', 'P', 'Y'),
('19043', 'Bagas Misbakhul Munir', 'K02', 'L', 'Y'),
('19044', 'Muhammad Sholikhul Hadi', 'K02', 'L', 'Y'),
('19045', 'Edi Purwanto', 'K02', 'L', 'Y'),
('a1', 'Bapak Nurul Huda, S.Th.I., M.SI', 'K1', 'L', 'Y'),
('b2', 'Bapak Sugiyanto, S.Pd', 'K1', 'L', 'Y'),
('c3', 'Bapak Muhammad Arif, S.Pd.I', 'K1', 'L', 'Y'),
('d4', 'Bapak Sulistyo, S.Pd', 'K1', 'L', 'Y'),
('e5', 'Bapak Nur Kholis, S.Ag', 'K1', 'L', 'Y'),
('f6', 'Bapak Mahfudzi, S.Ag', 'K1', 'L', 'Y'),
('g7', 'Bapak K. Abdul Rouf', 'K1', 'L', 'Y'),
('h8', 'Bapak Nurdin Madjid, S.Pd', 'K1', 'L', 'Y'),
('i9', 'Ibu Afifah, SH', 'K1', 'P', 'Y'),
('j10', 'Bapak Zaenal Abidin, S.Ag', 'K1', 'L', 'Y'),
('k11', 'Bapak Muhammad Anwari, S.Pd', 'K1', 'L', 'Y'),
('l12', 'Nur Khofia, S.Pd', 'K1', 'P', 'Y'),
('m13', 'Ibu Lilik Puji Rahayu, S.Pd', 'K1', 'P', 'Y'),
('n14', 'Bapak Ahmad Safig Almahdi, S.Pd', 'K1', 'L', 'Y'),
('o15', 'Bapak Deddy Anggriawan, S.Pd', 'K1', 'L', 'Y'),
('p16', 'Ibu Idha Zuly Astutik, S.Pd', 'K1', 'P', 'Y'),
('q17', 'Bapak Fathul Hamim, S.Sos.I', 'K1', 'L', 'Y'),
('r18', 'Bapak M. EKo Aris Munandar, S.Pd', 'K1', 'L', 'Y'),
('s19', 'Bapak Abdul Kholiq, S.Pd.I', 'K1', 'L', 'Y'),
('t20', 'Bapak M. Kamal Majdi, S.Pd', 'K1', 'L', 'Y'),
('u21', 'Ibu Fitrie Amaelia, S.Pd', 'K1', 'P', 'Y');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_admin`
--
ALTER TABLE `t_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `t_kandidat`
--
ALTER TABLE `t_kandidat`
  ADD PRIMARY KEY (`id_kandidat`);

--
-- Indexes for table `t_kelas`
--
ALTER TABLE `t_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_admin`
--
ALTER TABLE `t_admin`
  MODIFY `id_admin` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_kandidat`
--
ALTER TABLE `t_kandidat`
  MODIFY `id_kandidat` smallint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
