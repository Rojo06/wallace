-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mar. 24 oct. 2017 à 11:23
-- Version du serveur :  10.1.26-MariaDB
-- Version de PHP :  7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `wallace`
--

-- --------------------------------------------------------

--
-- Structure de la table `comptoir`
--

CREATE TABLE `comptoir` (
  `IDComptoir` int(11) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `IDObjet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `IDFacture` int(11) NOT NULL,
  `DateFacture` date NOT NULL,
  `details` varchar(150) NOT NULL,
  `prixTotale` double NOT NULL,
  `IDLocation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `locataire`
--

CREATE TABLE `locataire` (
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `ville` varchar(20) NOT NULL,
  `telephone` varchar(30) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `dateDeNaissance` date NOT NULL,
  `IDLocataire` int(11) NOT NULL,
  `IDobjet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE `location` (
  `IDLocation` int(11) NOT NULL,
  `DateDebutLocation` date NOT NULL,
  `DateFinLocation` date NOT NULL,
  `IDLocataire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `objet`
--

CREATE TABLE `objet` (
  `IDObjet` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `prix` double NOT NULL,
  `categorie` varchar(50) NOT NULL,
  `IDLocataire` int(11) NOT NULL,
  `IDComptoir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reglement`
--

CREATE TABLE `reglement` (
  `IDReglement` int(11) NOT NULL,
  `modeReglement` varchar(50) NOT NULL,
  `IDFacture` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comptoir`
--
ALTER TABLE `comptoir`
  ADD PRIMARY KEY (`IDComptoir`),
  ADD KEY `IDObjet` (`IDObjet`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`IDFacture`),
  ADD KEY `IDLocation` (`IDLocation`);

--
-- Index pour la table `locataire`
--
ALTER TABLE `locataire`
  ADD PRIMARY KEY (`IDLocataire`),
  ADD KEY `IDobjet` (`IDobjet`);

--
-- Index pour la table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`IDLocation`),
  ADD KEY `IDLocataire` (`IDLocataire`);

--
-- Index pour la table `objet`
--
ALTER TABLE `objet`
  ADD PRIMARY KEY (`IDObjet`),
  ADD KEY `IDLocataire` (`IDLocataire`),
  ADD KEY `IDComptoir` (`IDComptoir`);

--
-- Index pour la table `reglement`
--
ALTER TABLE `reglement`
  ADD PRIMARY KEY (`IDReglement`),
  ADD KEY `IDFacture` (`IDFacture`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comptoir`
--
ALTER TABLE `comptoir`
  ADD CONSTRAINT `comptoir_ibfk_1` FOREIGN KEY (`IDObjet`) REFERENCES `objet` (`IDObjet`);

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `facture_ibfk_1` FOREIGN KEY (`IDLocation`) REFERENCES `location` (`IDLocation`);

--
-- Contraintes pour la table `locataire`
--
ALTER TABLE `locataire`
  ADD CONSTRAINT `locataire_ibfk_1` FOREIGN KEY (`IDobjet`) REFERENCES `objet` (`IDObjet`);

--
-- Contraintes pour la table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`IDLocataire`) REFERENCES `locataire` (`IDLocataire`);

--
-- Contraintes pour la table `objet`
--
ALTER TABLE `objet`
  ADD CONSTRAINT `objet_ibfk_1` FOREIGN KEY (`IDLocataire`) REFERENCES `locataire` (`IDLocataire`),
  ADD CONSTRAINT `objet_ibfk_2` FOREIGN KEY (`IDComptoir`) REFERENCES `comptoir` (`IDComptoir`);

--
-- Contraintes pour la table `reglement`
--
ALTER TABLE `reglement`
  ADD CONSTRAINT `reglement_ibfk_1` FOREIGN KEY (`IDFacture`) REFERENCES `facture` (`IDFacture`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
