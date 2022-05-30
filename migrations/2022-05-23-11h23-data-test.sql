-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 23 mai 2022 à 09:21
-- Version du serveur : 5.7.24
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`idArticle`, `title`, `abstract`, `content`, `image`, `createdAt`, `fkCategoryId`, `fkUserId`) VALUES
(15, 'A trois semaines des élections législatives, trois blocs se partagent plus de 75 % des intentions de vote', 'Selon la onzième vague Ipsos-Sopra Steria, en partenariat avec « Le Monde », les rapports de force issus du premier tour de l’élection présidentielle sont en passe de dessiner le profil de la prochaine Assemblée.', 'Les rapports de force issus du premier tour de l’élection présidentielle sont en passe de dessiner le profil de la prochaine Assemblée nationale. A trois semaines du premier tour des élections législatives, plus de 75 % des intentions de vote se répartissent entre la majorité présidentielle sous la bannière Ensemble (Renaissance, MoDem, et Horizons : 28 %, marge d’erreur de plus ou moins 1,1 point), la Nouvelle Union populaire, écologique et sociale (Nupes) – réunissant La France insoumise (LFI), Europe Ecologie-Les Verts (EELV), le Parti socialiste (PS) et le Parti communiste français (PCF), 27 %, même marge d’erreur – et le Rassemblement national (RN, 21 %, marge d’erreur de plus ou moins 1 point). Si l’on ajoute les voix que recueilleraient les candidats estampillés Reconquête !, le parti d’Eric Zemmour (6 %, marge d’erreur de plus ou moins 0,6 point), alors le bloc d’extrême droite représenterait environ 27 % des intentions de vote.', 'img2.jpg', '2022-05-23 09:08:43', 5, 9),
(16, 'Visite à haut risque en Chine pour Michelle Bachelet, haut-commissaire de l’ONU aux droits de l’homme', 'Elle a été critiquée pour sa discrétion sur les violations des droits des Ouïgours dans la région du Xinjiang, où elle doit se rendre dans les prochains jours. ', 'En visite officielle en Chine – « à l’invitation du gouvernement chinois », selon Pékin – du lundi 23 au samedi 28 mai, Michelle Bachelet, haut-commissaire des Nations unies aux droits de l’homme, doit se rendre à Kashgar et Urumqi. Ces villes sont les deux principales cités du Xinjiang, une région où plus de 1 million de Ouïgours seraient détenus et où la Chine aurait commis « un génocide », selon les accusations de plusieurs parlements nationaux. En raison de la politique zéro Covid, Michelle Bachelet ne passera pas à Pékin. Elle devait atterrir à Canton et mener des entretiens – vraisemblablement par vidéo – avec des responsables chinois, des représentants des milieux d’affaires, des diplomates et des « organisations de la société civile ».\r\n\r\nCe voyage est à haut risque pour l’ancienne présidente chilienne, dont on ignore si elle conservera ses fonctions à la tête du Haut-Commissariat des Nations unies aux droits de l’homme (OHCHR) à l’issue de son premier mandat de quatre ans qui s’achève le 1er septembre. « C’est le voyage de sa vie », estime l’ambassadeur d’un pays européen à Pékin. A Genève, les milieux internationaux critiques de la politique d’apaisement des agences onusiennes avec la Chine considèrent ce déplacement comme un « test crucial, presque définitif, de la crédibilité de l’agence ». Vendredi 20 mai, Ned Price, porte-parole du département d’Etat américain, a déclaré que les Etats-Unis étaient « très inquiets » quant aux conditions de cette visite. « Nous ne pensons pas que la Chine lui garantisse l’accès nécessaire pour accomplir une évaluation complète et non manipulée de la question des droits de l’homme au Xinjiang. »\r\n\r\nA quoi, à qui Michelle Bachelet aura-t-elle accès, et dans quelles conditions ? « Nous n’entrons généralement pas dans les détails au sujet des termes de référence », a fait savoir la porte-parole de l’OHCHR. Comme avant toutes les visites de délégations onusiennes menées dans des pays au contexte compliqué, « les termes de référence » font l’objet d’un accord négocié en grand secret entre les deux parties durant des mois, sur ce que la mission pourra voir ou non.', NULL, '2022-05-23 09:09:54', 5, 9),
(17, 'Cannes 2022 : « Triangle of Sadness », le capitalisme en phase terminale', 'Le Suédois Ruben Östlund, Palme d’or en 2017, continue, sans finesse, de régler ses comptes avec la société occidentale. ', 'Après la Palme d’or obtenue en 2017 pour The Square, le Suédois Ruben Östlund, 48 ans, revient en compétition régler ses comptes à la société occidentale, qu’il place cette fois sur un yacht de luxe. Son arme favorite, la satire grinçant sous le poids du sarcasme vengeur, est ici poussée au carré, dans des retranchements inédits et avec les proportions massives d’une fiction de deux heures trente, qui ne sont plus exactement celles d’une farce, même explosive.', 'img1.jpg', '2022-05-23 09:10:52', 6, 9);

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`idCategory`, `label`) VALUES
(4, 'PHP'),
(5, 'JavaScript'),
(6, 'SQL');

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`idUser`, `firstname`, `lastname`, `email`, `hash`, `createdAt`, `role`) VALUES
(9, 'Alfred', 'Dupont', 'alfred@gmail.com', '$2a$12$C1lAEN9md/exmC4hnE.4te/vnSPS7ekTUMaNLH19AcGIiYEu8bSlq', '2022-05-23 09:07:48', 'ADMIN');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
