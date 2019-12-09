-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 172.26.125.158:3306
-- Generation Time: Dec 09, 2019 at 03:30 PM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.2.14

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
(4, 'May and April', 1, 0, 'Mai et avril'),
(5, '11111', 2, 0, '11111'),
(6, '99990', 2, 0, '99990'),
(7, '99999', 2, 1, '99999'),
(8, '90009', 2, 0, '90009'),
(9, 'Green', 3, 0, 'Verte'),
(10, 'Pink', 3, 1, 'Rose'),
(11, 'Blue', 3, 0, 'Bleue'),
(12, 'Yellow', 3, 0, 'Jaune'),
(13, '4000 miles', 4, 1, '4000 miles'),
(14, '5000 km', 4, 0, '5000 km'),
(15, '3000 miles', 4, 0, '3000 miles'),
(16, '9856 km', 4, 0, '9856 km'),
(17, 'fifty two', 5, 0, 'cinquante-deux'),
(18, 'twenty four', 5, 0, 'vingt quatre'),
(19, 'sixty five', 5, 0, 'soixante-cinq'),
(20, 'fifty', 5, 1, 'cinquante'),
(21, 'Four stars', 6, 1, 'Quatre etoiles'),
(22, 'Two stars', 6, 0, 'Deux etoiles'),
(23, 'Nine stars', 6, 0, 'Neuf etoiles'),
(24, 'Six stars', 6, 0, 'Six etoiles'),
(25, 'Canada! (Rideau Canal)', 7, 0, 'La Canada! (Rideau Canal)'),
(26, 'USA, sure USA, don\'t you know that? (The Wabash and Erie Canal)', 7, 0, 'Les Etats-Unis, bien sur Les Etats-Unis, vous ne le savez pas? (The Wabash and Erie Canal)'),
(27, 'Russia (White Sea Baltic Canal)', 7, 0, 'La Russie (White Sea Baltic Canal)'),
(28, 'China (Beijing-Hangzhou Grand Canal)', 7, 1, 'La Chine (Beijing-Hangzhou Grand Canal)'),
(29, 'Orca (killer whale)', 8, 1, 'Orca (epaulard)'),
(30, 'Octopus (deep-sea octopuses)', 8, 0, 'Pieuvre (pieuvres profondes)'),
(31, 'Grand cachalot', 8, 0, 'Grand cachalot'),
(32, 'Giant squid', 8, 0, 'Calmar geant'),
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
(45, 'One extra pair of ribs', 12, 0, 'Une paire de cotes supplementaire'),
(46, 'The wrist bone', 12, 0, 'L\'os du poignet'),
(47, 'The pinky toe phalanges ', 12, 0, 'Les phalanges au petit doigt'),
(48, 'The big toe', 12, 1, 'Grand orteil'),
(49, 'Ball Hockey and Soccer are our national sports', 13, 0, 'Le hockey-balle et le soccer sont nos sports nationaux'),
(50, 'Hockey and Lacrosse are our national sports', 13, 1, 'Le hockey et la crosse sont nos sports nationaux'),
(51, 'Chess and Ping-pong', 13, 0, 'Echecs et Ping-Pong'),
(52, 'Big tennis and Rugby are our national sports', 13, 0, 'Le tennis et le rugby sont nos sports nationaux'),
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
(75, 'Quebec City', 19, 0, 'La ville de Quebec'),
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
(87, '80% of the world\'s supply of cranberries  comes from Canada!', 22, 0, '80% de l\'offre mondiale de canneberges provient du Canada!'),
(88, '80% of the world\'s supply of maple syrup comes from Canada!', 22, 1, '80% de la production mondiale de sirop d\'erable provient du Canada!');

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
(2, 'What is the largest number of five digits?', 0, 0, 'https://player.vimeo.com/video/303102987', 'Quel est le plus grand nombre de cinq chiffres'),
(3, 'What colour to do you get when you mix red and white?', 0, 0, 'https://player.vimeo.com/video/241087789', 'Quelle couleur obtenez-vous lorsque vous mélangez le rouge et le blanc?'),
(4, 'How long is the Great Wall of China?', 0, 0, 'https://player.vimeo.com/video/241087789', 'Quelle est la longueur de la grande muraille de Chine?'),
(5, 'How many stars has the American flag got?', 0, 0, 'https://player.vimeo.com/video/241087842', 'Combien d\'etoiles le drapeau americain a-t-il?'),
(6, 'How many stars feature on the flag of New Zealand?', 0, 0, 'https://player.vimeo.com/video/241087842', 'Combien d\'etoiles figurent sur le drapeau de la Nouvelle-Zelande?'),
(7, 'What country is home to the longest canal in the world?', 0, 0, 'https://player.vimeo.com/video/302832544', 'Dans quel pays le plus long canal du monde est situe?'),
(8, 'Which marine animal is the only known natural predator of the great white shark?', 0, 0, 'https://player.vimeo.com/video/302832544', 'Quel animal marin est le seul predateur naturel connu du grand requin blanc?'),
(9, 'Located approximately halfway between Iceland and Norway, the Faroe Islands are a territory of which country?', 0, 0, 'https://player.vimeo.com/video/241087805', 'Situees a peu pres a mi-chemin entre l\'Islande et la Norvege, les îles Feroe sont un territoire de quel pays?'),
(10, 'What is the primary unit of temperature measurement in the physical sciences?', 0, 0, 'https://player.vimeo.com/video/241087805', 'Quelle est l\'unite principale de mesure de la temperature en sciences physiques?'),
(11, 'A deficiency of what vitamin may lead to dry eyes and night blindness?', 0, 0, 'https://player.vimeo.com/video/241087805', 'Une carence en quelle vitamine peut entraîner des yeux secs et une cecite nocturne?'),
(12, 'In the human body, what is the hallux?', 0, 0, 'https://player.vimeo.com/video/241087805', 'Dans le corps humain, qu\'est-ce que l\'hallux?'),
(13, 'WHAT IS CANADA\'S NATIONAL SPORT?', 0, 0, 'https://player.vimeo.com/video/303102987', 'QU\'EST-CE QUE LE SPORT NATIONAL DU CANADA?'),
(14, 'EAT UP! WHICH CITY HAS THE MOST RESTAURANTS PER CAPITA IN CANADA?', 0, 0, 'https://player.vimeo.com/video/303102987', 'Goute! Quelle ville a le plus de restaurants par habitant au Canada?'),
(15, 'WHICH CANADIAN CITY RANKS AS THE MOST EDUCATED IN THE COUNTRY?', 0, 0, 'https://player.vimeo.com/video/241087789', 'LA VILLE CANADIENNE RANKS COMME LA PLUS EDUCEE DU PAYS?'),
(16, 'CANADA IS THE LARGEST EXPORTER OF WHAT SWEET LITTLE FRUIT?', 0, 0, 'https://player.vimeo.com/video/241087789', 'Le Canada est le plus grand exportateur de quels fruits sucres?'),
(17, 'WHAT IS CANADA\'S OLDEST CITY?', 0, 0, 'https://player.vimeo.com/video/241087842', 'QUELLE EST LA VIEILLE VIEILLE DU CANADA?'),
(18, 'HOW MANY TIME ZONES DOES CANADA HAVE?', 0, 0, 'https://player.vimeo.com/video/241087842', 'Combien de zone temps le Canada a-t-il?'),
(19, 'WHICH CANADIAN CITY HAS THE MOST TOURISTS?', 0, 0, 'https://player.vimeo.com/video/241087805', 'QUELLE VILLE CANADIENNE A LA PLUPART DES TOURISTES?'),
(20, 'ONLY ONE PROVINCE IS OFFICIALLY BILINGUAL, CAN YOU GUESS WHICH ONE?', 0, 0, 'https://player.vimeo.com/video/241087805', 'UNE SEULE PROVINCE EST OFFICIELLEMENT BILINGUE, POUVEZ-VOUS QUEL?'),
(21, 'HOW MANY OCEANS BORDER CANADA?', 0, 0, 'https://player.vimeo.com/video/302832544', 'COMBIEN D\'OCEANS A LA FRONTIERE DU CANADA?'),
(22, '80% OF THE WORLD\'S SUPPLY OF WHAT COMES FROM CANADA?', 0, 0, 'https://player.vimeo.com/video/302832544', '80% DE LA FOURNITURE MONDIALE DE CE QUI VIENT DU CANADA?');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tabusers`
--

INSERT INTO `tabusers` (`uId`, `uIUN`, `uFName`, `uLName`, `uRetryCount`, `uTimer`, `uTotalScore`, `uIsFinished`, `timestart`, `timefinish`, `listofquestions`, `comment`, `sessionId`) VALUES
(1, ' ', ' ', ' ', 1, 0, 5, 0, '12/06/2019 15:19:54', '', 'qT:1; qF:17; qT:17; qT:18; qT:7; qT:15; ', '', 'baae7293-3ae6-407f-9d85-dc155cde21c1'),
(2, 'JAMESBROWN1 ', 'JAMESBROWN1 ', 'JAMESBROWN1 ', 1, 146, 11, 1, '12/06/2019 15:39:13', '12/06/2019 15:42:06', 'qT:18; qT:21; qT:11; qF:19; qT:19; qT:3; qF:8; qT:8; qT:17; qT:1; qF:12; qT:12; qT:10; qT:13; ', '1)Stars: 5 2)Likes: Cool! Like it! 3)Suggest: Keep doing - great job!!!', '554fa710-9e3a-4080-9b84-5b0cd5146dbc'),
(3, 'LION8KING ', 'LION8KING ', 'LION8KING ', 1, 0, 1, 0, '12/09/2019 08:37:23', '', 'qT:5; qF:3; ', '', '469cbd91-0de7-466b-b3e7-fea0c863e19f'),
(4, 'UNKNOWN ', 'UNKNOWN ', 'UNKNOWN ', 1, 631, 11, 1, '12/09/2019 08:44:20', '12/09/2019 08:55:12', 'qT:9; qF:17; qT:17; qT:8; qT:2; qT:21; qT:10; qT:15; qF:11; qF:11; qT:11; qF:16; qF:16; qT:16; qF:7; qT:7; qT:13; ', '1)Stars: 0 2)Likes:  3)Suggest: ', '9cb32a18-6297-4b99-a5ee-abcc7e2e9cb4'),
(5, ' ', ' ', ' ', 2, 464, 12, 1, '12/09/2019 09:07:07', '12/09/2019 09:14:52', 'qT:13; qT:7; qT:1; qT:3; qT:21; qT:9; qF:6; qT:6; qT:22; qT:2; qT:2; qT:10; qF:5; qT:5; ', '', '0e770552-d93a-447b-b98a-73b185167640'),
(6, ' ', ' ', ' ', 3, 0, 9, 0, '12/09/2019 09:44:10', '', 'qT:13; qT:22; qT:3; qT:10; qT:10; qT:1; qT:1; qT:9; qF:7; qF:7; qT:7; qF:6; ', '', '16c693c0-a397-4301-af46-35641b181f66'),
(7, 'JOHN-DOE ', 'JOHN-DOE ', 'JOHN-DOE ', 1, 72, 8, 1, '12/09/2019 09:50:02', '12/09/2019 09:51:38', 'qT:11; qT:17; qT:19; qT:12; qT:13; qT:5; qT:6; qT:10; ', '1)Stars: 5 2)Likes: Cool game! 3)Suggest: Make it shorter, please!', '6da658a4-c6c2-41e1-be89-4ed49af48d77'),
(8, 'UNKNOWN ', 'UNKNOWN ', 'UNKNOWN ', 2, 0, 0, 0, '12/09/2019 10:27:50', '', 'qF:20; ', 'Inserted: ', '22a41973-6f4f-4043-bc36-938a724c4dea'),
(9, 'UNKNOWN ', 'UNKNOWN ', 'UNKNOWN ', 3, 0, 0, 0, '12/09/2019 10:27:50', '', 'qF:20; qF:9; ', 'Inserted: ', '22a41973-6f4f-4043-bc36-938a724c4dea');

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
