-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Creato il: Gen 13, 2021 alle 15:33
-- Versione del server: 5.7.24
-- Versione PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `camera`
--

CREATE TABLE `camera` (
  `cam_ID` int(11) NOT NULL,
  `cam_Prezzo` mediumint(9) NOT NULL,
  `cam_Letto` varchar(50) NOT NULL,
  `cam_Condizionatore` varchar(50) NOT NULL,
  `cam_Stanza_fumatori` tinyint(1) NOT NULL,
  `cam_Prodotti_bagno_omaggio` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `ospite`
--

CREATE TABLE `ospite` (
  `osp_ID` int(11) NOT NULL,
  `osp_Nome` varchar(150) NOT NULL,
  `osp_Cognome` varchar(150) NOT NULL,
  `osp_Data_di_nascita` date NOT NULL,
  `osp_Codice_fiscale` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazione`
--

CREATE TABLE `prenotazione` (
  `pren_ID` int(11) NOT NULL,
  `pren_Data_inizio` date NOT NULL,
  `Pren_Data_fine` date NOT NULL,
  `FK_osp_id` int(150) NOT NULL,
  `FK_cam_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `camera`
--
ALTER TABLE `camera`
  ADD PRIMARY KEY (`cam_ID`);

--
-- Indici per le tabelle `ospite`
--
ALTER TABLE `ospite`
  ADD PRIMARY KEY (`osp_ID`);

--
-- Indici per le tabelle `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD PRIMARY KEY (`pren_ID`),
  ADD KEY `FK_cam_id` (`FK_cam_id`),
  ADD KEY `FK_osp_id` (`FK_osp_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `camera`
--
ALTER TABLE `camera`
  MODIFY `cam_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ospite`
--
ALTER TABLE `ospite`
  MODIFY `osp_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `prenotazione`
--
ALTER TABLE `prenotazione`
  MODIFY `pren_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD CONSTRAINT `FK_cam_id` FOREIGN KEY (`FK_cam_id`) REFERENCES `camera` (`cam_ID`),
  ADD CONSTRAINT `FK_osp_id` FOREIGN KEY (`FK_osp_id`) REFERENCES `ospite` (`osp_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
