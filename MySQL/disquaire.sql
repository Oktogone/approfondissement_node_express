-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 11, 2022 at 04:59 PM
-- Server version: 5.7.30
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: disquaire
--
CREATE DATABASE IF NOT EXISTS disquaire DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE disquaire;

-- --------------------------------------------------------

--
-- Table structure for table album
--

CREATE TABLE album (
  id int(11) NOT NULL,
  nom varchar(80) NOT NULL,
  groupe int(11) NOT NULL,
  année varchar(20) NOT NULL,
  image varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table album
--

INSERT INTO album (id, nom, groupe, année, image) VALUES
(1, 'The lamb lies down on Broadway', 2, '', 'genesis-the-lamb-album-cover.jpg'),
(2, 'The Wall', 1, '', 'PINK-FLOYD-WALL-large-MI0003237403.jpg'),
(3, 'Foxtrot', 2, '', 'genesisfoxtrot.jpg'),
(4, 'Some Girls', 3, '', '115380777.jpg'),
(5, 'Greatests Hits', 5, '', 'R-4652012-1374435253-3816.jpg');

-- --------------------------------------------------------

--
-- Table structure for table artiste
--

CREATE TABLE artiste (
  id int(11) NOT NULL,
  nom varchar(80) NOT NULL,
  prenom varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table artiste
--

INSERT INTO artiste (id, nom, prenom) VALUES
(1, 'Banks', 'Tony'),
(2, 'Rutherford', 'Mike'),
(3, 'Collins', 'Phil'),
(4, 'Gabriel', 'Peter'),
(5, 'Barret', 'Syd'),
(6, 'Waters', 'Roger'),
(7, 'Wright', 'Richard'),
(8, 'Mason', 'Nick'),
(9, 'Jagger', 'Mick'),
(10, 'Richards', 'Keith'),
(11, 'Wood', 'Ronnie');

-- --------------------------------------------------------

--
-- Table structure for table commentaires
--

CREATE TABLE commentaires (
  id int(11) NOT NULL,
  commentaire varchar(1024) NOT NULL,
  note int(11) NOT NULL,
  nom varchar(60) NOT NULL,
  album int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table commentaires
--

INSERT INTO commentaires (id, commentaire, note, nom, album) VALUES
(1, 'Génial', 3, 'marc', 3),
(2, 'Lovely', 5, 'Mick', 4),
(3, 'J\'aime beaucoup', 4, 'Roger', 2);

-- --------------------------------------------------------

--
-- Table structure for table groupe
--

CREATE TABLE groupe (
  id int(11) NOT NULL,
  nom varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table groupe
--

INSERT INTO groupe (id, nom) VALUES
(1, 'Pink floyd'),
(2, 'Genesis'),
(3, 'Rolling Stones'),
(4, 'Guns and Roses'),
(5, 'ZZ top');

-- --------------------------------------------------------

--
-- Table structure for table groupe_X_artiste
--

CREATE TABLE groupe_X_artiste (
  groupe int(11) NOT NULL,
  artiste int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table groupe_X_artiste
--

INSERT INTO groupe_X_artiste (groupe, artiste) VALUES
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(3, 9),
(3, 10),
(3, 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table album
--
ALTER TABLE album
  ADD PRIMARY KEY (id),
  ADD KEY groupe (groupe);

--
-- Indexes for table artiste
--
ALTER TABLE artiste
  ADD PRIMARY KEY (id);

--
-- Indexes for table commentaires
--
ALTER TABLE commentaires
  ADD PRIMARY KEY (id),
  ADD KEY FK_album (album);

--
-- Indexes for table groupe
--
ALTER TABLE groupe
  ADD PRIMARY KEY (id);

--
-- Indexes for table groupe_X_artiste
--
ALTER TABLE groupe_X_artiste
  ADD PRIMARY KEY (groupe,artiste),
  ADD KEY FK_artiste (artiste);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table album
--
ALTER TABLE album
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table artiste
--
ALTER TABLE artiste
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table commentaires
--
ALTER TABLE commentaires
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table groupe
--
ALTER TABLE groupe
  MODIFY id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table album
--
ALTER TABLE album
  ADD CONSTRAINT album_ibfk_1 FOREIGN KEY (groupe) REFERENCES `groupe` (id);

--
-- Constraints for table commentaires
--
ALTER TABLE commentaires
  ADD CONSTRAINT FK_album FOREIGN KEY (album) REFERENCES album (id);

--
-- Constraints for table groupe_X_artiste
--
ALTER TABLE groupe_X_artiste
  ADD CONSTRAINT FK_artiste FOREIGN KEY (artiste) REFERENCES artiste (id),
  ADD CONSTRAINT FK_groupe FOREIGN KEY (groupe) REFERENCES `groupe` (id);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
