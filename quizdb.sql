-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 10, 2020 at 09:48 PM
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

CREATE TABLE `tabanswers` (
  `ansId` bigint(20) NOT NULL,
  `ansTxt` text COLLATE latin1_general_ci NOT NULL,
  `ansQId` bigint(20) NOT NULL,
  `ansIsValid` tinyint(1) NOT NULL,
  `ansTxtFRA` text COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

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

CREATE TABLE `tabquestions` (
  `qId` bigint(20) NOT NULL,
  `qTxt` text COLLATE latin1_general_ci NOT NULL,
  `qIsTaken` tinyint(1) NOT NULL,
  `qIsAnswered` tinyint(1) NOT NULL,
  `questionurl` text COLLATE latin1_general_ci NOT NULL,
  `qTxtFRA` text COLLATE latin1_general_ci NOT NULL,
  `questionurlFRA` text COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tabquestions`
--

INSERT INTO `tabquestions` (`qId`, `qTxt`, `qIsTaken`, `qIsAnswered`, `questionurl`, `qTxtFRA`, `questionurlFRA`) VALUES
(1, 'Which two months are named after Roman emperors?', 0, 0, 'https://player.vimeo.com/video/303102987', 'Quels deux mois sont nommes d\'apres les empereurs romains', 'https://player.vimeo.com/video/303103168'),
(2, 'What is the largest number of five digits?', 0, 0, 'https://player.vimeo.com/video/303102987', 'Quel est le plus grand nombre de cinq chiffres', 'https://player.vimeo.com/video/303103168'),
(3, 'What colour to do you get when you mix red and white?', 0, 0, 'https://player.vimeo.com/video/241087789', 'Quelle couleur obtenez-vous lorsque vous mélangez le rouge et le blanc?', 'https://player.vimeo.com/video/244339235'),
(4, 'How long is the Great Wall of China?', 0, 0, 'https://player.vimeo.com/video/241087789', 'Quelle est la longueur de la grande muraille de Chine?', 'https://player.vimeo.com/video/244339235'),
(5, 'How many stars has the American flag got?', 0, 0, 'https://player.vimeo.com/video/241087842', 'Combien d\'etoiles le drapeau americain a-t-il?', 'https://player.vimeo.com/video/244338734'),
(6, 'How many stars feature on the flag of New Zealand?', 0, 0, 'https://player.vimeo.com/video/241087842', 'Combien d\'etoiles figurent sur le drapeau de la Nouvelle-Zelande?', 'https://player.vimeo.com/video/244338734'),
(7, 'What country is home to the longest canal in the world?', 0, 0, 'https://player.vimeo.com/video/302832544', 'Dans quel pays le plus long canal du monde est situe?', 'https://player.vimeo.com/video/302833635'),
(8, 'Which marine animal is the only known natural predator of the great white shark?', 0, 0, 'https://player.vimeo.com/video/302832544', 'Quel animal marin est le seul predateur naturel connu du grand requin blanc?', 'https://player.vimeo.com/video/302833635'),
(9, 'Located approximately halfway between Iceland and Norway, the Faroe Islands are a territory of which country?', 0, 0, 'https://player.vimeo.com/video/241087822', 'Situees a peu pres a mi-chemin entre l\'Islande et la Norvege, les îles Feroe sont un territoire de quel pays?', 'https://player.vimeo.com/video/244338953'),
(10, 'What is the primary unit of temperature measurement in the physical sciences?', 0, 0, 'https://player.vimeo.com/video/241087805', 'Quelle est l\'unite principale de mesure de la temperature en sciences physiques?', 'https://player.vimeo.com/video/244339094'),
(11, 'A deficiency of what vitamin may lead to dry eyes and night blindness?', 0, 0, 'https://player.vimeo.com/video/241087822', 'Une carence en quelle vitamine peut entraîner des yeux secs et une cecite nocturne?', 'https://player.vimeo.com/video/244338953'),
(12, 'In the human body, what is the hallux?', 0, 0, 'https://player.vimeo.com/video/241087805', 'Dans le corps humain, qu\'est-ce que l\'hallux?', 'https://player.vimeo.com/video/244339094'),
(13, 'WHAT IS CANADA\'S NATIONAL SPORT?', 0, 0, 'https://player.vimeo.com/video/303102987', 'QU\'EST-CE QUE LE SPORT NATIONAL DU CANADA?', 'https://player.vimeo.com/video/303103168'),
(14, 'EAT UP! WHICH CITY HAS THE MOST RESTAURANTS PER CAPITA IN CANADA?', 0, 0, 'https://player.vimeo.com/video/303102987', 'Goute! Quelle ville a le plus de restaurants par habitant au Canada?', 'https://player.vimeo.com/video/303103168'),
(15, 'WHICH CANADIAN CITY RANKS AS THE MOST EDUCATED IN THE COUNTRY?', 0, 0, 'https://player.vimeo.com/video/241087789', 'LA VILLE CANADIENNE RANKS COMME LA PLUS EDUCEE DU PAYS?', 'https://player.vimeo.com/video/244339235'),
(16, 'CANADA IS THE LARGEST EXPORTER OF WHAT SWEET LITTLE FRUIT?', 0, 0, 'https://player.vimeo.com/video/241087789', 'Le Canada est le plus grand exportateur de quels fruits sucres?', 'https://player.vimeo.com/video/244339235'),
(17, 'WHAT IS CANADA\'S OLDEST CITY?', 0, 0, 'https://player.vimeo.com/video/241087842', 'QUELLE EST LA VIEILLE VIEILLE DU CANADA?', 'https://player.vimeo.com/video/244338734'),
(18, 'HOW MANY TIME ZONES DOES CANADA HAVE?', 0, 0, 'https://player.vimeo.com/video/241087842', 'Combien de zone temps le Canada a-t-il?', 'https://player.vimeo.com/video/244338734'),
(19, 'WHICH CANADIAN CITY HAS THE MOST TOURISTS?', 0, 0, 'https://player.vimeo.com/video/241087805', 'QUELLE VILLE CANADIENNE A LA PLUPART DES TOURISTES?', 'https://player.vimeo.com/video/244339094'),
(20, 'ONLY ONE PROVINCE IS OFFICIALLY BILINGUAL, CAN YOU GUESS WHICH ONE?', 0, 0, 'https://player.vimeo.com/video/241087805', 'UNE SEULE PROVINCE EST OFFICIELLEMENT BILINGUE, POUVEZ-VOUS QUEL?', 'https://player.vimeo.com/video/244339094'),
(21, 'HOW MANY OCEANS BORDER CANADA?', 0, 0, 'https://player.vimeo.com/video/302832544', 'COMBIEN D\'OCEANS A LA FRONTIERE DU CANADA?', 'https://player.vimeo.com/video/302833635'),
(22, '80% OF THE WORLD\'S SUPPLY OF WHAT COMES FROM CANADA?', 0, 0, 'https://player.vimeo.com/video/302832544', '80% DE LA FOURNITURE MONDIALE DE CE QUI VIENT DU CANADA?', 'https://player.vimeo.com/video/302833635');

-- --------------------------------------------------------

--
-- Table structure for table `tabusers`
--

CREATE TABLE `tabusers` (
  `uId` bigint(20) NOT NULL,
  `uIUN` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `uFName` text COLLATE utf8_unicode_ci NOT NULL,
  `uLName` text COLLATE utf8_unicode_ci NOT NULL,
  `uRetryCount` int(11) NOT NULL,
  `uTimer` int(11) NOT NULL,
  `uTotalScore` int(11) NOT NULL,
  `uIsFinished` tinyint(1) NOT NULL,
  `timestart` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `timefinish` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `listofquestions` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `sessionId` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tabusers`
--

INSERT INTO `tabusers` (`uId`, `uIUN`, `uFName`, `uLName`, `uRetryCount`, `uTimer`, `uTotalScore`, `uIsFinished`, `timestart`, `timefinish`, `listofquestions`, `comment`, `sessionId`) VALUES
(1, 'MARYBROWN', 'MARY1001', 'MARY1001', 1, 196, 11, 1, '01/10/2020 13:38:59', '01/10/2020 13:43:11', 'qT:19; qT:2; qT:21; qT:7; qT:22; qF:5; qF:5; qT:5; qT:8; qF:14; qF:14; qF:14; qF:14; qT:14; qT:4; qT:12; qT:20; ', '1)Stars: 5 2)Likes: Great idea, nice game! Like Im coming back to 80ths :) 3)Suggest: Please do more fun games!', '17bfa827-e8ee-4333-9cd2-8a295e7cfe13'),
(2, 'JOHNDOE101', 'JohnDoe', 'JohnDoe', 1, 133, 11, 1, '01/10/2020 13:43:46', '01/10/2020 13:46:39', 'qT:1; qF:15; qT:15; qT:8; qT:18; qT:19; qT:14; qT:12; qF:7; qT:7; qF:11; qT:11; qT:9; qT:4; ', '1)Stars: 5 2)Likes: I like it, well done! 3)Suggest: More and more games', '2d5db7ae-8ff3-481b-ba28-48cc7d2b75ed');

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
-- Indexes for table `tabquestions`
--
ALTER TABLE `tabquestions`
  ADD PRIMARY KEY (`qId`);

--
-- Indexes for table `tabusers`
--
ALTER TABLE `tabusers`
  ADD PRIMARY KEY (`uId`),
  ADD UNIQUE KEY `sessionId` (`sessionId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tabanswers`
--
ALTER TABLE `tabanswers`
  MODIFY `ansId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `tabquestions`
--
ALTER TABLE `tabquestions`
  MODIFY `qId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tabusers`
--
ALTER TABLE `tabusers`
  MODIFY `uId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
