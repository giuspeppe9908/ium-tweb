-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Nov 25, 2021 alle 10:40
-- Versione del server: 10.4.21-MariaDB
-- Versione PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi`
--

CREATE TABLE `corsi` (
  `ID_C` int(11) NOT NULL,
  `Titolo` varchar(50) CHARACTER SET ascii NOT NULL,
  `attivo` varchar(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `corsi`
--

INSERT INTO `corsi` (`ID_C`, `Titolo`, `attivo`) VALUES
(1, 'Prog 1', '1'),
(2, 'Architettura Elaboratori', '1'),
(3, 'IUM TWeb', '1'),
(4, 'Reti I', '1'),
(5, 'LPP', '1'),
(6, 'LFT', '1'),
(7, 'CMRO', '1'),
(8, 'Discreta e Logica', '1'),
(9, 'Prog III', '1'),
(10, 'Fisica 1', '1');

-- --------------------------------------------------------

--
-- Struttura della tabella `docenti`
--

CREATE TABLE `docenti` (
  `ID_D` int(11) NOT NULL,
  `NomeD` varchar(20) NOT NULL,
  `CognomeD` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `docenti`
--

INSERT INTO `docenti` (`ID_D`, `NomeD`, `CognomeD`) VALUES
(1, 'Luca', 'Padovani'),
(2, 'Liliana', 'Ardissono'),
(3, 'Roberto', 'Aringhieri'),
(4, 'Andrea', 'Mori'),
(5, 'Igor', 'Pesando');

-- --------------------------------------------------------

--
-- Struttura della tabella `insegnamento`
--

CREATE TABLE `insegnamento` (
  `ID_D` int(11) NOT NULL,
  `ID_C` int(11) NOT NULL,
  `NomeC` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `insegnamento`
--

INSERT INTO `insegnamento` (`ID_D`, `ID_C`, `NomeC`) VALUES
(2, 3, 'IUM TWeb'),
(2, 9, 'Prog III'),
(4, 8, 'Discreta e Logica'),
(1, 6, 'LFT'),
(3, 7, 'CMRO');

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazioni`
--

CREATE TABLE `prenotazioni` (
  `ID_U` varchar(50) NOT NULL,
  `ID_C` varchar(11) NOT NULL,
  `Orario` set('15-16','16-17','17-18','18-19') NOT NULL DEFAULT '15-16',
  `Giorno` set('Lunedì','Martedì','Mercoledì','Giovedì','Venerdì') NOT NULL,
  `stato` set('available','disabled') NOT NULL DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `prenotazioni`
--

INSERT INTO `prenotazioni` (`ID_U`, `ID_C`, `Orario`, `Giorno`, `stato`) VALUES
('4', '2', '16-17', 'Lunedì', 'disabled'),
('2', '3', '16-17', 'Martedì', 'available'),
('4', '6', '16-17', 'Giovedì', 'available'),
('2', '2', '16-17', 'Lunedì', 'disabled'),
('2', '3', '15-16', 'Venerdì', 'available'),
('4', '5', '16-17', 'Mercoledì', 'available'),
('2', '8', '18-19', 'Lunedì', 'available'),
('4', '10', '17-18', 'Martedì', 'available'),
('2', '10', '17-18', 'Mercoledì', 'available'),
('2', '13', '17-18', 'Lunedì', 'available'),
('2', '1', '15-16', 'Lunedì', 'available'),
('2', '10', '15-16', 'Giovedì', 'available');

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `ID_U` varchar(11) NOT NULL,
  `Account` varchar(20) NOT NULL,
  `Password` varchar(16) NOT NULL,
  `Ruolo` set('amministratore','cliente','guest') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`ID_U`, `Account`, `Password`, `Ruolo`) VALUES
('1', 'admin', 'admin', 'amministratore'),
('2', 'peppe', 'peppe', 'cliente'),
('3', 'guest', 'guest', 'guest'),
('4', 'user', 'user', 'cliente');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `corsi`
--
ALTER TABLE `corsi`
  ADD PRIMARY KEY (`ID_C`);

--
-- Indici per le tabelle `docenti`
--
ALTER TABLE `docenti`
  ADD PRIMARY KEY (`ID_D`);

--
-- Indici per le tabelle `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD KEY `fk_utente` (`ID_U`),
  ADD KEY `fk_cor` (`ID_C`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`ID_U`,`Account`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `corsi`
--
ALTER TABLE `corsi`
  MODIFY `ID_C` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `docenti`
--
ALTER TABLE `docenti`
  MODIFY `ID_D` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
