-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 172.26.125.158:3306
-- Generation Time: Dec 16, 2019 at 04:15 PM
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
  `ansTxt` text COLLATE utf8_unicode_ci NOT NULL,
  `ansQId` bigint(20) NOT NULL,
  `ansIsValid` tinyint(1) NOT NULL,
  `ansTxtFRA` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ansId`),
  KEY `ansQId` (`ansQId`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tabanswers`
--

INSERT INTO `tabanswers` (`ansId`, `ansTxt`, `ansQId`, `ansIsValid`, `ansTxtFRA`) VALUES
(1, 'Call your team and discuss the completion of a AH 223 report.', 1, 0, 'Vous appelez votre équipe et préparez un rapport AH 223.'),
(2, 'You call Help Desk at 48484 to inform them.', 1, 1, 'Vous appelez le soutien  informatique au 48484 pour les informer.'),
(3, 'You call 55555 and call an IS code as the whole network could be infected.', 1, 0, 'Vous appelez 55555 pour déclencher un code IS, puisque l\'ensemble du réseau pourrait être  infecté.'),
(4, 'None of these statements is correct.', 1, 0, 'Aucun énoncé n\'est correct.'),
(5, 'Call HELP DESK at 48484.', 2, 1, 'Appeler le soutien informatique au 48484.'),
(6, 'Ignore the message.', 2, 0, ' Ignorer le message. '),
(7, 'Request advice on social networks.', 2, 0, 'Demander des conseils sur les réseaux sociaux. '),
(8, 'None of these statements is correct.', 2, 0, 'Aucun énoncé n\'est correct.'),
(9, 'Confidentiality of patient information.', 3, 0, 'Confidentialité des informations des patients.'),
(10, 'Management of the security of informational assets.', 3, 0, 'Gestion sécuritaire des actifs informationnels.'),
(11, 'Acceptable use of information assets .', 3, 0, 'Utilisation acceptable des ressources informationnelles.'),
(12, 'All of the statements are correct.', 3, 1, 'Tous les énoncés sont corrects.'),
(13, 'You would call your manager and discuss the completion of a AH 223 report.', 4, 0, 'Vous appelez votre superviseur pour déterminer s\'il y a lieu de remplir un formulaire d\'incident AH 223.'),
(14, 'You would call Help Desk at 48484 .', 4, 1, 'Vous appelez le Centre d\'appel au 48484 .'),
(15, 'You would call 55555 and trigger an \'IS\'  code as the whole network could be infected.', 4, 0, 'Vous appelez 55555 et déclenchez un code \'IS\' car tout le réseau pourrait être infecté.'),
(16, 'None of these statements is correct.', 4, 0, 'Aucun énoncé n\'est correct.'),
(17, 'Direct him to the section of the website where all of the P&P\'s are posted.', 5, 0, 'Vous le dirigez vers la section de l\'intranet où se trouvent les Politiques et procédures.'),
(18, 'You remind him to ask the patient for written consent prior to taking pictures and file it in his medical file.', 5, 1, 'Vous lui rappelez de demander le consentement écrit au patient avant de prendre des photos et de le classer dans son dossier médical.'),
(19, 'You let him take the picture and use it regardless of his consent because he\'s the surgeon.', 5, 0, 'Le médecin étant le chirurgien qui a opéré le patient, vous le laissez prendre la photo et l\'utiliser, sans recueillir le consentement de l\'intéressé.'),
(20, 'None of these statements is correct.', 5, 0, 'Aucun énoncé n\'est correct.'),
(21, 'Acceptable use of information assets.', 6, 0, 'Utilisation acceptable des ressources informationnelles.'),
(22, 'Management of the security of informational assets.', 6, 0, 'Sécurité des actifs informationnels. '),
(23, 'Disclosure of patient informationt.', 6, 0, 'Divulgation des informations des patients. '),
(24, 'All of these statements are correct.', 6, 1, 'Tous les énoncés sont corrects. '),
(25, 'Move the cursor back and hope the action is undone?', 7, 0, 'Sur votre navigateur web, vous cliquez sur le bouton de retour à la page précédente, en espérant que cela annulera votre erreur.'),
(26, 'Erase the windows explorer files and hope nobody notices?', 7, 0, 'Vous ouvrez votre explorateur Windows et effacez les fichiers chiffrés en espérant que personne ne le remarquera.'),
(27, 'Call 48484 and inform them of your involuntary action?', 7, 1, 'Vous appelez le 48484 et l\'informez de votre action involontaire.'),
(28, 'Keep working as if nothing happened?', 7, 0, 'Vous continuez à travailler comme si de rien n\'était.'),
(29, 'The logo on the email looks familiar and the personal information required sounds legitimate, so you click on the link.', 8, 0, 'Le logo dans le courriel vous est familier et les informations personnelles requises semblent légitimes, vous cliquez donc sur le lien.'),
(30, 'As you receive lots of offers during holiday season you inadvertently click on the link.', 8, 0, 'Comme vous recevez de nombreuses offres pendant le temps des fêtes, vous cliquez dessus par habitude.'),
(31, 'You doubt the email as this company should not have your professional address, so you inform the Help Desk at 48484. ', 8, 1, 'Vous trouvez étrange que cette compagnie dispose de votre adresse courriel professionnelle et, dans le doute, vous informez le Soutien Technique au 48484.'),
(32, 'None of these statements is correct.', 8, 0, 'Aucun énoncé n\'est correct.'),
(33, 'It is not necessary because the system logs off automatically every 15 minutes.', 9, 0, 'Ce n\'est pas nécessaire, car le système se déconnecte automatiquement après 15 minutes d\'inactivité.'),
(34, 'It is necessary to prevent others to snoop into your files.', 9, 1, 'C\'est nécessaire, pour empêcher autrui de fouiner dans vos fichiers.'),
(35, 'It is not important because you are not responsible for activity in your account from the time you log in to the time you log out.', 9, 0, 'Ce n\'est pas important car vous n\'êtes pas responsable de l\'activité sur votre compte durant vos temps de connexion.'),
(36, 'All of these statements are correct.', 9, 0, 'Aucun énoncé n\'est correct.'),
(37, 'To use simple and short password. ', 10, 0, 'utiliser un mot de passe simple et court. '),
(38, 'To use a complex password with upper and lower case characters as well as numbers and some symbols.', 10, 1, 'Utiliser un mot de passe complexe avec des caractères majuscules et minuscules ainsi que des chiffres et certains symboles.'),
(39, 'To leave your workstation unlocked allowing a colleague to access later, when he has the time.', 10, 0, 'Laisser sa session de travail déverrouillée, pour permettre à un collègue d\'y accéder plus tard, quand il aura un moment.'),
(40, 'To write your password on a post-it and stick it on your monitor, in an open office .', 10, 0, 'Noter son mot de passe sur un papillon adhésif collé sur son moniteur, dans un bureau non verrouillé.'),
(41, 'To use robust passwords.', 11, 0, 'Utiliser des mots de passe forts.'),
(42, 'To lock or close your session if you step out of your office.', 11, 0, 'Verrouiller ou fermer la session si vous quittez votre poste de travail informatique.'),
(43, 'To restrict the access to patient information  only to members of the patient\'s care team.', 11, 0, 'Restreindre l\'accès aux informations-patients aux seuls les membres de son équipe de soins .'),
(44, 'All of these statements are correct.', 11, 1, 'Tous les énoncés sont corrects.'),
(45, 'Before we let them in, we should ask for their identity and who  they are going to see. Once they are duly identified, escort them to a designated office.', 12, 0, 'Avant l\'avoir fait entrer, je lui demande son identité et celle de la personne qu\'il vient voir. Une fois le visiteur identifié, Je l\'accompagne jusqu\'au bureau de cette personnne.'),
(46, 'If the host is not in his office, invite the visitor to wait outside.', 12, 0, 'Si ladite personne n\'est pas à son bureau, j\'invite le visiteur à ressortir des locaux.'),
(47, 'If the visitor refuses to wait outside, inform the physical security service in your building.', 12, 0, 'Si le visiteur refuse de ressortir des locaux, j\'avertis immédiatement le service de la sécurité physique.'),
(48, 'All of these statements are correct.', 12, 1, 'Tous les énoncés sont corrects.'),
(49, 'So that everyone knows who you are.', 13, 0, 'Pour que tout le monde sache qui vous êtes.'),
(50, 'So that everyone can ask who you are looking for.', 13, 0, 'Pour que chacun puisse demander qui vous cherchez.'),
(51, 'So that other staff may consider you are presumably entitled to circulate in the premises.', 13, 1, 'Pour que les autres membres du personnel puissent vous identifier et valider auprès de la sécurité que vous avez le droit de circuler dans des locaux du CUSM.'),
(52, 'None of these statements is correct.', 13, 0, 'Aucun énoncé n\'est correct.'),
(53, 'As it complies to a policy and procedure.', 14, 0, 'Puisqu\'il est conforme à une politique et procédure.'),
(54, 'As it identifies who you are and allows security to validate your electronic privileges to circulate in restricted secured areas.', 14, 1, 'Puisqu\'il  vous identifie et permet à la sécurité de valider vos privilèges électroniques pour circuler dans des zones sécurisées restreintes.'),
(55, 'So that visitors can ask you for information.', 14, 0, 'Pour des visiteurs qui pourraient vous demander des informations.'),
(56, 'All of these statements are correct.', 14, 0, 'Tous les énoncés sont corrects.'),
(57, 'We should never take pictures of patientsbecause this infringes their rights. ', 15, 0, 'On ne peut jamais prendre de photos d\'un patient car cela viole ses droits et libertés. '),
(58, 'We should never takepictures with a smartphone. ', 15, 0, 'On ne peut jamais prendre des photos du patient avec un téléphone cellulaire.'),
(59, 'The pictures should be taken in a way that the patient is clearly recognizable.', 15, 0, 'Les photos doivent être prises de manière à ce que le patient soit clairement reconnaissable.'),
(60, 'The pictures where a patient can be recognized should be taken only with previous patient consent.', 15, 1, 'Les photos permettant d\'identifier un patient ne peuvent être prises qu\'avec le consentement préalable de celui-ci.'),
(61, 'To converse about the diagnoses of patients you are treating.', 16, 0, 'de parler des diagnostics des patients que vous traitez.'),
(62, 'To talk about the cultural and sport activities you practice at the hospital\'s premises.', 16, 1, 'de parler des activités culturelles ou sportives que vous exercez dans les locaux de l\'hôpital.'),
(63, ' To give your personal opinion about a Public Health policy that is being deployed by the government.', 16, 0, 'de donner votre avis personnel sur la politique de santé publique menée par le gouvernement.'),
(64, ' All of these statements are correct.', 16, 0, 'Tous les énoncés sont corrects.'),
(65, 'Only when the patient visits a newborn in the nursery.', 17, 0, 'Uniquement lorsque le patient visite un nouveau-né dans la pouponnière.'),
(66, 'Only when the patient is undergoing a surgical procedure that is innovative and might be presented in a medical teaching session .', 17, 0, 'Seulement lorsque le patient subit une intervention chirurgicale innovante, qui pourrait être présentée dans une session d\'enseignement médical.'),
(67, 'Only when the patient is aware that he is part of a research project.', 17, 0, 'Seulement dans le cadre d\'un projet de recherche.'),
(68, 'When the patient can be identified in that photo.', 17, 1, 'Lorsque le patient peut être identifié sur la photo.'),
(69, 'Use it across multiple sites. ', 18, 0, 'L\'utiliser sur plusieurs sites internet ou bases de données profesionnelles.'),
(70, 'Share it with colleagues.', 18, 0, 'Le partager avec vos collègues.'),
(71, 'Ensure it is clearly written on a post it on your computer screen in an open office.', 18, 0, 'Vous assurer qu\'il est écrit clairement sur un papillon adhésif sur votre écran d\'ordinateur, à votre bureau en aire ouverte.'),
(72, 'None of these statements is correct.', 18, 1, 'Aucun énoncé n\'est correct.'),
(73, 'That has less than 8  characters.', 19, 0, 'Qui a moins de 8 caractères.'),
(74, 'Built with a word where  \'E\' is replaced by \'3\' ', 19, 0, 'Qui est constitué d\'un mot tiré du dictionnaire dans lequel les \'E\' sont remplacés par des \'3\' '),
(75, 'That all its characters are lowercase.', 19, 0, 'Qui contient uniquement des caractères minuscules.'),
(76, 'None of these statements is correct.', 19, 1, 'Aucun énoncé n\'est correct.'),
(77, 'A date easy to remember.', 20, 0, 'Une date facile à retenir.'),
(78, 'An easy and short word that you can find in the dictionary.', 20, 0, 'Un mot simple et court trouvable dans n\'importe quel dictionnaire.'),
(79, 'A long word (more than 20 letters) that you can find in the dictionary.', 20, 0, 'Un mot très long (plus de 20 lettres) du dictionnaire. '),
(80, 'None of these statements is correct.', 20, 1, 'Aucun énoncé n\'est correct.'),
(81, 'it is created by including special characters and numbers.', 21, 0, 'qu\'il inclut des caractères spéciaux et des chiffres.'),
(82, 'it is protected from others\'  sight.', 21, 0, 'qu\'il soit conservé hors  de la vue d\'autrui.'),
(83, 'it uses initial letters of words from a long phrase that you like.', 21, 0, 'qu\'il soit constitué des premières lettres des mots d\'une longue phrase que vous aimez.'),
(84, 'All of these statements are correct.', 21, 1, 'Tous les énoncés sont corrects.'),
(85, 'Use a very pricy toothbrush that you can show to everybody.', 22, 0, 'Utilisez une brosse à dents très chère pour la montrer à tout le monde.'),
(86, 'Make sure of leaving it in a visible place so your colleague can use when in need.', 22, 0, 'Assurez-vous de la laisser dans un endroit visible afin que votre collègue puisse l\'utiliser en cas de besoin.'),
(87, 'Keep the same one for a lifetime.', 22, 0, 'Gardez la même pour toute une vie.'),
(88, 'None of these statements is correct.', 22, 1, 'Aucun de ces énoncés n\'est correct.'),
(89, 'Call the security guard to inform they are contravening the privacy of the patient.', 23, 0, 'Vous appelez le gardien de sécurité pour l\'informer que ces employés portent atteinte à la vie privée du patient.'),
(90, 'Kindly request them to continue their conversation in a private place.', 23, 1, 'Vous demandez à ces employés de continuer leur conversation dans un lieu privé.'),
(91, 'Engage in conversation with them and start asking them questions about the surgery.', 23, 0, 'Vous engagez la conversation avec eux et leur posez des questions sur la chirurgie de ce patient .'),
(92, 'All of these statements are correct.', 23, 0, 'Tous les énoncés sont corrects.'),
(93, 'Could you kindly identify yourself? ', 24, 0, 'Pourriez-vous vous identifier ? '),
(94, 'Would you please let us know where your meeting is taking place? ', 24, 0, 'Pourriez-vous nous dire où votre réunion a lieu?'),
(95, 'I will certainly inform your host so he can come and look for you.', 24, 0, 'Je vais informer votre hôte et lui demander de passer vous chercher.'),
(96, 'All of these statements are correct', 24, 1, 'Tous les énoncés sont corrects.'),
(97, 'You invite him to trespass into your section and look around.', 25, 0, 'l\'invitez dans votre section pour qu\'il puisse regarder l\'environnement.'),
(98, 'You invite him to leave your section as he does not have an ID card.', 25, 0, 'l\'invitez à quitter votre section, car il n\'a pas de carte d\'identité.'),
(99, 'You call the physical security office in your building immediately .', 25, 1, 'Vous appelez la sécurité physique immédiatement. '),
(100, 'All of these statements are correct.', 25, 0, 'Tous les énoncés sont corrects.'),
(101, 'You give the intern  your login information (user ID and password)  so that she can access information .', 26, 0, 'Vous donnez vos identifiant et mot de passe à la stagiaire pour qu\'elle puisse accéder à vos fichiers. '),
(102, 'You leave your session active on your workstation so that the intern can work whenever she needs to.', 26, 0, 'Vous laissez votre session active en tout temps sur votre poste informatique pour que la stagiaire puisse y travailler quand elle en a besoin.'),
(103, 'You copy your login information on a post-it and stick it on the monitor in an open office so that the intern can work while you are away . ', 26, 0, 'Vous inscrivez vos identifiant et mot de passe sur un papillon adhésif que vous collez sur votre poste de travail en aire ouverte pour que la stagiaire puisse travailler sur vos dossiers durant votre absence.'),
(104, 'All of these statements are correct.', 26, 1, 'Aucun de ces énoncés n\'est approprié.'),
(105, 'Low because the probability of having a malicious colleague is minimal.', 27, 0, 'Faible parce que la probabilité d\'avoir des collègues malintentionnés est minime.'),
(106, 'Medium because in escence, it is possible that one of my colleagues might be tempted to look for information that concerns me and he shouldn\'t.', 27, 0, 'Moyen, essentiellement parce qu\'il est possible qu\'un de mes collègues soit tenté de rechercher indûment des informations me concernant.'),
(107, 'High because I am accountable of all the activity occurring during my session, including unacceptable use of MUHC\'s information assets  by other individuals.', 27, 1, 'Elevé, parce que je suis responsable de toutes les activités qui se produisent pendant ma session, y compris l\'utilisation inappropriée d\'actifs informationnels du CUSM par d\'autres personnes.'),
(108, 'All of these statements are correct.', 27, 0, 'Tous les énoncés sont corrects..');

-- --------------------------------------------------------

--
-- Table structure for table `tabquestions`
--

CREATE TABLE IF NOT EXISTS `tabquestions` (
  `qId` bigint(20) NOT NULL AUTO_INCREMENT,
  `qTxt` text COLLATE utf8_unicode_ci NOT NULL,
  `qIsTaken` tinyint(1) NOT NULL,
  `qIsAnswered` tinyint(1) NOT NULL,
  `questionurl` text COLLATE utf8_unicode_ci NOT NULL,
  `qTxtFRA` text COLLATE utf8_unicode_ci NOT NULL,
  `questionurlFRA` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`qId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tabquestions`
--

INSERT INTO `tabquestions` (`qId`, `qTxt`, `qIsTaken`, `qIsAnswered`, `questionurl`, `qTxtFRA`, `questionurlFRA`) VALUES
(1, 'You suspect your computer and the information you are accessing on a database are compromised…. You then:', 0, 0, 'https://player.vimeo.com/video/303102987', 'Vous soupçonnez que votre ordinateur a été piraté et que les informations auxquelles vous accédez par son intermédiaire sont compromises. Aussitôt:', 'https://player.vimeo.com/video/303103168'),
(2, 'You received an email from  a hacker informing you that he took control of your professional data and requesting a ransom. What should you do?', 0, 0, 'https://player.vimeo.com/video/303102987', 'Vous avez reçu un courriel d\'un pirate vous informant qu\'il a pris le contrôle de vos données professionnelles et demande une rançon. Que devriez-vous faire?', 'https://player.vimeo.com/video/303103168'),
(3, 'A staff member takes advantage of an open session to snoop into a colleague\'s medical record. What is the main violation she/he is incurring? ', 0, 0, 'https://player.vimeo.com/video/302832544', 'Un membre du personnel profite d\'une session ouverte sur un poste informatiquepour fouiner dans le dossier médical d\'un collègue. Quelle norme professionnelle viole-t-il ?', 'https://player.vimeo.com/video/302833635'),
(4, 'You are receiving an email request to click on a link and provide login information for computer maintenance. What would you do? ', 0, 0, 'https://player.vimeo.com/video/303102987', 'Vous recevez un courriel vous demandant de cliquer sur un lien afin d\'effectuer une mise à jour logicielle. La page web qui s\'affiche alors vous demande de fournir vos identifiants et mot de passe d\'accès au réseau. Que faites-vous ?', 'https://player.vimeo.com/video/241087789'),
(5, 'You are part of the care team of a patient that has an identifiable tattoo on his body. In preparation for a lecture, the physician wants to take a picture of his body at the level of the tattoo, to document the case. You:', 0, 0, 'https://player.vimeo.com/video/302832544', 'Vous faites partie de l\'équipe de soins d\'un patient qui porte un tatouage particulier susceptible de l\'identifier aisément. En vue d\'une conférence qu\'il doit bientôt donner pour présenter le cas de ce patient, un médecin veut prendre une photo du corps de ce patient au niveau de son tatouage. Que faites-vous?', 'https://player.vimeo.com/video/302833635'),
(6, 'An employee has had to go on sick leave. He looks at the results of his last blood tests on OACIS. What principle would he be infringing?', 0, 0, 'https://player.vimeo.com/video/302832544', 'Un employé a dû partir en congé maladie. Il accède et regarde les résultats de ses derniers tests sur OACIS. Quel principe enfreint-il?', 'https://player.vimeo.com/video/302833635'),
(7, 'You have just clicked on an infected Internet link received by email. In doing so, you have just triggered crypto-ransomware on your computer, which begins to encrypt your files and displays a ransom note on the screen. What do you do?', 0, 0, 'https://player.vimeo.com/video/303102987', 'Vous venez de cliquer sur un lien Internet piégé, reçu par courriel. Ce faisant, vous venez de faire entrer sur votre ordinateur un crypto-rançongiciel, qui commence à chiffrer vos fichiers et affiche à l\'écran une demande de rançon. Que faites-vous?', 'https://player.vimeo.com/video/241087789'),
(8, 'You received a product offer email What should you do?', 0, 0, 'https://player.vimeo.com/video/303102987', 'Vous avez reçu un courriel commercial. Que devriez-vous faire?', 'https://player.vimeo.com/video/241087789'),
(9, 'Why would you always need to lock or log off your work station?', 0, 0, 'https://player.vimeo.com/video/302832544', 'Doit-on vraiment toujours verrouiller ou  déconnecter sa session en quittant son poste  de travail?', 'https://player.vimeo.com/video/302833635'),
(10, 'Which of the following are security acceptable practices to secure the access to your work station?', 0, 0, 'https://player.vimeo.com/video/302832544', 'Parmi les déclarations suivantes, lesquelles sont des pratiques acceptables en matière de sécurisation des accès à sa session de travail sur son poste informatique?', 'https://player.vimeo.com/video/302833635'),
(11, 'Which are the best practices for protecting patient information? ', 0, 0, 'https://player.vimeo.com/video/302832544', 'Quelles sont les meilleures pratiques pour protéger les informations des patients qui sont stockées dans nos bases de données:', 'https://player.vimeo.com/video/302833635'),
(12, 'It is possible to welcome visitors without identity cards to our offices, with the following precautions?', 0, 0, 'https://player.vimeo.com/video/241087789', 'Il est possible de donner accès à nos bureaux administratifs à des visiteurs, qui ne portent pas de carte d\'identité du CUSM ; mais en prenant les précautions suivantes? ', 'https://player.vimeo.com/video/244339235'),
(13, 'Why is it important to wear your ID card?', 0, 0, 'https://player.vimeo.com/video/241087789', 'Pourquoi est-il important de porter votre carte d\'identité de façon visible ?', 'https://player.vimeo.com/video/244339235'),
(14, 'Wearing a visible ID card is important:', 0, 0, 'https://player.vimeo.com/video/241087789', 'Le port d\'une carte d\'identité est important…', 'https://player.vimeo.com/video/244339235'),
(15, 'What are the requirements for taking pictures of patients?', 0, 0, 'https://player.vimeo.com/video/302832544', 'Quelles sont les exigences pour prendre des photos de patients?', 'https://player.vimeo.com/video/302833635'),
(16, 'In MUHC\'S public spaces especially elevators, corridors and coffee shops, where there are other people,  it is permitted:', 0, 0, 'https://player.vimeo.com/video/241087805', 'Dans les locaux du CUSM, en présence d\'autres personnes (notamment dans les espaces publics comme les ascenseurs, les couloirs et les cafés), il est permis:', 'https://player.vimeo.com/video/244339094'),
(17, 'When do you need patient consent for taking pictures of him/her?', 0, 0, 'https://player.vimeo.com/video/241087805', 'Quand avez-vous besoin du consentement du patient pour le prendre en photo ?', 'https://player.vimeo.com/video/244339094'),
(18, 'Once you have a consistent password you can:', 0, 0, 'https://player.vimeo.com/video/241087822', 'Une fois que vous avez un mot de passe fort, vous pouvez…', 'https://player.vimeo.com/video/244338953'),
(19, 'The best password is the one:', 0, 0, 'https://player.vimeo.com/video/241087822', 'Un mot de passe fort est un mot de passe…', 'https://player.vimeo.com/video/244338953'),
(20, 'When making the choice of a password to protect the  access to a database you will ensure it Is:', 0, 0, 'https://player.vimeo.com/video/241087822', 'Pour sécuriser votre accès à une base de données, vous pouvez choisir comme mot de passe …', 'https://player.vimeo.com/video/244338953'),
(21, 'If you want to choose a password that will be difficult to discover by people with bad intentions, you will make sure that:', 0, 0, 'https://player.vimeo.com/video/241087822', 'Si vous faites le choix d\'un mot de passe difficile à découvrir par des personnes mal intentionnées, vous vous assurez ...:', 'https://player.vimeo.com/video/244338953'),
(22, 'Passwords are like toothbrushes, so you should:', 0, 0, 'https://player.vimeo.com/video/241087842', 'Les mots de passe sont comme les brosses à dents.', 'https://player.vimeo.com/video/244338734'),
(23, 'You are in the hospital and you are in the cafeteria. Sitting next to you 2 members of the staff are talking about a patient currently in the  operating room, who is actually a renown politician. You:', 0, 0, 'https://player.vimeo.com/video/241087805', 'Vous vous trouvez à la cafétéria de l\'hôpital. Assis à côté de vous, deux membres du personnel discutent d\'un patient présentement en salle d\'opérations… qui s\'avère être un politicien de renom. Que faites-vous?', 'https://player.vimeo.com/video/244339094'),
(24, 'A person who does not wear an ID card arrives for a meeting on your floor and requests access to your premises. You open the door, and ask :', 0, 0, 'https://player.vimeo.com/video/241087789', 'Une personne qui ne porte pas de carte d\'identité, se présente à votre étage et demande à accéder à vos locaux. Vous lui ouvrez la porte , et lui demandez….', 'https://player.vimeo.com/video/244339235'),
(25, 'There is an incident at the hospital and the press is covering it. A journalist wanders around the hospital to try to gather additional information t. You notice a gentleman with no ID card and:', 0, 0, 'https://player.vimeo.com/video/241087789', 'Il y a un incident à l\'hôpital et la presse le couvre. Un journaliste se promène dans l\'hôpital, peut-être cherche-t-il  des informations supplémentaires. Vous remarquez une personne qui ne porte pas de carte donc vous…', 'https://player.vimeo.com/video/244339235'),
(26, 'You are a medical secretary, and an intern has been hired to work with you during a period of heavy workload. Which of the following is inappropriate?', 0, 0, 'https://player.vimeo.com/video/241087842', 'Vous êtes secrétaire médicale et une stagiaire a été embauché pour  vous assister pendant une période de lourde charge de travail. Lequel des énoncés suivants est inapproprié?  ', 'https://player.vimeo.com/video/244338734'),
(27, 'How would you evaluate the risk of sharing passwords?', 0, 0, 'https://player.vimeo.com/video/241087842', 'Comment évalueriez-vous le risque de partager des mots de passe?', 'https://player.vimeo.com/video/244338734');

-- --------------------------------------------------------

--
-- Table structure for table `tabusers`
--

CREATE TABLE IF NOT EXISTS `tabusers` (
  `uId` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `sessionId` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`uId`),
  UNIQUE KEY `sessionId` (`sessionId`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tabusers`
--

INSERT INTO `tabusers` (`uId`, `uIUN`, `uFName`, `uLName`, `uRetryCount`, `uTimer`, `uTotalScore`, `uIsFinished`, `timestart`, `timefinish`, `listofquestions`, `comment`, `sessionId`) VALUES
(7, 'BADO6002@MUHCAD.MUHCFRD.CA', '', '', 2, 365, 9, 1, '12/12/2019 15:37:04', '12/12/2019 15:43:43', 'qF:2; qF:2; qF:18; qF:18; qF:18; qF:18; qF:18; qF:18; qF:18; qF:18; qT:18; qT:18; qT:2; qF:5; qF:5; qT:5; qT:5; qT:24; qT:24; qF:3; qF:3; qF:1; qF:1; qT:1; qT:1; ', '1)Stars: 5 2)Likes: This is amazing  3)Suggest: Please add more characters', '2c8b0eab-3e9e-4011-8cc3-43f656d5fef9'),
(8, 'ZAAL6006@MUHCAD.MUHCFRD.CA', '', '', 2, 298, 14, 1, '12/12/2019 15:50:47', '12/12/2019 15:56:22', 'qT:26; qT:21; qT:27; qF:3; qT:3; qT:24; qT:12; qT:9; qT:16; qF:20; qT:20; qF:14; qF:14; qT:14; qT:18; qT:22; qF:5; qT:5; qT:4; ', '1)Stars: 5 2)Likes: I did it!  My test is finished! 3)Suggest: Reduce some questions as they are appearing too long and sometimes could even close the submit button :)', '2fa996ae-56e7-42e5-95b9-1a9f51600eb7'),
(9, 'BRSH6002@MUHCAD.MUHCFRD.CA', '', '', 1, 0, 0, 0, '12/12/2019 15:50:09', '', 'qF:9; ', 'Inserted: ', 'cdd0f174-d987-4713-b967-abc2c43a5958'),
(10, 'TRAU6000@MUHCAD.MUHCFRD.CA', 'TRAU6000', 'TRAU6000', 1, 429, 10, 1, '12/12/2019 15:50:24', '12/12/2019 15:58:40', 'qT:21; qT:3; qT:10; qT:1; qT:18; qT:9; qT:5; qT:27; qT:2; qT:4; ', '1)Stars: 5 2)Likes: The answer ALL OF THE ABOVE or NONEO F THE ABOVE should always be (d) 3)Suggest: Good numbero of questions and short time to playt the game', 'efc9318c-2228-4694-83a0-3ed53554dc45'),
(11, 'BRSH6002@MUHCAD.MUHCFRD.CA', 'BRSH6002', 'BRSH6002', 2, 307, 20, 1, '12/12/2019 15:52:34', '12/12/2019 15:59:57', 'qT:8; qT:15; qT:15; qT:17; qT:17; qT:3; qT:3; qF:23; qT:23; qT:4; qT:4; qF:20; qF:20; qT:20; qT:20; qT:9; qT:9; qT:19; qT:19; qT:24; qT:24; qT:26; qT:26; ', '1)Stars: 4 2)Likes: It was a fun puzzle, but very simple. 3)Suggest: Some buggy controls caused me to move diagonally sometimes. It appeared to be caused by pressing more than one arrow key briefly.  It continued whether I had more than one pressed or not.', 'cfc84dae-311d-4e92-b689-17d99f5ac8b8'),
(12, 'STPA6007@MUHCAD.MUHCFRD.CA', '', '', 1, 529, 14, 1, '12/12/2019 16:01:38', '12/12/2019 16:10:50', 'qF:16; qF:16; qT:16; qF:12; qF:12; qF:12; qF:12; qT:12; qT:26; qT:17; qT:5; qT:15; qT:10; qT:1; qF:21; qT:21; qT:18; qT:18; qT:7; qT:24; qT:11; ', '1)Stars: 0 2)Likes: Fun 3)Suggest: More fun games', '2a53766e-0cec-4627-a53a-a577c35e5dd3'),
(13, 'ggnideho@MUHCAD.MUHCFRD.CA', 'gngi6000', 'gngi6000', 1, 173, 9, 1, '12/12/2019 16:05:40', '12/12/2019 16:08:48', 'qT:1; qT:19; qT:8; qT:15; qT:27; qT:13; qF:25; qT:25; qT:20; qT:21; ', '1)Stars: 4 2)Likes: Super 3)Suggest: Super', 'bc2c2bb7-9d01-4e50-8b26-a84d9d88061f'),
(14, 'BRSH6002@MUHCAD.MUHCFRD.CA', '', '', 3, 0, 4, 0, '12/12/2019 16:11:05', '', 'qT:2; qT:2; qT:11; qT:11; ', '', '6e0cd5bd-ac5e-44fc-b50d-040677edcd93'),
(15, 'KOPO6000@MUHCAD.MUHCFRD.CA', '', '', 1, 0, 3, 0, '12/12/2019 16:12:09', '', 'qT:8; qT:7; qF:3; qF:3; qF:3; qT:3; ', '', '929bc39c-0a75-427e-9e38-e35750106a62'),
(16, 'PAAR6004@MUHCAD.MUHCFRD.CA', '', '', 1, 513, 15, 1, '12/12/2019 16:13:32', '12/12/2019 16:22:21', 'qT:8; qT:5; qT:25; qT:15; qF:26; qT:13; qT:13; qT:26; qT:10; qT:2; qF:24; qT:24; qT:9; qT:12; qT:27; qT:21; qT:20; ', '', 'c27342fe-4f04-4d06-a436-b193ba3acb4f'),
(17, 'TRAU6000@MUHCAD.MUHCFRD.CA', 'TRAU6000', 'TRAU6000', 2, 315, 10, 1, '12/12/2019 16:29:59', '12/12/2019 16:35:47', 'qT:3; qT:16; qF:14; qT:14; qT:6; qT:6; qT:1; qT:22; qT:26; qT:27; qT:18; ', '1)Stars: 4 2)Likes: Second SUBMIT could be eliminated 3)Suggest: ', 'e13ff4e9-52dd-4146-8f0f-907c1da5cebd'),
(20, 'BRSH6002@MUHCAD.MUHCFRD.CA', '', '', 4, 0, 3, 0, '12/13/2019 08:54:07', '', 'qT:20; qT:20; qT:16; ', '', 'e68f2148-753b-4a2c-bf80-29e2bbddb1ed'),
(21, 'BRSH6002', 'BRSH6002', 'BRSH6002', 5, 485, 34, 1, '12/13/2019 08:57:13', '12/13/2019 09:05:18', 'qT:13; qT:13; qT:5; qT:5; qF:6; qF:6; qT:6; qT:10; qT:10; qF:23; qT:23; qT:23; qF:24; qF:24; qT:24; qT:4; qT:4; qT:19; qT:19; qT:3; qT:3; qT:17; qT:17; qT:26; qT:26; qT:18; qT:18; qT:1; qT:11; qT:2; qT:2; qT:21; qT:16; qT:15; qT:27; qT:27; qT:8; qT:8; qT:12; ', '', 'fe2c00f8-50ba-45c1-85e9-06aeab7b1376'),
(22, 'BRSH6002', '', '', 6, 0, 3, 0, '12/13/2019 09:05:32', '', 'qT:11; qT:11; qT:6; ', '', '8f482249-49f8-4e12-befe-c900db098547'),
(27, 'ggnideho', 'ggnideho', 'ggnideho', 2, 333, 8, 1, '12/13/2019 09:50:26', '12/13/2019 09:55:59', 'qT:24; qT:13; qF:7; qT:7; qT:11; qT:15; qT:26; qT:19; qT:22; ', '', '1c0f3ad8-e80c-4399-b6ea-86a2cb38dc9c'),
(28, 'UNKNOWN', '', '', 4, 0, 2, 0, '12/13/2019 09:52:10', '', 'qF:14; qF:14; qF:14; qT:14; qT:1; ', '', '75ce6085-229b-42e0-b741-95efb432067b'),
(41, 'TRAU6000', 'TRAU6000', 'TRAU6000', 3, 241, 11, 1, '12/13/2019 11:39:56', '12/13/2019 11:44:39', 'qT:26; qT:6; qT:12; qT:13; qT:25; qT:11; qT:20; qT:21; qT:8; qT:16; qT:4; ', '1)Stars: 5 2)Likes: No problems with the different characters in the french version 3)Suggest: alli s good', 'a8024667-5473-4452-9fb6-b3b49c05e5b2'),
(44, 'aroussin', '', '', 1, 343, 9, 1, '12/13/2019 12:47:37', '12/13/2019 12:53:34', 'qT:9; qT:22; qT:19; qF:6; qT:6; qT:10; qT:18; qF:14; qT:14; qT:16; qT:2; ', '', '661de140-b431-43d8-bf5a-10bf11ffc13b'),
(45, 'aroussin', '', '', 2, 0, 7, 0, '12/13/2019 12:53:53', '', 'qT:22; qT:15; qT:2; qT:19; qT:7; qT:17; qT:10; ', '', '771efeec-1166-4bbd-b019-08bc6adb8510'),
(46, 'STPA6007', '', '', 1, 564, 11, 1, '12/13/2019 12:58:04', '12/13/2019 13:07:55', 'qT:24; qT:5; qT:15; qT:4; qF:23; qT:23; qF:25; qT:25; qT:10; qT:22; qT:1; qT:12; qT:27; ', '1)Stars: 3 2)Likes: Ne sais pas 3)Suggest: Un autre jeu questionnaire', 'ea584e5f-34d1-425e-9301-dd376bb64d1f'),
(47, 'STPA6007', '', '', 2, 301, 12, 1, '12/13/2019 13:08:40', '12/13/2019 13:13:53', 'qT:15; qT:13; qT:18; qF:20; qF:20; qF:20; qT:20; qT:22; qF:19; qT:19; qT:1; qT:1; qF:16; qT:16; qT:8; qT:2; qT:26; ', '1)Stars: 0 2)Likes: Fun 3)Suggest: Fun fun', '3dffa89a-55ce-4624-bf5b-4b1201117cc6'),
(48, 'ZAAL6006', 'ZAAL', 'ZAAL', 1, 348, 11, 1, '12/13/2019 13:13:08', '12/13/2019 13:19:18', 'qT:24; qF:9; qT:9; qT:22; qT:5; qT:6; qT:19; qT:7; qF:15; qT:15; qF:27; qT:27; qT:14; qF:25; qT:25; ', '1)Stars: 5 2)Likes: Wow! Thats much better now! 3)Suggest: Works just fine! Please add more nice questions!', '48876022-242d-49aa-a976-3cdc8562a07d'),
(49, 'TRAU6000', 'TRAU6000', 'TRAU6000', 1, 369, 11, 1, '12/13/2019 13:44:31', '12/13/2019 13:51:02', 'qT:23; qT:10; qT:19; qT:2; qT:3; qT:14; qT:25; qT:13; qT:16; qT:18; qT:17; ', '', 'f4faf40e-6a74-4be1-8a80-4f16de5e998b'),
(50, 'BADO6002', 'bado6002', 'bado6002', 1, 0, 6, 0, '12/13/2019 13:55:17', '', 'qF:10; qF:10; qT:10; qT:10; qT:6; qT:6; qF:14; qF:14; qF:14; qF:14; qT:14; qT:14; ', '', '1dbf2e84-20b9-427e-baf0-99bed6eaa422'),
(51, 'TRAU6000', 'TRAU6000', 'TRAU6000', 2, 0, 1, 0, '12/13/2019 13:55:26', '', 'qT:17; ', 'Inserted: ', '8ec02f93-08db-4749-9a9d-70204e355b46'),
(52, 'BADO6002', 'bado6002', 'bado6002', 2, 0, 6, 0, '12/13/2019 13:57:05', '', 'qF:15; qF:15; qT:15; qT:15; qF:16; qF:16; qT:16; qT:16; qF:5; qF:5; qT:5; qT:5; ', '', '6210c66a-c9f6-4fb7-b5ba-14b03211345e'),
(53, 'BADO6002', 'bbo', 'bbo', 3, 205, 10, 1, '12/13/2019 13:59:29', '12/13/2019 14:02:56', 'qT:1; qF:23; qF:23; qF:23; qF:23; qT:23; qF:4; qT:4; qT:27; qT:27; qT:13; qT:13; qT:16; qT:16; qF:24; qF:24; qF:24; qF:7; qF:7; qF:12; qF:12; qF:18; qF:18; qF:18; qF:18; qF:18; qT:18; ', '', '7767523f-af52-4681-9979-9b43e99a637a'),
(54, 'PAAR6004', '', '', 1, 734, 13, 1, '12/13/2019 14:02:44', '12/13/2019 14:14:58', 'qT:6; qT:5; qT:2; qT:23; qT:3; qT:11; qT:18; qT:24; qT:9; qT:16; qT:14; qT:7; qF:26; qT:26; ', '', '57c9c127-45b3-470c-b0e1-5ce7f16337cf'),
(55, 'TRAU6000', 'TRAU6000', 'TRAU6000', 3, 182, 9, 1, '12/13/2019 14:05:18', '12/13/2019 14:08:47', 'qT:16; qF:17; qT:17; qT:14; qT:13; qT:7; qT:3; qT:15; qT:24; qT:5; ', '1)Stars: 5 2)Likes: GREAT LEARNING EXPERIENCE 3)Suggest: MOREO F THESE', '946d1602-bb8e-40e2-a499-95382c21bc50'),
(56, 'STPA6007', '', '', 3, 225, 12, 1, '12/13/2019 14:12:46', '12/13/2019 14:16:54', 'qT:1; qT:18; qF:25; qT:25; qT:7; qT:11; qT:27; qT:2; qT:2; qT:23; qT:4; qT:4; qT:14; ', '1)Stars: 0 2)Likes: fun 3)Suggest: fun fun', '529ee286-cfad-4d11-adf1-f35a06a1eb2b'),
(57, 'PAAR6004', '', '', 2, 584, 21, 1, '12/13/2019 14:15:13', '12/13/2019 14:25:11', 'qF:16; qF:12; qT:16; qT:12; qT:3; qT:25; qT:24; qT:26; qT:7; qT:18; qT:17; qT:13; qT:27; qT:11; qT:9; qF:19; qT:19; qT:8; qT:23; qT:14; qT:15; qT:21; qT:4; qT:1; ', '', '98c6e687-45f0-402c-89fa-e3940352edfe'),
(58, 'STPA6007', '', '', 4, 350, 15, 1, '12/13/2019 14:18:27', '12/13/2019 14:24:26', 'qT:8; qT:19; qT:19; qT:12; qT:4; qT:4; qF:21; qF:21; qF:21; qT:21; qT:9; qT:9; qT:5; qT:22; qT:25; qT:2; qT:2; qT:13; ', '1)Stars: 0 2)Likes: fun\n 3)Suggest: fun', 'fa7f445a-8020-493e-b0ec-166a5338bb79'),
(59, 'PAAR6004', '', '', 3, 2193, 21, 1, '12/13/2019 14:28:06', '12/13/2019 15:04:40', 'qT:9; qT:11; qT:4; qT:20; qF:12; qT:12; qT:14; qT:18; qT:26; qT:3; qT:5; qT:22; qT:13; qT:23; qT:17; qT:19; qT:7; qT:1; qT:2; qT:24; qT:8; qT:10; ', '', 'b3838173-2532-4c56-a732-3c9433fbf63f'),
(60, 'STPA6007', '', '', 5, 165, 12, 1, '12/13/2019 14:50:33', '12/13/2019 14:53:30', 'qT:9; qT:14; qT:23; qT:23; qT:25; qT:2; qT:5; qT:18; qT:16; qT:15; qT:27; qT:27; ', '1)Stars: 0 2)Likes: fun 3)Suggest: fun', 'fa7846b4-310d-487e-aee3-ba266fe02c26'),
(61, 'STPA6007', '', '', 6, 443, 11, 1, '12/13/2019 14:56:24', '12/13/2019 15:03:54', 'qT:22; qT:23; qT:20; qT:26; qT:18; qT:4; qT:4; qF:16; qF:16; qT:16; qT:24; qT:14; qT:3; ', '1)Stars: 0 2)Likes: fun 3)Suggest: fun', 'c94c2d9b-3fd5-4e26-aa66-53b82e777117'),
(62, 'ZAAL6006', 'ALEX2001', 'ALEX2001', 2, 679, 20, 1, '12/13/2019 16:41:44', '12/13/2019 16:53:44', 'qT:1; qT:4; qT:11; qF:3; qT:3; qF:27; qF:27; qT:27; qT:20; qF:12; qF:12; qT:12; qF:5; qF:5; qF:5; qT:5; qF:26; qF:26; qT:26; qT:14; qT:2; qF:6; qF:6; qF:6; qT:6; qT:15; qT:8; qT:18; qT:24; qF:25; qT:25; qT:10; qT:7; qF:16; qT:16; ', '1)Stars: 5 2)Likes: I like the game! 3)Suggest: Much appreciate your work', 'dcca97cb-2fb0-41dc-bfc7-6a4feee153f2'),
(63, 'ggnideho', '', '', 2, 155, 8, 1, '12/16/2019 08:26:19', '12/16/2019 08:29:32', 'qT:23; qT:26; qT:12; qT:4; qT:3; qT:19; qT:11; qT:10; ', '1)Stars: 0 2)Likes: Great game, keep going 3)Suggest: Great game keep going', 'ac378a02-ab44-4d1a-a01a-024c612278b6'),
(64, 'ggnideho', '', '', 3, 213, 8, 1, '12/16/2019 08:31:35', '12/16/2019 08:35:23', 'qT:10; qT:18; qF:6; qT:6; qF:23; qT:23; qF:8; qT:8; qT:15; qT:5; qT:1; ', '1)Stars: 0 2)Likes: Great 3)Suggest: Great', 'a7751a1c-cd08-4e1f-8c17-50ebfff38bc4'),
(65, 'STPA6007', 'stpa6007', 'stpa6007', 7, 314, 11, 1, '12/16/2019 08:32:39', '12/16/2019 08:38:23', 'qT:3; qT:17; qT:14; qT:9; qT:10; qT:13; qT:11; qT:2; qT:26; qT:25; qT:7; ', '1)Stars: 0 2)Likes: Cool 3)Suggest: Cool', 'fefbdb51-9b85-4d05-90b7-86b3ead7a158'),
(66, 'UNKNOWN', 'JACKSPARROW', 'JACKSPARROW', 2, 137, 10, 1, '12/16/2019 08:42:20', '12/16/2019 08:45:03', 'qT:18; qF:10; qF:10; qT:10; qF:5; qF:5; qF:5; qT:5; qT:17; qF:24; qT:24; qT:19; qT:3; qT:13; qF:9; qT:9; qF:22; qT:22; ', '1)Stars: 5 2)Likes: Great game! And my pirates team too! 3)Suggest: I like it, please do more games like that!', '1e5f8af4-7be2-4416-90b5-565ffd06cb4e'),
(67, 'STPA6007', '', '', 8, 325, 9, 1, '12/16/2019 08:43:46', '12/16/2019 08:49:12', 'qT:13; qT:16; qT:19; qT:23; qT:8; qT:9; qT:3; qF:20; qT:20; qT:25; ', '', '9e7ae4b2-e4db-40d2-8779-45f69ebe418f'),
(68, 'UNKNOWN', 'JACKSPARROW', 'JACKSPARROW', 3, 90, 8, 1, '12/16/2019 08:47:26', '12/16/2019 08:50:21', 'qT:7; qT:12; qT:2; qF:27; qT:27; qT:4; qT:19; qF:14; qT:14; qF:9; qT:9; ', '1)Stars: 4 2)Likes: Cool! 3)Suggest: Great!', '8c469494-57e5-42f7-aa22-687072c661c5'),
(69, 'UNKNOWN', 'JACKSPARROW', 'JACKSPARROW', 4, 106, 9, 1, '12/16/2019 08:53:00', '12/16/2019 08:55:03', 'qT:22; qT:14; qT:4; qF:15; qT:15; qF:16; qT:16; qF:25; qT:25; qF:5; qT:5; qT:9; qT:3; ', '1)Stars: 5 2)Likes: Easy and fun game! Great! 3)Suggest: One more game like that!', 'c167a210-7b1a-4904-9d40-c543274b279c'),
(70, 'STPA6007', '', '', 9, 1033, 11, 1, '12/16/2019 08:54:25', '12/16/2019 09:11:39', 'qT:20; qT:16; qT:8; qT:5; qT:7; qT:1; qT:12; qT:3; qT:11; qT:9; qT:25; ', '', '1a374004-9a72-4e91-b854-466fa003a49f'),
(71, 'UNKNOWN', '', '', 5, 0, 3, 0, '12/16/2019 09:04:01', '', 'qT:13; qT:11; qF:5; qT:5; ', '', '7c45b6d1-9fb7-456d-8c0a-dc697fd8dd60'),
(72, 'UNKNOWN', '', '', 6, 109, 9, 1, '12/16/2019 09:06:18', '12/16/2019 09:08:16', 'qF:12; qT:12; qT:9; qT:5; qT:4; qT:2; qT:11; qT:22; qT:7; qT:17; ', '1)Stars: 5 2)Likes: gggg 3)Suggest: mghmghgj gh jghjg', 'c81a09c5-06a2-4eb8-81d8-24c4b9f98d62'),
(73, 'TRAU6000', '', '', 5, 102, 8, 1, '12/16/2019 09:09:41', '12/16/2019 09:11:30', 'qT:27; qT:7; qT:3; qT:10; qT:20; qT:11; qT:21; qT:1; ', '1)Stars: 5 2)Likes: iko 3)Suggest: koop', '58b6641a-5444-4332-8a47-1c9dc7e017a9'),
(74, 'ggnideho', '', '', 4, 540, 8, 1, '12/16/2019 09:10:44', '12/16/2019 09:22:05', 'qT:25; qT:24; qT:12; qT:4; qT:18; qF:14; qT:14; qT:10; qT:21; ', '1)Stars: 0 2)Likes: ok 3)Suggest: ok', 'c73782ed-74d9-4fc8-8514-4a55733771a5'),
(75, 'STPA6007', '', '', 10, 703, 10, 1, '12/16/2019 09:19:14', '12/16/2019 09:30:57', 'qT:27; qT:1; qT:24; qT:13; qT:4; qT:10; qT:14; qT:3; qT:26; qT:2; ', '', '5e243250-4fba-40a4-80a8-85f457ecb545'),
(76, 'UNKNOWN', '', '', 7, 168, 10, 1, '12/16/2019 10:11:08', '12/16/2019 10:14:05', 'qT:23; qT:25; qT:13; qT:12; qT:7; qT:18; qT:2; qT:11; qF:8; qT:8; qT:26; ', '1)Stars: 4 2)Likes: ewee 3)Suggest: eeeee', '26c72a03-5738-406c-bc05-7f521a192dd6'),
(77, 'UNKNOWN', 'ZAAL6006', 'ZAAL6006', 8, 182, 9, 1, '12/16/2019 11:02:42', '12/16/2019 11:05:54', 'qT:26; qT:1; qF:15; qF:15; qF:15; qF:15; qT:15; qF:6; qF:6; qF:6; qT:6; qF:16; qF:16; qF:16; qT:16; qT:20; qF:10; qT:10; qF:5; qT:5; qT:19; ', '1)Stars: 5 2)Likes: Cool! 3)Suggest: I like it!', '7a2c29b1-87cc-4b6f-b4e8-45dc9165ed6a'),
(78, 'UNKNOWN', '', '', 9, 221, 9, 1, '12/16/2019 11:08:21', '12/16/2019 11:12:14', 'qT:11; qT:13; qT:1; qF:16; qT:16; qT:6; qT:3; qT:27; qT:19; qF:5; qF:5; qF:5; qT:5; ', '1)Stars: 5 2)Likes: Great! 3)Suggest: Like it!', '0f592f53-f105-4b96-8848-af73a340a056');

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
