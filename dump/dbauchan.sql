-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 28 mai 2024 à 20:30
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dbauchan`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id_categorie` int NOT NULL,
  `nom_categorie` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id_categorie`, `nom_categorie`) VALUES
(1, 'Électronique'),
(2, 'Vêtements'),
(3, 'Alimentation'),
(4, 'Mobilier'),
(5, 'Jouets');

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id_client` int NOT NULL,
  `nom_client` varchar(255) DEFAULT NULL,
  `prenom_client` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id_client`, `nom_client`, `prenom_client`, `email`, `telephone`) VALUES
(1, 'Dupont', 'Jean', 'jean.dupont@example.com', '0601020304'),
(2, 'Martin', 'Marie', 'marie.martin@example.com', '0605060708'),
(3, 'Bernard', 'Paul', 'paul.bernard@example.com', '0608091011'),
(4, 'Dubois', 'Sophie', 'sophie.dubois@example.com', '0612131415'),
(5, 'Petit', 'Luc', 'luc.petit@example.com', '0616171819');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
CREATE TABLE IF NOT EXISTS `commandes` (
  `id_commande` int NOT NULL,
  `id_client` int DEFAULT NULL,
  `id_produit` int DEFAULT NULL,
  `quantite` int DEFAULT NULL,
  `date_commande` datetime DEFAULT NULL,
  `id_magasin` int DEFAULT NULL,
  `id_moyen_paiement` int DEFAULT NULL,
  `id_employe` int DEFAULT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `fk_client` (`id_client`),
  KEY `fk_produit` (`id_produit`),
  KEY `fk_magasin` (`id_magasin`),
  KEY `fk_moyen_paiement` (`id_moyen_paiement`),
  KEY `fk_employe` (`id_employe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`id_commande`, `id_client`, `id_produit`, `quantite`, `date_commande`, `id_magasin`, `id_moyen_paiement`, `id_employe`) VALUES
(1, 1, 1, 2, '2024-05-01 09:15:00', 1, 1, 1),
(2, 2, 2, 1, '2024-05-02 10:45:00', 2, 2, 2),
(3, 3, 3, 4, '2024-05-03 11:30:00', 3, 3, 3),
(4, 4, 4, 1, '2024-05-04 12:00:00', 1, 4, 4),
(5, 5, 5, 3, '2024-05-05 13:45:00', 2, 5, 5),
(6, 1, 6, 1, '2024-05-06 14:30:00', 3, 1, 1),
(7, 2, 1, 2, '2024-05-07 15:15:00', 1, 2, 2),
(8, 3, 2, 1, '2024-05-08 16:00:00', 2, 3, 3),
(9, 4, 3, 4, '2024-05-09 17:45:00', 3, 4, 4),
(10, 5, 4, 1, '2024-05-10 18:30:00', 1, 5, 5),
(11, 1, 5, 3, '2024-05-11 19:15:00', 2, 1, 1),
(12, 2, 6, 1, '2024-05-12 20:00:00', 3, 2, 2),
(13, 3, 1, 2, '2024-05-13 21:45:00', 1, 3, 3),
(14, 4, 2, 1, '2024-05-14 22:30:00', 2, 4, 4),
(15, 5, 3, 4, '2024-05-15 23:15:00', 3, 5, 5),
(16, 1, 4, 1, '2024-05-16 08:30:00', 1, 1, 1),
(17, 2, 5, 3, '2024-05-17 09:45:00', 2, 2, 2),
(18, 3, 6, 1, '2024-05-18 10:30:00', 3, 3, 3),
(19, 4, 1, 2, '2024-05-19 11:15:00', 1, 4, 4),
(20, 5, 2, 1, '2024-05-20 12:00:00', 2, 5, 5),
(21, 1, 3, 4, '2024-05-21 13:45:00', 3, 1, 1),
(22, 2, 4, 1, '2024-05-22 14:30:00', 1, 2, 2),
(23, 3, 5, 3, '2024-05-23 15:15:00', 2, 3, 3),
(24, 4, 6, 1, '2024-05-24 16:00:00', 3, 4, 4),
(25, 5, 1, 2, '2024-05-25 17:45:00', 1, 5, 5),
(26, 1, 2, 1, '2024-05-26 18:30:00', 2, 1, 1),
(27, 2, 3, 4, '2024-05-27 19:15:00', 3, 2, 2),
(28, 3, 4, 1, '2024-05-28 20:00:00', 1, 3, 3),
(29, 4, 5, 3, '2024-05-29 21:45:00', 2, 4, 4),
(30, 5, 6, 1, '2024-05-30 22:30:00', 3, 5, 5),
(31, 1, 1, 2, '2024-06-01 08:15:00', 1, 1, 1),
(32, 2, 2, 1, '2024-06-02 09:00:00', 2, 2, 2),
(33, 3, 3, 4, '2024-06-03 09:45:00', 3, 3, 3),
(34, 4, 4, 1, '2024-06-04 10:30:00', 1, 4, 4),
(35, 5, 5, 3, '2024-06-05 11:15:00', 2, 5, 5),
(36, 1, 6, 1, '2024-06-06 12:00:00', 3, 1, 1),
(37, 2, 1, 2, '2024-06-07 12:45:00', 1, 2, 2),
(38, 3, 2, 1, '2024-06-08 13:30:00', 2, 3, 3),
(39, 4, 3, 4, '2024-06-09 14:15:00', 3, 4, 4),
(40, 5, 4, 1, '2024-06-10 15:00:00', 1, 5, 5),
(41, 1, 5, 3, '2024-06-11 15:45:00', 2, 1, 1),
(42, 2, 6, 1, '2024-06-12 16:30:00', 3, 2, 2),
(43, 3, 1, 2, '2024-06-13 17:15:00', 1, 3, 3),
(44, 4, 2, 1, '2024-06-14 18:00:00', 2, 4, 4),
(45, 5, 3, 4, '2024-06-15 18:45:00', 3, 5, 5),
(46, 1, 4, 1, '2024-06-16 19:30:00', 1, 1, 1),
(47, 2, 5, 3, '2024-06-17 20:15:00', 2, 2, 2),
(48, 3, 6, 1, '2024-06-18 21:00:00', 3, 3, 3),
(49, 4, 1, 2, '2024-06-19 21:45:00', 1, 4, 4),
(50, 5, 2, 1, '2024-06-20 22:30:00', 2, 5, 5),
(51, 1, 3, 4, '2024-06-21 08:15:00', 3, 1, 1),
(52, 2, 4, 1, '2024-06-22 09:00:00', 1, 2, 2),
(53, 3, 5, 3, '2024-06-23 09:45:00', 2, 3, 3),
(54, 4, 6, 1, '2024-06-24 10:30:00', 3, 4, 4),
(55, 5, 1, 2, '2024-06-25 11:15:00', 1, 5, 5),
(56, 1, 2, 1, '2024-06-26 12:00:00', 2, 1, 1),
(57, 2, 3, 4, '2024-06-27 12:45:00', 3, 2, 2),
(58, 3, 4, 1, '2024-06-28 13:30:00', 1, 3, 3),
(59, 4, 5, 3, '2024-06-29 14:15:00', 2, 4, 4),
(60, 5, 6, 1, '2024-06-30 15:00:00', 3, 5, 5),
(61, 1, 1, 2, '2024-07-01 08:15:00', 1, 1, 1),
(62, 2, 2, 1, '2024-07-02 09:00:00', 2, 2, 2),
(63, 3, 3, 4, '2024-07-03 09:45:00', 3, 3, 3),
(64, 4, 4, 1, '2024-07-04 10:30:00', 1, 4, 4),
(65, 5, 5, 3, '2024-07-05 11:15:00', 2, 5, 5),
(66, 1, 6, 1, '2024-07-06 12:00:00', 3, 1, 1),
(67, 2, 1, 2, '2024-07-07 12:45:00', 1, 2, 2),
(68, 3, 2, 1, '2024-07-08 13:30:00', 2, 3, 3),
(69, 4, 3, 4, '2024-07-09 14:15:00', 3, 4, 4),
(70, 5, 4, 1, '2024-07-10 15:00:00', 1, 5, 5),
(71, 1, 5, 3, '2024-07-11 15:45:00', 2, 1, 1),
(72, 2, 6, 1, '2024-07-12 16:30:00', 3, 2, 2),
(73, 3, 1, 2, '2024-07-13 17:15:00', 1, 3, 3),
(74, 4, 2, 1, '2024-07-14 18:00:00', 2, 4, 4),
(75, 5, 3, 4, '2024-07-15 18:45:00', 3, 5, 5),
(76, 1, 4, 1, '2024-07-16 19:30:00', 1, 1, 1),
(77, 2, 5, 3, '2024-07-17 20:15:00', 2, 2, 2),
(78, 3, 6, 1, '2024-07-18 21:00:00', 3, 3, 3),
(79, 4, 1, 2, '2024-07-19 21:45:00', 1, 4, 4),
(80, 5, 2, 1, '2024-07-20 22:30:00', 2, 5, 5),
(81, 1, 3, 4, '2024-07-21 08:15:00', 3, 1, 1),
(82, 2, 4, 1, '2024-07-22 09:00:00', 1, 2, 2),
(83, 3, 5, 3, '2024-07-23 09:45:00', 2, 3, 3),
(84, 4, 6, 1, '2024-07-24 10:30:00', 3, 4, 4),
(85, 5, 1, 2, '2024-07-25 11:15:00', 1, 5, 5),
(86, 1, 2, 1, '2024-07-26 12:00:00', 2, 1, 1),
(87, 2, 3, 4, '2024-07-27 12:45:00', 3, 2, 2),
(88, 3, 4, 1, '2024-07-28 13:30:00', 1, 3, 3),
(89, 4, 5, 3, '2024-07-29 14:15:00', 2, 4, 4),
(90, 5, 6, 1, '2024-07-30 15:00:00', 3, 5, 5),
(91, 1, 1, 2, '2024-08-01 08:15:00', 1, 1, 1),
(92, 2, 2, 1, '2024-08-02 09:00:00', 2, 2, 2),
(93, 3, 3, 4, '2024-08-03 09:45:00', 3, 3, 3),
(94, 4, 4, 1, '2024-08-04 10:30:00', 1, 4, 4),
(95, 5, 5, 3, '2024-08-05 11:15:00', 2, 5, 5),
(96, 1, 6, 1, '2024-08-06 12:00:00', 3, 1, 1),
(97, 2, 1, 2, '2024-08-07 12:45:00', 1, 2, 2),
(98, 3, 2, 1, '2024-08-08 13:30:00', 2, 3, 3),
(99, 4, 3, 4, '2024-08-09 14:15:00', 3, 4, 4),
(100, 5, 4, 1, '2024-08-10 15:00:00', 1, 5, 5);

-- --------------------------------------------------------

--
-- Structure de la table `employes`
--

DROP TABLE IF EXISTS `employes`;
CREATE TABLE IF NOT EXISTS `employes` (
  `id_employe` int NOT NULL,
  `nom_employe` varchar(255) DEFAULT NULL,
  `prenom_employe` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_employe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `employes`
--

INSERT INTO `employes` (`id_employe`, `nom_employe`, `prenom_employe`, `email`, `telephone`) VALUES
(1, 'Lefevre', 'Elise', 'elise.lefevre@example.com', '0620212223'),
(2, 'Moreau', 'Hugo', 'hugo.moreau@example.com', '0623242526'),
(3, 'Girard', 'Emma', 'emma.girard@example.com', '0626272829'),
(4, 'Andre', 'Louis', 'louis.andre@example.com', '0630313233'),
(5, 'Mercier', 'Lucas', 'lucas.mercier@example.com', '0633343536');

-- --------------------------------------------------------

--
-- Structure de la table `magasins`
--

DROP TABLE IF EXISTS `magasins`;
CREATE TABLE IF NOT EXISTS `magasins` (
  `id_magasin` int NOT NULL,
  `nom_magasin` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `ville` varchar(100) DEFAULT NULL,
  `code_postal` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_magasin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `magasins`
--

INSERT INTO `magasins` (`id_magasin`, `nom_magasin`, `adresse`, `ville`, `code_postal`) VALUES
(1, 'Auchan Mermoz', 'Mermoz', 'Dakar', '75001'),
(2, 'Auchan Thies', 'Thies', 'Thies', '69002'),
(3, 'Auchan FANN', 'FANN ', 'Dakar', '13003');

-- --------------------------------------------------------

--
-- Structure de la table `moyens_paiement`
--

DROP TABLE IF EXISTS `moyens_paiement`;
CREATE TABLE IF NOT EXISTS `moyens_paiement` (
  `id_moyen_paiement` int NOT NULL,
  `nom_moyen_paiement` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_moyen_paiement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `moyens_paiement`
--

INSERT INTO `moyens_paiement` (`id_moyen_paiement`, `nom_moyen_paiement`) VALUES
(1, 'Carte de Crédit'),
(2, 'Wave'),
(3, 'Orange money'),
(4, 'Chèque'),
(5, 'Espèces');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `id_produit` int NOT NULL,
  `nom_produit` varchar(255) DEFAULT NULL,
  `prix_unitaire` decimal(10,2) DEFAULT NULL,
  `id_categorie` int DEFAULT NULL,
  PRIMARY KEY (`id_produit`),
  KEY `fk_categorie` (`id_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id_produit`, `nom_produit`, `prix_unitaire`, `id_categorie`) VALUES
(1, 'Télévision', '499.99', 1),
(2, 'Ordinateur Portable', '899.99', 1),
(3, 'T-shirt', '19.99', 2),
(4, 'Jeans', '49.99', 2),
(5, 'Pain', '2.99', 3),
(6, 'Canapé', '399.99', 4);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `fk_client` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_employe` FOREIGN KEY (`id_employe`) REFERENCES `employes` (`id_employe`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_magasin` FOREIGN KEY (`id_magasin`) REFERENCES `magasins` (`id_magasin`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_moyen_paiement` FOREIGN KEY (`id_moyen_paiement`) REFERENCES `moyens_paiement` (`id_moyen_paiement`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_produit` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `fk_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categories` (`id_categorie`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
