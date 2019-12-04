-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 04, 2019 at 09:35 PM
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
CREATE DATABASE IF NOT EXISTS `quizdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `quizdb`;

-- --------------------------------------------------------

--
-- Table structure for table `tabanswers`
--

CREATE TABLE IF NOT EXISTS `tabanswers` (
  `ansId` bigint(20) NOT NULL AUTO_INCREMENT,
  `ansTxt` text COLLATE latin1_general_ci NOT NULL,
  `ansQId` bigint(20) NOT NULL,
  `ansIsValid` tinyint(1) NOT NULL,
  PRIMARY KEY (`ansId`),
  KEY `ansQId` (`ansQId`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tabanswers`
--

INSERT INTO `tabanswers` (`ansId`, `ansTxt`, `ansQId`, `ansIsValid`) VALUES
(1, 'January and March', 1, 0),
(2, 'July and August', 1, 1),
(3, 'September and December', 1, 0),
(4, 'May and April', 1, 0),
(5, '11111', 2, 0),
(6, '99990', 2, 0),
(7, '99999', 2, 1),
(8, '90009', 2, 0),
(9, 'Green', 3, 0),
(10, 'Pink', 3, 1),
(11, 'Blue', 3, 0),
(12, 'Yellow', 3, 0),
(13, '4000 miles', 4, 1),
(14, '5000 km', 4, 0),
(15, '3000 miles', 4, 0),
(16, '9856 km', 4, 0),
(17, 'fifty two', 5, 0),
(18, 'twenty four', 5, 0),
(19, 'sixty five', 5, 0),
(20, 'fifty', 5, 1),
(21, 'Four stars', 6, 1),
(22, 'Two stars', 6, 0),
(23, 'Nine stars', 6, 0),
(24, 'Six stars', 6, 0),
(25, 'Oh, Canada! (Rideau Canal)', 7, 0),
(26, 'USA, sure USA, don\'t you know that? (The Wabash and Erie Canal)', 7, 0),
(27, 'Russia (White Sea Baltic Canal)', 7, 0),
(28, 'China (Beijing-Hangzhou Grand Canal)', 7, 1),
(29, 'Orca (killer whale)', 8, 1),
(30, 'Octopus (deep-sea octopuses)', 8, 0),
(31, 'Grand cachalot', 8, 0),
(32, 'Giant squid', 8, 0),
(33, 'Norway', 9, 0),
(34, 'Denmark', 9, 1),
(35, 'Iceland', 9, 0),
(36, 'United Kingdom', 9, 0),
(37, 'the Celsius ', 10, 0),
(38, 'the Fahrenheit', 10, 0),
(39, 'The Kelvin', 10, 1),
(40, 'The Rankine', 10, 0),
(41, 'Vitamin E', 11, 0),
(42, 'Vitamin A', 11, 1),
(43, 'Vitamin D', 11, 0),
(44, 'Vitamin XYZ', 11, 0),
(45, 'One extra pair of ribs', 12, 0),
(46, 'The wrist bone', 12, 0),
(47, 'The pinky toe phalanges ', 12, 0),
(48, 'The big toe', 12, 1),
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
(85, '80% of the world\'s supply of fresh cannabis comes from Canada!', 22, 0),
(86, '80% of the world\'s supply of crude oil  comes from Canada!', 22, 0),
(87, '80% of the world\'s supply of cranberries  comes from Canada!', 22, 0),
(88, '80% of the world\'s supply of maple syrup comes from Canada!', 22, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tabquestions`
--

CREATE TABLE IF NOT EXISTS `tabquestions` (
  `qId` bigint(20) NOT NULL AUTO_INCREMENT,
  `qTxt` text COLLATE latin1_general_ci NOT NULL,
  `qIsTaken` tinyint(1) NOT NULL,
  `qIsAnswered` tinyint(1) NOT NULL,
  `questionurl` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`qId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tabquestions`
--

INSERT INTO `tabquestions` (`qId`, `qTxt`, `qIsTaken`, `qIsAnswered`, `questionurl`) VALUES
(1, 'Which two months are named after Roman emperors?', 0, 0, 'https://player.vimeo.com/video/303102987'),
(2, 'What is the largest number of five digits?', 0, 0, 'https://player.vimeo.com/video/303102987'),
(3, 'What colour to do you get when you mix red and white?', 0, 0, 'https://player.vimeo.com/video/241087789'),
(4, 'How long is the Great Wall of China?', 0, 0, 'https://player.vimeo.com/video/241087789'),
(5, 'How many stars has the American flag got?', 0, 0, 'https://player.vimeo.com/video/241087842'),
(6, 'How many stars feature on the flag of New Zealand?', 0, 0, 'https://player.vimeo.com/video/241087842'),
(7, 'What country is home to the longest canal in the world?', 0, 0, 'https://player.vimeo.com/video/302832544'),
(8, 'Which marine animal is the only known natural predator of the great white shark?', 0, 0, 'https://player.vimeo.com/video/302832544'),
(9, 'Located approximately halfway between Iceland and Norway, the Faroe Islands are a territory of which country?', 0, 0, 'https://player.vimeo.com/video/241087805'),
(10, 'What is the primary unit of temperature measurement in the physical sciences?', 0, 0, 'https://player.vimeo.com/video/241087805'),
(11, 'A deficiency of what vitamin may lead to dry eyes and night blindness?', 0, 0, 'https://player.vimeo.com/video/241087805'),
(12, 'In the human body, what is the hallux?', 0, 0, 'https://player.vimeo.com/video/241087805'),
(13, 'WHAT IS CANADA\'S NATIONAL SPORT?', 0, 0, 'https://player.vimeo.com/video/303102987'),
(14, 'EAT UP! WHICH CITY HAS THE MOST RESTAURANTS PER CAPITA IN CANADA?', 0, 0, 'https://player.vimeo.com/video/303102987'),
(15, 'WHICH CANADIAN CITY RANKS AS THE MOST EDUCATED IN THE COUNTRY?', 0, 0, 'https://player.vimeo.com/video/241087789'),
(16, 'CANADA IS THE LARGEST EXPORTER OF WHAT SWEET LITTLE FRUIT?', 0, 0, 'https://player.vimeo.com/video/241087789'),
(17, 'WHAT IS CANADA\'S OLDEST CITY?', 0, 0, 'https://player.vimeo.com/video/241087842'),
(18, 'HOW MANY TIME ZONES DOES CANADA HAVE?', 0, 0, 'https://player.vimeo.com/video/241087842'),
(19, 'WHICH CANADIAN CITY HAS THE MOST TOURISTS?', 0, 0, 'https://player.vimeo.com/video/241087805'),
(20, 'ONLY ONE PROVINCE IS OFFICIALLY BILINGUAL, CAN YOU GUESS WHICH ONE?', 0, 0, 'https://player.vimeo.com/video/241087805'),
(21, 'HOW MANY OCEANS BORDER CANADA?', 0, 0, 'https://player.vimeo.com/video/302832544'),
(22, '80% OF THE WORLD\'S SUPPLY OF WHAT COMES FROM CANADA?', 0, 0, 'https://player.vimeo.com/video/302832544');

-- --------------------------------------------------------

--
-- Table structure for table `tabusers`
--

CREATE TABLE IF NOT EXISTS `tabusers` (
  `uId` bigint(20) NOT NULL AUTO_INCREMENT,
  `uIUN` text COLLATE latin1_general_ci NOT NULL,
  `uFName` text COLLATE latin1_general_ci NOT NULL,
  `uLName` text COLLATE latin1_general_ci NOT NULL,
  `uRetryCount` int(11) NOT NULL,
  `uTimer` int(11) NOT NULL,
  `uTotalScore` int(11) NOT NULL,
  `uIsFinished` tinyint(1) NOT NULL,
  `timestart` text COLLATE latin1_general_ci NOT NULL,
  `timefinish` text COLLATE latin1_general_ci NOT NULL,
  `listofquestions` text COLLATE latin1_general_ci NOT NULL,
  `comment` text COLLATE latin1_general_ci NOT NULL,
  `sessionId` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`uId`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tabusers`
--

INSERT INTO `tabusers` (`uId`, `uIUN`, `uFName`, `uLName`, `uRetryCount`, `uTimer`, `uTotalScore`, `uIsFinished`, `timestart`, `timefinish`, `listofquestions`, `comment`, `sessionId`) VALUES
(1, 'JohnDoe001', 'JohnDoe001', 'JohnDoe001', 1, 0, 2, 0, '12/02/2019 09:54:17', '', 'undefined q:8 q:1', '', 'fbc178d0-8d11-4cf8-bcfb-45e8935e4a6c'),
(2, 'JohnDoe001', 'JohnDoe001', 'JohnDoe001', 2, 0, 2, 0, '12/02/2019 09:55:24', '', ' q:5 q:8', '', '3ea04748-91e4-4b70-99b5-f520abdecd78'),
(3, 'JohnDoe001', 'JohnDoe001', 'JohnDoe001', 3, 0, 7, 1, '12/02/2019 10:05:45', '', ' q:12 q:4 q:6 q:3 q:2 q:8 q:11', '', '0610faf8-f690-483b-b336-c93bcd24fb34'),
(4, 'JohnDoe001', 'JohnDoe001', 'JohnDoe001', 4, 50, 7, 1, '12/02/2019 10:19:53', '12/02/2019 10:21:20', 'q:12; q:9; q:2; q:10; q:3; q:8; q:7; ', '1)Stars: 4 2)Likes: Really nice! I like this game! 3)Suggest: Would it be possible toa dd more fun?', '8069b9d0-821b-40af-a9f0-d0fa280a076a'),
(5, 'JohnDoe001', 'JohnDoe001', 'JohnDoe001', 5, 45, 7, 1, '12/02/2019 10:29:14', '12/02/2019 10:30:14', 'q:5; q:9; q:10; q:12; q:8; q:1; q:3; ', '1)Stars: 4 2)Likes: ty ht tyj   tyjyt 3)Suggest: ty jtyj tryj rjyehrth \nuiou', '9e71d6e6-68fe-4105-917e-fff518ae1a02'),
(6, 'JohnDoe001', 'JohnDoe001', 'JohnDoe001', 6, 50, 7, 1, '12/02/2019 10:33:16', '12/02/2019 10:34:12', 'q:12; q:2; q:6; q:1; q:10; q:9; q:4; ', '1)Stars: 4 2)Likes: tryr rtyrty  3)Suggest: rtyrty rty ', '2c9ecf70-e7c7-4f1e-bb9f-bf69a6a6fe51'),
(7, 'JohnDoe001', 'JohnDoe001', 'JohnDoe001', 7, 42, 7, 1, '12/02/2019 10:39:30', '12/02/2019 10:40:25', 'q:2; q:9; q:1; q:5; q:7; q:6; q:12; ', '1)Stars: 4 2)Likes: reter ytryyr  ytr  rtyrt 3)Suggest: r tyrtyr ty', '1270b229-ea9b-45a7-8623-6fcb9d9ce0da'),
(8, 'JohnDoe001', 'JohnDoe001', 'JohnDoe001', 8, 39, 7, 1, '12/02/2019 10:41:00', '12/02/2019 10:41:49', 'q:2; q:4; q:3; q:8; q:9; q:11; q:12; ', '1)Stars: 2 2)Likes: rthrtnotsofoo 3)Suggest: gdf', '593ec3d7-281f-4792-ab4b-900d9deba9b8'),
(9, 'JohnDoe001', 'JohnDoe001', 'JohnDoe001', 9, 0, 4, 0, '12/02/2019 11:08:16', '', 'q:9; q:5; q:8; q:11; ', '', 'f5e9348d-715f-4b01-a439-854a76dbff77'),
(10, 'JohnDoe001', 'JohnDoe001', 'JohnDoe001', 10, 0, 7, 1, '12/02/2019 11:18:08', '', 'q:7; q:9; q:4; q:11; q:3; q:5; q:1; ', '', 'b8ffc6ed-d352-4e78-b4b3-32c0a1932c3c'),
(11, 'Array', 'Array', 'Array', 1, 45, 7, 1, '12/02/2019 11:23:28', '12/02/2019 11:24:25', 'q:5; q:3; q:6; q:1; q:2; q:11; q:4; ', '1)Stars: 5 2)Likes: fg dfgh jhdhj  3)Suggest: d jhgjgj hk6 u67 ||dfgh s dg r ', '06160c58-cb83-4c80-9828-eed0216af82e'),
(12, '', '', '', 1, 0, 1, 0, '12/02/2019 11:28:01', '', 'q:4; ', 'Inserted: ', '2fb01ba1-f8f2-489d-9f20-87e4100552c7'),
(13, 'JAKSON5 ', 'JAKSON5 ', 'JAKSON5 ', 1, 0, 1, 0, '12/02/2019 11:31:26', '', 'q:6; ', 'Inserted: ', '3f3b8802-a6d0-4b34-9458-999cad80d9e3'),
(14, 'JAKSON5 ', 'JAKSON5 ', 'JAKSON5 ', 2, 0, 1, 0, '12/02/2019 13:31:43', '', 'q:3; ', 'Inserted: ', '806b54e3-8c41-4a3a-a862-bc0af0f42685'),
(15, 'JAKSON5 ', 'JAKSON5 ', 'JAKSON5 ', 3, 0, 1, 0, '12/02/2019 13:31:59', '', 'q:3; ', 'Inserted: ', '872a4537-18bf-448e-9676-61f8c7b6adaa'),
(16, 'JAKSON5 ', 'JAKSON5 ', 'JAKSON5 ', 4, 0, 1, 0, '12/02/2019 13:32:31', '', 'q:2; ', 'Inserted: ', '8755aff2-7952-4cca-8654-b6f84512d004'),
(17, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 1, 0, 2, 0, '12/02/2019 13:46:09', '', 'q:4; q:8; ', '', 'b875df2b-68aa-4ae9-b969-60f312692e3f'),
(18, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 2, 0, 3, 0, '12/02/2019 13:46:49', '', 'q:11; q:12; q:7; ', '', 'e5a6cb67-b277-4c24-8d62-82dccef7f7a7'),
(19, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 3, 0, 6, 0, '12/02/2019 14:38:39', '', 'q:11; q:4; q:6; q:3; q:1; q:8; ', '', '5746420a-dd22-4b47-8b14-b1473df6c89a'),
(20, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 4, 0, 1, 0, '12/02/2019 15:36:13', '', 'q:12; ', 'Inserted: ', '92a9a823-5d85-4a17-a554-0c6372e11358'),
(21, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 5, 0, 2, 0, '12/02/2019 15:37:23', '', 'q:2; q:4; ', '', 'c3826f6d-2672-4146-a977-2a8ee3747efd'),
(22, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 6, 48, 7, 1, '12/02/2019 15:38:00', '12/02/2019 15:39:06', 'q:2; q:10; q:7; q:11; q:3; q:6; q:8; ', '1)Stars: 5 2)Likes: dsfs 343 45 dfg d 3)Suggest: dfgfgdfgdf d    tert', '982a749d-af17-434b-8f27-e79b8ac60fcc'),
(23, 'ALEX2010 ', 'ALEX2010 ', 'ALEX2010 ', 1, 0, 1, 0, '12/02/2019 16:11:45', '', 'q:2; ', 'Inserted: ', '9e9e27ba-0f4b-4969-ba62-12910a13591e'),
(24, 'ALEX2010 ', 'ALEX2010 ', 'ALEX2010 ', 2, 0, 2, 0, '12/02/2019 16:14:55', '', 'q:9; q:2; ', '', 'afd3b714-ca40-4423-b33c-6c876c77736e'),
(25, 'ALEX2010 ', 'ALEX2010 ', 'ALEX2010 ', 3, 0, 1, 0, '12/02/2019 16:17:09', '', 'q:3; ', 'Inserted: ', '6e8f6d5b-f3c1-483e-94a2-2b1639725896'),
(26, 'ALEX2010 ', 'ALEX2010 ', 'ALEX2010 ', 4, 0, 5, 0, '12/02/2019 16:18:13', '', 'q:10; q:4; q:11; q:1; q:7; ', '', '1658191f-8cf3-4d6c-affd-ab0194c3d3aa'),
(27, 'ALEX2010 ', 'ALEX2010 ', 'ALEX2010 ', 5, 0, 3, 0, '12/02/2019 16:26:17', '', 'q:1; q:4; q:9; ', '', 'e04fb2ac-5842-4a75-a93e-db23c8daf3b9'),
(28, 'ALEX2010 ', 'ALEX2010 ', 'ALEX2010 ', 6, 95, 8, 1, '12/02/2019 16:48:04', '12/02/2019 16:49:51', 'q:11; q:2; q:3; q:4; q:1; q:12; q:7; q:5; ', '1)Stars: 5 2)Likes: asfsdf 3)Suggest: dgdfs 54 ', '9dc38320-2830-49b2-8a3f-5235163a0993'),
(29, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 7, 0, 2, 0, '12/02/2019 16:51:44', '', 'q:3; q:5; ', '', '18fdda80-f3be-4bbf-8851-d58c345576ff'),
(30, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 8, 0, 1, 0, '12/02/2019 17:00:47', '', 'q:12; ', 'Inserted: ', '83e798d6-47dc-4bcb-aba8-fcce9d3fde92'),
(31, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 9, 0, 1, 0, '12/02/2019 17:01:16', '', 'q:2; ', 'Inserted: ', 'cfd9391a-3041-4f71-b623-0ac262204fb0'),
(32, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 10, 0, 1, 0, '12/02/2019 17:03:01', '', 'q:10; ', 'Inserted: ', 'a8f64781-806f-44a8-a3ae-fe6a680a7a28'),
(33, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 11, 0, 3, 0, '12/02/2019 17:04:50', '', 'q:7; q:11; q:1; ', '', 'cf7047fd-7f37-4ce3-a830-edebac856fc5'),
(34, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 12, 0, 1, 0, '12/02/2019 17:07:25', '', 'q:12; ', 'Inserted: ', 'a7eb19cb-003a-4bf8-bc2b-76a7ac3c70f5'),
(35, 'MIKE2222 ', 'MIKE2222 ', 'MIKE2222 ', 1, 0, 1, 0, '12/03/2019 13:52:20', '', 'q:1; ', 'Inserted: ', 'f7e516b5-f0a8-4ff5-b608-c7958186f4ba'),
(36, 'MIKE2222 ', 'MIKE2222 ', 'MIKE2222 ', 2, 0, 1, 0, '12/03/2019 13:53:02', '', 'q:11; ', 'Inserted: ', 'eccecd6b-f034-479f-8339-dba51b3dcbd9'),
(37, 'MIKE2222 ', 'MIKE2222 ', 'MIKE2222 ', 3, 0, 2, 0, '12/03/2019 13:53:25', '', 'q:5; q:4; ', '', 'ce44029c-1fdc-44f5-b104-4d9b4bb81022'),
(38, 'ALEXTHEKING ', 'ALEXTHEKING ', 'ALEXTHEKING ', 1, 0, 1, 0, '12/04/2019 08:39:26', '', 'q:4; ', 'Inserted: ', '7d186624-f988-49b5-b442-565d08911b6c'),
(39, 'ALEXTHEKING ', 'ALEXTHEKING ', 'ALEXTHEKING ', 2, 71, 7, 1, '12/04/2019 08:40:14', '12/04/2019 08:41:41', 'q:3; q:8; q:10; q:7; q:4; q:11; q:5; ', '1)Stars: 4 2)Likes: 8fghfgjghj6 68 6 gj 3)Suggest: gjhk gj6 j 67 j6k', 'e9c43cb0-9b4d-4cef-8dde-1677626f1f59'),
(40, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 13, 47, 6, 1, '12/04/2019 10:21:07', '12/04/2019 10:21:54', 'q:3; q:10; q:6; q:7; q:12; q:5; ', '', '9ae1ed91-dd93-449d-a750-4dce42eb7c3e'),
(41, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 14, 0, 3, 0, '12/04/2019 12:01:28', '', 'q:13; q:19; q:7; ', '', '01c326da-6880-4c14-93c0-521c71f8b351'),
(42, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 15, 0, 1, 0, '12/04/2019 13:26:55', '', 'q:10; ', '', 'b7e2661e-b0be-4f5f-b8a3-2431b3e04c45'),
(43, 'KILLERWHALE1 ', 'KILLERWHALE1 ', 'KILLERWHALE1 ', 1, 73, 7, 1, '12/04/2019 13:32:42', '12/04/2019 13:34:02', 'q:12; q:18; q:15; q:6; q:14; q:5; q:20; ', '1)Stars: 5 2)Likes: 1 3)Suggest: 2', '4cfb294a-0a78-438f-8025-e20cd8b4a178');

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
