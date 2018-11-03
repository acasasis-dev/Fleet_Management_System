-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: fleet3
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.17.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `arrival_inspection_record`
--

DROP TABLE IF EXISTS `arrival_inspection_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arrival_inspection_record` (
  `arrival_inspection_id` int(11) NOT NULL AUTO_INCREMENT,
  `sched_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `inspection_time` timestamp NULL DEFAULT NULL,
  `u_parts_inspection_id` int(11) DEFAULT NULL,
  `u_ef_inspection_id` int(11) DEFAULT NULL,
  `u_inspection_comment` varchar(200) DEFAULT NULL,
  `u_inspection_status` int(11) DEFAULT NULL,
  `for_date` date NOT NULL,
  PRIMARY KEY (`arrival_inspection_id`),
  KEY `sched_id` (`sched_id`),
  KEY `staff_id` (`staff_id`),
  KEY `u_parts_inspection_id` (`u_parts_inspection_id`),
  KEY `u_ef_inspection_id` (`u_ef_inspection_id`),
  CONSTRAINT `arrival_inspection_record_ibfk_1` FOREIGN KEY (`sched_id`) REFERENCES `schedule` (`sched_id`),
  CONSTRAINT `arrival_inspection_record_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`),
  CONSTRAINT `arrival_inspection_record_ibfk_3` FOREIGN KEY (`u_parts_inspection_id`) REFERENCES `unit_body_inspection` (`u_parts_inspection_id`),
  CONSTRAINT `arrival_inspection_record_ibfk_4` FOREIGN KEY (`u_ef_inspection_id`) REFERENCES `unit_engine/fluid_inspection` (`u_ef_inspection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arrival_inspection_record`
--

LOCK TABLES `arrival_inspection_record` WRITE;
/*!40000 ALTER TABLE `arrival_inspection_record` DISABLE KEYS */;
INSERT INTO `arrival_inspection_record` VALUES (1,110,5,'2018-08-31 15:12:55',43,43,'FAILED!!!',0,'2018-08-31'),(2,111,NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-31'),(4,112,NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-31'),(5,137,2,'2018-09-22 10:09:35',46,46,'',1,'2018-09-22'),(6,141,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-22'),(7,139,2,'2018-09-22 10:30:06',50,50,'collided',0,'2018-09-22'),(8,142,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-22'),(9,143,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-22'),(10,155,2,'2018-10-05 11:10:56',53,53,'bagsak',0,'2018-10-05'),(11,159,2,'2018-10-05 11:40:55',55,55,'FAILED',0,'2018-10-05'),(12,161,2,'2018-10-05 13:59:07',60,60,'PASSED',1,'2018-10-05'),(13,157,2,'2018-10-06 09:43:36',66,66,'',0,'2018-10-06'),(14,155,2,'2018-10-06 09:40:48',64,64,'',0,'2018-10-06'),(15,156,2,'2018-10-06 09:41:29',65,65,'',0,'2018-10-06'),(16,155,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-08'),(17,155,2,'2018-10-09 18:02:52',69,69,'fail',0,'2018-10-10'),(18,156,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-10'),(19,159,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-10'),(20,160,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-10'),(21,155,2,'2018-10-10 17:11:53',75,75,'fail',0,'2018-10-11');
/*!40000 ALTER TABLE `arrival_inspection_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arrival_record`
--

DROP TABLE IF EXISTS `arrival_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arrival_record` (
  `arrival_id` int(11) NOT NULL AUTO_INCREMENT,
  `sched_id` int(11) NOT NULL,
  `time_arrived` timestamp NULL DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `for_date` date NOT NULL,
  PRIMARY KEY (`arrival_id`),
  KEY `sched_id` (`sched_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `arrival_record_ibfk_1` FOREIGN KEY (`sched_id`) REFERENCES `schedule` (`sched_id`),
  CONSTRAINT `arrival_record_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arrival_record`
--

LOCK TABLES `arrival_record` WRITE;
/*!40000 ALTER TABLE `arrival_record` DISABLE KEYS */;
INSERT INTO `arrival_record` VALUES (1,110,'2018-08-31 11:33:14',3,'2018-08-31'),(2,111,'2018-08-31 11:37:18',3,'2018-08-31'),(3,112,'2018-08-31 15:04:13',3,'2018-08-31'),(4,137,'2018-09-22 10:04:03',3,'2018-09-22'),(5,141,'2018-09-22 10:10:51',3,'2018-09-22'),(6,139,'2018-09-22 10:27:31',3,'2018-09-22'),(7,142,'2018-09-22 10:49:45',3,'2018-09-22'),(8,143,'2018-09-22 10:56:01',3,'2018-09-22'),(9,155,'2018-10-05 10:31:34',3,'2018-10-05'),(10,159,'2018-10-05 11:40:17',3,'2018-10-05'),(11,161,'2018-10-05 13:58:33',3,'2018-10-05'),(12,157,'2018-10-05 21:10:44',3,'2018-10-06'),(13,155,'2018-10-06 09:37:44',3,'2018-10-06'),(14,156,'2018-10-06 09:37:59',3,'2018-10-06'),(15,155,'2018-10-07 18:12:46',3,'2018-10-08'),(16,155,'2018-10-09 17:47:56',3,'2018-10-10'),(17,156,'2018-10-09 20:29:05',3,'2018-10-10'),(18,159,'2018-10-09 20:35:58',3,'2018-10-10'),(19,160,'2018-10-09 20:40:02',3,'2018-10-10'),(20,155,'2018-10-10 17:11:33',3,'2018-10-11');
/*!40000 ALTER TABLE `arrival_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_supply`
--

DROP TABLE IF EXISTS `auto_supply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_supply` (
  `asupply_id` int(11) NOT NULL AUTO_INCREMENT,
  `ascategory_id` int(11) NOT NULL,
  `asupply_desc` varchar(20) NOT NULL,
  `asupply_quantity` int(11) NOT NULL,
  PRIMARY KEY (`asupply_id`),
  UNIQUE KEY `asupply_desc` (`asupply_desc`),
  KEY `ascategory_id` (`ascategory_id`),
  CONSTRAINT `auto_supply_ibfk_1` FOREIGN KEY (`ascategory_id`) REFERENCES `auto_supply_category` (`ascategory_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_supply`
--

LOCK TABLES `auto_supply` WRITE;
/*!40000 ALTER TABLE `auto_supply` DISABLE KEYS */;
INSERT INTO `auto_supply` VALUES (1,2,'GTX 1070i',2),(2,2,'DDR4 RAM',4),(5,3,'lights',0),(6,2,'Gecko',1),(7,2,'DDR3 RAM',0);
/*!40000 ALTER TABLE `auto_supply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_supply_category`
--

DROP TABLE IF EXISTS `auto_supply_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_supply_category` (
  `ascategory_id` int(11) NOT NULL AUTO_INCREMENT,
  `ascategory_desc` varchar(100) NOT NULL,
  PRIMARY KEY (`ascategory_id`),
  UNIQUE KEY `ascategory_desc` (`ascategory_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_supply_category`
--

LOCK TABLES `auto_supply_category` WRITE;
/*!40000 ALTER TABLE `auto_supply_category` DISABLE KEYS */;
INSERT INTO `auto_supply_category` VALUES (2,'Engines'),(3,'Fuel System Part'),(1,'Mami'),(4,'Spark Plug Ignition System Part'),(5,'Transmission Part'),(6,'Valve Mechanism Part');
/*!40000 ALTER TABLE `auto_supply_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boundary_record`
--

DROP TABLE IF EXISTS `boundary_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boundary_record` (
  `brecord_id` int(11) NOT NULL AUTO_INCREMENT,
  `sched_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `for_date` date NOT NULL,
  PRIMARY KEY (`brecord_id`),
  KEY `sched_id` (`sched_id`),
  CONSTRAINT `boundary_record_ibfk_1` FOREIGN KEY (`sched_id`) REFERENCES `schedule` (`sched_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boundary_record`
--

LOCK TABLES `boundary_record` WRITE;
/*!40000 ALTER TABLE `boundary_record` DISABLE KEYS */;
INSERT INTO `boundary_record` VALUES (16,198,1000.00,'2018-10-09'),(17,197,1000.00,'2018-10-09'),(18,194,1000.00,'2018-10-09'),(19,196,500.00,'2018-10-09'),(20,155,1000.00,'2018-10-10'),(21,156,1190.00,'2018-10-10'),(22,159,1368.00,'2018-10-10'),(23,160,300.00,'2018-10-10'),(24,155,473.00,'2018-10-11');
/*!40000 ALTER TABLE `boundary_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boundary_remittance`
--

DROP TABLE IF EXISTS `boundary_remittance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boundary_remittance` (
  `bremittance_id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `date_received` datetime DEFAULT NULL,
  `confirmed` int(1) NOT NULL,
  PRIMARY KEY (`bremittance_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `boundary_remittance_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boundary_remittance`
--

LOCK TABLES `boundary_remittance` WRITE;
/*!40000 ALTER TABLE `boundary_remittance` DISABLE KEYS */;
INSERT INTO `boundary_remittance` VALUES (9,470.00,4,'2018-10-10 03:53:20',1);
/*!40000 ALTER TABLE `boundary_remittance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_desc` varchar(100) NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Toyota'),(4,'Isuzu'),(5,'Lamborghini'),(6,'McLaren'),(7,'Honda'),(8,'Lexus'),(10,'Camel');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand_unit_type`
--

DROP TABLE IF EXISTS `brand_unit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand_unit_type` (
  `butype_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL,
  `unittype_id` int(11) NOT NULL,
  PRIMARY KEY (`butype_id`),
  KEY `brand_id` (`brand_id`),
  KEY `unittype_id` (`unittype_id`),
  CONSTRAINT `brand_unit_type_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`),
  CONSTRAINT `brand_unit_type_ibfk_2` FOREIGN KEY (`unittype_id`) REFERENCES `unit_type` (`unittype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_unit_type`
--

LOCK TABLES `brand_unit_type` WRITE;
/*!40000 ALTER TABLE `brand_unit_type` DISABLE KEYS */;
INSERT INTO `brand_unit_type` VALUES (1,1,1),(2,1,3),(3,4,2),(4,4,4),(5,5,1),(6,5,2),(7,5,3),(8,5,4),(9,6,1),(10,6,3),(11,7,2),(12,7,4),(13,8,1),(14,8,2),(15,8,3),(16,8,4),(18,10,1),(19,10,2),(20,10,3),(21,10,4),(22,10,5);
/*!40000 ALTER TABLE `brand_unit_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code_lift`
--

DROP TABLE IF EXISTS `code_lift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code_lift` (
  `clift_id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) NOT NULL,
  `for_date` date NOT NULL,
  PRIMARY KEY (`clift_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `code_lift_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code_lift`
--

LOCK TABLES `code_lift` WRITE;
/*!40000 ALTER TABLE `code_lift` DISABLE KEYS */;
INSERT INTO `code_lift` VALUES (1,1,'2018-10-08'),(2,4,'2018-10-08'),(3,3,'2018-10-08'),(4,1,'2018-10-15'),(5,1,'2018-10-22');
/*!40000 ALTER TABLE `code_lift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispatch_inspection_record`
--

DROP TABLE IF EXISTS `dispatch_inspection_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dispatch_inspection_record` (
  `dispatch_inspection_id` int(11) NOT NULL AUTO_INCREMENT,
  `sched_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `inspection_time` timestamp NULL DEFAULT NULL,
  `u_parts_inspection_id` int(11) DEFAULT NULL,
  `u_ef_inspection_id` int(11) DEFAULT NULL,
  `u_inspection_comment` varchar(200) DEFAULT NULL,
  `u_inspection_status` int(1) DEFAULT NULL,
  `for_date` date NOT NULL,
  PRIMARY KEY (`dispatch_inspection_id`),
  KEY `u_ef_inspection_id` (`u_ef_inspection_id`),
  KEY `u_parts_inspection_id` (`u_parts_inspection_id`),
  KEY `sched_id` (`sched_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `dispatch_inspection_record_ibfk_1` FOREIGN KEY (`u_ef_inspection_id`) REFERENCES `unit_engine/fluid_inspection` (`u_ef_inspection_id`) ON UPDATE CASCADE,
  CONSTRAINT `dispatch_inspection_record_ibfk_2` FOREIGN KEY (`u_parts_inspection_id`) REFERENCES `unit_body_inspection` (`u_parts_inspection_id`) ON UPDATE CASCADE,
  CONSTRAINT `dispatch_inspection_record_ibfk_3` FOREIGN KEY (`sched_id`) REFERENCES `schedule` (`sched_id`) ON UPDATE CASCADE,
  CONSTRAINT `dispatch_inspection_record_ibfk_4` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispatch_inspection_record`
--

LOCK TABLES `dispatch_inspection_record` WRITE;
/*!40000 ALTER TABLE `dispatch_inspection_record` DISABLE KEYS */;
INSERT INTO `dispatch_inspection_record` VALUES (10,109,2,'2018-08-31 10:23:13',39,39,'FULLY FAILED',1,'2018-08-31'),(11,110,5,'2018-08-31 11:32:52',40,40,'FULLY PASSED',1,'2018-08-31'),(12,111,5,'2018-08-31 11:36:54',41,41,'PASSED',1,'2018-08-31'),(13,112,5,'2018-08-31 12:26:17',42,42,'PASSED',1,'2018-08-31'),(14,113,NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-31'),(15,114,NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-31'),(16,115,NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-31'),(17,116,NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-31'),(18,117,NULL,NULL,NULL,NULL,NULL,NULL,'2018-08-31'),(19,136,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-22'),(20,137,2,'2018-09-22 09:58:21',44,44,'okay',1,'2018-09-22'),(21,138,2,'2018-09-22 10:00:15',45,45,'',0,'2018-09-22'),(22,139,2,'2018-09-22 10:25:57',49,49,'PASSED',1,'2018-09-22'),(23,140,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-22'),(24,141,2,'2018-09-22 10:10:17',47,47,'',1,'2018-09-22'),(25,142,2,'2018-09-22 10:11:50',48,48,'',1,'2018-09-22'),(26,143,2,'2018-09-22 10:51:23',51,51,'okay',1,'2018-09-22'),(27,144,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-22'),(28,136,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-23'),(29,137,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-23'),(30,138,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-23'),(31,139,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-23'),(32,140,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-23'),(33,141,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-23'),(34,142,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-23'),(35,143,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-23'),(36,144,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-23'),(37,136,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-24'),(38,140,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-24'),(39,141,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-24'),(40,142,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-24'),(41,136,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-25'),(42,137,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-25'),(43,138,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-25'),(44,139,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-25'),(45,140,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-25'),(46,141,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-25'),(47,142,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-25'),(48,143,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-25'),(49,144,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-25'),(50,137,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-26'),(51,138,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-26'),(52,139,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-26'),(53,141,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-26'),(54,142,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-26'),(55,143,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-26'),(56,144,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-26'),(57,136,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-27'),(58,137,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-27'),(59,138,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-27'),(60,139,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-27'),(61,140,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-27'),(62,143,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-27'),(63,144,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-27'),(64,145,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-28'),(65,146,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-28'),(66,147,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-28'),(67,148,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-28'),(68,149,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-28'),(69,150,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-28'),(70,151,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-28'),(71,152,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-28'),(72,153,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-28'),(73,145,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-29'),(74,146,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-29'),(75,147,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-29'),(76,148,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-29'),(77,149,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-29'),(78,150,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-29'),(79,151,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-29'),(80,152,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-29'),(81,153,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-29'),(82,145,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-30'),(83,146,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-30'),(84,147,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-30'),(85,148,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-30'),(86,149,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-30'),(87,150,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-30'),(88,151,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-30'),(89,152,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-30'),(90,153,NULL,NULL,NULL,NULL,NULL,NULL,'2018-09-30'),(91,146,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-03'),(92,147,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-03'),(93,148,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-03'),(94,150,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-03'),(95,151,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-03'),(96,152,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-03'),(97,153,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-03'),(98,145,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-04'),(99,146,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-04'),(100,147,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-04'),(101,148,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-04'),(102,149,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-04'),(103,152,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-04'),(104,153,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-04'),(105,155,2,'2018-10-05 10:31:04',52,52,'PASADO',1,'2018-10-05'),(106,156,2,'2018-10-05 12:47:37',56,56,'FAILED',0,'2018-10-05'),(107,159,2,'2018-10-05 11:39:17',54,54,'PASADO',1,'2018-10-05'),(108,160,2,'2018-10-05 12:53:08',57,57,'another fail',0,'2018-10-05'),(109,157,2,'2018-10-05 13:03:41',58,58,'fail',0,'2018-10-05'),(110,161,2,'2018-10-05 13:58:13',59,59,'PASSED',1,'2018-10-05'),(111,154,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-05'),(112,158,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-05'),(113,162,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-05'),(114,154,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-08'),(115,158,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-08'),(116,159,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-08'),(117,160,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-08'),(118,155,2,'2018-10-07 18:12:26',67,67,'',1,'2018-10-08'),(119,156,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-08'),(120,157,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-08'),(121,161,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-08'),(122,162,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-08'),(123,154,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-06'),(124,155,2,'2018-10-06 09:19:47',62,62,'PASADO',1,'2018-10-06'),(125,156,2,'2018-10-06 09:22:01',63,63,'',1,'2018-10-06'),(126,157,2,'2018-10-05 21:10:28',61,61,'PASSED',1,'2018-10-06'),(127,158,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-06'),(128,159,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-06'),(129,160,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-06'),(130,161,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-06'),(131,162,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-06'),(132,155,2,'2018-10-09 17:47:29',68,68,'passed',1,'2018-10-10'),(133,156,2,'2018-10-09 20:28:50',70,70,'pasado',1,'2018-10-10'),(134,157,2,'2018-10-09 20:39:44',73,73,'',1,'2018-10-10'),(135,159,2,'2018-10-09 20:35:37',71,71,'pasado',1,'2018-10-10'),(136,160,2,'2018-10-09 20:39:36',72,72,'',1,'2018-10-10'),(137,161,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-10'),(138,162,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-10'),(139,154,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-11'),(140,155,2,'2018-10-10 17:11:16',74,74,'pass',1,'2018-10-11'),(141,156,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-11'),(142,157,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-11'),(143,158,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-11'),(144,161,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-11'),(145,162,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-11');
/*!40000 ALTER TABLE `dispatch_inspection_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispatching_record`
--

DROP TABLE IF EXISTS `dispatching_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dispatching_record` (
  `dispatching_id` int(11) NOT NULL AUTO_INCREMENT,
  `sched_id` int(11) NOT NULL,
  `time_dispatched` timestamp NULL DEFAULT NULL,
  `staff_id` int(11) NOT NULL,
  `for_date` date NOT NULL,
  PRIMARY KEY (`dispatching_id`),
  KEY `sched_id` (`sched_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `dispatching_record_ibfk_1` FOREIGN KEY (`sched_id`) REFERENCES `schedule` (`sched_id`) ON UPDATE CASCADE,
  CONSTRAINT `dispatching_record_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispatching_record`
--

LOCK TABLES `dispatching_record` WRITE;
/*!40000 ALTER TABLE `dispatching_record` DISABLE KEYS */;
INSERT INTO `dispatching_record` VALUES (1,110,'2018-08-31 11:33:09',3,'2018-08-31'),(2,111,'2018-08-31 11:37:16',3,'2018-08-31'),(3,112,'2018-08-31 12:26:31',3,'2018-08-31'),(4,137,'2018-09-22 10:02:49',3,'2018-09-22'),(5,141,'2018-09-22 10:10:39',3,'2018-09-22'),(6,139,'2018-09-22 10:26:56',3,'2018-09-22'),(7,142,'2018-09-22 10:48:18',3,'2018-09-22'),(8,143,'2018-09-22 10:53:34',3,'2018-09-22'),(9,155,'2018-10-05 10:31:25',3,'2018-10-05'),(10,159,'2018-10-05 11:40:09',3,'2018-10-05'),(11,161,'2018-10-05 13:58:26',3,'2018-10-05'),(12,157,'2018-10-05 21:10:40',3,'2018-10-06'),(13,155,'2018-10-06 09:36:17',3,'2018-10-06'),(14,156,'2018-10-06 09:37:54',3,'2018-10-06'),(15,155,'2018-10-07 18:12:42',3,'2018-10-08'),(16,155,'2018-10-09 17:47:49',3,'2018-10-10'),(17,156,'2018-10-09 20:29:00',3,'2018-10-10'),(18,159,'2018-10-09 20:35:50',3,'2018-10-10'),(19,160,'2018-10-09 20:39:57',3,'2018-10-10'),(20,155,'2018-10-10 17:11:27',3,'2018-10-11');
/*!40000 ALTER TABLE `dispatching_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver_type`
--

DROP TABLE IF EXISTS `driver_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driver_type` (
  `driver_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_type_desc` varchar(10) NOT NULL,
  PRIMARY KEY (`driver_type_id`),
  UNIQUE KEY `driver_type_desc` (`driver_type_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_type`
--

LOCK TABLES `driver_type` WRITE;
/*!40000 ALTER TABLE `driver_type` DISABLE KEYS */;
INSERT INTO `driver_type` VALUES (1,'Regular'),(2,'Reliever');
/*!40000 ALTER TABLE `driver_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drivers` (
  `driver_id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_fn` varchar(20) NOT NULL,
  `driver_mn` varchar(15) NOT NULL,
  `driver_ln` varchar(15) NOT NULL,
  `driver_type_id` int(11) DEFAULT NULL,
  `driver_pic` varchar(50) DEFAULT NULL,
  `driver_sex` varchar(7) NOT NULL,
  `driver_bday` date NOT NULL,
  `driver_address` varchar(50) NOT NULL,
  `driver_contact` varchar(11) NOT NULL,
  `driver_license` varchar(7) NOT NULL,
  `driver_licreg` date NOT NULL,
  `driver_licexp` date NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`driver_id`,`driver_fn`,`driver_mn`,`driver_ln`),
  UNIQUE KEY `driver_license` (`driver_license`),
  KEY `driver_type_id` (`driver_type_id`),
  KEY `unit_id` (`unit_id`),
  CONSTRAINT `drivers_ibfk_1` FOREIGN KEY (`driver_type_id`) REFERENCES `driver_type` (`driver_type_id`) ON UPDATE CASCADE,
  CONSTRAINT `drivers_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`unit_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (5,'Chloe Grace','','Carreoniverse',1,'','Male','2018-08-13','asdasdas','0909090909','123141','2018-08-12','2023-08-12',9),(6,'asd','a','aasd',1,'','Male','2018-08-30','asdasd','','5435362','2018-08-05','2023-08-05',6),(7,'John','None','Doe',1,'','Male','2018-08-17','Nowhere','09123456789','232323','2018-08-17','2023-08-17',6),(8,'Jane','None','Doe',1,'','Male','2018-08-17','Nowhere','09987654321','676767','2018-08-17','2023-08-17',8),(9,'Juan','Lastimosa','Dela Cruz',1,'','Male','2018-08-17','none','09123456789','656565','2018-08-17','2023-08-17',9),(10,'Pedro','Pontillas','Penduko',1,'','Male','2018-08-17','Manila, Philippines','09123456789','989898','2018-08-17','2023-08-17',7),(11,'Dummy','None','Account',1,'','Male','2018-08-17','nowhere','09123456789','363636','2018-08-17','2023-08-17',7),(12,'Hello','None','World',1,'','Male','2018-08-23','None','09123456789','898089','2018-08-23','2023-08-23',8),(13,'Wade','Walter','Washington',1,'','Male','2018-08-01','Nowhere','09090909','909090','2018-08-30','2023-08-30',10),(14,'Dummy','None','Reliever',2,'','Male','2018-08-31','Nowhere','09123456789','686868','2018-08-31','2023-08-31',NULL),(15,'John','None','Snow',2,'NULL','Male','1995-10-14','The Wall','09109090900','690806','2018-10-07','2023-10-07',NULL);
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `for_repair`
--

DROP TABLE IF EXISTS `for_repair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `for_repair` (
  `for_repairs_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `for_repairs_deadline` date DEFAULT NULL,
  `for_repairs_content` varchar(300) DEFAULT NULL,
  `for_repairs_status` varchar(15) NOT NULL,
  PRIMARY KEY (`for_repairs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `for_repair`
--

LOCK TABLES `for_repair` WRITE;
/*!40000 ALTER TABLE `for_repair` DISABLE KEYS */;
INSERT INTO `for_repair` VALUES (3,2,6,'2018-08-30','Needed ASAP','Fixed'),(4,2,6,'2018-09-06','NEEDED ASAP SOONER BETTER','Fixed'),(5,NULL,7,'2018-10-12','need asap now','Fixed'),(6,NULL,8,'2018-10-12','asaap','Fixed'),(7,NULL,6,'2018-09-09',NULL,'Fixed'),(8,NULL,6,NULL,NULL,'Fixed'),(9,NULL,6,NULL,NULL,'Fixed');
/*!40000 ALTER TABLE `for_repair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offense_category`
--

DROP TABLE IF EXISTS `offense_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offense_category` (
  `offensecat_id` int(11) NOT NULL AUTO_INCREMENT,
  `offensecat_desc` varchar(20) NOT NULL,
  PRIMARY KEY (`offensecat_id`),
  UNIQUE KEY `offensecat_desc` (`offensecat_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offense_category`
--

LOCK TABLES `offense_category` WRITE;
/*!40000 ALTER TABLE `offense_category` DISABLE KEYS */;
INSERT INTO `offense_category` VALUES (1,'Boundary'),(2,'Damage');
/*!40000 ALTER TABLE `offense_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offense_record`
--

DROP TABLE IF EXISTS `offense_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offense_record` (
  `offense_rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `penalty_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `mechanic_id` int(11) DEFAULT NULL,
  `penalty_amount` decimal(10,0) DEFAULT NULL,
  `for_date` date NOT NULL,
  PRIMARY KEY (`offense_rec_id`),
  KEY `penalty_id` (`penalty_id`),
  KEY `staff_id` (`mechanic_id`),
  KEY `driver_id` (`driver_id`),
  CONSTRAINT `offense_record_ibfk_2` FOREIGN KEY (`penalty_id`) REFERENCES `penalty` (`penalty_id`) ON UPDATE CASCADE,
  CONSTRAINT `offense_record_ibfk_3` FOREIGN KEY (`mechanic_id`) REFERENCES `staffs` (`staff_id`) ON UPDATE CASCADE,
  CONSTRAINT `offense_record_ibfk_4` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offense_record`
--

LOCK TABLES `offense_record` WRITE;
/*!40000 ALTER TABLE `offense_record` DISABLE KEYS */;
INSERT INTO `offense_record` VALUES (15,5,6,2,1000,'2018-10-10');
/*!40000 ALTER TABLE `offense_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offense_remittance`
--

DROP TABLE IF EXISTS `offense_remittance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offense_remittance` (
  `oremittance_id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `date_received` datetime DEFAULT NULL,
  `confirmed` int(1) NOT NULL,
  PRIMARY KEY (`oremittance_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `offense_remittance_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offense_remittance`
--

LOCK TABLES `offense_remittance` WRITE;
/*!40000 ALTER TABLE `offense_remittance` DISABLE KEYS */;
INSERT INTO `offense_remittance` VALUES (5,1000.00,4,'2018-10-10 03:55:13',1);
/*!40000 ALTER TABLE `offense_remittance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_log`
--

DROP TABLE IF EXISTS `payment_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_log` (
  `plog_id` int(11) NOT NULL AUTO_INCREMENT,
  `brecord_id` int(11) NOT NULL,
  `paid` decimal(10,2) NOT NULL,
  `plog_time` datetime NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`plog_id`),
  KEY `brecord_id` (`brecord_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `payment_log_ibfk_1` FOREIGN KEY (`brecord_id`) REFERENCES `boundary_record` (`brecord_id`),
  CONSTRAINT `payment_log_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`),
  CONSTRAINT `payment_log_ibfk_3` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_log`
--

LOCK TABLES `payment_log` WRITE;
/*!40000 ALTER TABLE `payment_log` DISABLE KEYS */;
INSERT INTO `payment_log` VALUES (1,16,100.00,'2018-10-09 04:47:04',4),(2,16,100.00,'2018-10-09 04:47:05',4),(3,16,100.00,'2018-10-09 04:47:06',4),(4,16,10.00,'2018-10-09 05:02:27',4),(5,16,5.00,'2018-10-09 05:03:34',4),(6,16,5.00,'2018-10-09 05:04:05',4),(7,16,5.00,'2018-10-09 05:05:57',4),(8,16,5.00,'2018-10-09 05:06:29',4),(9,16,5.00,'2018-10-09 05:07:15',4),(10,16,5.00,'2018-10-09 05:08:06',4),(11,16,5.00,'2018-10-09 05:08:50',4),(12,16,5.00,'2018-10-09 05:12:48',4),(13,16,5.00,'2018-10-09 05:17:56',4),(14,16,5.00,'2018-10-09 05:26:17',4),(15,16,5.00,'2018-10-09 05:26:31',4),(16,16,5.00,'2018-10-09 06:27:32',4),(17,17,5.00,'2018-10-09 06:27:36',4),(18,17,95.00,'2018-10-09 06:29:57',4);
/*!40000 ALTER TABLE `payment_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penalty`
--

DROP TABLE IF EXISTS `penalty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penalty` (
  `penalty_id` int(11) NOT NULL AUTO_INCREMENT,
  `offensecat_id` int(11) NOT NULL,
  `offense_no` int(11) NOT NULL,
  `penalty_desc` varchar(30) NOT NULL,
  PRIMARY KEY (`penalty_id`),
  KEY `offensecat_id` (`offensecat_id`),
  CONSTRAINT `penalty_ibfk_1` FOREIGN KEY (`offensecat_id`) REFERENCES `offense_category` (`offensecat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penalty`
--

LOCK TABLES `penalty` WRITE;
/*!40000 ALTER TABLE `penalty` DISABLE KEYS */;
INSERT INTO `penalty` VALUES (1,1,1,'1 week suspension'),(2,1,2,'1 month suspension'),(3,1,3,'3 months suspension'),(4,1,4,'Termination of job'),(5,2,1,'1 week suspension'),(6,2,2,'1 month suspension'),(7,2,3,'3 months suspension'),(8,2,4,'Termination of job');
/*!40000 ALTER TABLE `penalty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penalty_payment_log`
--

DROP TABLE IF EXISTS `penalty_payment_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penalty_payment_log` (
  `pplog_id` int(11) NOT NULL AUTO_INCREMENT,
  `offense_rec_id` int(11) NOT NULL,
  `paid` decimal(10,2) NOT NULL,
  `pplog_time` datetime NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`pplog_id`),
  KEY `offense_rec_id` (`offense_rec_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `penalty_payment_log_ibfk_1` FOREIGN KEY (`offense_rec_id`) REFERENCES `offense_record` (`offense_rec_id`),
  CONSTRAINT `penalty_payment_log_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penalty_payment_log`
--

LOCK TABLES `penalty_payment_log` WRITE;
/*!40000 ALTER TABLE `penalty_payment_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `penalty_payment_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair_report`
--

DROP TABLE IF EXISTS `repair_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repair_report` (
  `repair_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `for_repair_id` int(11) NOT NULL,
  `repair_report_content` varchar(300) DEFAULT NULL,
  `repair_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`repair_report_id`),
  KEY `for_repair_id` (`for_repair_id`),
  CONSTRAINT `repair_report_ibfk_2` FOREIGN KEY (`for_repair_id`) REFERENCES `for_repair` (`for_repairs_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_report`
--

LOCK TABLES `repair_report` WRITE;
/*!40000 ALTER TABLE `repair_report` DISABLE KEYS */;
INSERT INTO `repair_report` VALUES (1,3,'DONE',1),(2,4,'FIXED',1),(3,6,'ayos na',1),(4,5,'ayos na rin',1);
/*!40000 ALTER TABLE `repair_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `route_id` int(11) NOT NULL AUTO_INCREMENT,
  `route_from` varchar(50) NOT NULL,
  `route_to` varchar(50) NOT NULL,
  PRIMARY KEY (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,'Pasig','Quiapo'),(2,'Boni','Stop and Shop'),(3,'Hulo','Kalentong'),(4,'Sogo','Kalentong');
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sched_type`
--

DROP TABLE IF EXISTS `sched_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sched_type` (
  `sctype_id` int(11) NOT NULL AUTO_INCREMENT,
  `sctype_desc` varchar(20) NOT NULL,
  `sctype_from` time NOT NULL,
  `sctype_to` time NOT NULL,
  PRIMARY KEY (`sctype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sched_type`
--

LOCK TABLES `sched_type` WRITE;
/*!40000 ALTER TABLE `sched_type` DISABLE KEYS */;
INSERT INTO `sched_type` VALUES (1,'Morning','03:00:00','14:00:00'),(2,'Afternoon','15:00:00','02:00:00'),(3,'Whole Day','04:00:00','21:00:00');
/*!40000 ALTER TABLE `sched_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `sched_id` int(11) NOT NULL AUTO_INCREMENT,
  `driver_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `sctype_id` int(11) NOT NULL,
  `sched_from` date NOT NULL,
  `sched_to` date NOT NULL,
  `reliever_id` int(11) DEFAULT NULL,
  `relieve_date` date DEFAULT NULL,
  PRIMARY KEY (`sched_id`),
  KEY `driver_id` (`driver_id`),
  KEY `unit_id` (`unit_id`),
  KEY `sctype_id` (`sctype_id`),
  KEY `reliever_id` (`reliever_id`),
  CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`unit_id`) ON UPDATE CASCADE,
  CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`sctype_id`) REFERENCES `sched_type` (`sctype_id`),
  CONSTRAINT `schedule_ibfk_4` FOREIGN KEY (`reliever_id`) REFERENCES `drivers` (`driver_id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (109,5,9,1,'2018-08-31','2018-09-06',NULL,NULL),(110,6,6,1,'2018-08-31','2018-09-06',14,'2018-08-31'),(111,7,6,2,'2018-08-31','2018-09-06',NULL,NULL),(112,8,8,1,'2018-08-31','2018-09-06',NULL,NULL),(113,9,9,2,'2018-08-31','2018-09-06',NULL,NULL),(114,10,7,1,'2018-08-31','2018-09-06',NULL,NULL),(115,11,7,2,'2018-08-31','2018-09-06',NULL,NULL),(116,12,8,2,'2018-08-31','2018-09-06',NULL,NULL),(117,13,10,3,'2018-08-31','2018-09-06',NULL,NULL),(118,6,6,2,'2018-09-07','2018-09-13',NULL,NULL),(119,7,6,1,'2018-09-07','2018-09-13',NULL,NULL),(120,10,7,2,'2018-09-07','2018-09-13',NULL,NULL),(121,11,7,1,'2018-09-07','2018-09-13',NULL,NULL),(122,8,8,2,'2018-09-07','2018-09-13',NULL,NULL),(123,12,8,1,'2018-09-07','2018-09-13',NULL,NULL),(124,5,9,2,'2018-09-07','2018-09-13',NULL,NULL),(125,9,9,1,'2018-09-07','2018-09-13',NULL,NULL),(126,13,10,3,'2018-09-07','2018-09-13',NULL,NULL),(127,5,9,1,'2018-09-14','2018-09-20',NULL,NULL),(128,6,6,1,'2018-09-14','2018-09-20',NULL,NULL),(129,7,6,2,'2018-09-14','2018-09-20',NULL,NULL),(130,8,8,1,'2018-09-14','2018-09-20',NULL,NULL),(131,9,9,2,'2018-09-14','2018-09-20',NULL,NULL),(132,10,7,1,'2018-09-14','2018-09-20',NULL,NULL),(133,11,7,2,'2018-09-14','2018-09-20',NULL,NULL),(134,12,8,2,'2018-09-14','2018-09-20',NULL,NULL),(135,13,10,3,'2018-09-14','2018-09-20',NULL,NULL),(136,5,9,2,'2018-09-21','2018-09-27',NULL,NULL),(137,6,6,2,'2018-09-21','2018-09-27',NULL,NULL),(138,7,6,1,'2018-09-21','2018-09-27',NULL,NULL),(139,8,8,2,'2018-09-21','2018-09-27',NULL,NULL),(140,9,9,1,'2018-09-21','2018-09-27',NULL,NULL),(141,10,7,2,'2018-09-21','2018-09-27',NULL,NULL),(142,11,7,1,'2018-09-21','2018-09-27',NULL,NULL),(143,12,8,1,'2018-09-21','2018-09-27',NULL,NULL),(144,13,10,3,'2018-09-21','2018-09-27',NULL,NULL),(145,5,9,1,'2018-09-28','2018-10-04',NULL,NULL),(146,6,6,1,'2018-09-28','2018-10-04',NULL,NULL),(147,7,6,2,'2018-09-28','2018-10-04',NULL,NULL),(148,8,8,1,'2018-09-28','2018-10-04',NULL,NULL),(149,9,9,2,'2018-09-28','2018-10-04',NULL,NULL),(150,10,7,1,'2018-09-28','2018-10-04',NULL,NULL),(151,11,7,2,'2018-09-28','2018-10-04',NULL,NULL),(152,12,8,2,'2018-09-28','2018-10-04',NULL,NULL),(153,13,10,3,'2018-09-28','2018-10-04',NULL,NULL),(154,5,9,2,'2018-10-05','2018-10-11',NULL,NULL),(155,6,6,2,'2018-10-05','2018-10-11',14,'2018-10-11'),(156,7,6,1,'2018-10-05','2018-10-11',NULL,NULL),(157,8,8,2,'2018-10-05','2018-10-11',NULL,NULL),(158,9,9,1,'2018-10-05','2018-10-11',NULL,NULL),(159,10,7,2,'2018-10-05','2018-10-11',NULL,NULL),(160,11,7,1,'2018-10-05','2018-10-11',NULL,NULL),(161,12,8,1,'2018-10-05','2018-10-11',NULL,NULL),(162,13,10,3,'2018-10-05','2018-10-11',NULL,NULL),(163,5,9,1,'2018-10-12','2018-10-18',NULL,NULL),(164,6,6,1,'2018-10-12','2018-10-18',NULL,NULL),(165,7,6,2,'2018-10-12','2018-10-18',NULL,NULL),(166,8,8,1,'2018-10-12','2018-10-18',NULL,NULL),(167,9,9,2,'2018-10-12','2018-10-18',NULL,NULL),(168,10,7,1,'2018-10-12','2018-10-18',NULL,NULL),(169,11,7,2,'2018-10-12','2018-10-18',NULL,NULL),(170,12,8,2,'2018-10-12','2018-10-18',NULL,NULL),(171,13,10,3,'2018-10-12','2018-10-18',NULL,NULL),(172,5,9,2,'2018-10-19','2018-10-25',NULL,NULL),(173,6,6,2,'2018-10-19','2018-10-25',NULL,NULL),(174,7,6,1,'2018-10-19','2018-10-25',NULL,NULL),(175,8,8,2,'2018-10-19','2018-10-25',NULL,NULL),(176,9,9,1,'2018-10-19','2018-10-25',NULL,NULL),(177,10,7,2,'2018-10-19','2018-10-25',NULL,NULL),(178,11,7,1,'2018-10-19','2018-10-25',NULL,NULL),(179,12,8,1,'2018-10-19','2018-10-25',NULL,NULL),(180,13,10,3,'2018-10-19','2018-10-25',NULL,NULL),(181,5,9,1,'2018-10-26','2018-11-01',NULL,NULL),(182,6,6,1,'2018-10-26','2018-11-01',NULL,NULL),(183,7,6,2,'2018-10-26','2018-11-01',NULL,NULL),(184,8,8,1,'2018-10-26','2018-11-01',NULL,NULL),(185,9,9,2,'2018-10-26','2018-11-01',NULL,NULL),(186,10,7,1,'2018-10-26','2018-11-01',NULL,NULL),(187,11,7,2,'2018-10-26','2018-11-01',NULL,NULL),(188,12,8,2,'2018-10-26','2018-11-01',NULL,NULL),(189,13,10,3,'2018-10-26','2018-11-01',NULL,NULL),(190,5,9,2,'2018-11-02','2018-11-08',NULL,NULL),(191,6,6,2,'2018-11-02','2018-11-08',NULL,NULL),(192,7,6,1,'2018-11-02','2018-11-08',NULL,NULL),(193,8,8,2,'2018-11-02','2018-11-08',NULL,NULL),(194,9,9,1,'2018-11-02','2018-11-08',NULL,NULL),(195,10,7,2,'2018-11-02','2018-11-08',NULL,NULL),(196,11,7,1,'2018-11-02','2018-11-08',NULL,NULL),(197,12,8,1,'2018-11-02','2018-11-08',NULL,NULL),(198,13,10,3,'2018-11-02','2018-11-08',NULL,NULL);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_assignment`
--

DROP TABLE IF EXISTS `staff_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_assignment` (
  `s_assignment_id` int(11) NOT NULL AUTO_INCREMENT,
  `Bus` tinyint(1) NOT NULL,
  `FX` tinyint(1) NOT NULL,
  `Jeep` tinyint(1) NOT NULL,
  `Taxi` tinyint(1) NOT NULL,
  `UV` tinyint(1) NOT NULL,
  PRIMARY KEY (`s_assignment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_assignment`
--

LOCK TABLES `staff_assignment` WRITE;
/*!40000 ALTER TABLE `staff_assignment` DISABLE KEYS */;
INSERT INTO `staff_assignment` VALUES (1,1,1,1,1,1),(2,1,1,1,1,1),(3,0,1,1,1,0),(4,0,1,1,1,1),(5,0,0,0,0,0);
/*!40000 ALTER TABLE `staff_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_type`
--

DROP TABLE IF EXISTS `staff_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_type` (
  `staff_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_type_desc` varchar(20) NOT NULL,
  PRIMARY KEY (`staff_type_id`),
  UNIQUE KEY `staff_type_desc` (`staff_type_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_type`
--

LOCK TABLES `staff_type` WRITE;
/*!40000 ALTER TABLE `staff_type` DISABLE KEYS */;
INSERT INTO `staff_type` VALUES (3,'Collector'),(2,'Dispatcher'),(1,'Mechanic'),(4,'Operator');
/*!40000 ALTER TABLE `staff_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffs`
--

DROP TABLE IF EXISTS `staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staffs` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_fn` varchar(20) NOT NULL,
  `staff_mn` varchar(15) NOT NULL,
  `staff_ln` varchar(15) NOT NULL,
  `staff_type_id` int(11) NOT NULL,
  `staff_pic` varchar(50) DEFAULT NULL,
  `staff_sex` varchar(7) NOT NULL,
  `staff_bday` date NOT NULL,
  `staff_address` varchar(50) NOT NULL,
  `staff_contact` varchar(11) NOT NULL,
  `staff_assignment_id` int(11) DEFAULT NULL,
  `staff_password` varchar(15) NOT NULL,
  PRIMARY KEY (`staff_id`,`staff_fn`,`staff_mn`,`staff_ln`),
  KEY `staff_assignment_id` (`staff_assignment_id`),
  KEY `staff_type_id` (`staff_type_id`),
  CONSTRAINT `staffs_ibfk_1` FOREIGN KEY (`staff_assignment_id`) REFERENCES `staff_assignment` (`s_assignment_id`) ON UPDATE CASCADE,
  CONSTRAINT `staffs_ibfk_2` FOREIGN KEY (`staff_type_id`) REFERENCES `staff_type` (`staff_type_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffs`
--

LOCK TABLES `staffs` WRITE;
/*!40000 ALTER TABLE `staffs` DISABLE KEYS */;
INSERT INTO `staffs` VALUES (1,'Matthew James ','Estoesta','Victore',4,'','Male','1998-07-08','727 Int. 8 Bagumbayan St., Sta. Mesa, Manila','09485733222',NULL,'mattpogi'),(2,'Reannie Danielle','Cacal','Exiomo',1,'','Female','1999-04-18','Pinagbuhatan, Pasig City','09353334515',1,'yanie'),(3,'Dummy','None','Dispatcher',2,NULL,'Male','2018-08-01','Nowhere','09123456789',2,'hello'),(4,'Dummy','None','Collector',3,NULL,'Male','2018-08-23','Nowhere','09123456789',3,'hello'),(5,'Dummy','None','Mechanic',1,NULL,'Male','2018-08-31','Nowhere','09123456789',4,'hello'),(6,'Juan','','Dela Cruz',2,NULL,'Male','1995-10-04','Nowhere','09089090900',5,'jokelang');
/*!40000 ALTER TABLE `staffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `tdata` varchar(100) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'Hello World'),(2,'foo bar'),(3,'john doe'),(4,'jane doe'),(5,'unidentified.py');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unittype_id` int(11) NOT NULL,
  `unitnum_id` int(11) NOT NULL,
  `unitroute_id` int(11) DEFAULT NULL,
  `unit_capacity` int(11) NOT NULL,
  `unit_model` varchar(10) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `unit_coding` varchar(10) NOT NULL,
  `unit_boundary_id` int(11) NOT NULL,
  `unit_warranty` date DEFAULT NULL,
  `unit_acquired` year(4) NOT NULL,
  `unit_plate_registration` date DEFAULT NULL,
  PRIMARY KEY (`unit_id`),
  KEY `unittype_id` (`unittype_id`),
  KEY `unitnum_id` (`unitnum_id`),
  KEY `unitroute_id` (`unitroute_id`),
  KEY `brand_id` (`brand_id`),
  KEY `unit_boundary_id` (`unit_boundary_id`),
  CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`unittype_id`) REFERENCES `unit_type` (`unittype_id`) ON UPDATE CASCADE,
  CONSTRAINT `unit_ibfk_2` FOREIGN KEY (`unitnum_id`) REFERENCES `unit_number` (`unitnum_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `unit_ibfk_3` FOREIGN KEY (`unitroute_id`) REFERENCES `unit_route` (`unitroute_id`) ON UPDATE CASCADE,
  CONSTRAINT `unit_ibfk_4` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`) ON UPDATE CASCADE,
  CONSTRAINT `unit_ibfk_5` FOREIGN KEY (`unit_boundary_id`) REFERENCES `unit_boundary` (`unit_boundary_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (6,1,6,6,21,'2018',1,'Monday',2,'2020-10-10',2018,'2018-10-13'),(7,2,7,7,21,'2018',4,'Thursday',3,'2017-10-10',2018,'2018-10-13'),(8,3,8,8,21,'2018',6,'Monday',4,'2018-10-01',2018,'2018-10-13'),(9,3,9,9,20,'2017',1,'Wednesday',5,'2016-10-01',2018,'2018-10-13'),(10,4,13,13,6,'2018',4,'Monday',10,'2016-01-01',2018,'2018-10-13');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_body_inspection`
--

DROP TABLE IF EXISTS `unit_body_inspection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_body_inspection` (
  `u_parts_inspection_id` int(11) NOT NULL AUTO_INCREMENT,
  `brake` tinyint(1) NOT NULL,
  `light` tinyint(1) NOT NULL,
  `mirror` tinyint(1) NOT NULL,
  `horn` tinyint(1) NOT NULL,
  `tires` tinyint(1) NOT NULL,
  `steer` tinyint(1) NOT NULL,
  `seatbelt` tinyint(1) NOT NULL,
  `door` tinyint(1) DEFAULT NULL,
  `air_conditioning` tinyint(1) DEFAULT NULL,
  `body_condition` tinyint(1) NOT NULL,
  `cleanliness` tinyint(1) NOT NULL,
  PRIMARY KEY (`u_parts_inspection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_body_inspection`
--

LOCK TABLES `unit_body_inspection` WRITE;
/*!40000 ALTER TABLE `unit_body_inspection` DISABLE KEYS */;
INSERT INTO `unit_body_inspection` VALUES (1,1,0,0,1,0,1,0,0,0,0,1),(2,1,0,0,1,0,1,0,0,0,0,1),(3,0,0,1,0,1,0,0,0,1,0,1),(4,1,0,0,0,1,0,0,0,1,1,0),(5,0,1,0,0,1,0,0,1,1,0,0),(6,0,0,1,0,0,0,1,0,1,1,0),(7,0,1,0,0,1,0,0,1,1,0,0),(8,1,1,1,1,1,1,1,1,1,1,1),(9,0,1,0,0,1,0,0,1,1,0,0),(10,1,1,1,1,1,1,1,1,1,1,1),(11,1,1,1,1,1,1,1,1,1,1,1),(12,0,0,1,0,0,0,1,0,0,1,0),(13,1,1,1,1,1,1,1,1,1,1,1),(14,1,1,1,1,1,1,1,1,1,1,1),(15,1,1,1,1,1,1,1,1,1,1,1),(16,1,1,1,1,1,1,1,1,1,1,1),(17,1,1,1,1,1,1,1,1,1,1,1),(18,1,0,0,1,0,1,0,0,0,0,1),(19,1,1,1,1,1,1,1,1,1,1,1),(20,1,1,1,1,1,1,1,1,1,1,0),(21,0,0,1,0,0,0,1,0,0,1,0),(22,0,0,1,0,0,0,1,0,0,1,0),(23,1,1,1,1,1,1,1,1,1,1,1),(24,1,1,1,0,0,0,0,1,0,1,1),(25,0,0,1,0,0,0,1,0,0,1,0),(26,1,1,1,1,1,1,1,1,1,1,1),(27,1,1,1,1,1,1,1,1,1,1,1),(28,1,1,1,1,1,1,1,1,1,1,1),(29,0,0,1,0,0,0,1,0,0,1,0),(30,1,1,1,1,1,1,1,1,1,1,1),(31,0,0,1,0,0,0,1,0,0,1,0),(32,1,1,1,1,1,1,1,1,1,1,1),(33,0,0,1,0,0,0,1,0,0,1,0),(34,1,1,1,1,1,1,1,1,1,1,1),(35,0,0,1,0,0,0,1,0,0,1,0),(36,0,0,1,0,0,0,1,0,0,1,0),(37,1,1,1,1,1,1,1,1,1,1,1),(38,0,1,0,0,1,0,0,1,1,0,0),(39,0,0,1,0,0,0,1,0,0,1,0),(40,1,1,1,1,1,1,1,1,1,1,1),(41,1,1,1,1,1,1,1,1,1,1,1),(42,1,1,1,1,1,1,1,1,1,1,1),(43,0,0,1,0,0,0,1,0,0,1,0),(44,1,1,1,1,1,1,1,1,1,1,1),(45,0,0,1,0,0,0,0,0,0,0,0),(46,1,1,1,1,1,1,1,1,1,1,1),(47,1,1,1,1,1,1,1,1,1,1,1),(48,1,1,1,1,1,1,1,1,1,1,1),(49,1,1,1,1,1,1,1,1,1,1,1),(50,0,0,0,1,0,1,1,0,1,0,0),(51,1,1,1,1,1,1,1,1,1,1,1),(52,1,1,1,1,1,1,1,1,1,1,1),(53,1,0,0,0,0,0,0,0,0,0,0),(54,1,1,1,1,1,1,1,1,0,1,1),(55,0,0,0,0,0,0,0,0,1,0,0),(56,0,0,0,0,0,0,0,0,0,0,0),(57,0,0,0,0,0,0,0,0,0,0,0),(58,0,1,0,0,1,0,0,1,1,0,0),(59,1,1,1,1,1,1,1,1,1,1,1),(60,1,1,1,1,1,1,1,1,1,1,1),(61,1,1,1,1,1,1,1,1,1,1,1),(62,1,1,1,1,1,1,1,1,1,1,1),(63,1,1,1,1,1,1,1,1,1,1,1),(64,0,0,0,0,0,0,0,0,1,0,0),(65,0,0,0,0,0,0,0,1,0,0,0),(66,0,0,0,0,0,0,0,0,0,0,0),(67,1,1,1,1,1,1,1,1,1,1,1),(68,1,1,1,1,1,1,1,1,1,1,1),(69,0,0,0,0,0,1,0,0,0,0,0),(70,1,1,1,1,1,1,1,1,1,1,1),(71,1,1,1,1,1,1,1,1,1,1,1),(72,1,1,1,1,1,1,1,1,1,1,1),(73,1,1,1,1,1,1,1,1,1,1,1),(74,1,1,1,1,1,1,1,1,1,1,1),(75,0,0,0,0,0,1,0,0,0,0,0);
/*!40000 ALTER TABLE `unit_body_inspection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_boundary`
--

DROP TABLE IF EXISTS `unit_boundary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_boundary` (
  `unit_boundary_id` int(11) NOT NULL AUTO_INCREMENT,
  `unittype_id` int(11) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `morning_boundary` decimal(10,0) NOT NULL,
  `afternoon_boundary` decimal(10,0) NOT NULL,
  `wholeday_boundary` decimal(10,0) NOT NULL,
  `unit_boundary_type` int(11) NOT NULL,
  PRIMARY KEY (`unit_boundary_id`),
  KEY `unittype_id` (`unittype_id`),
  CONSTRAINT `unit_boundary_ibfk_1` FOREIGN KEY (`unittype_id`) REFERENCES `unit_type` (`unittype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_boundary`
--

LOCK TABLES `unit_boundary` WRITE;
/*!40000 ALTER TABLE `unit_boundary` DISABLE KEYS */;
INSERT INTO `unit_boundary` VALUES (1,1,0,1000,1000,5000,2),(2,2,0,1000,1000,5000,2),(3,3,0,1000,1000,5000,2),(4,4,0,1000,1000,5000,2),(5,5,0,1000,1000,1500,2),(6,1,23,500,500,1500,1),(7,NULL,NULL,2000,2000,5000,2),(8,NULL,NULL,1000,1000,3000,2),(9,NULL,NULL,2000,2000,5000,2),(10,NULL,NULL,1000,2000,3000,2),(11,NULL,NULL,1000,1000,1500,2),(12,NULL,NULL,1000,1000,5000,2);
/*!40000 ALTER TABLE `unit_boundary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_coding`
--

DROP TABLE IF EXISTS `unit_coding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_coding` (
  `unit_coding_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_coding_no` int(11) NOT NULL,
  `unit_coding_day` varchar(10) NOT NULL,
  PRIMARY KEY (`unit_coding_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_coding`
--

LOCK TABLES `unit_coding` WRITE;
/*!40000 ALTER TABLE `unit_coding` DISABLE KEYS */;
/*!40000 ALTER TABLE `unit_coding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_engine/fluid_inspection`
--

DROP TABLE IF EXISTS `unit_engine/fluid_inspection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_engine/fluid_inspection` (
  `u_ef_inspection_id` int(11) NOT NULL AUTO_INCREMENT,
  `fuel` varchar(9) NOT NULL,
  `engine_oil` varchar(9) NOT NULL,
  `brake_fluid` varchar(9) NOT NULL,
  `battery_charge` varchar(9) NOT NULL,
  PRIMARY KEY (`u_ef_inspection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_engine/fluid_inspection`
--

LOCK TABLES `unit_engine/fluid_inspection` WRITE;
/*!40000 ALTER TABLE `unit_engine/fluid_inspection` DISABLE KEYS */;
INSERT INTO `unit_engine/fluid_inspection` VALUES (1,'High','Moderate','Low','Moderate'),(2,'High','Moderate','Low','Moderate'),(3,'Moderate','High','Low','Moderate'),(4,'Low','Moderate','High','Low'),(5,'Low','Low','Low','Low'),(6,'Moderate','Moderate','Moderate','Moderate'),(7,'High','Moderate','Low','Moderate'),(8,'High','High','High','High'),(9,'High','Moderate','Low','Moderate'),(10,'Low','Low','Low','Low'),(11,'High','High','High','High'),(12,'Low','Low','Low','Low'),(13,'High','High','High','High'),(14,'High','High','High','High'),(15,'High','High','High','High'),(16,'High','High','High','High'),(17,'High','High','High','High'),(18,'Low','Low','Low','Low'),(19,'High','High','High','High'),(20,'Moderate','Moderate','Moderate','Moderate'),(21,'Low','Low','Low','Low'),(22,'Low','Low','Low','Low'),(23,'High','High','High','High'),(24,'Moderate','Low','Moderate','Low'),(25,'Low','Low','Low','Low'),(26,'High','High','High','High'),(27,'High','High','High','High'),(28,'High','High','High','High'),(29,'Low','Low','Low','Low'),(30,'High','High','High','High'),(31,'Low','Low','Low','Low'),(32,'High','High','High','High'),(33,'Low','Moderate','Low','Moderate'),(34,'High','High','High','High'),(35,'Low','Low','Low','Low'),(36,'Low','Low','Low','Low'),(37,'High','High','High','High'),(38,'Low','Low','Moderate','Moderate'),(39,'Low','Low','Low','Low'),(40,'High','High','High','High'),(41,'High','High','High','High'),(42,'High','High','High','High'),(43,'Low','Low','Low','Low'),(44,'High','High','High','High'),(45,'Low','Low','Low','Low'),(46,'High','High','High','High'),(47,'High','High','High','High'),(48,'High','High','High','High'),(49,'High','High','High','High'),(50,'Low','Low','Low','Low'),(51,'High','High','High','High'),(52,'High','High','High','High'),(53,'Low','Low','Low','Low'),(54,'High','High','High','High'),(55,'Low','Low','Low','Low'),(56,'Low','Low','Low','Low'),(57,'Low','Low','Low','Low'),(58,'Low','Low','Low','Low'),(59,'High','High','High','High'),(60,'High','High','High','High'),(61,'High','High','High','High'),(62,'High','High','High','High'),(63,'Low','High','High','High'),(64,'Low','Low','Low','Low'),(65,'Low','Low','Low','Low'),(66,'undefined','undefined','undefined','undefined'),(67,'High','High','High','High'),(68,'High','High','High','High'),(69,'High','High','High','High'),(70,'High','High','High','High'),(71,'High','High','High','High'),(72,'High','High','High','High'),(73,'High','High','High','High'),(74,'High','High','High','High'),(75,'Moderate','Moderate','Moderate','Moderate');
/*!40000 ALTER TABLE `unit_engine/fluid_inspection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_number`
--

DROP TABLE IF EXISTS `unit_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_number` (
  `unitnum_id` int(11) NOT NULL AUTO_INCREMENT,
  `unitplate_no` varchar(11) NOT NULL,
  `unitchassi_no` varchar(11) DEFAULT NULL,
  `unitengine_no` varchar(11) NOT NULL,
  `unitbody_no` varchar(11) NOT NULL,
  PRIMARY KEY (`unitnum_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_number`
--

LOCK TABLES `unit_number` WRITE;
/*!40000 ALTER TABLE `unit_number` DISABLE KEYS */;
INSERT INTO `unit_number` VALUES (1,'ABC 1234','ABC 1234','ABC 1234','ABC 1234'),(2,'CBA 4321','CBA 4321','CBA 4321','CBA 4321'),(3,'CAB 1234','CAB 1234','CAB 1234','CAB 1234'),(4,'DCB 2143','DCB 2143','DCB 2143','DCB 2143'),(5,'qwe 1234','qwe 1234','qwe 1234','qwe 1234'),(6,'654321','654321','654321','654321'),(7,'123456','123456','123456','123456'),(8,'111111','111111','111111','111111'),(9,'uwre445','12345','3546','1234'),(11,'125454','125454','125454','125454'),(12,'090909','090909','090909','090909'),(13,'909090','909090','909090','909090'),(14,'TRW 6553','ASD12345678','ASD12345678','ASD12345678'),(15,'JKK 1555','12345678910','12345678910','12345678910'),(16,'UVI 1234','989898','989898','989898');
/*!40000 ALTER TABLE `unit_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_route`
--

DROP TABLE IF EXISTS `unit_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_route` (
  `unitroute_id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) NOT NULL,
  `unitroute_registered` date NOT NULL,
  `unitroute_expiration` date NOT NULL,
  PRIMARY KEY (`unitroute_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `unit_route_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_route`
--

LOCK TABLES `unit_route` WRITE;
/*!40000 ALTER TABLE `unit_route` DISABLE KEYS */;
INSERT INTO `unit_route` VALUES (1,1,'2018-09-09','2018-09-09'),(2,2,'2018-01-23','2020-01-21'),(3,3,'2018-09-09','2021-09-09'),(4,4,'2018-01-01','2023-01-01'),(5,1,'1960-01-01','1960-01-01'),(6,1,'2018-08-14','2023-08-14'),(7,2,'2018-08-15','2023-08-15'),(8,3,'2018-08-15','2023-08-15'),(9,1,'2018-08-23','2023-08-23'),(10,1,'2018-08-30','2023-08-30'),(11,1,'2018-08-30','2023-08-30'),(12,1,'2018-08-30','2023-08-30'),(13,1,'2018-08-30','2023-08-30'),(14,2,'2018-10-08','2023-10-08'),(15,2,'2018-10-02','2023-10-02'),(16,1,'2018-10-07','2023-10-07');
/*!40000 ALTER TABLE `unit_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_type`
--

DROP TABLE IF EXISTS `unit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_type` (
  `unittype_id` int(11) NOT NULL AUTO_INCREMENT,
  `unittype_desc` varchar(15) NOT NULL,
  `unittype_status` tinyint(1) NOT NULL,
  `unittype_minimum` decimal(10,2) NOT NULL,
  PRIMARY KEY (`unittype_id`),
  UNIQUE KEY `unittype_desc` (`unittype_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_type`
--

LOCK TABLES `unit_type` WRITE;
/*!40000 ALTER TABLE `unit_type` DISABLE KEYS */;
INSERT INTO `unit_type` VALUES (1,'Bus',0,300.00),(2,'FX',1,300.00),(3,'Jeep',1,200.00),(4,'Taxi',1,300.00),(5,'UV',1,300.00);
/*!40000 ALTER TABLE `unit_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-13 12:10:41
