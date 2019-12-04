-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 04, 2019 at 08:23 PM
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
-- Table structure for table `tabanswers`
--

CREATE TABLE `tabanswers` (
  `ansId` bigint(20) NOT NULL,
  `ansTxt` text COLLATE latin1_general_ci NOT NULL,
  `ansQId` bigint(20) NOT NULL,
  `ansIsValid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tabanswers`
--

INSERT INTO `tabanswers` (`ansId`, `ansTxt`, `ansQId`, `ansIsValid`) VALUES
(49, 'Ball Hockey and Soccer are our national sports', 13, 0),
(50, 'Hockey and Lacrosse are our national sports', 13, 1),
(51, 'Chess and Ping-pong', 13, 0),
(52, 'Big tennis and Rugby are our national sports', 13, 0),
(53, 'Ottawa', 14, 0),
(54, 'Calgary', 14, 0),
(55, 'Montreal', 14, 1),
(56, 'Toronto', 14, 0),
(57, 'Ottawa', 15, 1),
(58, 'Montreal', 15, 0),
(59, 'Calgary', 15, 0),
(60, 'Toronto', 15, 0),
(61, 'Blueberries', 16, 1),
(62, 'Cranberries', 16, 0),
(63, 'Figs', 16, 0),
(64, 'Strawberries', 16, 0),
(65, 'Trois-Rivières', 17, 0),
(66, 'Quebec City', 17, 0),
(67, 'Montreal', 17, 0),
(68, 'Newfoundland', 17, 1),
(69, 'There are six time zones across Canada', 18, 1),
(70, 'There are five time zones across Canada', 18, 0),
(71, 'There are four time zones across Canada', 18, 0),
(72, 'There are three time zones across Canada', 18, 0),
(73, 'Toronto', 19, 1),
(74, 'Montreal', 19, 0),
(75, 'Quebec City', 19, 0),
(76, 'Vancouver', 19, 0),
(77, 'Quebec', 20, 0),
(78, 'New Brunswick', 20, 1),
(79, 'Prince Edward Island', 20, 0),
(80, 'Newfoundland', 20, 0),
(81, 'There are two oceans total', 21, 0),
(82, 'There are three oceans total', 21, 1),
(83, 'There are four oceans total', 21, 0),
(84, 'There is only one ocean and two more seas', 21, 0),
(85, '80% of the world’s supply of fresh cannabis comes from Canada!', 22, 0),
(86, '80% of the world’s supply of crude oil  comes from Canada!', 22, 0),
(87, '80% of the world’s supply of cranberries  comes from Canada!', 22, 0),
(88, '80% of the world’s supply of maple syrup comes from Canada!', 22, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tabanswers`
--
ALTER TABLE `tabanswers`
  ADD PRIMARY KEY (`ansId`),
  ADD KEY `ansQId` (`ansQId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tabanswers`
--
ALTER TABLE `tabanswers`
  MODIFY `ansId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tabanswers`
--
ALTER TABLE `tabanswers`
  ADD CONSTRAINT `tabanswers_ibfk_1` FOREIGN KEY (`ansQId`) REFERENCES `tabquestions` (`qId`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
