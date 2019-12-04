-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 04, 2019 at 08:19 PM
-- Server version: 5.7.23
-- PHP Version: 7.0.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quizdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tabquestions`
--

CREATE TABLE `tabquestions` (
  `qId` bigint(20) NOT NULL,
  `qTxt` text COLLATE latin1_general_ci NOT NULL,
  `qIsTaken` tinyint(1) NOT NULL,
  `qIsAnswered` tinyint(1) NOT NULL,
  `questionurl` text COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tabquestions`
--

INSERT INTO `tabquestions` (`qId`, `qTxt`, `qIsTaken`, `qIsAnswered`, `questionurl`) VALUES
(13, 'WHAT IS CANADA’S NATIONAL SPORT?', 0, 0, 'https://player.vimeo.com/video/303102987'),
(14, 'EAT UP! WHICH CITY HAS THE MOST RESTAURANTS PER CAPITA IN CANADA?', 0, 0, 'https://player.vimeo.com/video/303102987'),
(15, 'WHICH CANADIAN CITY RANKS AS THE MOST EDUCATED IN THE COUNTRY?', 0, 0, 'https://player.vimeo.com/video/241087789'),
(16, 'CANADA IS THE LARGEST EXPORTER OF WHAT SWEET LITTLE FRUIT?', 0, 0, 'https://player.vimeo.com/video/241087789'),
(17, 'WHAT IS CANADA’S OLDEST CITY?', 0, 0, 'https://player.vimeo.com/video/241087842'),
(18, 'HOW MANY TIME ZONES DOES CANADA HAVE?', 0, 0, 'https://player.vimeo.com/video/241087842'),
(19, 'WHICH CANADIAN CITY HAS THE MOST TOURISTS?', 0, 0, 'https://player.vimeo.com/video/241087805'),
(20, 'ONLY ONE PROVINCE IS OFFICIALLY BILINGUAL, CAN YOU GUESS WHICH ONE?', 0, 0, 'https://player.vimeo.com/video/241087805'),
(21, 'HOW MANY OCEANS BORDER CANADA?', 0, 0, 'https://player.vimeo.com/video/302832544'),
(22, '80% OF THE WORLD’S SUPPLY OF WHAT COMES FROM CANADA?', 0, 0, 'https://player.vimeo.com/video/302832544');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tabquestions`
--
ALTER TABLE `tabquestions`
  ADD PRIMARY KEY (`qId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tabquestions`
--
ALTER TABLE `tabquestions`
  MODIFY `qId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
