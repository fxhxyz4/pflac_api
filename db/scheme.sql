
-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: datadb
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- TRIGGER FOR table_physical --
CREATE TRIGGER `update_physical` AFTER UPDATE ON `table_physical`
 FOR EACH ROW BEGIN
    UPDATE last_change SET date = CURDATE();
END

-- TRIGGER FOR table_scoring --
CREATE TRIGGER `update_scoring` AFTER UPDATE ON `table_scoring`
 FOR EACH ROW BEGIN
    UPDATE last_change SET date = CURDATE();
END

-- TRIGGER FOR table_standarts --
CREATE TRIGGER `update_standarts` AFTER UPDATE ON `table_standarts`
 FOR EACH ROW BEGIN
    UPDATE last_change SET date = CURDATE();
END

--
-- Table structure for table `last_change`
--

DROP TABLE IF EXISTS `last_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `last_change` (
  date DATE NOT NULL DEFAULT '2025-01-01'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `last_date`
--

LOCK TABLES `last_change` WRITE;
/*!40000 ALTER TABLE `last_change` DISABLE KEYS */;
INSERT INTO `last_change` VALUES ('2025-01-01');
/*!40000 ALTER TABLE `last_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_physical`
--

DROP TABLE IF EXISTS `table_physical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `table_physical` (
  `id` int NOT NULL AUTO_INCREMENT,
  `age_group` int NOT NULL DEFAULT 40,
  `gender` varchar(50) NOT NULL DEFAULT 'man',
  `exercise_number` int DEFAULT NULL,
  `exercise_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_physical`
--

LOCK TABLES `table_physical` WRITE;
/*!40000 ALTER TABLE `table_physical` DISABLE KEYS */;
INSERT INTO `table_physical` VALUES (1,40,'man',14,'Підтягування на перекладині'),(2,40,'man',25,'Біг на 100 м'),(3,40,'man',3,'Біг на 3 км'),(4,44,'man',14,'Підтягування на перекладині'),(5,44,'man',21,'Згинання та розгинання тулуба'),(6,44,'man',2,'Біг на 2 км'),(7,49,'man',14,'Підтягування на перекладині(згинання та розгинання рук в упорі лежачи)'),(8,49,'man',21,'Згинання та розгинання тулуба'),(9,49,'man',2,'Біг на 2 км'),(10,50,'man',14,'Підтягування на перекладині(згинання та розгинання рук в упорі лежачи)'),(11,50,'man',21,'Згинання та розгинання тулуба'),(12,50,'man',1,'Біг на 1 км'),(13,30,'woman',20,'Згинання та розгинання рук в упорі лежачи'),(14,30,'woman',21,'Згинання та розгинання тулуба'),(15,30,'woman',3,'Біг на 3 км'),(16,39,'woman',20,'Згинання та розгинання рук в упорі лежачи'),(17,39,'woman',21,'Згинання та розгинання тулуба'),(18,39,'woman',2,'Біг на 2 км'),(19,40,'woman',20,'Згинання та розгинання рук в упорі лежачи'),(20,40,'woman',21,'Згинання та розгинання тулуба'),(21,40,'woman',1,'Біг на 1 км');
/*!40000 ALTER TABLE `table_physical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_scoring`
--

DROP TABLE IF EXISTS `table_scoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

-- default float = 0.1 --
CREATE TABLE IF NOT EXISTS `table_scoring` (
  `score_count` int NOT NULL AUTO_INCREMENT,
  `exercise_man_25` float NOT NULL DEFAULT 0.1,
  `exercise_man_14` float NOT NULL DEFAULT 0.1,
  `exercise_man_20` float NOT NULL DEFAULT 0.1,
  `exercise_man_21` float NOT NULL DEFAULT 0.1,
  `exercise_man_1` float NOT NULL DEFAULT 0.1,
  `exercise_man_2` float NOT NULL DEFAULT 0.1,
  `exercise_man_3` float NOT NULL DEFAULT 0.1,
  `exercise_woman_20` float NOT NULL DEFAULT 0.1,
  `exercise_woman_21` float NOT NULL DEFAULT 0.1,
  `exercise_woman_1` float NOT NULL DEFAULT 0.1,
  `exercise_woman_2` float NOT NULL DEFAULT 0.1,
  `exercise_woman_3` float NOT NULL DEFAULT 0.1,
  PRIMARY KEY (`score_count`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_scoring`
--

LOCK TABLES `table_scoring` WRITE;
/*!40000 ALTER TABLE `table_scoring` DISABLE KEYS */;
INSERT INTO `table_scoring` VALUES (1,18.75,0,1,0,7.27,13.16,22.48,0,0,8.27,14.16,28.24),(2,18.7,0,2,1,7.24,13.12,22.36,0,1,8.24,14.12,28.18),(3,18.65,0,3,0,7.21,13.08,22.24,1,0,8.21,14.08,28.12),(4,18.6,0,4,2,7.18,13.04,22.12,0,2,8.18,14.04,28.06),(5,18.55,0,5,0,7.15,13,22,0,0,8.15,14,28),(6,18.5,0,6,3,7.12,12.56,21.48,2,3,8.12,13.56,27.48),(7,18.45,0,7,0,7.09,12.52,21.36,0,0,8.09,13.52,27.36),(8,18.4,0,8,4,7.06,12.48,21.24,0,4,8.06,13.48,27.24),(9,18.35,0,9,0,7.03,12.44,21.12,3,0,8.03,13.44,27.12),(10,18.3,0,10,5,7,12.4,21,0,5,8,13.4,27),(11,18.25,0,11,0,5.57,12.36,20.48,0,0,7.57,13.36,26.48),(12,18.2,0,12,6,6.54,12.32,20.36,4,6,7.54,13.32,26.36),(13,18.15,0,13,0,6.51,12.28,20.24,0,0,7.51,13.28,26.24),(14,18.1,0,14,7,6.48,12.24,20.12,0,7,7.48,13.24,26.12),(15,18.05,1,15,0,6.45,12.2,20,5,0,7.45,13.2,26),(16,18,0,16,8,6.42,12.16,19.52,0,8,7.42,13.16,25.48),(17,17.95,0,17,0,6.39,12.12,19.44,0,0,7.39,13.12,25.36),(18,17.9,0,18,9,6.36,12.08,19.36,6,9,7.36,13.08,25.24),(19,17.85,0,19,0,6.33,12.04,19.28,0,0,7.33,13.04,25.12),(20,17.8,0,20,10,6.3,12,19.2,0,10,7.3,13,25),(21,17.75,0,0,0,6.27,11.56,19.12,7,0,7.27,12.56,24.48),(22,17.7,0,21,11,6.24,11.52,19.04,0,11,7.24,12.52,24.36),(23,17.65,0,0,0,6.21,11.48,18.56,0,0,7.21,12.48,24.24),(24,17.6,0,22,12,6.18,11.44,18.48,8,12,7.18,12.44,24.12),(25,17.55,2,0,0,6.15,11.4,18.4,0,0,7.15,12.4,24),(26,17.5,0,23,13,6.12,11.36,18.32,0,13,7.12,12.36,23.52),(27,17.45,0,0,0,6.09,11.32,18.24,9,0,7.09,12.32,23.44),(28,17.4,0,24,14,6.06,11.28,18.16,0,14,7.06,12.28,23.36),(29,17.35,0,0,0,6.03,11.24,18.08,0,0,7.03,12.24,23.28),(30,17.3,3,25,15,6,11.2,18,10,15,7,12.2,23.2),(31,17.25,0,0,0,5.57,11.16,17.52,0,0,6.57,12.16,23.12),(32,17.2,0,26,16,5.54,11.12,17.48,0,16,6.54,12.12,23.04),(33,17.15,0,0,0,5.51,11.08,17.42,11,0,6.51,12.08,22.56),(34,17.1,0,27,17,5.48,11.04,17.36,0,17,6.48,12.04,22.48),(35,17.05,4,0,0,5.45,11,17.3,0,0,6.45,12,22.4),(36,17,0,28,18,5.42,10.56,17.24,12,18,6.42,11.56,22.32),(37,16.95,0,0,0,5.39,10.52,17.18,0,0,6.39,11.52,22.24),(38,16.9,0,29,19,5.36,10.48,17.12,0,19,6.36,11.48,22.16),(39,16.85,0,0,0,5.33,10.44,17.06,13,0,6.33,11.44,22.08),(40,16.8,5,30,20,5.3,10.4,17,0,20,6.3,11.4,22),(41,16.75,0,0,0,5.27,10.36,16.52,0,0,6.27,11.36,21.52),(42,16.7,0,31,21,5.24,10.32,16.48,14,21,6.24,11.32,21.44),(43,16.65,0,0,0,5.21,10.28,16.42,0,0,6.21,11.28,21.36),(44,16.6,0,32,22,5.18,10.24,16.36,0,22,6.18,11.24,21.28),(45,16.55,6,0,0,5.15,10.2,16.3,15,0,6.15,11.2,21.2),(46,16.5,0,33,23,5.12,10.16,16.24,0,23,6.12,11.16,21.12),(47,16.45,0,0,0,5.09,10.12,16.18,0,0,6.09,11.12,21.04),(48,16.4,0,34,24,5.06,10.08,16.12,16,24,6.06,11.08,20.56),(49,16.35,0,0,0,5.03,10.04,16.06,0,0,6.03,11.04,20.48),(50,16.3,7,35,25,5,10,16,0,25,6,11,20.4),(51,16.25,0,0,0,4.58,9.57,15.52,17,0,5.58,10.57,20.32),(52,16.2,0,36,26,4.56,9.54,15.48,0,26,5.56,10.54,20.24),(53,16.15,0,0,0,4.54,9.51,15.42,0,0,5.54,10.51,20.16),(54,16.1,0,37,27,4.52,9.48,15.36,18,27,5.52,10.48,20.08),(55,16.05,8,0,0,4.5,9.45,15.3,0,0,5.5,10.45,20),(56,16,0,38,28,4.48,9.42,15.24,0,28,5.48,10.42,19.54),(57,15.95,0,0,0,4.46,9.39,15.18,19,0,5.46,10.39,19.48),(58,15.9,0,39,29,4.44,9.36,15.12,0,29,5.44,10.36,19.42),(59,15.85,0,0,0,4.42,9.33,15.06,0,0,5.42,10.33,19.36),(60,15.8,9,40,30,4.4,9.3,15,20,30,5.4,10.3,19.3),(61,15.75,0,0,0,4.38,9.27,14.54,0,0,5.38,10.27,19.24),(62,15.7,0,41,31,4.36,9.24,14.48,0,31,5.36,10.24,19.18),(63,15.65,0,0,0,4.34,9.21,14.42,21,0,5.34,10.21,19.12),(64,15.6,0,42,32,4.32,9.18,14.36,0,32,5.32,10.18,19.06),(65,15.55,10,0,0,4.3,9.15,14.3,0,0,5.3,10.15,19),(66,15.5,0,43,33,4.28,9.12,14.24,22,33,5.28,10.12,18.54),(67,15.45,0,0,0,4.26,9.09,14.18,0,0,5.26,10.09,18.48),(68,15.4,0,44,34,4.24,9.06,14.12,0,34,5.24,10.06,18.42),(69,15.35,0,0,0,4.22,9.03,14.06,23,0,5.22,10.03,18.36),(70,15.3,11,45,35,4.2,9,14,0,35,5.2,10,18.3),(71,15.25,0,0,0,4.18,8.57,13.56,0,0,5.18,9.57,18.24),(72,15.2,0,46,36,4.16,8.54,13.52,24,36,5.16,9.54,18.18),(73,15.15,0,0,0,4.14,8.51,13.48,0,0,5.14,9.51,18.12),(74,15.1,0,47,37,4.12,8.48,13.44,0,37,5.12,9.48,18.06),(75,15.05,12,0,0,4.1,8.45,13.4,25,0,5.1,9.45,18),(76,15,0,48,38,4.08,8.42,13.36,0,38,5.08,9.42,17.54),(77,14.95,0,0,0,4.06,8.39,13.32,0,0,5.06,9.39,17.48),(78,14.9,0,49,39,4.04,8.36,13.28,26,39,5.04,9.36,17.42),(79,14.85,0,0,0,4.02,8.33,13.24,0,0,5.02,9.33,17.36),(80,14.8,13,50,40,4,8.3,13.2,0,40,5,9.3,17.3),(81,14.75,0,0,0,3.58,8.27,13.16,27,0,4.58,9.27,17.24),(82,14.7,0,51,41,3.56,8.24,13.12,0,41,4.56,9.24,17.18),(83,14.65,0,0,0,3.54,8.21,13.08,0,0,4.54,9.21,17.12),(84,14.6,0,52,42,3.52,8.18,13.04,28,42,4.52,9.18,17.06),(85,14.55,14,0,0,3.5,8.15,13,0,0,4.5,9.15,17),(86,14.5,0,53,43,3.48,8.12,12.56,0,43,4.48,9.12,16.56),(87,14.45,0,0,0,3.46,8.09,12.52,29,0,4.46,8.09,16.52),(88,14.4,0,54,44,3.44,8.06,12.48,0,44,4.44,9.06,16.48),(89,14.35,0,0,0,3.42,8.03,12.44,0,0,4.42,9.03,16.44),(90,14.3,15,55,45,3.4,8,12.4,30,45,4.4,9,16.4),(91,14.25,0,0,0,3.38,7.57,12.36,0,0,4.38,8.57,16.36),(92,14.2,0,56,46,3.36,7.54,12.32,0,46,4.36,8.54,16.32),(93,14.15,0,0,0,3.34,7.51,12.28,0,0,4.34,8.51,16.28),(94,14.1,0,57,47,3.32,7.48,12.24,0,47,4.32,8.48,16.24),(95,14.05,16,0,0,3.3,7.45,12.2,31,0,4.3,8.45,16.2),(96,14,0,58,48,3.28,7.42,12.16,0,48,4.28,8.42,16.16),(97,13.95,0,0,0,3.26,7.39,12.12,0,0,4.26,8.39,16.12),(98,13.9,0,59,49,3.24,7.36,12.08,0,49,4.24,8.36,16.08),(99,13.85,0,0,0,3.22,7.33,12.04,0,0,4.22,8.33,16.04),(100,13.8,17,60,50,3.2,7.3,12,32,50,4.2,8.3,16);
/*!40000 ALTER TABLE `table_scoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_standarts`
--

DROP TABLE IF EXISTS `table_standarts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `table_standarts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` int DEFAULT NULL,
  `age_group` int NOT NULL DEFAULT 25,
  `score` int DEFAULT NULL,
  `rating_5` varchar(50) DEFAULT NULL,
  `rating_4` varchar(50) DEFAULT NULL,
  `rating_3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `category_check` CHECK (((`category` > 0) and (`category` <= 3)))
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_standarts`
--

LOCK TABLES `table_standarts` WRITE;
/*!40000 ALTER TABLE `table_standarts` DISABLE KEYS */;
INSERT INTO `table_standarts` VALUES (1,1,25,85,'295/390','275/360','255/340'),(2,2,25,80,'280/370','260/340','240/320'),(3,3,25,80,'280/370','260/340','240/320'),(4,1,30,85,'295/390','275/360','255/340'),(5,2,30,75,'265/350','245/320','225/300'),(6,3,30,75,'265/350','245/320','225/300'),(7,1,35,80,'280/370','260/340','240/320'),(8,2,35,70,'250/330','230/300','210/280'),(9,3,35,70,'250/330','230/300','210/280'),(10,1,40,80,'280/370','260/340','240/320'),(11,2,40,65,'235/310','215/280','195/260'),(12,3,40,60,'220/290','200/260','180/240'),(13,1,45,65,'235/310','215/280','195/260'),(14,2,45,55,'205/270','185/240','165/220'),(15,3,45,45,'175/230','155/200','135/180'),(16,1,50,55,'205','185','165'),(17,2,50,45,'175','155','135'),(18,3,50,35,'145','125','105'),(19,1,55,45,'175','155','135'),(20,2,55,35,'145','125','105'),(21,3,55,25,'115','95','75'),(22,1,60,35,'145','125','105'),(23,2,60,25,'115','105','75'),(24,3,60,15,'85','65','45'),(25,1,70,25,'115','95','75'),(26,2,70,15,'85','65','45'),(27,3,70,5,'55','35','15');
/*!40000 ALTER TABLE `table_standarts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-29 18:06:54