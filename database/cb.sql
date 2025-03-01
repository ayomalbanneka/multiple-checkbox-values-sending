-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.41 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.9.0.6999
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for testings
CREATE DATABASE IF NOT EXISTS `testings` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `testings`;

-- Dumping structure for table testings.sizes
CREATE TABLE IF NOT EXISTS `sizes` (
  `sizes_id` int NOT NULL AUTO_INCREMENT,
  `size` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sizes_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table testings.sizes: ~4 rows (approximately)
INSERT INTO `sizes` (`sizes_id`, `size`) VALUES
	(1, 'S'),
	(2, 'm'),
	(3, 'l'),
	(4, 'xl');

-- Dumping structure for table testings.sizes_has_store
CREATE TABLE IF NOT EXISTS `sizes_has_store` (
  `sizes_sizes_id` int NOT NULL,
  `store_id` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_sizes_has_store_store1_idx` (`store_id`),
  KEY `fk_sizes_has_store_sizes_idx` (`sizes_sizes_id`),
  CONSTRAINT `fk_sizes_has_store_sizes` FOREIGN KEY (`sizes_sizes_id`) REFERENCES `sizes` (`sizes_id`),
  CONSTRAINT `fk_sizes_has_store_store1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table testings.sizes_has_store: ~0 rows (approximately)

-- Dumping structure for table testings.store
CREATE TABLE IF NOT EXISTS `store` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table testings.store: ~3 rows (approximately)
INSERT INTO `store` (`id`, `name`) VALUES
	(1, 'sotre1'),
	(2, 'store 2'),
	(3, 'store 3');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
