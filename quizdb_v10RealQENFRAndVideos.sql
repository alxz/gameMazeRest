-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 11, 2019 at 06:16 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tabanswers`
--

INSERT INTO `tabanswers` (`ansId`, `ansTxt`, `ansQId`, `ansIsValid`, `ansTxtFRA`) VALUES
(1,'Call your team and discuss the completion of a AH 223 report',1,0,N'Vous appelez votre équipe et préparez un rapport AH 223'),
(2,'You call Help Desk at 48484 to inform them.',1,1,N'Vous appelez le support  informatique au 48484 pour leurs informer'),
(3,'You call 55555 and call an IS code as the whole network could be infected',1,0,N'Vous appelez 55555 pour déclencher un code IS, puisque l\'ensemble du réseau pourrait être  infecté'),
(4,'None of the above',1,0,N'Aucune de ces réponses'),
(5,'Call HELP DESK at 48484',2,1,N'Appeler le soutien informatique au 48484'),
(6,'Ignore the message',2,0,N' Ignorer le message '),
(7,'Request advice on social networks',2,0,N'Demander des conseils sur les réseaux sociaux '),
(8,'None the above',2,0,N'Aucune de ces réponses'),
(9,'Confidentiality of patient information',3,0,N'Confidentialité des informations des patients'),
(10,'Security Management of informational assets',3,0,N'Gestion sécuritaire des actifs informationnels'),
(11,'Acceptable use of information assets ',3,0,N'Utilisation acceptable des ressources informationnelles'),
(12,'All of the above',3,1,N'Tout ce qui précède'),
(13,'You would call your manager and discuss the completion of a AH 223 report',4,0,N'Vous appelez votre superviseur pour déterminer s\'il y a lieu de remplir un formulaire d\'incident AH 223'),
(14,'You would call Help Desk at 48484 ',4,1,N'Vous appelez le Centre d\'appel au 48484 '),
(15,'You would call 55555 and trigger an \'IS\' code as the whole network could be infected',4,0,N'Vous appelez 55555 et déclenchez un code \'IS\' car tout le réseau pourrait être infecté'),
(16,'None of the above',4,0,N'Aucune de ces réponses'),
(17,'Direct him to the section of the website where all of the P\&P\'s are posted',5,0,N'Vous le dirigez vers la section de l\'intranet où se trouvent les Politiques et procédures'),
(18,'You remind him to ask the patient for written consent prior to taking pictures and file it in his medical file',5,1,N'Vous lui rappelez de demander le consentement écrit au patient avant de prendre des photos et le classez dans son dossier médical'),
(19,'You let him take the picture and use it regardless of his consent because he\’s the surgeon',5,0,N'Le médecin étant le chirurgien qui a opéré le patient, vous le laissez prendre la photo et l\'utiliser, sans recueillir le consentement de l\'intéressé'),
(20,'none of the above',5,0,N'Aucune de ces réponses'),
(21,'Acceptable use of information assets',6,0,N'Utilisation acceptable des ressources informationnelles '),
(22,'Security Management of informational assets',6,0,N'Sécurité des actifs informationnels '),
(23,'Confidentiality agreement',6,0,N'Confidentialité des informations des patients '),
(24,'All of the above',6,1,N'Tout ce qui précède '),
(25,'Move the cursor back and hope the action is undone?',7,0,N'Sur votre navigateur web, vous cliquez sur le bouton de retour à la page précédente, en espérant que cela annulera votre erreur.'),
(26,'Erase the windows explorer files and hope nobody notices?',7,0,N'Vous ouvrez votre explorateur Windows et effacez les fichiers chiffrés en espérant que personne ne le remarquera.'),
(27,'Call 48484 and inform them of your involuntary action?',7,1,N'Vous appelez le 48484 et l\'informez de votre action involontaire.'),
(28,'Keep working as if nothing happened?',7,0,N'Vous continuez à travailler comme si de rien n\'était.'),
(29,'The logo on the email looks familiar and the personal information required sounds legitimate, so you click on the link.',8,0,N'Le logo dans le courriel vous est familier et les informations personnelles requises semblent légitimes, vous cliquez donc sur le lien.'),
(30,'As you receive lots of offers during holiday season you inadvertently click on the link.',8,0,N'Comme vous recevez de nombreuses offres pendant le temps des fêtes, vous cliquez dessus par habitude.'),
(31,'You doubt the email as this company should not have your professional address, so you inform the Help Desk at 48484 ',8,1,N'Vous trouvez étrange que cette compagnie dispose de votre adresse courriel professionnelle et, dans le doute, vous informez le Soutien Technique au 48484.'),
(32,'None of the above',8,0,N'Aucune de ces réponses'),
(33,'It is not necessary because the system logs off automatically every 15 minutes',9,0,N'Ce n\'est pas nécessaire car le système se déconnecte automatiquement après 15 minutes d\'inactivité.'),
(34,'It is necessary to prevent others to snoop into your files',9,1,N'C\'est nécessaire, pour empêcher les autres de fouiner dans vos fichiers'),
(35,'It is not important because you are not responsible for activity in your account from the time you log in to the time you log out',9,0,N'Ce n\'est pas important car vous n\'êtes pas responsable de l\'activité sur votre compte durant vos temps de connexion'),
(36,'All of the above',9,0,N'Aucune de ces réponses'),
(37,'To use simple and short password ',10,0,N'utiliser un mot de passe simple et court '),
(38,'To use a complex password with upper and lower case characters as well as numbers and some symbols',10,1,N'utiliser un mot de passe complexe avec des caractères majuscules et minuscules ainsi que des chiffres et certains symboles'),
(39,'To leave your workstation unlocked allowing a colleague to access later, when he has the time',10,0,N'laisser sa session de travail déverrouillée, pour permettre à un collègue d\'y accéder plus tard, quand il aura un moment'),
(40,'To write your password on a post-it and stick it on your monitor, in an open office ',10,0,N'Noter son mot de passe sur un papillon adhésif collé sur son moniteur, dans un bureau non verrouillé.'),
(41,'To use robust passwords',11,0,N'Utiliser des mots de passe robustes.'),
(42,'To lock or close your session if you step out of your office',11,0,N'Verrouiller ou fermer la session si vous quittez votre poste de travail informatique.'),
(43,'To restrict the access to patient information  only to members of the patient’s care team ',11,0,N'Restreindre l\'accès aux informations-patients aux seuls les membres de son équipe de soins .'),
(44,'All of the above',11,1,N'Tout ce qui précède'),
(45,'Before we let them in, we should ask for their identity and who  they are going to see. Once they are duly identified, escort them to a designated office',12,0,N'Avant l\'avoir fait entrer, je lui demande son identité et celle de la personne qu\'il vient voir. Une fois le visiteur identifié, Je l\'accompagne jusqu\'au bureau de cette personnne.'),
(46,'If the host is not in his office, invite the visitor to wait outside',12,0,N'Si ladite personne n\'est pas à son bureau, j\'invite le visiteur à ressortir des locaux.'),
(47,'If the visitor refuses to wait outside, inform the physical security service in your building',12,0,N'Si le visiteur refuse de ressortir des locaux, j\'avertis immédiatement le service de la sécurité physique'),
(48,'All of the above',12,1,N'Tout ce qui précède'),
(49,'So that everyone knows who you are',13,0,N'Pour que tout le monde sache qui vous êtes'),
(50,'So that everyone can ask who you are looking for',13,0,N'Pour que chacun puisse demander qui vous cherchez'),
(51,'So that other staff know you are entitled to circulate in the premises',13,1,N'Pour que les autres membres du personnel sachent que vous avez le droit de circuler dans des locaux du CUSM'),
(52,'None of the above',13,0,N'Aucune de ces réponses'),
(53,'As it complies to a policy and procedure',14,0,N'Puisqu\'il est conforme à une politique et procédure'),
(54,'As it identifies who you are and allows security to validate your electronic privileges to circulate in restricted secured areas',14,1,N'Puisqu\'il  vous identifie et permet à la sécurité de valider vos privilèges électroniques pour circuler dans des zones sécurisées restreintes'),
(55,'So that visitors can ask you for information',14,0,N'Pour des visiteurs qui pourraient vous demander des informations'),
(56,'All of the above',14,0,N'Tout ce qui précède'),
(57,'We should never take pictures of patientsbecause this infringes their rights ',15,0,N'On ne peut jamais prendre de photos d\'un patient car cela viole ses droits et libertés '),
(58,'We should never takepictures with a smartphone ',15,0,N'On ne peut jamais prendre des photos du patient avec un téléphone cellulaire.'),
(59,'The pictures should be taken in a way that the patient is clearly recognizable',15,0,N'Les photos doivent être prises de manière à ce que le patient soit clairement reconnaissable'),
(60,'The pictures where a patient can be recognized should be taken only with previous patient consent',15,1,N'Les photos permettant d\'identifier un patient ne peuvent être prises qu\'avec le consentement préalable de celui-ci.'),
(61,'To converse about the diagnoses of patients you are treating',16,0,N'de parler des diagnostics des patients que vous traitez.'),
(62,'To talk about the cultural and sport activities you practice at the hospital’s premises',16,1,N'de parler des activités culturelles ou sportives que vous exercez dans les locaux de l\'hôpital'),
(63,' To give your personal opinion about a Public Health policy that is being deployed by the government',16,0,N'de donner votre avis personnel sur la politique de santé publique menée par le gouvernement'),
(64,'To do all of the above',16,0,N'de faire tout ce qui précède'),
(65,'Only when the patient visits a newborn in the nursery',17,0,N'Uniquement lorsque le patient visite un nouveau-né dans la pouponnière.'),
(66,'Only when the patient is undergoing a surgical procedure that is innovative and might be presented in a medical teaching session ',17,0,N'Seulement lorsque le patient subit une intervention chirurgicale innovante, qui pourrait être présentée dans une session d\'enseignement médical.'),
(67,'Only when the patient is aware that he is part of a research project',17,0,N'Seulement dans le cadre d\'un projet de recherche'),
(68,'When the patient can be identified in that photo',17,1,N'Lorsque le patient peut être identifié sur la photo.'),
(69,'Use it across multiple sites ',18,0,N'L\'utiliser sur plusieurs sites'),
(70,'Share it with colleagues',18,0,N'Le partager avec vos collègues'),
(71,'Ensure it is clearly written on a post it on your computer screen in an open office',18,0,N'Vous assurer qu\'il est écrit clairement sur un papillon adhésif sur votre écran d\'ordinateur, à votre bureau en aire ouverte'),
(72,'None of the above',18,1,N'Aucune de ces réponses'),
(73,'That has less than 8  characters',19,0,N'Qui a moins de 8 caractères'),
(74,'Built with a word where  \'E\' is replaced by \'3\' ',19,0,N'Constitué d\'un mot dans lequel les \'E\' sont remplacés par des \'3\' '),
(75,'That all its characters are lowercase',19,0,N'Qui a seulement des caractères minuscules'),
(76,'None of the above',19,1,N'Aucune de ces réponses'),
(77,'A date easy to remember',20,0,N'une date facile à retenir'),
(78,'Is an easy and short word that you can find in the dictionary',20,0,N'Un mot simple et court trouvable dans n\’importe quel dictionnaire'),
(79,'Is a long word (more than 20 letters) that you can find in the dictionary',20,0,N'Un mot très long (plus de 20 lettres) du dictionnaire '),
(80,'None of the above',20,1,N'Aucune de ces réponses'),
(81,'it is created by including special characters and numbers',21,0,N'qu\'il inclut des caractères spéciaux et des chiffres'),
(82,'it is protected from others\'  sight',21,0,N'qu\'il soit conservé hors  de la vue d\'autrui'),
(83,'it uses initial letters of words from a long phrase that you like',21,0,N'qu\'il soit constitué des premières lettres des mots d\'une longue phrase que vous aimez.'),
(84,'All of the above',21,1,N'Tout ce qui précède'),
(85,'Use a very pricy toothbrush that you can show to everybody',22,0,N'Utilisez une brosse à dents très chère pour la montrer à tout le monde'),
(86,'Make sure of leaving it in a visible place so your colleague can use when in need',22,0,N'Assurez-vous de la laisser dans un endroit visible afin que votre collègue puisse l\'utiliser en cas de besoin'),
(87,'Keep the same one for a lifetime',22,0,N'Gardez la même pour toute une vie'),
(88,'None of the above',22,1,N'Aucune de ces réponses'),
(89,'Call the security guard to inform they are contravening the privacy of the patient',23,0,N'Vous appelez le gardien de sécurité pour l\'informer que ces employés portent atteinte à la vie privée du patient'),
(90,'Kindly request them to continue their conversation in a private place',23,1,N'Vous demandez à ces employés de continuer leur conversation dans un lieu privé'),
(91,'Engage in conversation with them and start asking them questions about the surgery',23,0,N'Vous engagez la conversation avec eux et leur posez des questions sur la chirurgie de ce patient '),
(92,'All of the above',23,0,N'Tout ce qui précède'),
(93,'Could you kindly identify yourself? ',24,0,N'Pourriez-vous vous identifier svp? '),
(94,'Would you please let us know where your meeting is taking place? ',24,0,N'Pourriez-vous s\'il vous plaît nous faire savoir où votre réunion a lieu?.'),
(95,'I will certainly inform your host so he can come and look for you',24,0,N'Je vais informer votre hôte et lui demander de passer vous chercher? '),
(96,'All of the above',24,1,N'Tout ce qui précède'),
(97,'You invite him to trespass into your section and look around',25,0,N'l\'invitez dans votre section pour qu\'il puisse regarder l\'environnement'),
(98,'You invite him to leave your section as he does not have an ID card',25,0,N'l\'invitez à quitter votre section car il n\'a pas de carte d\'identité'),
(99,'You call the physical security office in your building immediately ',25,1,N'Vous appelez la sécurité physique immédiatement '),
(100,'All of the above',25,0,N'Tout ce qui précède'),
(101,'You give the intern  your login information(user ID and password)  so that she can access information ',26,0,N'Vous donnez vos informations de connexion (identifiant et mot de passe) à la stagiaire pour qu\'elle puisse accéder à vos fichiers '),
(102,'You leave your session active on your workstation so that the intern can work whenever she needs to',26,0,N'Vous laissez votre session active en tout temps sur votre poste informatique pour que la stagiaire puisse y travailler quand elle en a besoin.'),
(103,'You copy your login information on a post-it and stick it on the monitor in an open office so that the intern can work while you are away  ',26,0,N'Vous inscrivez vos informations de connexion (identifiant et mot de passe) sur un papillon adhésif que vous collez sur votre poste de travail en aire ouverte pour que la stagiaire puisse travailler sur vos dossiers durant votre absence'),
(104,'All of the above',26,1,N'Toutes les précédentes'),
(105,'Low because the probability of having a malicious colleague is minimal',27,0,N'Faible parce que la probabilité d\'avoir des collègues malintentionnés est minime'),
(106,'Medium because in escence, it is possible that one of my colleagues might be tempted to look for information that concerns me and he shouldn\'t',27,0,N'Moyen, essentiellement parce qu\'il est possible qu\'un de mes collègues soit tenté de rechercher indûment des informations me concernant.'),
(107,'High because I am accountable of all the activity occurring during my session, including unacceptable use of informational assets under my session, including unacceptable use of MUHC\'s information assets  by other individuals',27,1,N'Elevé, parce que je suis responsable de toutes les activités qui se produisent pendant ma session, y compris l\'utilisation inappropriée d\'actifs informationnels du CUSM par d\'autres personnes.'),
(108,'All of the above',27,0,N'Tout ce qui précède.');


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
  `questionurlFRA` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`qId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tabquestions`
--

INSERT INTO `tabquestions` (`qId`, `qTxt`, `qIsTaken`, `qIsAnswered`, `questionurl`, `qTxtFRA`, `questionurlFRA`) VALUES
(1,'You suspect your computer and the information you are accessing on a database are compromised….you then',0,0,'https://player.vimeo.com/video/303102987',N'Vous soupçonnez que votre ordinateur a été piraté et que les informations auxquelles vous accédez par son intermédiaire sont compromises. Aussitôt: ','https://player.vimeo.com/video/303103168'),
(2,'You received an email from  a hacker informing you that he took control of your professional data and requesting a ransom. What should you do?',0,0,'https://player.vimeo.com/video/303102987',N'Vous avez reçu un courriel d\'un pirate vous informant qu\'il a pris le contrôle de vos données professionnelles et demande une rançon. Que devriez-vous faire?','https://player.vimeo.com/video/241087789'),
(3,'A staff member takes advantage of an open session to snoop into a colleague`s medical record. What is the main violation she/he is incurring? ',0,0,'https://player.vimeo.com/video/302832544',N'Un membre du personnel profite d\'une session ouverte pour fouiner dans le dossier médical d\'un collègue. Quelle norme professionnelle viole-t-il ?','https://player.vimeo.com/video/302833635'),
(4,'You are receiving an email request to click on a link and provide login information for computer maintenance.. What would you do: ',0,0,'https://player.vimeo.com/video/303102987',N'Vous recevez un courriel vous demandant de cliquer sur un lien afin d\'effectuer une mise à jour logicielle. La page web s\'affiche alors vous demande de fournir vos identifiants et mot de passe d\’accès au réseau. Que faites-vous ?','https://player.vimeo.com/video/241087789'),
(5,'You are part of the care team of a patient that has an identifiable tattoo on his body. A physician wants to take a picture of him for presenting his case at a conference. You:',0,0,'https://player.vimeo.com/video/302832544',N'Vous faites partie de l\'équipe de soins d\'un patient qui porte un tatouage particulier susceptible de l\'identifier aisément. En vue d\'une conférence qu\'il doit bientôt donner pour présenter le cas de ce patient, un médecin veut prendre une photo du corps de ce patient au niveau de son tatouage:','https://player.vimeo.com/video/302833635'),
(6,'An employee has had to go on sick leave. He looks at the results of his last blood tests on OACIS. What principle would he be infringing?',0,0,'https://player.vimeo.com/video/302832544',N'Un employé a dû partir en congé maladie. Il accède et regarde les résultats de ses derniers tests sur OACIS. Quel principe enfreint-il?','https://player.vimeo.com/video/302833635'),
(7,'Ransomware is a type of malware that requests the client pay a ransom in order to return access to his files. It arrives via e-mail in the form of a url. When you click on it, you accept intrusion. From then on, the ransomware triggers the encryption of  all your files. What would you do in a similar situation:',0,0,'https://player.vimeo.com/video/303102987',N'Le rançongiciel est un type de maliciel qui demande au client de payer une rançon afin de lui rendre l\'accès à ses fichiers. Il s\'introduit dans les systèmes informatiques via un courriel qui comprend un lien vers une ressource Internet. Lorsque vous cliquez dessus, vous autorisez l\'intrusion du programme sur votre ordinateur. Dès lors, le rançongiciel commence à chiffrer vos fichiers. Que feriez-vous dans une telle situation ?','https://player.vimeo.com/video/241087789'),
(8,'You received a product offer email What should you do?',0,0,'https://player.vimeo.com/video/303102987','Vous avez reçu un courriel commercial. Que devriez-vous faire?','https://player.vimeo.com/video/241087789'),
(9,'Why would you always need to lock or log off your work station?',0,0,'https://player.vimeo.com/video/302832544',N'Pourquoi auriez-vous toujours besoin de verrouiller ou de vous déconnecter de votre session de travail?','https://player.vimeo.com/video/302833635'),
(10,'Which of the following are security acceptable practices to secure the access to your work station:',0,0,'https://player.vimeo.com/video/302832544',N'Parmi les déclarations suivantes, lesquelles sont des pratiques acceptables en matière de sécurisation des accès à sa session de travail sur son poste informatique:','https://player.vimeo.com/video/302833635'),
(11,'Which are the best practices for protecting patient information ',0,0,'https://player.vimeo.com/video/302832544',N'Quelles sont les meilleures pratiques pour protéger les informations des patients qui sont stockées dans nos bases de données:','https://player.vimeo.com/video/302833635'),
(12,'It is possible to welcome visitors without identity cards to our offices, with the following precautions',0,0,'https://player.vimeo.com/video/241087789',N'Il est possible de donner accès à nos bureaux administratifs à des visiteurs, qui ne portent pas de carte d\'identité du CUSM, mais en prenant les précautions suivantes ','https://player.vimeo.com/video/244339235'),
(13,'Why is it important to wear your ID card',0,0,'https://player.vimeo.com/video/241087789',N'Pourquoi est-il important de porter votre carte d\'identité de façon visible?','https://player.vimeo.com/video/244339235'),
(14,'Wearing a visible ID card is important',0,0,'https://player.vimeo.com/video/241087789',N'Le port d\'une carte d\'identité est important','https://player.vimeo.com/video/244339235'),
(15,'What are the requirements for taking pictures of patients:',0,0,'https://player.vimeo.com/video/302832544',N'Quelles sont les exigences pour prendre des photos de patients:','https://player.vimeo.com/video/302833635'),
(16,'In public spaces especially elevators, corridors and coffee shops, where there are other people,  it is permitted:',0,0,'https://player.vimeo.com/video/241087805',N'En présence d\'autres personnes (notamment dans les espaces publics comme les ascenseurs, les couloirs et les cafés), il est permis ..','https://player.vimeo.com/video/244339094'),
(17,'When do you need patient consent for taking pictures of him/her?',0,0,'https://player.vimeo.com/video/241087805',N'Quand avez-vous besoin du consentement du patient pour le prendre en photo ?','https://player.vimeo.com/video/244339094'),
(18,'Once you have a consistent password you can',0,0,'https://player.vimeo.com/video/241087822',N'Une fois que vous avez un mot de passe robuste, vous pouvez…','https://player.vimeo.com/video/244338953'),
(19,'The best password is the one ',0,0,'https://player.vimeo.com/video/241087822',N'Un mot de passe fort est un mot de passe :','https://player.vimeo.com/video/244338953'),
(20,'When making the choice of a password to protect the  access to a database you will ensure it Is',0,0,'https://player.vimeo.com/video/241087822',N'Pour sécuriser votre accès à une base de données, vous pouvez choisir comme mot de passe:','https://player.vimeo.com/video/244338953'),
(21,'If you want to choose a password that will be difficult to discover by people with bad intentions, you will make sure that:',0,0,'https://player.vimeo.com/video/241087822',N'Si vous faites le choix d\’un mot de passe difficile à découvrir par des personnes mal intentionnées, vous vous assurez que:','https://player.vimeo.com/video/244338953'),
(22,'Passwords are like toothbrushes.. so you should',0,0,'https://player.vimeo.com/video/241087842',N'Les mots de passe sont comme les brosses à dents.','https://player.vimeo.com/video/244338734'),
(23,'You are a patient at the hospital and you are in the cafeteria. Sitting next to you 2 members of the staff are talking about a patient currently in the  operated room, who is actually a renown politician. You:',0,0,'https://player.vimeo.com/video/241087805',N'Vous êtes patient à l\'hôpital et vous êtes à la cafétéria. Assis à côté de vous, deux membres du personnel dicutent d\'un patient présentement en salle d\'opérations, qui s\'avère être unpoliticien de renom. Que faites-vous ?','https://player.vimeo.com/video/244339094'),
(24,'A person arrives for a meeting in the floor of the office building and is not wearing an ID card. If you opened the door for him/her what would you ask?',0,0,'https://player.vimeo.com/video/241087789',N'Une personne arrive pour une réunion à l\'étage de l\'immeuble de bureaux et ne porte pas de carte d\'identité. Vous lui ouvrez la porte, et lui demandez','https://player.vimeo.com/video/244339235'),
(25,'There is an incident at the hospital and the press is covering it. A journalist wanders around the hospital to try to gather additional information t. You notice this gentleman has no ID card and …',0,0,'https://player.vimeo.com/video/241087789',N'Il y a un incident à l\'hôpital et la presse le couvre. Un journaliste se promène dans l\'hôpital, peut être il cherche  des informations supplémentaires. Vous remarquez qu\’il ne porte pas de carte donc vous…','https://player.vimeo.com/video/244339235'),
(26,'You are a medical secretary, and an intern has been hired to work with you during a period of heavy workload. Which of the following is inappropriate?',0,0,'https://player.vimeo.com/video/241087842',N'Vous êtes secrétaire médical, à l\'accueil d\'une clinique recevant un grand nombre de patients. Vous connaissez présentement une intense période de surcharge de travail. Aussi a-t-on embauché temporairement une stagiaire pour vous assister durant quelques semaines. Lequel des énoncés suivants est inapproprié ?','https://player.vimeo.com/video/244338734'),
(27,'How would you evaluate the risk of sharing passwords:',0,0,'https://player.vimeo.com/video/241087842',N'Comment évalueriez-vous le risque de partager des mots de passe:','https://player.vimeo.com/video/244338734');

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
  `sessionId` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`uId`),
  UNIQUE KEY `sessionId` (`sessionId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tabusers`
--

INSERT INTO `tabusers` (`uId`, `uIUN`, `uFName`, `uLName`, `uRetryCount`, `uTimer`, `uTotalScore`, `uIsFinished`, `timestart`, `timefinish`, `listofquestions`, `comment`, `sessionId`) VALUES
(1, ' ', ' ', ' ', 1, 0, 0, 0, '12/11/2019 09:57:11', '', 'qF:15; ', 'Inserted: ', '6eed91bd-47eb-45f2-8626-0d789311aaea');

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
