-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2024 at 11:03 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `study`
--

-- --------------------------------------------------------

--
-- Table structure for table `forum`
--

CREATE TABLE `forum` (
  `ID_forum` int(11) NOT NULL,
  `ID_pelajar` int(11) NOT NULL,
  `Judul_diskusi` varchar(100) NOT NULL,
  `Konten_diskusi` text NOT NULL,
  `Tanggal_post` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hasil_quiz`
--

CREATE TABLE `hasil_quiz` (
  `ID_hasil` int(11) NOT NULL,
  `ID_pelajar` int(11) NOT NULL,
  `ID_soal` int(11) NOT NULL,
  `Jawaban` char(1) NOT NULL,
  `Status_jawaban` tinyint(1) NOT NULL,
  `Tanggal_dikerjakan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `ID_komentar` int(11) NOT NULL,
  `ID_forum` int(11) NOT NULL,
  `ID_pelajar` int(11) NOT NULL,
  `Konten_komentar` text NOT NULL,
  `Tanggal_komentar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `ID_materi` int(11) NOT NULL,
  `Judul_materi` varchar(100) NOT NULL,
  `Deskripsi` text DEFAULT NULL,
  `Kategori` varchar(50) NOT NULL,
  `Tingkat_kesulitan` enum('Mudah','Sedang','Sulit') NOT NULL,
  `Tanggal_dibuat` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `materi`
--

INSERT INTO `materi` (`ID_materi`, `Judul_materi`, `Deskripsi`, `Kategori`, `Tingkat_kesulitan`, `Tanggal_dibuat`) VALUES
(13001, 'Pantun', 'Bermanfaat', 'Bahasa Indonesia', 'Mudah', '1998-08-07');

-- --------------------------------------------------------

--
-- Table structure for table `pelajar`
--

CREATE TABLE `pelajar` (
  `ID_pelajar` int(11) NOT NULL,
  `Nama_Pelajar` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Tanggal_lahir` date NOT NULL,
  `Jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `Kelas` varchar(50) NOT NULL,
  `Sekolah` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelajar`
--

INSERT INTO `pelajar` (`ID_pelajar`, `Nama_Pelajar`, `Email`, `Password`, `Tanggal_lahir`, `Jenis_kelamin`, `Kelas`, `Sekolah`) VALUES
(12001, 'Tony Stark', 'tonystark@gmail.com', 'andiamironman', '2007-02-14', 'Laki-laki', '6', 'SD Marvel 2'),
(12002, 'Steve Rogers', 'steverogers@gmail.com', 'Captainamerika', '2009-07-17', 'Laki-laki', '4', 'SD Marvel 1'),
(12003, 'Natasha Romanoff', 'natasharomanoff@gmail.com', 'blackwidow', '2009-04-01', 'Perempuan', '4', 'SD Marvel 1'),
(12004, 'T\'Challa Sihotang', 'tchallasihotang@gmail.com', 'blackpanther', '2008-06-30', 'Laki-laki', '5', 'SD Wakanda 1'),
(12005, 'Wanda Maximoff', 'wandamaximoff@gmail.com', 'Wandavisionwitch', '2010-07-01', 'Perempuan', '3', 'SD Marvel 2'),
(12006, 'Thor Odinson ', 'thorodinson@gmail.com', 'thorthedarkworld', '2010-10-06', 'Laki-laki', '3', 'SD Asgard 2'),
(12007, 'Carol Danvers', 'caroldanvers@gmail.com', 'kaptenmarvel', '2008-04-09', 'Perempuan', '5', 'SD Marvel 3'),
(12008, 'Shuri Sidabutar', 'shurisidabutar@gmail.com', 'wakandaforever', '2007-01-22', 'Perempuan', '6', 'SD Wakanda 1'),
(12009, 'M\'Baku Sinaga', 'mbakusinaga@gmail.com', 'dutawakanda77', '2010-08-17', 'Laki-laki', '3', 'SD Wakanda 2');

-- --------------------------------------------------------

--
-- Table structure for table `progress_belajar`
--

CREATE TABLE `progress_belajar` (
  `ID_progress` int(11) NOT NULL,
  `ID_pelajar` int(11) NOT NULL,
  `ID_materi` int(11) NOT NULL,
  `Status` enum('Belum Dimulai','Dalam Progres','Selesai') NOT NULL,
  `Tanggal_mulai` date DEFAULT NULL,
  `Tanggal_selesai` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `progress_belajar`
--

INSERT INTO `progress_belajar` (`ID_progress`, `ID_pelajar`, `ID_materi`, `Status`, `Tanggal_mulai`, `Tanggal_selesai`) VALUES
(14001, 12003, 13001, 'Belum Dimulai', '2018-08-09', '2018-08-10');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `ID_soal` int(11) NOT NULL,
  `ID_materi` int(11) NOT NULL,
  `Pertanyaan` text NOT NULL,
  `Jawaban_benar` char(1) NOT NULL,
  `Penjelasan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`ID_forum`),
  ADD KEY `ID_pelajar` (`ID_pelajar`);

--
-- Indexes for table `hasil_quiz`
--
ALTER TABLE `hasil_quiz`
  ADD PRIMARY KEY (`ID_hasil`),
  ADD KEY `ID_pelajar` (`ID_pelajar`),
  ADD KEY `ID_soal` (`ID_soal`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`ID_komentar`),
  ADD KEY `ID_forum` (`ID_forum`),
  ADD KEY `ID_pelajar` (`ID_pelajar`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`ID_materi`);

--
-- Indexes for table `pelajar`
--
ALTER TABLE `pelajar`
  ADD PRIMARY KEY (`ID_pelajar`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `progress_belajar`
--
ALTER TABLE `progress_belajar`
  ADD PRIMARY KEY (`ID_progress`),
  ADD KEY `ID_pelajar` (`ID_pelajar`),
  ADD KEY `ID_materi` (`ID_materi`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`ID_soal`),
  ADD KEY `ID_materi` (`ID_materi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `forum`
--
ALTER TABLE `forum`
  MODIFY `ID_forum` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hasil_quiz`
--
ALTER TABLE `hasil_quiz`
  MODIFY `ID_hasil` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `ID_komentar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
  MODIFY `ID_materi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13002;

--
-- AUTO_INCREMENT for table `pelajar`
--
ALTER TABLE `pelajar`
  MODIFY `ID_pelajar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12010;

--
-- AUTO_INCREMENT for table `progress_belajar`
--
ALTER TABLE `progress_belajar`
  MODIFY `ID_progress` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14002;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `ID_soal` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `forum`
--
ALTER TABLE `forum`
  ADD CONSTRAINT `forum_ibfk_1` FOREIGN KEY (`ID_pelajar`) REFERENCES `pelajar` (`ID_pelajar`);

--
-- Constraints for table `hasil_quiz`
--
ALTER TABLE `hasil_quiz`
  ADD CONSTRAINT `hasil_quiz_ibfk_1` FOREIGN KEY (`ID_pelajar`) REFERENCES `pelajar` (`ID_pelajar`),
  ADD CONSTRAINT `hasil_quiz_ibfk_2` FOREIGN KEY (`ID_soal`) REFERENCES `quiz` (`ID_soal`);

--
-- Constraints for table `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`ID_forum`) REFERENCES `forum` (`ID_forum`),
  ADD CONSTRAINT `komentar_ibfk_2` FOREIGN KEY (`ID_pelajar`) REFERENCES `pelajar` (`ID_pelajar`);

--
-- Constraints for table `progress_belajar`
--
ALTER TABLE `progress_belajar`
  ADD CONSTRAINT `progress_belajar_ibfk_1` FOREIGN KEY (`ID_pelajar`) REFERENCES `pelajar` (`ID_pelajar`),
  ADD CONSTRAINT `progress_belajar_ibfk_2` FOREIGN KEY (`ID_materi`) REFERENCES `materi` (`ID_materi`);

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`ID_materi`) REFERENCES `materi` (`ID_materi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
