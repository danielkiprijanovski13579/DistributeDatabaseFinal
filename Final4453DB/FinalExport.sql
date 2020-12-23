-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.4.16-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for fedex_4453
DROP DATABASE IF EXISTS `fedex_4453`;
CREATE DATABASE IF NOT EXISTS `fedex_4453` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `fedex_4453`;

-- Dumping structure for table fedex_4453.client
DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `Id_Client` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` text NOT NULL,
  `lastName` text NOT NULL,
  `Address` text NOT NULL,
  `City` text NOT NULL,
  `email` text NOT NULL,
  PRIMARY KEY (`Id_Client`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table fedex_4453.client: ~3 rows (approximately)
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` (`Id_Client`, `firstName`, `lastName`, `Address`, `City`, `email`) VALUES
	(1, 'Client 1', 'pClient 1', 'address 1', 'City 1', 'email1@mail.com'),
	(2, 'Client 2', 'pClient 2', 'address 2', 'City 2', 'email2@mail.com'),
	(3, 'Client 3', 'pClient 3', 'address 3', 'City 3', 'email3@mail.com');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;

-- Dumping structure for table fedex_4453.delivery
DROP TABLE IF EXISTS `delivery`;
CREATE TABLE IF NOT EXISTS `delivery` (
  `id_delivery` int(11) NOT NULL AUTO_INCREMENT,
  `id_packet` int(11) NOT NULL DEFAULT 0,
  `id_status` int(11) NOT NULL DEFAULT 0,
  `date_delivered` datetime NOT NULL,
  PRIMARY KEY (`id_delivery`),
  KEY `FK_delivery_packet` (`id_packet`),
  KEY `FK_delivery_status_delivery` (`id_status`),
  CONSTRAINT `FK_delivery_packet` FOREIGN KEY (`id_packet`) REFERENCES `packet` (`Id_packet`),
  CONSTRAINT `FK_delivery_status_delivery` FOREIGN KEY (`id_status`) REFERENCES `status_delivery` (`Id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table fedex_4453.delivery: ~10 rows (approximately)
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` (`id_delivery`, `id_packet`, `id_status`, `date_delivered`) VALUES
	(1, 1, 1, '0000-00-00 00:00:00'),
	(2, 1, 2, '0000-00-00 00:00:00'),
	(3, 1, 3, '0000-00-00 00:00:00'),
	(4, 2, 1, '0000-00-00 00:00:00'),
	(5, 2, 2, '0000-00-00 00:00:00'),
	(6, 3, 1, '0000-00-00 00:00:00'),
	(7, 3, 2, '0000-00-00 00:00:00'),
	(8, 3, 4, '0000-00-00 00:00:00'),
	(9, 4, 1, '0000-00-00 00:00:00'),
	(10, 4, 5, '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;

-- Dumping structure for table fedex_4453.packet
DROP TABLE IF EXISTS `packet`;
CREATE TABLE IF NOT EXISTS `packet` (
  `Id_packet` int(11) NOT NULL AUTO_INCREMENT,
  `Fk_price_packet` int(11) NOT NULL DEFAULT 0,
  `Fk_client` int(11) NOT NULL DEFAULT 0,
  `Fk_recipient` int(11) NOT NULL DEFAULT 0,
  `datePacket` datetime NOT NULL,
  PRIMARY KEY (`Id_packet`),
  KEY `FK_packet_paketprice` (`Fk_price_packet`),
  KEY `FK_packet_client` (`Fk_client`),
  KEY `FK_packet_recipient` (`Fk_recipient`),
  CONSTRAINT `FK_packet_client` FOREIGN KEY (`Fk_client`) REFERENCES `client` (`Id_Client`),
  CONSTRAINT `FK_packet_paketprice` FOREIGN KEY (`Fk_price_packet`) REFERENCES `paketprice` (`id_packet_Price`),
  CONSTRAINT `FK_packet_recipient` FOREIGN KEY (`Fk_recipient`) REFERENCES `recipient` (`id_recipient`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table fedex_4453.packet: ~12 rows (approximately)
/*!40000 ALTER TABLE `packet` DISABLE KEYS */;
INSERT INTO `packet` (`Id_packet`, `Fk_price_packet`, `Fk_client`, `Fk_recipient`, `datePacket`) VALUES
	(1, 1, 1, 1, '0000-00-00 00:00:00'),
	(2, 2, 2, 2, '0000-00-00 00:00:00'),
	(3, 3, 3, 3, '0000-00-00 00:00:00'),
	(4, 4, 1, 2, '0000-00-00 00:00:00'),
	(5, 5, 3, 1, '0000-00-00 00:00:00'),
	(7, 2, 1, 1, '0000-00-00 00:00:00'),
	(8, 2, 3, 1, '0000-00-00 00:00:00'),
	(9, 0, 0, 0, '0000-00-00 00:00:00'),
	(10, 0, 0, 0, '0000-00-00 00:00:00'),
	(11, 0, 0, 0, '0000-00-00 00:00:00'),
	(17, 4, 3, 3, '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `packet` ENABLE KEYS */;

-- Dumping structure for table fedex_4453.paketprice
DROP TABLE IF EXISTS `paketprice`;
CREATE TABLE IF NOT EXISTS `paketprice` (
  `id_packet_Price` int(11) NOT NULL AUTO_INCREMENT,
  `weight` text NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_packet_Price`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table fedex_4453.paketprice: ~5 rows (approximately)
/*!40000 ALTER TABLE `paketprice` DISABLE KEYS */;
INSERT INTO `paketprice` (`id_packet_Price`, `weight`, `price`) VALUES
	(1, '0-2 kg', 200),
	(2, '2-4 kg', 400),
	(3, '4-8 kg', 800),
	(4, '8-12 kg', 1500),
	(5, '12 kg+', 4000);
/*!40000 ALTER TABLE `paketprice` ENABLE KEYS */;

-- Dumping structure for procedure fedex_4453.procedure1
DROP PROCEDURE IF EXISTS `procedure1`;
DELIMITER //
CREATE PROCEDURE `procedure1`(
	IN `packet_id` INT
)
BEGIN
SELECT packet.Id_packet,Status_delivery.status
FROM delivery
INNER JOIN packet
ON delivery.id_packet = packet.Id_packet
INNER JOIN Status_delivery 
ON delivery.id_status = status_delivery.Id_status
WHERE packet.Id_packet = packet_id;
END//
DELIMITER ;

-- Dumping structure for table fedex_4453.recipient
DROP TABLE IF EXISTS `recipient`;
CREATE TABLE IF NOT EXISTS `recipient` (
  `id_recipient` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` text NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`id_recipient`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table fedex_4453.recipient: ~5 rows (approximately)
/*!40000 ALTER TABLE `recipient` DISABLE KEYS */;
INSERT INTO `recipient` (`id_recipient`, `fullName`, `address`) VALUES
	(1, 'Recipient 1', 'Address 1'),
	(2, 'Recipient 2', 'Address 2'),
	(3, 'Recipient 3', 'Address 3'),
	(4, '', ''),
	(5, '', '');
/*!40000 ALTER TABLE `recipient` ENABLE KEYS */;

-- Dumping structure for table fedex_4453.stat
DROP TABLE IF EXISTS `stat`;
CREATE TABLE IF NOT EXISTS `stat` (
  `ID_STAT` int(11) NOT NULL AUTO_INCREMENT,
  `Desc_STAT` text NOT NULL,
  `DATE_STAT` datetime NOT NULL,
  PRIMARY KEY (`ID_STAT`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table fedex_4453.stat: ~1 rows (approximately)
/*!40000 ALTER TABLE `stat` DISABLE KEYS */;
INSERT INTO `stat` (`ID_STAT`, `Desc_STAT`, `DATE_STAT`) VALUES
	(1, 'Inserted packet with ID = 17and price in: 1500', '2020-12-23 18:19:39');
/*!40000 ALTER TABLE `stat` ENABLE KEYS */;

-- Dumping structure for table fedex_4453.status_delivery
DROP TABLE IF EXISTS `status_delivery`;
CREATE TABLE IF NOT EXISTS `status_delivery` (
  `Id_status` int(11) NOT NULL AUTO_INCREMENT,
  `status` text NOT NULL,
  PRIMARY KEY (`Id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table fedex_4453.status_delivery: ~5 rows (approximately)
/*!40000 ALTER TABLE `status_delivery` DISABLE KEYS */;
INSERT INTO `status_delivery` (`Id_status`, `status`) VALUES
	(1, 'Packet preparation'),
	(2, 'Packet in Transit'),
	(3, 'Delivery Completed'),
	(4, 'Cancelled'),
	(5, 'UnKnown');
/*!40000 ALTER TABLE `status_delivery` ENABLE KEYS */;

-- Dumping structure for view fedex_4453.view1
DROP VIEW IF EXISTS `view1`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view1` (
	`ID_Client` INT(11) NOT NULL,
	`First_Name` TEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`Last_Name` TEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`SumPackages` DECIMAL(32,0) NULL
) ENGINE=MyISAM;

-- Dumping structure for trigger fedex_4453.trigger1
DROP TRIGGER IF EXISTS `trigger1`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trigger1` AFTER INSERT ON `packet` FOR EACH ROW BEGIN
DECLARE pp VARCHAR(255);
SELECT
price INTO pp
FROM packet
INNER JOIN 
paketprice
ON packet.Fk_price_packet = paketprice.id_packet_Price
WHERE packet.Id_packet = NEW.Id_packet;
INSERT INTO stat
SET stat.Desc_STAT = CONCAT('Inserted packet with ID = ',NEW.ID_packet,'and price in: ',pp),
    DATE_STAT = NOW();
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for view fedex_4453.view1
DROP VIEW IF EXISTS `view1`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view1`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view1` AS SELECT 
client.Id_client AS ID_Client,
client.firstName AS First_Name,
client.lastName AS Last_Name,
SUM(packet.id_packet) AS SumPackages
FROM client
JOIN packet ON client.Id_Client = packet.Fk_client
GROUP BY 
client.Id_client ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
