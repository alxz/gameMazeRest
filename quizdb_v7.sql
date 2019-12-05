-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 06, 2019 at 01:00 AM
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
  `ansTxtFRA` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ansId`),
  KEY `ansQId` (`ansQId`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tabanswers`
--

INSERT INTO `tabanswers` (`ansId`, `ansTxt`, `ansQId`, `ansIsValid`, `ansTxtFRA`) VALUES
(1, 'January and March', 1, 0, 'Janvier et mars'),
(2, 'July and August', 1, 1, 'Juillet et Aout'),
(3, 'September and December', 1, 0, 'Septembre et decembre'),
(4, 'May and April', 1, 0, 'mai et avril'),
(5, '11111', 2, 0, '11111'),
(6, '99990', 2, 0, '99990'),
(7, '99999', 2, 1, '99999'),
(8, '90009', 2, 0, '90009'),
(9, 'Green', 3, 0, 'Green'),
(10, 'Pink', 3, 1, 'Pink'),
(11, 'Blue', 3, 0, 'Blue'),
(12, 'Yellow', 3, 0, 'Yellow'),
(13, '4000 miles', 4, 1, '4000 miles'),
(14, '5000 km', 4, 0, '5000 km'),
(15, '3000 miles', 4, 0, '3000 miles'),
(16, '9856 km', 4, 0, '9856 km'),
(17, 'fifty two', 5, 0, 'fifty two'),
(18, 'twenty four', 5, 0, 'twenty four'),
(19, 'sixty five', 5, 0, 'soixante-cinq'),
(20, 'fifty', 5, 1, 'cinquante'),
(21, 'Four stars', 6, 1, 'Quatre etoiles'),
(22, 'Two stars', 6, 0, 'Deux etoiles'),
(23, 'Nine stars', 6, 0, 'Nine stars'),
(24, 'Six stars', 6, 0, 'Six stars'),
(25, 'Oh, Canada! (Rideau Canal)', 7, 0, 'Oh, Canada! (Rideau Canal)'),
(26, 'USA, sure USA, don\'t you know that? (The Wabash and Erie Canal)', 7, 0, 'USA, sure USA, don\'t you know that? (The Wabash and Erie Canal)'),
(27, 'Russia (White Sea Baltic Canal)', 7, 0, 'Russia (White Sea Baltic Canal)'),
(28, 'China (Beijing-Hangzhou Grand Canal)', 7, 1, 'China (Beijing-Hangzhou Grand Canal)'),
(29, 'Orca (killer whale)', 8, 1, 'Orca (killer whale)'),
(30, 'Octopus (deep-sea octopuses)', 8, 0, 'Octopus (deep-sea octopuses)'),
(31, 'Grand cachalot', 8, 0, 'Grand cachalot'),
(32, 'Giant squid', 8, 0, 'Giant squid'),
(33, 'Norway', 9, 0, 'Norway'),
(34, 'Denmark', 9, 1, 'Denmark'),
(35, 'Iceland', 9, 0, 'Iceland'),
(36, 'United Kingdom', 9, 0, 'United Kingdom'),
(37, 'the Celsius ', 10, 0, 'the Celsius '),
(38, 'the Fahrenheit', 10, 0, 'the Fahrenheit'),
(39, 'The Kelvin', 10, 1, 'The Kelvin'),
(40, 'The Rankine', 10, 0, 'The Rankine'),
(41, 'Vitamin E', 11, 0, 'Vitamin E'),
(42, 'Vitamin A', 11, 1, 'Vitamin A'),
(43, 'Vitamin D', 11, 0, 'Vitamin D'),
(44, 'Vitamin XYZ', 11, 0, 'Vitamin XYZ'),
(45, 'One extra pair of ribs', 12, 0, 'One extra pair of ribs'),
(46, 'The wrist bone', 12, 0, 'The wrist bone'),
(47, 'The pinky toe phalanges ', 12, 0, 'Les phalanges au petit doigt'),
(48, 'The big toe', 12, 1, 'Grand orteil'),
(49, 'Ball Hockey and Soccer are our national sports', 13, 0, 'Le hockey-balle et le soccer sont nos sports nationaux'),
(50, 'Hockey and Lacrosse are our national sports', 13, 1, 'Le hockey et la crosse sont nos sports nationaux'),
(51, 'Chess and Ping-pong', 13, 0, 'Chess and Ping-pong'),
(52, 'Big tennis and Rugby are our national sports', 13, 0, 'Big tennis and Rugby are our national sports'),
(53, 'Ottawa', 14, 0, 'Ottawa'),
(54, 'Calgary', 14, 0, 'Calgary'),
(55, 'Montreal', 14, 1, 'Montreal'),
(56, 'Toronto', 14, 0, 'Toronto'),
(57, 'Ottawa', 15, 1, 'Ottawa'),
(58, 'Montreal', 15, 0, 'Montreal'),
(59, 'Calgary', 15, 0, 'Calgary'),
(60, 'Toronto', 15, 0, 'Toronto'),
(61, 'Blueberries', 16, 1, 'Blueberries'),
(62, 'Cranberries', 16, 0, 'Canneberges'),
(63, 'Figs', 16, 0, 'Figs'),
(64, 'Strawberries', 16, 0, 'Fraises'),
(65, 'Trois-Rivieres', 17, 0, 'Trois-Rivieres'),
(66, 'Quebec City', 17, 0, 'Quebec City'),
(67, 'Montreal', 17, 0, 'Montreal'),
(68, 'Newfoundland', 17, 1, 'Newfoundland'),
(69, 'There are six time zones across Canada', 18, 1, 'Il y a six fuseaux horaires au Canada'),
(70, 'There are five time zones across Canada', 18, 0, 'Il y a cinq fuseaux horaires au Canada'),
(71, 'There are four time zones across Canada', 18, 0, 'Il y a quatre fuseaux horaires au Canada'),
(72, 'There are three time zones across Canada', 18, 0, 'Il y a trois fuseaux horaires au Canada'),
(73, 'Toronto', 19, 1, 'Toronto'),
(74, 'Montreal', 19, 0, 'Montreal'),
(75, 'Quebec City', 19, 0, 'Quebec City'),
(76, 'Vancouver', 19, 0, 'Vancouver'),
(77, 'Quebec', 20, 0, 'Quebec'),
(78, 'New Brunswick', 20, 1, 'New Brunswick'),
(79, 'Prince Edward Island', 20, 0, 'Prince Edward Island'),
(80, 'Newfoundland', 20, 0, 'Newfoundland'),
(81, 'There are two oceans total', 21, 0, 'Il y a deux oceans au total'),
(82, 'There are three oceans total', 21, 1, 'Il y a trois oceans au total'),
(83, 'There are four oceans total', 21, 0, 'Il y a quatre oceans au total'),
(84, 'There is only one ocean and two more seas', 21, 0, 'Il n\'y a qu\'un ocean et deux autres mers'),
(85, '80% of the world\'s supply of fresh cannabis comes from Canada!', 22, 0, '80% de l\'offre mondiale de cannabis frais provient du Canada!'),
(86, '80% of the world\'s supply of crude oil  comes from Canada!', 22, 0, '80% de l\'approvisionnement mondial en petrole brut provient du Canada!'),
(87, '80% of the world\'s supply of cranberries  comes from Canada!', 22, 0, '80% of the world\'s supply of cranberries  comes from Canada!'),
(88, '80% of the world\'s supply of maple syrup comes from Canada!', 22, 1, '80% of the world\'s supply of maple syrup comes from Canada!');

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
  `qTxtFRA` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`qId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tabquestions`
--

INSERT INTO `tabquestions` (`qId`, `qTxt`, `qIsTaken`, `qIsAnswered`, `questionurl`, `qTxtFRA`) VALUES
(1, 'Which two months are named after Roman emperors?', 0, 0, 'https://player.vimeo.com/video/303102987', 'Quels deux mois sont nommes d\'apres les empereurs romains'),
(2, 'What is the largest number of five digits?', 0, 0, 'https://player.vimeo.com/video/303102987', 'What is the largest number of five digits'),
(3, 'What colour to do you get when you mix red and white?', 0, 0, 'https://player.vimeo.com/video/241087789', 'FRA: What colour to do you get when you mix red and white?'),
(4, 'How long is the Great Wall of China?', 0, 0, 'https://player.vimeo.com/video/241087789', 'FRA: How long is the Great Wall of China?'),
(5, 'How many stars has the American flag got?', 0, 0, 'https://player.vimeo.com/video/241087842', 'FRA: How many stars has the American flag got?'),
(6, 'How many stars feature on the flag of New Zealand?', 0, 0, 'https://player.vimeo.com/video/241087842', 'FRA: How many stars feature on the flag of New Zealand?'),
(7, 'What country is home to the longest canal in the world?', 0, 0, 'https://player.vimeo.com/video/302832544', 'FRA: Quel pays abrite le plus long canal du monde'),
(8, 'Which marine animal is the only known natural predator of the great white shark?', 0, 0, 'https://player.vimeo.com/video/302832544', 'FRA: Which marine animal is the only known natural predator of the great white shark?'),
(9, 'Located approximately halfway between Iceland and Norway, the Faroe Islands are a territory of which country?', 0, 0, 'https://player.vimeo.com/video/241087805', 'FRA: Located approximately halfway between Iceland and Norway, the Faroe Islands are a territory of which country?'),
(10, 'What is the primary unit of temperature measurement in the physical sciences?', 0, 0, 'https://player.vimeo.com/video/241087805', 'FRA: What is the primary unit of temperature measurement in the physical sciences?'),
(11, 'A deficiency of what vitamin may lead to dry eyes and night blindness?', 0, 0, 'https://player.vimeo.com/video/241087805', 'FRA: A deficiency of what vitamin may lead to dry eyes and night blindness?'),
(12, 'In the human body, what is the hallux?', 0, 0, 'https://player.vimeo.com/video/241087805', 'FRA: In the human body, what is the hallux?'),
(13, 'WHAT IS CANADA\'S NATIONAL SPORT?', 0, 0, 'https://player.vimeo.com/video/303102987', 'FRA: WHAT IS CANADA\'S NATIONAL SPORT?'),
(14, 'EAT UP! WHICH CITY HAS THE MOST RESTAURANTS PER CAPITA IN CANADA?', 0, 0, 'https://player.vimeo.com/video/303102987', 'FRA: EAT UP! WHICH CITY HAS THE MOST RESTAURANTS PER CAPITA IN CANADA?'),
(15, 'WHICH CANADIAN CITY RANKS AS THE MOST EDUCATED IN THE COUNTRY?', 0, 0, 'https://player.vimeo.com/video/241087789', 'FRA: WHICH CANADIAN CITY RANKS AS THE MOST EDUCATED IN THE COUNTRY?'),
(16, 'CANADA IS THE LARGEST EXPORTER OF WHAT SWEET LITTLE FRUIT?', 0, 0, 'https://player.vimeo.com/video/241087789', 'FRA: CANADA IS THE LARGEST EXPORTER OF WHAT SWEET LITTLE FRUIT?'),
(17, 'WHAT IS CANADA\'S OLDEST CITY?', 0, 0, 'https://player.vimeo.com/video/241087842', 'FRA: WHAT IS CANADA\'S OLDEST CITY?'),
(18, 'HOW MANY TIME ZONES DOES CANADA HAVE?', 0, 0, 'https://player.vimeo.com/video/241087842', 'FRA: Combien de zone temps le Canada a-t-il?'),
(19, 'WHICH CANADIAN CITY HAS THE MOST TOURISTS?', 0, 0, 'https://player.vimeo.com/video/241087805', 'FRA: WHICH CANADIAN CITY HAS THE MOST TOURISTS?'),
(20, 'ONLY ONE PROVINCE IS OFFICIALLY BILINGUAL, CAN YOU GUESS WHICH ONE?', 0, 0, 'https://player.vimeo.com/video/241087805', 'FRA: ONLY ONE PROVINCE IS OFFICIALLY BILINGUAL, CAN YOU GUESS WHICH ONE?'),
(21, 'HOW MANY OCEANS BORDER CANADA?', 0, 0, 'https://player.vimeo.com/video/302832544', 'FRA: HOW MANY OCEANS BORDER CANADA?'),
(22, '80% OF THE WORLD\'S SUPPLY OF WHAT COMES FROM CANADA?', 0, 0, 'https://player.vimeo.com/video/302832544', 'FRA: 80% OF THE WORLD\'S SUPPLY OF WHAT COMES FROM CANADA?');

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tabusers`
--

INSERT INTO `tabusers` (`uId`, `uIUN`, `uFName`, `uLName`, `uRetryCount`, `uTimer`, `uTotalScore`, `uIsFinished`, `timestart`, `timefinish`, `listofquestions`, `comment`, `sessionId`) VALUES
(1, 'MIKE2010 ', 'MIKE2010 ', 'MIKE2010 ', 1, 162, 9, 1, '12/05/2019 09:36:35', '12/05/2019 09:39:36', 'qT:17; qT:14; qT:9; qT:1; qT:10; qT:5; qT:11; qT:3; qT:13; ', '1)Stars: 5 2)Likes: !!qqq 3)Suggest: ddd', '86738b8e-15da-40f9-b77d-69a6ec50afc9'),
(2, 'MIKE2010 ', 'MIKE2010 ', 'MIKE2010 ', 2, 145, 10, 1, '12/05/2019 10:06:39', '12/05/2019 10:09:09', 'qT:12; qT:8; qT:14; qT:7; qT:22; qT:17; qT:18; qT:13; qT:2; qF:15; qT:15; ', '1)Stars: 5 2)Likes: ]] 3)Suggest: ]]', '1bf0f666-53ce-412b-a9a3-c84c369e1779'),
(3, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 1, 0, 1, 0, '12/05/2019 10:11:26', '', 'qT:8; ', 'Inserted: ', '89028d7c-8837-4dee-a8c4-7242477dea36'),
(4, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 2, 0, 2, 0, '12/05/2019 10:12:01', '', 'qT:16; qT:13; ', '', 'babd33a8-c5a8-4a4f-b891-5cbf091c687f'),
(5, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 3, 0, 2, 0, '12/05/2019 10:21:17', '', 'qT:14; qF:13; qT:13; ', '', '1fd35dbe-1649-43b3-a584-e20a8edb5603'),
(6, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 4, 0, 1, 0, '12/05/2019 10:23:47', '', 'qT:8; ', 'Inserted: ', 'e1465f0c-c8c4-4387-b7a7-8b5a4f0cb59b'),
(7, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 5, 0, 6, 0, '12/05/2019 11:09:30', '', 'qT:2; qT:8; qT:6; qT:22; qT:17; qT:18; ', '', '84909d28-68d0-4c10-8610-9f72d3e077ff'),
(8, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 6, 0, 0, 0, '12/05/2019 12:05:11', '', 'qF:2; ', 'Inserted: ', '5a7cf0d9-fd5d-4800-9860-f3ce7cb6e68c'),
(9, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 7, 81, 8, 1, '12/05/2019 12:05:48', '12/05/2019 12:07:55', 'qF:7; qT:7; qT:5; qT:18; qT:22; qT:8; qT:2; qF:3; qT:3; qT:9; ', '1)Stars: 5 2)Likes: sfsdf 3)Suggest: s', '9d92cb1e-216a-4609-8d29-f369dc445af2'),
(10, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 8, 81, 8, 1, '12/05/2019 12:05:48', '12/05/2019 12:07:55', 'qF:7; qT:7; qT:5; qT:18; qT:22; qT:8; qT:2; qF:3; qT:3; qT:9; ', '1)Stars: 5 2)Likes: sfsdf 3)Suggest: s', '9d92cb1e-216a-4609-8d29-f369dc445af2'),
(11, 'SPIDERMAN001 ', 'SPIDERMAN001 ', 'SPIDERMAN001 ', 1, 83, 8, 1, '12/05/2019 12:08:08', '12/05/2019 12:12:22', 'qT:15; qT:21; qT:17; qT:7; qT:8; qT:14; qT:10; qF:13; qT:13; ', '1)Stars: 0 2)Likes: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaere 3)Suggest: ', '23b152e8-fcfb-48b6-afc6-5e5a1270979b'),
(12, 'SPIDERMAN001 ', 'SPIDERMAN001 ', 'SPIDERMAN001 ', 2, 71, 8, 1, '12/05/2019 12:12:33', '12/05/2019 12:13:44', 'qT:7; qF:17; qT:17; qT:8; qT:3; qT:2; qT:11; qT:22; qT:9; ', '', 'd3554732-0a0d-48ea-81f5-b9a68493f285'),
(13, 'SPIDERMAN001 ', 'SPIDERMAN001 ', 'SPIDERMAN001 ', 3, 61, 9, 1, '12/05/2019 12:15:17', '12/05/2019 12:16:39', 'qT:13; qT:12; qT:21; qT:11; qT:10; qT:8; qT:7; qT:1; qT:14; ', '1)Stars: 5 2)Likes: Just right! 3)Suggest: Great games!', 'e822ed68-953f-4e4b-88dd-3ab0845cb99c'),
(14, 'MARYBROWN ', 'MARYBROWN ', 'MARYBROWN ', 1, 0, 2, 0, '12/05/2019 13:34:59', '', 'qT:13; qT:18; ', '', '8b61f008-ba52-4b01-9d08-359de76eb334'),
(15, 'UNKNOWN ', 'UNKNOWN ', 'UNKNOWN ', 1, 0, 0, 0, '12/05/2019 14:35:58', '', 'qF:15; ', 'Inserted: ', 'c9d398ef-cb00-4c6b-861b-ea0e80e4a766'),
(16, 'UNKNOWN ', 'UNKNOWN ', 'UNKNOWN ', 2, 116, 8, 1, '12/05/2019 14:37:13', '12/05/2019 14:39:11', 'qT:14; qT:13; qT:12; qT:4; qT:21; qT:18; qT:19; qT:15; ', '', 'aafb3b77-bcce-4d07-a3e8-ed3f503a6cea'),
(17, 'UNKNOWN ', 'UNKNOWN ', 'UNKNOWN ', 3, 0, 3, 0, '12/05/2019 14:51:57', '', 'qT:17; qT:14; qT:9; ', '', '1c5f8c6a-fb16-4acb-91a6-fa971d805c29'),
(18, 'UNKNOWN ', 'UNKNOWN ', 'UNKNOWN ', 4, 0, 1, 0, '12/05/2019 14:53:32', '', 'qT:20; ', 'Inserted: ', 'd7451b5c-59a3-4eb9-b488-0a03cfa61672'),
(19, 'UNKNOWN ', 'UNKNOWN ', 'UNKNOWN ', 5, 0, 1, 0, '12/05/2019 14:53:43', '', 'qT:9; ', 'Inserted: ', '4fafa92d-64e9-4392-b712-141850e28702'),
(20, 'UNKNOWN ', 'UNKNOWN ', 'UNKNOWN ', 6, 0, 0, 0, '12/05/2019 14:54:25', '', 'qF:8; ', 'Inserted: ', '01f168ff-3061-4a2b-ba4c-1670d82f1e34'),
(21, 'UNKNOWN ', 'UNKNOWN ', 'UNKNOWN ', 7, 0, 0, 0, '12/05/2019 14:57:04', '', 'qF:22; ', 'Inserted: ', '96fff8ca-bbf1-44bd-aadf-8944af225c1b'),
(22, 'UNKNOWN ', 'UNKNOWN ', 'UNKNOWN ', 8, 0, 2, 0, '12/05/2019 15:59:31', '', 'qF:16; qT:16; qT:14; ', '', '73025f78-7976-434e-b562-ef0bbdd67971'),
(23, 'UNKNOWN ', 'UNKNOWN ', 'UNKNOWN ', 9, 0, 2, 0, '12/05/2019 15:59:31', '', 'qF:16; qT:16; qT:14; ', '', '73025f78-7976-434e-b562-ef0bbdd67971'),
(24, 'UNKNOWN ', 'UNKNOWN ', 'UNKNOWN ', 10, 0, 1, 0, '12/05/2019 16:06:30', '', 'qT:15; ', 'Inserted: ', '479109bc-74ad-43ee-b644-24b28aabbc67'),
(25, 'UNKNOWN ', 'UNKNOWN ', 'UNKNOWN ', 11, 0, 1, 0, '12/05/2019 16:09:14', '', 'qT:4; ', 'Inserted: ', 'bfecb747-8651-4747-9271-196db4f1593c'),
(26, 'UNKNOWN ', 'UNKNOWN ', 'UNKNOWN ', 12, 0, 2, 0, '12/05/2019 16:14:07', '', 'qT:3; qT:11; ', '', '4a26d40a-513b-48c8-872b-8dc75c71591a'),
(27, 'UNKNOWN ', 'UNKNOWN ', 'UNKNOWN ', 13, 0, 2, 0, '12/05/2019 16:14:32', '', 'qF:20; qT:20; qF:19; qF:19; qT:19; qF:1; ', '', '55ea8150-236d-45e1-a979-16c023c6836b'),
(28, 'UNKNOWN ', 'UNKNOWN ', 'UNKNOWN ', 14, 0, 2, 0, '12/05/2019 16:14:32', '', 'qF:20; qT:20; qF:19; qF:19; qT:19; qF:1; ', '', '55ea8150-236d-45e1-a979-16c023c6836b'),
(29, 'UNKNOWN ', 'UNKNOWN ', 'UNKNOWN ', 15, 0, 4, 0, '12/05/2019 16:16:45', '', 'qT:6; qT:16; qT:19; qT:3; ', '', '939ec41e-711b-442a-b90d-5b237476c8a6'),
(30, 'ALEX10001 ', 'ALEX10001 ', 'ALEX10001 ', 1, 0, 1, 0, '12/05/2019 16:44:11', '', 'qT:1; ', 'Inserted: ', 'f506211d-27ca-4a76-8f15-60589d3adc2d'),
(31, 'ALEX10001 ', 'ALEX10001 ', 'ALEX10001 ', 2, 0, 3, 0, '12/05/2019 16:53:25', '', 'qF:17; qT:10; qT:17; qT:19; ', '', 'b02c8f95-134d-4aab-8007-298946d1756d'),
(32, 'ALEX10001 ', 'ALEX10001 ', 'ALEX10001 ', 3, 0, 3, 0, '12/05/2019 16:53:25', '', 'qF:17; qT:10; qT:17; qT:19; ', '', 'b02c8f95-134d-4aab-8007-298946d1756d'),
(33, 'ALEX10001 ', 'ALEX10001 ', 'ALEX10001 ', 4, 0, 0, 0, '12/05/2019 16:55:06', '', 'qF:15; ', 'Inserted: ', 'e986877e-daa9-4f43-9655-62c41637e7c4');

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
