-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 23, 2025 at 09:43 PM
-- Server version: 11.8.3-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u220447391_client_rest`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`u220447391_client_rest`@`127.0.0.1` PROCEDURE `CleanupIdempotencyKeys` (IN `hours_old` INT)   BEGIN
    DELETE FROM idempotency_keys 
    WHERE CreatedAt < DATE_SUB(NOW(), INTERVAL hours_old HOUR);
    
    SELECT ROW_COUNT() as deleted_count;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ArtikulliBaze`
--

CREATE TABLE `ArtikulliBaze` (
  `tenant_id` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Artikull` tinyint(1) DEFAULT 1,
  `Sherbim` tinyint(1) DEFAULT 0,
  `Shifra` varchar(255) DEFAULT NULL,
  `Emri` varchar(255) DEFAULT NULL,
  `Njesia` varchar(255) NOT NULL,
  `Barkodi` varchar(255) DEFAULT NULL,
  `Cmimi_I_Shitjes_Cope` decimal(18,2) DEFAULT NULL,
  `Cmimi_I_Shitjes_Pako` decimal(18,2) DEFAULT NULL,
  `SasiaPako` int(11) DEFAULT NULL,
  `KategoriaId` int(11) DEFAULT NULL,
  `Aktiv` tinyint(1) DEFAULT NULL,
  `ArtikullIPerbere` tinyint(1) DEFAULT NULL,
  `EmriGjenerik` varchar(255) DEFAULT NULL,
  `Prodhuesi` varchar(255) DEFAULT NULL,
  `ArtNgaPeshorja` tinyint(1) DEFAULT 0,
  `DataEKrijimit` datetime(3) DEFAULT NULL,
  `DataEModifikimit` datetime(3) DEFAULT NULL,
  `TvshId` int(11) DEFAULT NULL,
  `EmertimiiDyte` varchar(255) DEFAULT NULL,
  `PeshaNeto` decimal(18,5) DEFAULT NULL,
  `PeshaBruto` decimal(18,5) DEFAULT NULL,
  `Gjatesia` decimal(18,5) DEFAULT NULL,
  `Gjersia` decimal(18,5) DEFAULT NULL,
  `Lartesia` decimal(18,5) DEFAULT NULL,
  `SasiaMinimale` decimal(18,5) DEFAULT NULL,
  `SasiaMaksimale` decimal(18,5) DEFAULT NULL,
  `Afatshkurte` tinyint(1) DEFAULT 0,
  `Afatgjate` tinyint(1) DEFAULT 0,
  `NormaZhvleresimit` decimal(5,2) DEFAULT NULL,
  `DataEFillimitTeZhvlersimit` date DEFAULT NULL,
  `TempId` int(11) DEFAULT NULL,
  `Skadimi` date DEFAULT NULL,
  `Ambalazhi` varchar(250) DEFAULT NULL,
  `IRimbursueshem` tinyint(1) DEFAULT NULL,
  `OrigjinaEMallit` varchar(500) DEFAULT NULL,
  `KostoEProdhimit` smallint(6) DEFAULT NULL,
  `Rafti` varchar(250) DEFAULT NULL,
  `KodiDoganor` varchar(250) DEFAULT NULL,
  `SubjektiId` int(11) DEFAULT NULL,
  `IncomeAccountId` int(11) DEFAULT NULL,
  `ExpenseAccountId` int(11) DEFAULT NULL,
  `IsGroup` tinyint(1) NOT NULL DEFAULT 0,
  `GroupId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ArtikulliBaze`
--

INSERT INTO `ArtikulliBaze` (`tenant_id`, `Id`, `Artikull`, `Sherbim`, `Shifra`, `Emri`, `Njesia`, `Barkodi`, `Cmimi_I_Shitjes_Cope`, `Cmimi_I_Shitjes_Pako`, `SasiaPako`, `KategoriaId`, `Aktiv`, `ArtikullIPerbere`, `EmriGjenerik`, `Prodhuesi`, `ArtNgaPeshorja`, `DataEKrijimit`, `DataEModifikimit`, `TvshId`, `EmertimiiDyte`, `PeshaNeto`, `PeshaBruto`, `Gjatesia`, `Gjersia`, `Lartesia`, `SasiaMinimale`, `SasiaMaksimale`, `Afatshkurte`, `Afatgjate`, `NormaZhvleresimit`, `DataEFillimitTeZhvlersimit`, `TempId`, `Skadimi`, `Ambalazhi`, `IRimbursueshem`, `OrigjinaEMallit`, `KostoEProdhimit`, `Rafti`, `KodiDoganor`, `SubjektiId`, `IncomeAccountId`, `ExpenseAccountId`, `IsGroup`, `GroupId`) VALUES
(1, 1, 1, 0, '1', 'Artikull 1', 'Cope', '1', 6.50, 6.50, 1, NULL, 1, 0, '', '', 0, '2025-07-20 01:55:15.557', '2025-09-14 22:08:36.420', 3, 'Artikull 1', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 5, '', '', NULL, NULL, NULL, 0, NULL),
(1, 2, 1, 0, '2', 'Artikull 2', 'Cope', '2', 4.50, 4.20, 1, NULL, 1, 0, '', '', 0, '2025-07-20 01:55:15.557', '2025-09-14 22:08:36.420', 3, 'Artikull 2', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2025-01-08', '', 0, '', 3, '', '', NULL, NULL, NULL, 0, NULL),
(1, 3, 1, 0, '3', 'Artikull 3', 'Cope', '3', 1.80, 1.70, 1, NULL, 1, 0, '', '', 0, '2025-07-20 01:55:15.557', '2025-09-14 22:08:36.420', 3, 'Artikull 3', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2025-06-20', '', 0, '', 1, '', '', NULL, NULL, NULL, 0, NULL),
(1, 4, 1, 0, 'ALK-ALEX-R', 'Alexandria e Kuqe', 'Cope', '4', 3.50, 3.50, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'ALEXANDRIA E KUQE', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 5, 1, 0, 'ALK-ALEX-W', 'Alexandria e Bardhë', 'Cope', '5', 3.50, 3.50, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'ALEXANDRIA E BARDHE', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 6, 1, 0, 'ALK-CORONA', 'Corona', 'Cope', '6', 3.50, 3.50, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'CORONA', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 7, 1, 0, 'ALK-GIN', 'Gin', 'Cope', '7', 3.00, 3.00, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'JIN', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 8, 1, 0, 'ALK-GIN-TONIC', 'Gin & Tonic', 'Cope', '8', 3.50, 3.50, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'JIN TONIC', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 9, 1, 0, 'ALK-HEINEKEN', 'Heineken', 'Cope', '9', 2.50, 2.50, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'HEINEKEN', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 10, 1, 0, 'ALK-JAGER', 'Jägermeister', 'Cope', '10', 3.00, 3.00, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'JAGERMEISTER', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 11, 1, 0, 'ALK-JAGER-MOLL', 'Jäger me Mollë', 'Cope', '11', 4.00, 4.00, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'JAGER MOLLE', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 12, 1, 0, 'ALK-JAGER-VISH', 'Jäger me Vishnje', 'Cope', '12', 4.00, 4.00, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'JAGER VISHNJE', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 13, 1, 0, 'ALK-JD', 'Jack Daniels', 'Cope', '13', 3.50, 3.50, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'JACK DANIELS', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 14, 1, 0, 'ALK-JD-COLA', 'Jack & Cola', 'Cope', '14', 4.50, 4.50, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'JACK COLA', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 15, 1, 0, 'ALK-LASKO', 'Laško', 'Cope', '15', 2.00, 2.00, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'LLASHKO', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 16, 1, 0, 'ALK-PEJA', 'Birra Peja', 'Cope', '16', 1.50, 1.50, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'BIRRA PEJA', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 17, 1, 0, 'ALK-PEJA-CRUDO', 'Peja Crudo', 'Cope', '17', 2.00, 2.00, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'PEJA CRUDO', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 18, 1, 0, 'ALK-PEJA-LAGER', 'Peja Lager', 'Cope', '18', 2.00, 2.00, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'PEJA LAGER', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 19, 1, 0, 'ALK-RAKI-DARDH', 'Raki Dardhë', 'Cope', '19', 2.00, 2.00, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'RAKI DARDHE', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 20, 1, 0, 'ALK-RAKI-FTOI', 'Raki Ftoi', 'Cope', '20', 2.00, 2.00, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'RAKI FTOI', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 21, 1, 0, 'ALK-RAKI-RR', 'Raki Rrushi', 'Cope', '21', 1.50, 1.50, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'RAKI RRUSHI', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 22, 1, 0, 'ALK-SHKUPI', 'Birra Shkupi', 'Cope', '22', 2.00, 2.00, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'BIRRA SHKUPI', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 23, 1, 0, 'ALK-TEQ', 'Tequila', 'Cope', '23', 2.00, 2.00, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'TEQUILA', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 24, 1, 0, 'ALK-TUBORG', 'Tuborg', 'Cope', '24', 2.50, 2.50, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'TUBORG', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 25, 1, 0, 'ALK-VODKA', 'Vodka', 'Cope', '25', 2.50, 2.50, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'VODKA', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 26, 1, 0, 'ALK-VODKA-RB', 'Vodka & Red Bull', 'Cope', '26', 5.00, 5.00, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'VODKA REDBULL', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 27, 1, 0, 'ALK-VODKA-SCH', 'Vodka & Schweppes', 'Cope', '27', 3.50, 3.50, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'VODKA SCHWEPPES', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 28, 1, 0, 'ALK-VODKA-VISH', 'Vodka & Vishnje', 'Cope', '28', 3.50, 3.50, 1, 3, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'VODKA VISHNJE', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 29, 1, 0, 'DRK-AMER', 'Kafe Amerikane', 'Cope', '29', 1.00, 1.00, 1, 2, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'KAFE AMERIKANE', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 30, 1, 0, 'DRK-CAP', 'Cappuccino', 'Cope', '30', 1.50, 1.50, 1, 2, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'CAPPUCCINO', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 31, 1, 0, 'DRK-COCA', 'Coca Cola', 'Cope', '31', 1.50, 1.50, 1, 1, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'COCA COLA', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 32, 1, 0, 'DRK-COCA-0', 'Coca Cola Zero', 'Cope', '32', 1.50, 1.50, 1, 1, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'COCA COLA ZERO', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 33, 1, 0, 'DRK-ESP', 'Espresso', 'Cope', '33', 1.00, 1.00, 1, 2, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'ESPRESSO', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 34, 1, 0, 'DRK-ESP-DBL', 'Double Espresso', 'Cope', '34', 1.80, 1.80, 1, 2, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'DOUBLE ESPRESSO', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 35, 1, 0, 'DRK-FANTA', 'Fanta', 'Cope', '35', 1.50, 1.50, 1, 1, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'FANTA', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 36, 1, 0, 'DRK-HOT-CHO', 'Çokollatë e Nxehtë', 'Cope', '36', 2.00, 2.00, 1, 2, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'HOT CHOCOLATE', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 37, 1, 0, 'DRK-ICE-AMER', 'Ice Amerikane', 'Cope', '37', 1.80, 1.80, 1, 2, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'ICE AMERIKANE', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 38, 1, 0, 'DRK-ICE-LATTE', 'Ice Latte', 'Cope', '38', 2.00, 2.00, 1, 2, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'ICE LATTE', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 39, 1, 0, 'DRK-JC-ACE', 'Lëng ACE', 'Cope', '39', 1.50, 1.50, 1, 1, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'ACE', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 40, 1, 0, 'DRK-JC-BORO', 'Lëng Boronicë', 'Cope', '40', 1.50, 1.50, 1, 1, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'BORNONICE', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 41, 1, 0, 'DRK-JC-DREZ', 'Lëng Dredhëz', 'Cope', '41', 1.50, 1.50, 1, 1, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'DREZHEZ', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 42, 1, 0, 'DRK-JC-MOLL', 'Lëng Molle', 'Cope', '42', 1.50, 1.50, 1, 1, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'MOLLE', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 43, 1, 0, 'DRK-JC-PJE', 'Lëng Pjeshke', 'Cope', '43', 1.50, 1.50, 1, 1, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'PJESHKE', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 44, 1, 0, 'DRK-JC-POR', 'Lëng Portokalli', 'Cope', '44', 1.50, 1.50, 1, 1, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'PORTOKALL', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 45, 1, 0, 'DRK-JC-VISH', 'Lëng Vishnje', 'Cope', '45', 1.50, 1.50, 1, 1, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'VISHNJE', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 46, 1, 0, 'DRK-LATTE', 'Latte Caffè', 'Cope', '46', 1.50, 1.50, 1, 2, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'LATTE CAFFE', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 47, 1, 0, 'DRK-MAC-L', 'Makiato e Madhe', 'Cope', '47', 1.20, 1.20, 1, 2, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'MAKIATO E MADHE', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 48, 1, 0, 'DRK-MAC-S', 'Makiato e Vogël', 'Cope', '48', 1.00, 1.00, 1, 2, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'MAKIATO E VOGËL', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 49, 1, 0, 'DRK-NES', 'Nescafe', 'Cope', '49', 1.50, 1.50, 1, 2, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'NESACAFFE', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 50, 1, 0, 'DRK-PA-PLUM', 'Makiato pa plumb', 'Cope', '50', 1.00, 1.00, 1, 2, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'MAKIATO PAPLUMB', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 51, 1, 0, 'DRK-REDBULL', 'Red Bull', 'Cope', '51', 2.50, 2.50, 1, 1, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'RED BULL', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 52, 1, 0, 'DRK-SCHWEPPES', 'Schweppes', 'Cope', '52', 1.50, 1.50, 1, 1, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'SCHWEPPES', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 53, 1, 0, 'DRK-SPRITE', 'Sprite', 'Cope', '53', 1.50, 1.50, 1, 1, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'SPRITE', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 54, 1, 0, 'DRK-TEA', 'Çaj', 'Cope', '54', 1.00, 1.00, 1, 2, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'QAJ', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 55, 1, 0, 'DRK-TEA-ICE', 'Ice Tea', 'Cope', '55', 1.50, 1.50, 1, 1, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'ICE TEA', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 56, 1, 0, 'DRK-TONIC', 'Schweppes Tonic', 'Cope', '56', 1.50, 1.50, 1, 1, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'SHWEPPES TONIK', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 57, 1, 0, 'DRK-WATER', 'Ujë i Thjeshtë', 'Cope', '57', 1.00, 1.00, 1, 1, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'UJE I THJESHTE', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 58, 1, 0, 'DRK-WATER-MIN', 'Ujë Mineral', 'Cope', '58', 1.00, 1.00, 1, 1, 1, 0, '', '', 0, '2025-09-14 20:06:51.040', '2025-09-14 22:08:36.420', 3, 'UJE MINERAL', 0.00000, 0.00000, 0.00000, 0.00000, 0.00000, 1.00000, 0.00000, 0, 0, 0.00, NULL, 0, '2999-12-31', '', 0, '', 0, '', '', NULL, NULL, NULL, 0, NULL),
(1, 1001, 1, 0, 'FLOW-ART-001', 'Flow Test Product', 'Cope', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, 0, '2025-09-18 11:58:04.027', '2025-09-18 11:58:04.027', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `BlerjeKategoria`
--

CREATE TABLE `BlerjeKategoria` (
  `tenant_id` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Emri` varchar(255) DEFAULT NULL,
  `Kodi` varchar(50) DEFAULT NULL,
  `Pershkrimi` varchar(255) DEFAULT NULL,
  `TvshId` int(11) DEFAULT NULL,
  `DataEKrijimit` datetime(3) DEFAULT NULL,
  `DataEModifikimit` datetime(3) DEFAULT NULL,
  `Fshire` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `BlerjeKategoria`
--

INSERT INTO `BlerjeKategoria` (`tenant_id`, `Id`, `Emri`, `Kodi`, `Pershkrimi`, `TvshId`, `DataEKrijimit`, `DataEModifikimit`, `Fshire`) VALUES
(1, 0, 'test', NULL, NULL, 2, NULL, NULL, 0),
(1, 1, 'test', NULL, NULL, 2, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Blerjet`
--

CREATE TABLE `Blerjet` (
  `tenant_id` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `DataEFatures` datetime(3) DEFAULT NULL,
  `DataEKrijimit` datetime(3) DEFAULT NULL,
  `DataEModifikimit` datetime(3) DEFAULT NULL,
  `Fshire` tinyint(1) DEFAULT 0,
  `NrFatures` varchar(50) DEFAULT NULL,
  `AfatiPageses` datetime(3) DEFAULT NULL,
  `BlerjeKategoriaId` int(11) DEFAULT NULL,
  `NumriFaturesSeFurnitorit` varchar(200) DEFAULT NULL,
  `Fatura` longblob DEFAULT NULL,
  `Staff` tinyint(1) DEFAULT 0,
  `SubjektiId` int(11) DEFAULT NULL,
  `PagesaId` int(11) DEFAULT NULL,
  `StatusFatureId` int(11) DEFAULT NULL,
  `OptimisticLockField` int(11) DEFAULT NULL,
  `fTotalPorosias` decimal(19,4) DEFAULT NULL,
  `fTotalVAT` decimal(19,4) DEFAULT NULL,
  `TotalPorosias` decimal(19,4) DEFAULT NULL,
  `TotalVAT` decimal(19,4) DEFAULT NULL,
  `ArkaId` int(11) DEFAULT NULL,
  `MenyraPagesesId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Blerjet`
--

INSERT INTO `Blerjet` (`tenant_id`, `Id`, `DataEFatures`, `DataEKrijimit`, `DataEModifikimit`, `Fshire`, `NrFatures`, `AfatiPageses`, `BlerjeKategoriaId`, `NumriFaturesSeFurnitorit`, `Fatura`, `Staff`, `SubjektiId`, `PagesaId`, `StatusFatureId`, `OptimisticLockField`, `fTotalPorosias`, `fTotalVAT`, `TotalPorosias`, `TotalVAT`, `ArkaId`, `MenyraPagesesId`) VALUES
(1, 0, NULL, NULL, NULL, 0, NULL, NULL, 1, '1231312312312', NULL, 0, NULL, 1001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 1, NULL, NULL, NULL, 0, NULL, NULL, 1, '1231312312312', NULL, 0, NULL, 2001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `etl_errors`
--

CREATE TABLE `etl_errors` (
  `Id` bigint(20) NOT NULL,
  `TenantId` int(11) NOT NULL,
  `TableName` varchar(64) NOT NULL,
  `Payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`Payload`)),
  `ErrorText` text NOT NULL,
  `CreatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Fatura`
--

CREATE TABLE `Fatura` (
  `tenant_id` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Data` datetime(3) DEFAULT NULL,
  `Fshire` tinyint(1) DEFAULT NULL,
  `ShfrytezuesiId` int(11) DEFAULT NULL,
  `NrFatures` varchar(50) DEFAULT NULL,
  `AfatiPageses` date DEFAULT NULL,
  `Staff` tinyint(1) DEFAULT NULL,
  `FaturaKategoriaId` int(11) DEFAULT NULL,
  `DataEKrijimit` datetime(3) DEFAULT NULL,
  `DataEModifikimit` datetime(3) DEFAULT NULL,
  `KodiValues` varchar(10) DEFAULT NULL,
  `KursiKembimit` decimal(10,4) DEFAULT NULL,
  `SubjektiId` int(11) DEFAULT NULL,
  `StatusFatureId` int(11) DEFAULT NULL,
  `PagesaId` int(11) DEFAULT NULL,
  `Comment` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Fatura`
--

INSERT INTO `Fatura` (`tenant_id`, `Id`, `Data`, `Fshire`, `ShfrytezuesiId`, `NrFatures`, `AfatiPageses`, `Staff`, `FaturaKategoriaId`, `DataEKrijimit`, `DataEModifikimit`, `KodiValues`, `KursiKembimit`, `SubjektiId`, `StatusFatureId`, `PagesaId`, `Comment`) VALUES
(1, 6, '2025-09-18 21:19:04.273', NULL, 2, 'OFERTE-2025-09-00001', NULL, 0, NULL, '2025-09-18 09:59:25.483', '2025-09-18 21:19:04.273', 'EUR', NULL, 3, 2, 8, 'I ka jep kapare 50 euro, plus gjamat ka me i kthy me 2 teteadnaw'),
(1, 7, '2025-09-18 21:18:26.187', NULL, NULL, 'FAT-2025-09-00007', NULL, NULL, 1, '2025-09-18 21:18:26.187', '2025-09-18 21:18:26.187', 'EUR', NULL, 1, 1, NULL, ''),
(1, 8, '2025-09-18 21:19:04.180', NULL, NULL, 'FAT-2025-09-00008', NULL, NULL, 1, '2025-09-18 21:19:04.180', '2025-09-18 21:19:04.180', 'EUR', NULL, 1, 1, NULL, ''),
(1, 9, '2025-09-18 21:21:16.703', NULL, NULL, 'FAT-2025-09-00009', NULL, NULL, 1, '2025-09-18 21:21:16.703', '2025-09-18 21:21:16.703', 'EUR', NULL, 1, 1, NULL, ''),
(1, 1001, '2025-09-18 11:58:17.611', 0, 1, 'FLOW-2025-001', '2025-10-16', 0, 1, '2025-09-18 11:58:17.611', '2025-09-18 11:58:17.611', 'EUR', 1.0000, 1001, 1, 1001, 'Flow test invoice');

-- --------------------------------------------------------

--
-- Table structure for table `FaturaKategoria`
--

CREATE TABLE `FaturaKategoria` (
  `tenant_id` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Emri` varchar(255) DEFAULT NULL,
  `Kodi` varchar(50) DEFAULT NULL,
  `Pershkrimi` varchar(255) DEFAULT NULL,
  `TvshId` int(11) DEFAULT NULL,
  `DataEKrijimit` datetime(3) DEFAULT NULL,
  `DataEModifikimit` datetime(3) DEFAULT NULL,
  `Fshire` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `FaturaKategoria`
--

INSERT INTO `FaturaKategoria` (`tenant_id`, `Id`, `Emri`, `Kodi`, `Pershkrimi`, `TvshId`, `DataEKrijimit`, `DataEModifikimit`, `Fshire`) VALUES
(1, 1, 'Flow Invoice Category', 'FLOW-INV', 'Flow test invoice category', 1, '2025-09-18 11:57:49.350', '2025-09-18 11:57:49.350', 0);

-- --------------------------------------------------------

--
-- Table structure for table `idempotency_keys`
--

CREATE TABLE `idempotency_keys` (
  `TenantId` int(11) NOT NULL,
  `TableName` varchar(64) NOT NULL,
  `KeyHash` varchar(64) NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `idempotency_keys`
--

INSERT INTO `idempotency_keys` (`TenantId`, `TableName`, `KeyHash`, `CreatedAt`) VALUES
(1, 'Subjektet', '951d84aba68a2bee349735258a6d107f961b9b3595dedf189103b6cac6a28039', '2025-09-16 21:17:19'),
(1, 'Subjektet', 'a3ec485f1bfe506be59da02d6db3ff7e7fe83e506595934ae61eed392c78b38d', '2025-09-16 21:17:19'),
(1, 'Subjektet', 'ef1412c994572ca02c99c5d9151f1968de952b5e2402221b3e99aee6d1d64f4f', '2025-09-16 21:22:08'),
(1, 'TVSH', 'afe79669f6fd7634642ff4416ea07780bd23e5b08d325e493f72f9342bf4d3d7', '2025-09-16 21:22:15'),
(1, 'Kategoria', 'cf3f49ab24b187d93cb35a4bb489f82a30d3e8f5e066978e741434690f4506dd', '2025-09-16 21:22:25'),
(1, 'ArtikulliBaze', '9fcfbc97db6a20827d40232777c5a1812b117927d14ce394e96238bfc1a9de5e', '2025-09-16 21:22:37'),
(1, 'Fatura', '3e8c78849e8b80e026000139aa165816d1eba5a31d0828f0f503ffe7c71f7811', '2025-09-16 21:22:42'),
(1, 'Porosia', '144e1c98229a373ccf34366bf9fd0aee0a0c124bb960ec7efc0109824706150f', '2025-09-16 21:22:56'),
(1, 'Subjektet', '254c22d249479d1cafbd43d569067b61df48f4db58bc48fe38ced44f7f04e9fb', '2025-09-16 21:23:02'),
(1, 'Subjektet', '90444983792aaa622a5751287ce47bca297954bf91a2ca08d58fe58cacc6e991', '2025-09-16 21:23:06'),
(1, 'Fatura', '178a93dfe0fc9f1142369f23930b77dec8106a14ed5f67f85422e9967523a4f9', '2025-09-16 21:24:40'),
(1, 'Porosia', '0c55e8adfc6a38b306173c2eb0e81fa1b2a786e94b81abd59a7e7629804054a2', '2025-09-16 21:24:48'),
(1, 'Fatura', '45e66ca46246b2512d7e9680d1ff5f8caba3d292d54867a3c8f798371f7e33dd', '2025-09-16 21:28:23'),
(1, 'Porosia', 'f0b53de5f6d387a962e3ec860084600ba3000ecc215dfb6aaac27e698f915658', '2025-09-16 21:29:02'),
(1, 'Subjektet', 'dbd1fb57913ba187ca3f670498a11027007a2daf3f308e14867f31026cf97ace', '2025-09-16 21:31:22'),
(1, 'Subjektet', '378c7a3b0d753be4f17c7776c6adae6b51dcbd05c5f0dc37b8a87498d35f5cc7', '2025-09-16 21:31:38'),
(1, 'Subjektet', 'f3ed89866416fc1fded8299781ec37cb7fdd4225062b2c8df11169a98f7ac88e', '2025-09-16 21:32:45'),
(1, 'Subjektet', '1b2e70b84c43d9d1ff11767e4e25330923a5aa4f3d6c16375f23e63afbbdb7f4', '2025-09-16 21:32:52'),
(1, 'Subjektet', '6147474492c5bef11b2771e4c93bc915b73ac9d8faa6a361d1cd21d0d51bb42f', '2025-09-16 21:33:04'),
(1, 'Subjektet', 'f48c2e09d202500c1cf9b4720a0c1e7d7a49a4a4695a839fbed44cae6116659b', '2025-09-16 21:33:18'),
(1, 'Subjektet', 'e175e0ac314e7f8ee7b822ee991e1dda8cdc7c6849e0aba37958bf06e68863d6', '2025-09-16 21:33:34'),
(1, 'Subjektet', '7ac9723a656638685eb2b9054bf566fdb65886849f69c36175cd6a83bfad6e0a', '2025-09-16 21:35:32'),
(1, 'Subjektet', 'eab386bf180af7a5888fa8560cb9ef74f35507cdffc606fc82c15b205c5c1bd1', '2025-09-16 21:37:17'),
(1, 'Subjektet', 'cd5372933a9a49586c3421fa82c089a2a69ae13d408a3e3a6c3a1ac66c5a456a', '2025-09-16 21:37:47'),
(1, 'Subjektet', '9ab0c35aaf8e08b027f96890355a9901c4a7fe77503d44f09ac46126998fd59f', '2025-09-16 21:46:18'),
(1, 'Subjektet', '8e4401aa9a3c1c669622c7a5457576f2a3e1788b6025f7767264dc0731a0d7a6', '2025-09-16 21:48:06'),
(1, 'Subjektet', 'f71b0b4bbec1c72fea8c0d131f4c60e05e13abd4958f16c1f379f09cd91e2da2', '2025-09-16 21:48:16'),
(1, 'Subjektet', '9322409906feacda74d34f7a4424aefa2e27037c2f7deada9ee61d786cfd1811', '2025-09-16 21:48:25'),
(1, 'Subjektet', '835c65e8e8287da88f5a93b838ac8fd8205c3b8676499bbaa182c6ba91d1eee5', '2025-09-16 21:49:17'),
(1, 'Subjektet', 'afce8799baccc132a572b46e3801b4986e4901bfd50289616e905d044667c7f9', '2025-09-16 21:49:39'),
(1, 'TVSH', 'd1d224a156080bc0d87c925cd1f82333f28be5ff8789a8b9028bb54c7221cb33', '2025-09-16 21:49:39'),
(1, 'Kategoria', '99c5c85b3a912639aec7c08cc377d9d4c2a3190fbebccc6e351381bfaa5aea68', '2025-09-16 21:49:40'),
(1, 'Subjektet', 'c058a903379240769b37c9f9e61687b30543a93d3aa88141789fc369da8ef2c7', '2025-09-16 21:49:40'),
(1, 'Kategoria', 'e0e989b9a473813c64300f1bf22143863a47521de53b495ca941a1c55b175896', '2025-09-16 21:49:56'),
(1, 'Subjektet', '144669f383612a91328f152558c15c2d203e39221ec03586e16207ef2950b70b', '2025-09-16 21:49:56'),
(1, 'Subjektet', 'c088bb2f919808a29662a79a03bc06d2a3804e526987252bd835cdc92275e55d', '2025-09-16 21:49:56'),
(1, 'TVSH', '3760d7f6df6492ff8f8c6c482e99a4351d0364715ae63a2bdec727edc7664d3a', '2025-09-16 21:49:56'),
(1, 'Kategoria', '8d580ab2c4f5cba41c077bd9e10a4f49c6f7a360b8ecadf9db58ebc5ccfa9020', '2025-09-16 21:50:20'),
(1, 'Subjektet', '35e98bd58fa39833b4f9eef63e31a85dc3e54ed730b6ddfc43613ad830e94960', '2025-09-16 21:50:20'),
(1, 'Subjektet', 'e1defdcc7a4389f685db0be18a95fc7304d27f312a510b6d4bb5c09bbe954a5f', '2025-09-16 21:50:20'),
(1, 'TVSH', '980701284d21ff26e399d2d45328e01fb5681ea150800b831cf735a62ea8ddc0', '2025-09-16 21:50:20'),
(1, 'Subjektet', '1d617bf26ba419cb0d147c9b3a954b49a77def60e01bd864d15ecb90ab7cdec1', '2025-09-16 21:51:08'),
(1, 'TVSH', '291c8cafd4f6b4b63e610403e07af44a9beeb1d4ce0cebe89bb4981a40e6590b', '2025-09-16 21:51:08'),
(1, 'Kategoria', '0d6d9b65f23e852f41ae0726176982a45f2f60edcbe8ed9c3aa8009a811e7eb5', '2025-09-16 21:51:09'),
(1, 'Subjektet', '4b92008809368346dd291d86b8ca3a24ecc099cb85cc62787571e9eb72e6aebf', '2025-09-16 21:51:09'),
(1, 'TVSH', '1530751d78559712d170a3993e040a3fb574e0aebddbafef6c487972da4281fd', '2025-09-16 21:51:25'),
(1, 'TVSH', '756d7b130d267e3bede5ae24ad51b9f2bb163502c0e86f66ee3c2d4ecf9daf1f', '2025-09-16 21:51:43'),
(1, 'Kategoria', '2c160679676d84211663e41b329d5e86bfc9da8a9746bf3379741dcacd80858c', '2025-09-16 21:55:00'),
(1, 'Subjektet', '9da02a27d86d724b445eeccae2daec25024fc2a28043d1d9b61d71fbdb82afad', '2025-09-16 21:55:00'),
(1, 'Subjektet', 'f4cab2c44735983f6902a159b4187136b5e708bfe35cb1572254a9a6800c6ab4', '2025-09-16 21:55:00'),
(1, 'TVSH', '989528ccfe0d3dbace7cf9129578289b83ec9795050bcb0ed4be4fb1a4ba2179', '2025-09-16 21:55:00'),
(1, 'TVSH', 'efed9ad4c77dba7963e03f5cb0f0218c2dfbd9ee8dd5516cb7fd80fe952b3926', '2025-09-16 21:55:13'),
(1, 'Fatura', '02216434f50a08e883068274116c5fb7a262dfcfe42af5f75d9c2dd1231efe9d', '2025-09-16 21:55:38'),
(1, 'Porosia', '2a19af72aa58006f0aef5bf6a5f1d2dfdfbec3c3d97221b7478f68dc259fe99a', '2025-09-16 21:55:42'),
(1, 'Subjektet', 'b00c2cedf34dcf93ba65c1d473249afb97b2c147ce4ba15211652b92da76aeb5', '2025-09-16 21:55:46'),
(1, 'TVSH', '7091c79269d8fd423f3c28223aec980c522035b14852ccdf2094684b28fec608', '2025-09-16 21:55:50'),
(1, 'Kategoria', 'cea3f294adccbc519d663ea95d73c61249fb3d2d076bab74a1f1358a94eb7e65', '2025-09-16 21:55:53'),
(1, 'ArtikulliBaze', '0b3c03b8d71e01c7ae588834357c5777e4506b95714928e689c0a97f8b92c2f7', '2025-09-16 21:55:56'),
(1, 'Fatura', '7f0e906ff0a492a3ad2448839fa5ee27930c16b237b052f6a54ccd9660bc5e4f', '2025-09-16 21:55:59'),
(1, 'Porosia', 'a73a49e274336c29d9f0fd4202b2e170b7b47aa5b644e33c33ec08fb2cfe7101', '2025-09-16 21:56:02'),
(1, 'Fatura', 'b879d1c78a751b316fdc298d678fa0ea6b22564c38b561f9999f58f9d648e99e', '2025-09-16 21:58:03'),
(1, 'Fatura', 'ba4c79b337f211fea677253474c7d10e926d129b88ef7e40079e9b8fab6148a7', '2025-09-16 21:58:03'),
(1, 'Porosia', '6f024b04a40e93f84757053742a5e8acb870ded4f2ca89a5da51529ae779bee3', '2025-09-16 21:58:03'),
(1, 'FaturaKategoria', '35bfea3f34ae3f609be607decd85807b81f3a7f4b0ad4e526392fd2438b66817', '2025-09-16 21:58:42'),
(1, 'Pagesat', 'daa9f385494c93d1f102acb5491dffdf5912301a0b7142d2befe4dd570c91487', '2025-09-16 21:58:42'),
(1, 'Shfrytezuesi', 'd344b4707abce357114f3fbec5798755cae3d5aaca5b53b5567e1302f734230f', '2025-09-16 21:58:42'),
(1, 'Subjektet', '23c2145534d462226a0b1bfeae800426fd730b6d1b751447a7840336b9e0260c', '2025-09-16 21:58:42'),
(1, 'ArtikulliBaze', 'c44c318b7c0f2b4d336721fd2979855d33beeb0d6b88aff1d618f03da18933e9', '2025-09-16 21:58:43'),
(1, 'Fatura', '3d7b557e3201bcbee5982ac5c1fc9016f6827f73fc7084a4b4c2f9bfbbcddb2b', '2025-09-16 21:58:43'),
(1, 'Porosia', '09e69a73c192f145ff088e66c2dc2a609966252b1262f9058d71ea836b82feaa', '2025-09-16 21:58:43'),
(1, 'Kategoria', '3acf23fb82695040e62341155c2f0581ca75d321717e75d994c198ea8989eb48', '2025-09-16 21:59:27'),
(1, 'Subjektet', '826d51f0794d9dcc3b3360a78d8eee070ca940dc5822164d6ccf34407768e79d', '2025-09-16 21:59:27'),
(1, 'TVSH', '13c1302d334347e010508dd4c5f37c5c334a8a5f45e002cf6c8b5b8a8cf953b7', '2025-09-16 21:59:27'),
(1, 'ArtikulliBaze', '4ab1ec63965bae56bc95cf48c2c2c8f1f08f6d7f70afe6b00a1820630371766c', '2025-09-16 21:59:28'),
(1, 'FaturaKategoria', 'f6bebd8344fb18b12ced51e58adb6fb6345b4578b4720ddea9a2c91ba9a12e6c', '2025-09-16 21:59:28'),
(1, 'MenyraPageses', '7ab030be17f56db5e6e974e5cf37b56a9ae611232502d312ac79c988747781f9', '2025-09-16 21:59:28'),
(1, 'Shfrytezuesi', 'b90e9a74c4f0aeacbee6708e4978070306ad2d31a4c7eb09cab277ec5c535194', '2025-09-16 21:59:28'),
(1, 'Fatura', 'c2a161a27be843b1bf6520787222c5a0143d835dbe42580169658aa55fe6e8b2', '2025-09-16 21:59:29'),
(1, 'Pagesat', '09afa4ab40f855439e041a91640fc1ccab956cd7f46e60b21f1f76463dec980f', '2025-09-16 21:59:29'),
(1, 'Porosia', '48a32ee77553be1e0aa0fd088ae440d32096cd61adebe445e9dee7708c4227fa', '2025-09-16 21:59:29'),
(1, 'Kategoria', '556f46e17b973cddf91804ddae03e0f6a27a64d2657447b533ee2029f33be488', '2025-09-16 22:12:09'),
(1, 'Subjektet', '91cf762844d470d2aced8672fcb98455b987fbe10d26415f2812863a75dddfdf', '2025-09-16 22:12:09'),
(1, 'TVSH', '115428a19d540f1f937f5bc83d453482cae930d39681bf68b3153d93f4676fab', '2025-09-16 22:12:09'),
(1, 'ArtikulliBaze', '644fdf4fe3f923672c9d444a5879eeedc95e9fb7064c41a03912a4d64af6edc6', '2025-09-16 22:12:17'),
(1, 'Shfrytezuesi', '80daaa1ddb971a0ed94e5d81c3d7e8a5ba34c37f3d806ceaa397f0eb15bfc6b6', '2025-09-16 22:12:18'),
(1, 'FaturaKategoria', '3385230eaf4a4a93c9ae51a32af8f3ff02aad157f1f0b88baa3c666647c787c1', '2025-09-16 22:12:26'),
(1, 'MenyraPageses', 'b953e989b0fe7adf98947e57c082fe4ac214228c5188020559aaeefa238b0f5f', '2025-09-16 22:12:26'),
(1, 'Pagesat', 'c0e11eb9bba4518a0462b6243831ace30989616c1b6a8fb60b6b054c51fb7aa1', '2025-09-16 22:12:39'),
(1, 'Fatura', '72eb1a60aa6e771a5ee3baeb50928e61022da83385f33bb5cdd441af613e4e9b', '2025-09-16 22:12:43'),
(1, 'Porosia', '2489e31eec901cca035d1b24296025c5fb258bc2afd13c6d4ea71b900911cc2e', '2025-09-16 22:12:46'),
(1, 'ArtikulliBaze', 'b8ca1fcc563feab2574f3741d8f9e117c004d62555dbd0dac7adc9cc3acedc55', '2025-09-17 12:57:18'),
(1, 'Kategoria', 'c60a19fc8d5e398d2c0632559eae69fd21aa214b7a6aa139fca5d97d51a1fa7e', '2025-09-17 12:57:18'),
(1, 'MenyraPageses', 'cfe472e8c835395afc1c36474ff3d5ec2037db6584f019b8a9c10b6b02eeb224', '2025-09-17 12:57:18'),
(1, 'Shfrytezuesi', '4da06ff09b9c8eab5b0dc4d519306ac510d6171a01588c95b9c0add8294b9fb4', '2025-09-17 12:57:18'),
(1, 'TVSH', '3c697f50ea31b3aa90dee04e35f0f7c965d3f6f62646407e85ccf0d820938709', '2025-09-17 12:57:18'),
(1, 'Fatura', '63baa00c94bd88970a268326acfa962911171341c7153a32f84132dc52cc9c24', '2025-09-17 12:57:19'),
(1, 'ZRaportet', '0f59562377689e50942bdc2ca15c8d7e91513370d62902aef5d5453d15b64cf0', '2025-09-17 12:57:19'),
(1, 'Fatura', 'd04bdfedda9fd0ef6bee1ac7795e1dad924da1a2c9b12b1b4b69d1a44ef7ec60', '2025-09-17 13:04:17'),
(1, 'Pagesat', 'cf7077e31464e3191035f23fe4329107d4acb7c798c55c2cf9515b64a9e7a56d', '2025-09-17 13:04:17'),
(1, 'Porosia', '4d229c6adb7dc52c46d4aa7eee70e640287cf8cfc1d8df118b05c57d833cb6d7', '2025-09-17 13:04:18'),
(1, 'Porosia', '0e8aa28f246390a462b8a88e6883f23414685dbed883e5d12f6387cb454d2ac3', '2025-09-17 14:13:04'),
(1, 'Porosia', '81b4e5b7efcf3ef65de96795e57ada9506a904761d3bc0b66fb1ee2ca0b3e220', '2025-09-17 14:13:39'),
(1, 'Fatura', '26581022eb814d8d311296e5142c5e8def75c7cda2f2e1a98e6cdf8299ab77c4', '2025-09-17 14:14:47'),
(1, 'Subjektet', 'e9306ba713d4cc771cab47b325f6d06fac9589aceb6ba172c67634038224c8d8', '2025-09-17 14:26:57'),
(1, 'Fatura', 'b9d351830bd8d6480e64fa29ef98bf176dc35fde35b229197129fbe13dc552ca', '2025-09-18 07:57:37'),
(1, 'Pagesat', 'f7bf9ab166c97cf88f85cd33227b1e9427e7dfbfea53b6e95f13e1a1fc8807c5', '2025-09-18 07:57:37'),
(1, 'Porosia', '5e87b3e70d387b29f66b88eb3509bf66503cbf48dde2b73bf27bda0c3ce3791f', '2025-09-18 07:57:37'),
(1, 'Shfrytezuesi', '1f3c513c6aae801185d6ae3d630e1585a335ca21d77db7c6344cd69b483b2abc', '2025-09-18 07:57:37'),
(1, 'Fatura', '1ba5872281a25ddbacc7f27be2254d250b5060dad3ce4f0bcddcad719ec9db70', '2025-09-18 07:58:37'),
(1, 'Pagesat', '287ff792034d1467db2a385e7e19b0b4738adb7e903c49783372d538b54c6a83', '2025-09-18 07:58:37'),
(1, 'Porosia', '65510efe220233ea1d79f57ff729679a2c55b870594350c733c47c483b2b77a4', '2025-09-18 07:58:37'),
(1, 'Subjektet', '0c47ca2edc5e99ac89d3417045a5d60284523d12bc26714b23ffcbed48ff26ce', '2025-09-18 07:58:37'),
(1, 'Fatura', 'b466fb100bc5ba67c176bcc8ed402a235d88bbd7decf8b4c3f6ed7258d84cfd7', '2025-09-18 07:59:37'),
(1, 'Pagesat', '4233aa46a160a853bf65314d36c01c44b348c760838c615e3f531626ef620ba6', '2025-09-18 07:59:37'),
(1, 'Porosia', 'b181c6eb462be65dd215508cbb0c4ab099cb12c38fa579932a5fcb72953776a9', '2025-09-18 07:59:37'),
(1, 'Blerjet', '77831039897e3e5b7639d716110ae235f30b4aa8427dcb77e7ca9d1b4f6a3fbc', '2025-09-18 11:55:09'),
(1, 'Pagesat', 'd6f491d46e4b8fc2f84ffcf7d97bd19970cd961ecaa8806221fe3738dcbc8558', '2025-09-18 11:55:09'),
(1, 'Fatura', 'bf2bdb031013eaed40d7f698029efcffc41fdca67ee06ded8714b2a441095faf', '2025-09-18 11:57:28'),
(1, 'Porosia', 'e0c8fc5ed786a9aa033967adea44529edc29e1726e88dd09ffcd4fa12160afcb', '2025-09-18 11:57:31'),
(1, 'Pagesat', '5adea3f4092351d8b35c94c3df0fcdc8abff410136c842b2fc5267afefb0e304', '2025-09-18 11:57:38'),
(1, 'Fatura', 'a12f47ef7ab4c1b7320b3253bb31e3e80c025ffe404c1fe0c3f40c3f9ddd0262', '2025-09-18 11:57:43'),
(1, 'Porosia', 'ba229cf1819f18367e805071d389f1fc7d6acced9f9a64d1c6a1c7ff6df65433', '2025-09-18 11:57:46'),
(1, 'FaturaKategoria', '7103d43554a1da9ca3ae9e7ee3159a6c1159d314106ae12d4f0560320c7d67e9', '2025-09-18 11:57:49'),
(1, 'MenyraPageses', '388cc093159140763ce9b2df8572de4473eb61600304abd6a0848b6d1f17b30a', '2025-09-18 11:57:53'),
(1, 'Fatura', 'b9ca0055a39500e3e340cc2bec99951becb30df77dc5a930308e9f7c8af5b033', '2025-09-18 11:57:55'),
(1, 'Shfrytezuesi', '0cdb038b309877d9fb9940aabd6016d7dedf6e64f0f56b35bd497976afff52c3', '2025-09-18 11:57:59'),
(1, 'ArtikulliBaze', '5ac1522cb2c2d251f000a58e9dc5be37899401572105f166c70b87d204639212', '2025-09-18 11:58:04'),
(1, 'TVSH', '3ef7d546a003f272f50029c5ffad0fcad284a605d4529058bafbbd61301e593c', '2025-09-18 11:58:09'),
(1, 'Subjektet', '8a21228212b145142f7d5f8ad1d177370313ff06577b740f91fa1ca2d576b949', '2025-09-18 11:58:12'),
(1, 'Kategoria', '9c5dc52eb371e232d7d5d4769f363ef30e04fe6b4159b605b6ee0314ecbc6108', '2025-09-18 11:58:15'),
(1, 'Fatura', '346dc938d829045f0e82276101b05c350c8149b0de8fec8aff174fae82ab706a', '2025-09-18 11:58:17'),
(1, 'Porosia', 'fc2797866f554f5221a5aa06ef92922c5c1c57316bf06caa081b133016b64887', '2025-09-18 11:58:20'),
(1, 'Fatura', '6393ccbf14a25a1dddcca097c34434a239d867d40f8f9a549fdbd6ce4acd6ce6', '2025-09-18 19:18:44'),
(1, 'Subjektet', '18153b53e4e15ca94409bb68882c63fa7bc5678b17bf574e5859a71c7b252038', '2025-09-18 19:18:44'),
(1, 'Porosia', '821cc47bc7dfcab7663bf321f892c6b27583db64e06c8641b09926ce28e76914', '2025-09-18 19:18:45'),
(1, 'Fatura', '8316cae9ad88362e3f94f2f5d97bb0fad3bd118a20d77bb980ce3058cee66bff', '2025-09-18 19:19:44'),
(1, 'Pagesat', 'a9130b35b38df9f2d3e825c56bd1c8ecdab696cc9fd1df71efaacd3273f3e34e', '2025-09-18 19:19:44'),
(1, 'Porosia', '1ec5a1e58dff26548add35e4f2af466fde634a4b47a3097b3796f676d2ffeee9', '2025-09-18 19:19:45'),
(1, 'Kategoria', '691a36ad9214b576cb8eb235c59948785445b24b72d34ae47a0b90e0eaa9785d', '2025-09-18 19:20:44'),
(1, 'Fatura', '66f3329d5b36c598d4e33e2a93c62bdf2a65d525c9e9f9ea123311006d5590ce', '2025-09-18 19:21:44'),
(1, 'Pagesat', '974d067adf3cefc7a4502a26e5f1db86b6e52523a98c63a58e2906434056b1ca', '2025-09-18 19:21:44'),
(1, 'Porosia', '845528be1cd3c98f12bf8905ada3fc0024e4e6d8805f8e7f499566586c2c3e5a', '2025-09-18 19:21:45'),
(1, 'Subjektet', 'd31a0d4ede68656bb13deb4ad45ba949c646f3d00e117ab6baf75bdd744d99ce', '2025-09-18 19:22:44'),
(1, 'Blerjet', '4f06c2b42dfa5f463b0be15789a8b06dfa77962eb236fb2c22743ce602bf3597', '2025-09-18 19:28:44'),
(1, 'Pagesat', '052879dfb900c05ab075d8971966035adb4e7f89005c1947a4e8247906df762c', '2025-09-18 19:28:44'),
(1, 'Pagesat', '2a7eedf1834e292e6d6b0895d9497d465fc4680c82ce1b14db4b5639e7edcf42', '2025-09-20 08:45:10'),
(5, 'Subjektet', '457b2077bdd2c7eeaccc1648338f133c6ae88d0c6e7778d7f34558808c195975', '2025-09-23 21:30:57');

-- --------------------------------------------------------

--
-- Table structure for table `Kategoria`
--

CREATE TABLE `Kategoria` (
  `tenant_id` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Emri` varchar(50) DEFAULT NULL,
  `Color` varchar(50) DEFAULT NULL,
  `Printer` varchar(50) DEFAULT NULL,
  `Lloji` int(11) DEFAULT NULL,
  `EmriNePrinter` varchar(50) DEFAULT NULL,
  `DataEKrijimit` datetime(3) DEFAULT NULL,
  `DataEModifikimit` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Kategoria`
--

INSERT INTO `Kategoria` (`tenant_id`, `Id`, `Emri`, `Color`, `Printer`, `Lloji`, `EmriNePrinter`, `DataEKrijimit`, `DataEModifikimit`) VALUES
(1, 1, 'Flow Test Category', '#FF0000', 'Default', 1, 'FLOW', '2025-09-18 11:58:14.918', '2025-09-18 11:58:14.918'),
(1, 2, 'Pije freskuese', '1', 'prn1', 0, 'POROSI BARI', '2025-07-04 18:21:20.377', '2025-07-04 22:01:11.400'),
(1, 3, 'Restaurant', '1', 'prn1', 0, 'POROSI BARI', '2025-07-04 18:21:20.377', '2025-07-04 22:01:15.177'),
(1, 4, 'Restaurant 2', '1', 'prn1', 0, 'POROSI BARI', '2025-07-04 18:21:20.377', '2025-07-16 09:51:25.420'),
(1, 5, 'Xhama', '1', 'prn1', 0, 'Porosi xhame', '2025-07-04 18:21:20.377', '2025-09-18 21:20:26.257'),
(1, 6, 'Lule natyrale', '1', 'prn1', 0, 'Porosi xhame', '2025-07-04 18:21:20.377', '2025-09-18 21:20:34.967'),
(1, 7, 'Lule artificiale', '1', 'prn1', 0, 'Porosi xhame', '2025-07-04 18:21:20.377', '2025-09-18 21:20:42.717');

-- --------------------------------------------------------

--
-- Table structure for table `materialized_daily`
--

CREATE TABLE `materialized_daily` (
  `TenantId` int(11) NOT NULL,
  `Ymd` date NOT NULL,
  `SalesNet` decimal(19,4) NOT NULL DEFAULT 0.0000,
  `SalesVat` decimal(19,4) NOT NULL DEFAULT 0.0000,
  `PurchasesNet` decimal(19,4) NOT NULL DEFAULT 0.0000,
  `PurchasesVat` decimal(19,4) NOT NULL DEFAULT 0.0000,
  `AvgTicket` decimal(19,4) NOT NULL DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MenyraPageses`
--

CREATE TABLE `MenyraPageses` (
  `tenant_id` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Kodi` varchar(50) DEFAULT NULL,
  `Emertimi` varchar(50) DEFAULT NULL,
  `Kontoja` int(11) DEFAULT NULL,
  `FiskalType` int(11) DEFAULT NULL,
  `PosEnabled` tinyint(1) DEFAULT NULL,
  `DataEKrijimit` datetime(3) DEFAULT NULL,
  `DataEModifikimit` datetime(3) DEFAULT NULL,
  `POSBorgji` tinyint(1) DEFAULT 0,
  `KontojaKalimtare` varchar(10) DEFAULT NULL,
  `KontimneKontoKalimtare` tinyint(1) DEFAULT 0,
  `KontojaeProvizioneve` varchar(10) DEFAULT NULL,
  `BankaId` int(11) DEFAULT NULL,
  `JoFiskal` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `MenyraPageses`
--

INSERT INTO `MenyraPageses` (`tenant_id`, `Id`, `Kodi`, `Emertimi`, `Kontoja`, `FiskalType`, `PosEnabled`, `DataEKrijimit`, `DataEModifikimit`, `POSBorgji`, `KontojaKalimtare`, `KontimneKontoKalimtare`, `KontojaeProvizioneve`, `BankaId`, `JoFiskal`) VALUES
(1, 1, 'FLOW-CASH', 'Flow Cash Payment', 1001, 1, 1, '2025-09-18 11:57:53.018', '2025-09-18 11:57:53.018', 0, '', 0, '', NULL, 0),
(1, 2, 'NLB', 'Pagesa përmes NLB', 95, 0, 0, '2024-11-09 22:31:24.837', '2025-06-17 22:02:24.327', 0, '', 0, '', 3, 0),
(1, 3, 'RBKO', 'Pagesë përmes RBKO', 96, 0, 0, '2024-11-09 22:31:24.837', '2025-06-17 22:02:03.390', 0, '', 0, '', 2, 0),
(1, 4, 'TEB', 'Pagesa përmes TEB', 129, 0, 0, '2024-11-09 22:31:24.837', '2025-06-17 22:03:34.373', 0, '', 0, '', 6, 0),
(1, 5, 'BpB', 'Pagesa permes BpB', 99, 0, 0, '2024-11-09 22:31:24.837', '2025-06-17 22:04:21.277', 0, '', 0, '', 9, 0),
(1, 6, 'BKT', 'Pagesa permes BKT', 100, 0, 0, '2024-11-09 22:31:24.837', '2025-06-17 22:03:18.140', 0, '', 0, '', 5, 0),
(1, 7, 'B.E.', 'Pagesa permes BEK', 98, 0, 0, '2024-11-09 22:31:24.837', '2025-06-17 22:03:51.320', 0, '', 0, '', 7, 0),
(1, 8, 'PCB', 'Pagese permes PCB', 97, 0, 0, '2024-11-09 22:31:24.837', '2025-06-17 22:02:47.790', 0, '', 0, '', 4, 0),
(1, 9, 'ISH', 'Pagese permes ISH', 132, 0, 0, '2024-11-09 22:31:24.837', '2025-06-17 22:04:08.467', 0, '', 0, '', 8, 0),
(1, 10, 'NLB POSS', 'Pagese permes NLB POSS', 95, 3, 0, '2024-11-09 22:31:24.837', '2025-06-17 22:02:27.877', 0, '', 0, '', 3, 0),
(1, 11, 'RBKO POSS', 'Pagese permes RBKO POSS', 96, 3, 0, '2024-11-09 22:31:24.837', '2025-06-17 22:02:08.133', 0, '', 0, '', 2, 0),
(1, 12, 'PCB POSS', 'Pagese permes PCB POSS', 97, 3, 0, '2024-11-09 22:31:24.837', '2025-06-17 22:02:50.873', 0, '', 0, '', 4, 0),
(1, 13, 'TEB POSS', 'Pagese permes TEB POSS', 129, 3, 0, '2024-11-09 22:31:24.837', '2025-06-17 22:03:37.467', 0, '', 0, '', 6, 0),
(1, 14, 'BPB POSS', 'Pagese permes BPB POSS', 99, 3, 0, '2024-11-09 22:31:24.837', '2025-09-08 18:37:47.440', 0, '', 0, '', 9, 0),
(1, 15, 'BE POSS', 'Pagese permes BE POSS', 98, 3, 0, '2024-11-09 22:31:24.837', '2025-06-17 22:03:54.743', 0, '', 0, '', 7, 0),
(1, 16, 'BKT POSS', 'Pagese permes BKT POSS', 100, 3, 0, '2024-11-09 22:31:24.837', '2025-09-08 18:37:42.640', 0, '', 0, '', 5, 0),
(1, 17, 'ISH POSS', 'Pagese permes ISH POSS', 132, 3, 0, '2024-11-09 22:31:24.837', '2025-09-08 18:37:37.960', 0, '', 0, '', 8, 0),
(1, 18, 'NLB USD', 'Pagese permes NLB USD', 95, 0, 0, '2024-11-09 22:31:24.837', '2025-06-17 22:02:31.180', 0, '', 0, '', 3, 0),
(1, 19, 'RBKO USD', 'Pagese permes RBKO USD', 95, 0, 0, '2024-11-09 22:31:24.837', '2025-06-17 22:02:12.217', 0, '', 0, '', 2, 0),
(1, 20, 'PCB USD', 'Pagese permes PCB USD', 97, 0, 0, '2024-11-09 22:31:24.837', '2025-06-17 22:02:53.333', 0, '', 0, '', 4, 0),
(1, 21, 'TEB USD', 'Pagese permes TEB USD', 129, 0, 0, '2024-11-09 22:31:24.837', '2025-06-17 22:03:39.880', 0, '', 0, '', 6, 0),
(1, 22, 'BE USD', 'Pagese permes BE USD', 98, 0, 0, '2024-11-09 22:31:24.837', '2025-06-17 22:03:56.967', 0, '', 0, '', 7, 0),
(1, 23, 'BKT USD', 'Pagese permes BKT USD', 100, 0, 0, '2024-11-09 22:31:24.837', '2025-06-17 22:03:23.917', 0, '', 0, '', 5, 0),
(1, 24, 'BPB USD', 'Pagese permes BPB USD', 99, 0, 0, '2024-11-09 22:31:24.837', '2025-06-17 22:04:26.273', 0, '', 0, '', 9, 0),
(1, 25, 'ISH USD', 'Pagese permes ISH USD', 132, 0, 0, '2024-11-09 22:31:24.837', '2025-06-17 22:04:13.370', 0, '', 0, '', 8, 0),
(1, 26, 'BORXH', 'BORXH', 94, 0, 0, '2024-11-09 22:31:24.837', '2025-09-08 18:37:33.463', 0, '', 0, '', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Normativa`
--

CREATE TABLE `Normativa` (
  `tenant_id` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `ArtikulliBazeId` int(11) NOT NULL,
  `Norma` decimal(18,2) NOT NULL,
  `DataEKrijimit` datetime(3) DEFAULT NULL,
  `DataEModifikimit` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Pagesat`
--

CREATE TABLE `Pagesat` (
  `tenant_id` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `DataPageses` datetime(3) DEFAULT NULL,
  `MenyraPagesesId` int(11) DEFAULT NULL,
  `Totali` decimal(18,2) DEFAULT NULL,
  `ShumaPaguar` decimal(18,2) DEFAULT NULL,
  `ArkaId` int(11) DEFAULT NULL,
  `BankaId` int(11) DEFAULT NULL,
  `Referenca` varchar(50) DEFAULT NULL,
  `Komenti` varchar(100) DEFAULT NULL,
  `Memo` varchar(100) DEFAULT NULL,
  `KrijuarNga` varchar(50) DEFAULT NULL,
  `DataEModifikimit` datetime(3) DEFAULT NULL,
  `Valuta` varchar(5) DEFAULT NULL,
  `KursiKembimit` decimal(18,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Pagesat`
--

INSERT INTO `Pagesat` (`tenant_id`, `Id`, `DataPageses`, `MenyraPagesesId`, `Totali`, `ShumaPaguar`, `ArkaId`, `BankaId`, `Referenca`, `Komenti`, `Memo`, `KrijuarNga`, `DataEModifikimit`, `Valuta`, `KursiKembimit`) VALUES
(1, 1, '2025-09-17 15:03:18.057', 1, 7.50, 7.50, NULL, NULL, 'REFSep 17 2025  3:03PM', '-', '-', '78', '2025-09-17 15:03:18.057', 'EUR', 1.00000000),
(1, 2, '2025-09-17 15:03:22.393', 1, 7.50, 7.50, 4, NULL, 'Shitje POS - Sep 17 2025  3:03PM', 'Payment Method ID: 1 (Para te gatshme)', 'Table: 1_78', '2', '2025-09-17 15:03:22.393', 'EUR', 1.00000000),
(1, 3, '2025-09-18 09:57:29.183', 1, 3.00, 3.00, 4, NULL, 'Shitje POS - Sep 18 2025  9:57AM', 'Payment Method ID: 1 (Para te gatshme)', 'Table: 1', '3', '2025-09-18 09:57:29.183', 'EUR', 1.00000000),
(1, 4, '2025-09-18 09:58:18.990', 1, 7.50, 7.50, 4, NULL, 'Shitje POS - Sep 18 2025  9:58AM', 'Payment Method ID: 1 (Para te gatshme)', 'Table: 1', '2', '2025-09-18 09:58:18.990', 'EUR', 1.00000000),
(1, 5, '2025-09-18 09:58:48.030', 1, 6.00, 6.00, 4, NULL, 'Shitje POS - Sep 18 2025  9:58AM', 'Payment Method ID: 1 (Para te gatshme)', 'Table: 1', '2', '2025-09-18 09:58:48.030', 'EUR', 1.00000000),
(1, 6, '2025-09-18 09:59:25.540', 1, 14.00, 14.00, 4, NULL, 'Shitje POS - Sep 18 2025  9:59AM', 'Payment Method ID: 1 (Para te gatshme)', 'Table: 1', '2', '2025-09-18 09:59:25.540', 'EUR', 1.00000000),
(1, 7, '2025-09-18 13:53:28.273', 1, 323.00, 323.00, NULL, NULL, '', 'Pagese e plotë e shtuar më 18/09/2025 13:54', '', '', '2025-09-18 13:54:13.927', '', 0.00000000),
(1, 8, '2025-09-18 21:19:04.270', 1, 14.80, 30.30, 4, NULL, 'Shitje POS - Sep 18 2025  9:19PM', 'Payment Method ID: 1 (Para te gatshme)', 'Table: K1', '2', '2025-09-20 10:44:59.423', 'EUR', 1.00000000),
(1, 9, '2025-09-18 21:21:16.777', 1, 18.50, 18.50, 4, NULL, 'Shitje POS - Sep 18 2025  9:21PM', 'Payment Method ID: 1 (Para te gatshme)', 'Table: 1', '2', '2025-09-18 21:21:16.777', 'EUR', 1.00000000),
(1, 10, '2025-09-18 21:27:06.627', 1, 28.00, 28.00, NULL, NULL, '', 'Pagese e plotë e shtuar më 18/09/2025 21:28', '', '', '2025-09-18 21:28:05.340', '', 0.00000000),
(1, 1001, '2025-09-18 11:57:38.095', 1, 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-18 11:57:38.095', NULL, NULL),
(1, 2001, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Porosia`
--

CREATE TABLE `Porosia` (
  `tenant_id` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `DataEKrijimit` datetime(3) DEFAULT NULL,
  `DataEModifikimit` datetime(3) DEFAULT NULL,
  `Fshire` tinyint(1) DEFAULT NULL,
  `FaturaId` int(11) NOT NULL,
  `ProduktiId` int(11) NOT NULL,
  `Cmimi` decimal(18,2) NOT NULL,
  `Sasia` decimal(9,2) DEFAULT NULL,
  `Rabati` decimal(18,2) DEFAULT NULL,
  `IdTavolina` varchar(50) DEFAULT NULL,
  `Aktive` tinyint(1) DEFAULT NULL,
  `ShfrytezuesiId` int(11) DEFAULT NULL,
  `Tvsh` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Porosia`
--

INSERT INTO `Porosia` (`tenant_id`, `Id`, `DataEKrijimit`, `DataEModifikimit`, `Fshire`, `FaturaId`, `ProduktiId`, `Cmimi`, `Sasia`, `Rabati`, `IdTavolina`, `Aktive`, `ShfrytezuesiId`, `Tvsh`) VALUES
(1, 17, '2025-09-18 21:18:26.180', '2025-09-18 21:19:04.277', NULL, 6, 1, 6.50, 1.00, 0.00, 'K1', 0, 2, 0.00),
(1, 18, '2025-09-18 21:18:26.180', '2025-09-18 21:19:04.277', NULL, 6, 1, 6.50, 1.00, 0.00, 'K1', 0, 2, 0.00),
(1, 19, '2025-09-18 21:18:26.183', '2025-09-18 21:19:04.277', NULL, 6, 3, 1.80, 1.00, 0.00, 'K1', 0, 2, 0.00),
(1, 20, '2025-09-18 21:19:04.177', '2025-09-18 21:19:04.277', NULL, 7, 1, 6.50, 1.00, 0.00, 'K1', 0, 2, 0.00),
(1, 21, '2025-09-18 21:19:04.180', '2025-09-18 21:19:04.277', NULL, 7, 21, 1.50, 1.00, 0.00, 'K1', 0, 2, 0.00),
(1, 22, '2025-09-18 21:19:04.180', '2025-09-18 21:19:04.277', NULL, 7, 21, 1.50, 1.00, 0.00, 'K1', 0, 2, 0.00),
(1, 23, '2025-09-18 21:19:04.180', '2025-09-18 21:19:04.277', NULL, 7, 2, 4.50, 1.00, 0.00, 'K1', 0, 2, 0.00),
(1, 24, '2025-09-18 21:19:04.180', '2025-09-18 21:19:04.277', NULL, 7, 52, 1.50, 1.00, 0.00, 'K1', 0, 2, 0.00),
(1, 25, '2025-09-18 21:21:16.690', '2025-09-18 21:21:16.777', NULL, 8, 32, 1.50, 5.00, 0.00, '1', 0, 2, 0.00),
(1, 26, '2025-09-18 21:21:16.690', '2025-09-18 21:21:16.777', NULL, 8, 40, 1.50, 1.00, 0.00, '1', 0, 2, 0.00),
(1, 27, '2025-09-18 21:21:16.700', '2025-09-18 21:21:16.777', NULL, 8, 41, 1.50, 1.00, 0.00, '1', 0, 2, 0.00),
(1, 28, '2025-09-18 21:21:16.700', '2025-09-18 21:21:16.777', NULL, 8, 51, 2.50, 2.00, 0.00, '1', 0, 2, 0.00),
(1, 29, '2025-09-18 21:21:16.703', '2025-09-18 21:21:16.777', NULL, 8, 45, 1.50, 2.00, 0.00, '1', 0, 2, 0.00),
(1, 1001, '2025-09-18 11:58:20.353', '2025-09-18 11:58:20.353', 0, 1001, 1001, 10.50, 2.00, 0.00, 'T1', 1, 1, 1.89);

-- --------------------------------------------------------

--
-- Table structure for table `PorositeEBlerjes`
--

CREATE TABLE `PorositeEBlerjes` (
  `tenant_id` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `ProduktiId` int(11) NOT NULL,
  `Sasia` decimal(8,2) NOT NULL,
  `CmimiNjesi` decimal(18,2) NOT NULL,
  `DataEKrijimit` datetime(3) DEFAULT NULL,
  `DataEModifikimit` datetime(3) DEFAULT NULL,
  `Fshire` tinyint(1) DEFAULT 0,
  `BlerjaId` int(11) DEFAULT NULL,
  `PorosiaDate` datetime(3) DEFAULT NULL,
  `Tvsh` decimal(18,2) DEFAULT NULL,
  `Rabati` decimal(18,2) DEFAULT NULL,
  `Total` decimal(19,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `Id` int(11) NOT NULL,
  `Name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`Id`, `Name`) VALUES
(1, 'admin'),
(3, 'cashier'),
(2, 'manager'),
(4, 'viewer');

-- --------------------------------------------------------

--
-- Table structure for table `Shfrytezuesi`
--

CREATE TABLE `Shfrytezuesi` (
  `tenant_id` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `DataEKrijimit` datetime(3) DEFAULT NULL,
  `DataEModifikimit` datetime(3) DEFAULT NULL,
  `Fshire` tinyint(1) DEFAULT 0,
  `Username` varchar(100) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Tel` varchar(100) DEFAULT NULL,
  `Aktiv` tinyint(1) NOT NULL DEFAULT 1,
  `Color` varchar(50) DEFAULT NULL,
  `RoleId` int(11) DEFAULT NULL,
  `PunetoriId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Shfrytezuesi`
--

INSERT INTO `Shfrytezuesi` (`tenant_id`, `Id`, `DataEKrijimit`, `DataEModifikimit`, `Fshire`, `Username`, `Email`, `Tel`, `Aktiv`, `Color`, `RoleId`, `PunetoriId`) VALUES
(1, 1, '2025-09-18 11:57:59.441', '2025-09-18 11:57:59.441', 0, 'flowuser', 'flow@kendrix.com', '+1234567890', 1, '#A52D2C', 1, NULL),
(1, 2, '2024-10-07 22:46:06.800', '2025-07-04 18:38:59.883', 0, 'admin ', 'admin@admin.com', '044205994', 1, '#800080', 1, NULL),
(1, 3, '2024-10-15 10:05:13.530', '2025-09-18 09:57:21.460', 0, 'Blerta', 'shites@shites.com', '011 111 111', 1, '#008000', 3, NULL),
(1, 4, '2024-10-15 10:05:15.793', '2025-07-17 11:48:52.627', 0, 'Erblina', 'shites2@shites.com', '022 222 222', 1, '#C00000', 3, NULL),
(1, 5, '2025-01-17 15:31:01.527', '2025-07-16 09:48:17.667', 0, 'Bedria', 'test', '044 205 994', 0, 'Gray', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Stoku`
--

CREATE TABLE `Stoku` (
  `tenant_id` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `ProduktiId` int(11) NOT NULL,
  `Sasia` decimal(18,3) DEFAULT NULL,
  `LevelIRenditjes` int(11) NOT NULL,
  `DataEKrijimit` datetime(3) DEFAULT NULL,
  `DataEModifikimit` datetime(3) DEFAULT NULL,
  `Fshire` tinyint(1) DEFAULT 0,
  `Lokacioni` varchar(255) DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Subjektet`
--

CREATE TABLE `Subjektet` (
  `tenant_id` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Kodi` varchar(20) DEFAULT NULL,
  `Emertimi` varchar(100) DEFAULT NULL,
  `Furnitor` tinyint(1) DEFAULT 0,
  `Bleres` tinyint(1) DEFAULT 0,
  `NrUnik` varchar(50) DEFAULT NULL,
  `NoFiskal` varchar(50) DEFAULT NULL,
  `NoTVSH` varchar(50) DEFAULT NULL,
  `NIB` varchar(50) DEFAULT NULL,
  `Adresa` varchar(100) DEFAULT NULL,
  `Telefoni` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Rabati` decimal(18,2) DEFAULT NULL,
  `Pershkrimi` varchar(100) DEFAULT NULL,
  `KontojaArketueshme` int(11) DEFAULT NULL,
  `KontojaPagueshme` int(11) DEFAULT NULL,
  `Limiti` decimal(18,2) DEFAULT NULL,
  `Fshire` tinyint(1) DEFAULT 0,
  `DataEKrijimit` datetime(3) DEFAULT NULL,
  `DataEModifikimit` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Subjektet`
--

INSERT INTO `Subjektet` (`tenant_id`, `Id`, `Kodi`, `Emertimi`, `Furnitor`, `Bleres`, `NrUnik`, `NoFiskal`, `NoTVSH`, `NIB`, `Adresa`, `Telefoni`, `Email`, `Rabati`, `Pershkrimi`, `KontojaArketueshme`, `KontojaPagueshme`, `Limiti`, `Fshire`, `DataEKrijimit`, `DataEModifikimit`) VALUES
(1, 1, '1', 'Bleres Qytetar', 0, 1, '-', '-', '-', '-', '-', '-', '-', 0.00, '-', NULL, NULL, 0.00, 0, '2024-03-09 00:00:00.000', '2025-04-23 14:00:17.027'),
(1, 2, '', 'Kendrix Tech L.L.C.', 0, 0, '812307975', '', '', '', 'Rr. Muharrem Fejza C-12 lok-3', '+38344205994', 'qdemiraj@gmail.com', 0.00, '', NULL, NULL, NULL, 0, '2025-09-18 09:58:13.420', '2025-09-18 09:58:13.420'),
(1, 3, '', 'Filan Fisteku', 0, 0, '', '', '', '', '456546', '455454', 'bllawdkakwd', 0.00, '', NULL, NULL, NULL, 0, '2025-09-18 21:18:04.377', '2025-09-18 21:18:04.377'),
(1, 4, '', 'Kendrix Tech L.L.C.', 0, 0, '812307975', '', '', '', 'Rr. Muharrem Fejza C-12 lok-3', '+38344205994', 'qdemiraj@gmail.com', 0.00, '', NULL, NULL, NULL, 0, '2025-09-18 21:21:53.197', '2025-09-18 21:21:53.197'),
(1, 1001, 'FLOW-SUB-001', 'Flow Test Subject', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-09-18 11:58:12.323', '2025-09-18 11:58:12.323'),
(5, 1001, 'FLOW-SUB-001', 'Flow Test Subject', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-09-23 21:30:57.017', '2025-09-23 21:30:57.017');

-- --------------------------------------------------------

--
-- Table structure for table `sync_versions`
--

CREATE TABLE `sync_versions` (
  `TenantId` int(11) NOT NULL,
  `TableName` varchar(64) NOT NULL,
  `LastVersion` bigint(20) NOT NULL DEFAULT 0,
  `LastPulledAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sync_versions`
--

INSERT INTO `sync_versions` (`TenantId`, `TableName`, `LastVersion`, `LastPulledAt`) VALUES
(1, 'ArtikulliBaze', 1001, '2025-09-18 11:58:04.000'),
(1, 'Blerjet', 638938276795230000, '2025-09-18 19:28:44.000'),
(1, 'Fatura', 638938272767770000, '2025-09-18 19:21:44.000'),
(1, 'FaturaKategoria', 1001, '2025-09-18 11:57:49.000'),
(1, 'Kategoria', 638938272427170000, '2025-09-18 19:20:44.000'),
(1, 'MenyraPageses', 1001, '2025-09-18 11:57:53.000'),
(1, 'Pagesat', 638939618994230000, '2025-09-20 08:45:10.000'),
(1, 'Porosia', 638938272767770000, '2025-09-18 19:21:45.000'),
(1, 'Shfrytezuesi', 1001, '2025-09-18 11:57:59.000'),
(1, 'Subjektet', 638938273131970000, '2025-09-18 19:22:44.000'),
(1, 'TVSH', 1001, '2025-09-18 11:58:09.000'),
(1, 'ZRaportet', 638882686059000000, '2025-09-17 12:57:19.000'),
(5, 'Subjektet', 1001, '2025-09-23 21:30:57.000');

-- --------------------------------------------------------

--
-- Table structure for table `Tavolina`
--

CREATE TABLE `Tavolina` (
  `tenant_id` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `DataEKrijimit` datetime(3) DEFAULT NULL,
  `DataEModifikimit` datetime(3) DEFAULT NULL,
  `Fshire` tinyint(1) DEFAULT 0,
  `Emri` varchar(200) DEFAULT NULL,
  `SallaId` int(11) NOT NULL,
  `ShfrytezuesiId` int(11) DEFAULT NULL,
  `Statusi` int(11) DEFAULT NULL,
  `RestTableX` int(11) DEFAULT NULL,
  `RestTableY` int(11) DEFAULT NULL,
  `SizeX` int(11) DEFAULT NULL,
  `SizeY` int(11) DEFAULT NULL,
  `RegDate` datetime(3) DEFAULT NULL,
  `TableColorR` int(11) DEFAULT NULL,
  `TableColorG` int(11) DEFAULT NULL,
  `TableColorB` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `Id` int(11) NOT NULL,
  `Name` varchar(120) NOT NULL,
  `ExternalKey` varchar(80) DEFAULT NULL,
  `Status` enum('active','paused','disabled') NOT NULL DEFAULT 'active',
  `CreatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `UpdatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`Id`, `Name`, `ExternalKey`, `Status`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'Kendrix Client', 'KENDRIX-CLIENT-001', 'active', '2025-09-16 21:03:47.000', '2025-09-16 21:03:47.000'),
(5, 'ProperPizza-Komoran', 'E0B2-F197-00DE-F86B-5203-136E-BF1C-9B1E', 'active', '2025-09-17 14:44:43.105', '2025-09-23 21:30:39.130');

-- --------------------------------------------------------

--
-- Table structure for table `TVSH`
--

CREATE TABLE `TVSH` (
  `tenant_id` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `DataEKrijimit` datetime(3) DEFAULT NULL,
  `DataEModifikimit` datetime(3) DEFAULT NULL,
  `Fshire` tinyint(1) DEFAULT 0,
  `Perqindja` decimal(18,2) NOT NULL,
  `Grupi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `TVSH`
--

INSERT INTO `TVSH` (`tenant_id`, `Id`, `DataEKrijimit`, `DataEModifikimit`, `Fshire`, `Perqindja`, `Grupi`) VALUES
(1, 1, '2025-09-18 11:58:09.528', '2025-09-18 11:58:09.528', 0, 20.00, 'Standard'),
(1, 2, '2024-11-01 11:41:46.537', '2024-11-10 13:13:27.063', 0, 0.08, 'D'),
(1, 3, '2024-11-01 11:41:47.313', '2024-11-10 13:13:35.510', 0, 0.00, 'E'),
(1, 4, '2024-12-20 13:11:21.537', '2024-12-20 13:11:31.190', 0, 0.16, 'M');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Id` int(11) NOT NULL,
  `Email` varchar(190) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `DisplayName` varchar(120) DEFAULT NULL,
  `CreatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `UpdatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3) ON UPDATE current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Id`, `Email`, `PasswordHash`, `DisplayName`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'admin@kendrix.org', '$2y$10$lcT9kHaTUFPcIdD2r1QwdOVPCN4mzqquYN181dzFy30CcI.T4xp0O', 'Qendrim', '2025-09-17 20:40:55.000', '2025-09-18 11:29:19.052'),
(2, 'user@kendrix.org', '$2y$10$lcT9kHaTUFPcIdD2r1QwdOVPCN4mzqquYN181dzFy30CcI.T4xp0O', 'Proper', '2025-09-18 11:29:02.055', '2025-09-18 11:29:02.055');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `UserId` int(11) NOT NULL,
  `RoleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`UserId`, `RoleId`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_tenants`
--

CREATE TABLE `user_tenants` (
  `UserId` int(11) NOT NULL,
  `TenantId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_tenants`
--

INSERT INTO `user_tenants` (`UserId`, `TenantId`) VALUES
(2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ZRaportet`
--

CREATE TABLE `ZRaportet` (
  `tenant_id` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `DataEKrijimit` datetime(3) NOT NULL,
  `DataEModifikimit` datetime(3) NOT NULL,
  `ShumaShitjeProgram` decimal(18,2) NOT NULL,
  `ShumaNeZRaport` decimal(18,2) NOT NULL,
  `Diferenca` decimal(18,2) GENERATED ALWAYS AS (`ShumaNeZRaport` - `ShumaShitjeProgram`) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ZRaportet`
--

INSERT INTO `ZRaportet` (`tenant_id`, `Id`, `DataEKrijimit`, `DataEModifikimit`, `ShumaShitjeProgram`, `ShumaNeZRaport`) VALUES
(1, 1, '2025-01-14 23:20:39.650', '2025-01-14 23:20:39.650', 0.00, 0.00),
(1, 2, '2025-01-14 23:27:54.153', '2025-01-14 23:27:54.153', 0.00, 0.00),
(1, 3, '2025-01-14 23:28:07.713', '2025-01-14 23:28:07.713', 0.00, 15.00),
(1, 4, '2025-01-14 23:30:29.620', '2025-01-14 23:30:29.620', 4.50, 4.50),
(1, 5, '2025-01-16 23:31:06.860', '2025-01-16 23:31:06.860', 48.50, 54.00),
(1, 6, '2025-01-17 16:08:01.223', '2025-01-17 16:08:01.223', 0.00, 20.00),
(1, 7, '2025-01-17 16:31:57.603', '2025-01-17 16:31:57.603', 0.00, 0.00),
(1, 8, '2025-01-18 23:32:52.893', '2025-01-18 23:32:52.893', 558.30, 10.00),
(1, 9, '2025-01-18 23:33:38.890', '2025-01-18 23:33:38.890', 558.30, 0.00),
(1, 10, '2025-02-04 23:49:30.623', '2025-02-04 23:49:30.623', 166.50, 123.00),
(1, 11, '2025-02-05 09:27:44.333', '2025-02-05 09:27:44.333', 99.50, 240.00),
(1, 12, '2025-02-05 15:49:22.630', '2025-02-05 15:49:22.630', 181.00, 0.00),
(1, 13, '2025-04-28 21:03:18.317', '2025-04-28 21:03:18.317', 52.40, 0.00),
(1, 14, '2025-04-28 21:04:36.103', '2025-04-28 21:04:36.103', 52.40, 0.00),
(1, 15, '2025-04-30 10:46:51.910', '2025-04-30 10:46:51.910', 0.00, 0.00),
(1, 16, '2025-04-30 10:54:11.977', '2025-04-30 10:54:11.977', 0.00, 0.00),
(1, 17, '2025-04-30 12:55:30.053', '2025-04-30 12:55:30.053', 3.00, 0.00),
(1, 18, '2025-05-05 09:46:32.557', '2025-05-05 09:46:32.557', 2.50, 0.00),
(1, 19, '2025-06-13 16:24:37.987', '2025-06-13 16:24:37.987', 0.00, 0.00),
(1, 20, '2025-07-16 13:16:45.900', '2025-07-16 13:16:45.900', 68.70, 0.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ArtikulliBaze`
--
ALTER TABLE `ArtikulliBaze`
  ADD PRIMARY KEY (`tenant_id`,`Id`),
  ADD KEY `ix_artikulli_tenant_kat` (`tenant_id`,`KategoriaId`),
  ADD KEY `ix_artikulli_tenant_tvsh` (`tenant_id`,`TvshId`),
  ADD KEY `ix_artikulli_tenant_barkodi` (`tenant_id`,`Barkodi`),
  ADD KEY `fk_artikulli_group` (`tenant_id`,`GroupId`),
  ADD KEY `fk_artikulli_subjekt` (`tenant_id`,`SubjektiId`);
ALTER TABLE `ArtikulliBaze` ADD FULLTEXT KEY `ft_artikulli_emri` (`Emri`);

--
-- Indexes for table `BlerjeKategoria`
--
ALTER TABLE `BlerjeKategoria`
  ADD PRIMARY KEY (`tenant_id`,`Id`),
  ADD KEY `ix_bk_tenant_tvsh` (`tenant_id`,`TvshId`);

--
-- Indexes for table `Blerjet`
--
ALTER TABLE `Blerjet`
  ADD PRIMARY KEY (`tenant_id`,`Id`),
  ADD UNIQUE KEY `ux_blerjet_pagesa` (`tenant_id`,`PagesaId`),
  ADD KEY `ix_blerjet_tenant_date` (`tenant_id`,`DataEFatures`),
  ADD KEY `ix_blerjet_tenant_subjekt` (`tenant_id`,`SubjektiId`),
  ADD KEY `fk_blerjet_kategoria` (`tenant_id`,`BlerjeKategoriaId`),
  ADD KEY `fk_blerjet_menyra` (`tenant_id`,`MenyraPagesesId`);

--
-- Indexes for table `etl_errors`
--
ALTER TABLE `etl_errors`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ix_etl_errors_tenant_time` (`TenantId`,`CreatedAt`);

--
-- Indexes for table `Fatura`
--
ALTER TABLE `Fatura`
  ADD PRIMARY KEY (`tenant_id`,`Id`),
  ADD KEY `ix_fatura_tenant_date` (`tenant_id`,`Data`),
  ADD KEY `ix_fatura_tenant_subjekt` (`tenant_id`,`SubjektiId`),
  ADD KEY `ix_fatura_tenant_kat` (`tenant_id`,`FaturaKategoriaId`),
  ADD KEY `fk_fatura_pagesa` (`tenant_id`,`PagesaId`),
  ADD KEY `ix_fatura_tenant_user_date` (`tenant_id`,`ShfrytezuesiId`,`Data`),
  ADD KEY `ix_fatura_tenant_user_date_user` (`tenant_id`,`ShfrytezuesiId`,`Data`);

--
-- Indexes for table `FaturaKategoria`
--
ALTER TABLE `FaturaKategoria`
  ADD PRIMARY KEY (`tenant_id`,`Id`),
  ADD KEY `ix_fk_tenant_tvsh` (`tenant_id`,`TvshId`);

--
-- Indexes for table `idempotency_keys`
--
ALTER TABLE `idempotency_keys`
  ADD PRIMARY KEY (`TenantId`,`TableName`,`KeyHash`),
  ADD KEY `idx_tenant_table` (`TenantId`,`TableName`),
  ADD KEY `idx_created_at` (`CreatedAt`);

--
-- Indexes for table `Kategoria`
--
ALTER TABLE `Kategoria`
  ADD PRIMARY KEY (`tenant_id`,`Id`),
  ADD KEY `ix_kategoria_tenant_lloji` (`tenant_id`,`Lloji`);

--
-- Indexes for table `materialized_daily`
--
ALTER TABLE `materialized_daily`
  ADD PRIMARY KEY (`TenantId`,`Ymd`);

--
-- Indexes for table `MenyraPageses`
--
ALTER TABLE `MenyraPageses`
  ADD PRIMARY KEY (`tenant_id`,`Id`),
  ADD KEY `ix_menyra_tenant_kodi` (`tenant_id`,`Kodi`);

--
-- Indexes for table `Normativa`
--
ALTER TABLE `Normativa`
  ADD PRIMARY KEY (`tenant_id`,`Id`),
  ADD KEY `ix_normativa_art` (`tenant_id`,`ArtikulliBazeId`);

--
-- Indexes for table `Pagesat`
--
ALTER TABLE `Pagesat`
  ADD PRIMARY KEY (`tenant_id`,`Id`),
  ADD KEY `ix_pagesat_tenant_date` (`tenant_id`,`DataPageses`),
  ADD KEY `ix_pagesat_tenant_menyra` (`tenant_id`,`MenyraPagesesId`);

--
-- Indexes for table `Porosia`
--
ALTER TABLE `Porosia`
  ADD PRIMARY KEY (`tenant_id`,`Id`),
  ADD KEY `ix_porosia_tenant_fatura` (`tenant_id`,`FaturaId`),
  ADD KEY `ix_porosia_tenant_produkt` (`tenant_id`,`ProduktiId`);

--
-- Indexes for table `PorositeEBlerjes`
--
ALTER TABLE `PorositeEBlerjes`
  ADD PRIMARY KEY (`tenant_id`,`Id`),
  ADD KEY `ix_peb_tenant_blerja` (`tenant_id`,`BlerjaId`),
  ADD KEY `ix_peb_tenant_produkt` (`tenant_id`,`ProduktiId`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `ux_roles_name` (`Name`);

--
-- Indexes for table `Shfrytezuesi`
--
ALTER TABLE `Shfrytezuesi`
  ADD PRIMARY KEY (`tenant_id`,`Id`),
  ADD UNIQUE KEY `ux_shfrytezuesi_tenant_username` (`tenant_id`,`Username`),
  ADD KEY `ix_shfrytezuesi_tenant_aktiv` (`tenant_id`,`Aktiv`);

--
-- Indexes for table `Stoku`
--
ALTER TABLE `Stoku`
  ADD PRIMARY KEY (`tenant_id`,`Id`),
  ADD UNIQUE KEY `ux_stoku_product_location` (`tenant_id`,`ProduktiId`,`Lokacioni`),
  ADD KEY `ix_stoku_tenant_product` (`tenant_id`,`ProduktiId`);

--
-- Indexes for table `Subjektet`
--
ALTER TABLE `Subjektet`
  ADD PRIMARY KEY (`tenant_id`,`Id`),
  ADD KEY `ix_subjektet_tenant_bleres` (`tenant_id`,`Bleres`),
  ADD KEY `ix_subjektet_tenant_furnitor` (`tenant_id`,`Furnitor`),
  ADD KEY `ix_subjektet_tenant_kodi` (`tenant_id`,`Kodi`);

--
-- Indexes for table `sync_versions`
--
ALTER TABLE `sync_versions`
  ADD PRIMARY KEY (`TenantId`,`TableName`);

--
-- Indexes for table `Tavolina`
--
ALTER TABLE `Tavolina`
  ADD PRIMARY KEY (`tenant_id`,`Id`),
  ADD KEY `ix_tavolina_tenant_salla` (`tenant_id`,`SallaId`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `ux_tenants_external` (`ExternalKey`);

--
-- Indexes for table `TVSH`
--
ALTER TABLE `TVSH`
  ADD PRIMARY KEY (`tenant_id`,`Id`),
  ADD KEY `ix_tvsh_tenant_grupi` (`tenant_id`,`Grupi`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `ux_users_email` (`Email`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`UserId`,`RoleId`),
  ADD KEY `fk_user_roles_role` (`RoleId`);

--
-- Indexes for table `user_tenants`
--
ALTER TABLE `user_tenants`
  ADD PRIMARY KEY (`UserId`,`TenantId`),
  ADD KEY `fk_user_tenants_tenant` (`TenantId`);

--
-- Indexes for table `ZRaportet`
--
ALTER TABLE `ZRaportet`
  ADD PRIMARY KEY (`tenant_id`,`Id`),
  ADD KEY `ix_zraportet_date` (`tenant_id`,`DataEKrijimit`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `etl_errors`
--
ALTER TABLE `etl_errors`
  MODIFY `Id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ArtikulliBaze`
--
ALTER TABLE `ArtikulliBaze`
  ADD CONSTRAINT `fk_artikulli_group` FOREIGN KEY (`tenant_id`,`GroupId`) REFERENCES `ArtikulliBaze` (`tenant_id`, `Id`),
  ADD CONSTRAINT `fk_artikulli_kategoria` FOREIGN KEY (`tenant_id`,`KategoriaId`) REFERENCES `Kategoria` (`tenant_id`, `Id`),
  ADD CONSTRAINT `fk_artikulli_subjekt` FOREIGN KEY (`tenant_id`,`SubjektiId`) REFERENCES `Subjektet` (`tenant_id`, `Id`),
  ADD CONSTRAINT `fk_artikulli_tvsh` FOREIGN KEY (`tenant_id`,`TvshId`) REFERENCES `TVSH` (`tenant_id`, `Id`);

--
-- Constraints for table `BlerjeKategoria`
--
ALTER TABLE `BlerjeKategoria`
  ADD CONSTRAINT `fk_blerjekategoria_tvsh` FOREIGN KEY (`tenant_id`,`TvshId`) REFERENCES `TVSH` (`tenant_id`, `Id`);

--
-- Constraints for table `Blerjet`
--
ALTER TABLE `Blerjet`
  ADD CONSTRAINT `fk_blerjet_kategoria` FOREIGN KEY (`tenant_id`,`BlerjeKategoriaId`) REFERENCES `BlerjeKategoria` (`tenant_id`, `Id`),
  ADD CONSTRAINT `fk_blerjet_menyra` FOREIGN KEY (`tenant_id`,`MenyraPagesesId`) REFERENCES `MenyraPageses` (`tenant_id`, `Id`),
  ADD CONSTRAINT `fk_blerjet_pagesa` FOREIGN KEY (`tenant_id`,`PagesaId`) REFERENCES `Pagesat` (`tenant_id`, `Id`),
  ADD CONSTRAINT `fk_blerjet_subjekt` FOREIGN KEY (`tenant_id`,`SubjektiId`) REFERENCES `Subjektet` (`tenant_id`, `Id`);

--
-- Constraints for table `etl_errors`
--
ALTER TABLE `etl_errors`
  ADD CONSTRAINT `fk_etl_errors_tenant` FOREIGN KEY (`TenantId`) REFERENCES `tenants` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `Fatura`
--
ALTER TABLE `Fatura`
  ADD CONSTRAINT `fk_fatura_kategoria` FOREIGN KEY (`tenant_id`,`FaturaKategoriaId`) REFERENCES `FaturaKategoria` (`tenant_id`, `Id`),
  ADD CONSTRAINT `fk_fatura_pagesa` FOREIGN KEY (`tenant_id`,`PagesaId`) REFERENCES `Pagesat` (`tenant_id`, `Id`),
  ADD CONSTRAINT `fk_fatura_subjekt` FOREIGN KEY (`tenant_id`,`SubjektiId`) REFERENCES `Subjektet` (`tenant_id`, `Id`);

--
-- Constraints for table `FaturaKategoria`
--
ALTER TABLE `FaturaKategoria`
  ADD CONSTRAINT `fk_faturakategoria_tvsh` FOREIGN KEY (`tenant_id`,`TvshId`) REFERENCES `TVSH` (`tenant_id`, `Id`);

--
-- Constraints for table `materialized_daily`
--
ALTER TABLE `materialized_daily`
  ADD CONSTRAINT `fk_materialized_daily_tenant` FOREIGN KEY (`TenantId`) REFERENCES `tenants` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `Normativa`
--
ALTER TABLE `Normativa`
  ADD CONSTRAINT `fk_normativa_artikulli` FOREIGN KEY (`tenant_id`,`ArtikulliBazeId`) REFERENCES `ArtikulliBaze` (`tenant_id`, `Id`);

--
-- Constraints for table `Pagesat`
--
ALTER TABLE `Pagesat`
  ADD CONSTRAINT `fk_pagesat_menyra` FOREIGN KEY (`tenant_id`,`MenyraPagesesId`) REFERENCES `MenyraPageses` (`tenant_id`, `Id`);

--
-- Constraints for table `Porosia`
--
ALTER TABLE `Porosia`
  ADD CONSTRAINT `fk_porosia_artikulli` FOREIGN KEY (`tenant_id`,`ProduktiId`) REFERENCES `ArtikulliBaze` (`tenant_id`, `Id`),
  ADD CONSTRAINT `fk_porosia_fatura` FOREIGN KEY (`tenant_id`,`FaturaId`) REFERENCES `Fatura` (`tenant_id`, `Id`) ON DELETE CASCADE;

--
-- Constraints for table `PorositeEBlerjes`
--
ALTER TABLE `PorositeEBlerjes`
  ADD CONSTRAINT `fk_peb_artikulli` FOREIGN KEY (`tenant_id`,`ProduktiId`) REFERENCES `ArtikulliBaze` (`tenant_id`, `Id`),
  ADD CONSTRAINT `fk_peb_blerjet` FOREIGN KEY (`tenant_id`,`BlerjaId`) REFERENCES `Blerjet` (`tenant_id`, `Id`) ON DELETE CASCADE;

--
-- Constraints for table `Stoku`
--
ALTER TABLE `Stoku`
  ADD CONSTRAINT `fk_stoku_artikulli` FOREIGN KEY (`tenant_id`,`ProduktiId`) REFERENCES `ArtikulliBaze` (`tenant_id`, `Id`);

--
-- Constraints for table `sync_versions`
--
ALTER TABLE `sync_versions`
  ADD CONSTRAINT `fk_sync_versions_tenant` FOREIGN KEY (`TenantId`) REFERENCES `tenants` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `fk_user_roles_role` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_roles_user` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `user_tenants`
--
ALTER TABLE `user_tenants`
  ADD CONSTRAINT `fk_user_tenants_tenant` FOREIGN KEY (`TenantId`) REFERENCES `tenants` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_tenants_user` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
