-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: vehicle
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arrival_inspection_record`
--

LOCK TABLES `arrival_inspection_record` WRITE;
/*!40000 ALTER TABLE `arrival_inspection_record` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arrival_record`
--

LOCK TABLES `arrival_record` WRITE;
/*!40000 ALTER TABLE `arrival_record` DISABLE KEYS */;
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
  `paid` double(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `for_date` date NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`brecord_id`),
  KEY `sched_id` (`sched_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `boundary_record_ibfk_1` FOREIGN KEY (`sched_id`) REFERENCES `schedule` (`sched_id`),
  CONSTRAINT `boundary_record_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boundary_record`
--

LOCK TABLES `boundary_record` WRITE;
/*!40000 ALTER TABLE `boundary_record` DISABLE KEYS */;
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
  `for_date` date NOT NULL,
  `confirmed` int(1) NOT NULL,
  PRIMARY KEY (`bremittance_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `boundary_remittance_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boundary_remittance`
--

LOCK TABLES `boundary_remittance` WRITE;
/*!40000 ALTER TABLE `boundary_remittance` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_unit_type`
--

LOCK TABLES `brand_unit_type` WRITE;
/*!40000 ALTER TABLE `brand_unit_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand_unit_type` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispatch_inspection_record`
--

LOCK TABLES `dispatch_inspection_record` WRITE;
/*!40000 ALTER TABLE `dispatch_inspection_record` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispatching_record`
--

LOCK TABLES `dispatching_record` WRITE;
/*!40000 ALTER TABLE `dispatching_record` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
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
  `for_repairs_deadline` date NOT NULL,
  `for_repairs_content` varchar(300) NOT NULL,
  `for_repairs_status` varchar(15) NOT NULL,
  PRIMARY KEY (`for_repairs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `for_repair`
--

LOCK TABLES `for_repair` WRITE;
/*!40000 ALTER TABLE `for_repair` DISABLE KEYS */;
INSERT INTO `for_repair` VALUES (3,2,6,'2018-08-30','Needed ASAP','Fixed'),(4,NULL,6,'2018-09-06','NEEDED ASAP SOONER BETTER','Pending');
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
  `mechanic_id` int(11) NOT NULL,
  `penalty_amount` decimal(10,0) DEFAULT NULL,
  `paid` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `for_date` date NOT NULL,
  `collector_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`offense_rec_id`),
  KEY `penalty_id` (`penalty_id`),
  KEY `staff_id` (`mechanic_id`),
  KEY `driver_id` (`driver_id`),
  KEY `collector_id` (`collector_id`),
  CONSTRAINT `offense_record_ibfk_2` FOREIGN KEY (`penalty_id`) REFERENCES `penalty` (`penalty_id`) ON UPDATE CASCADE,
  CONSTRAINT `offense_record_ibfk_3` FOREIGN KEY (`mechanic_id`) REFERENCES `staffs` (`staff_id`) ON UPDATE CASCADE,
  CONSTRAINT `offense_record_ibfk_4` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`),
  CONSTRAINT `offense_record_ibfk_5` FOREIGN KEY (`collector_id`) REFERENCES `staffs` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offense_record`
--

LOCK TABLES `offense_record` WRITE;
/*!40000 ALTER TABLE `offense_record` DISABLE KEYS */;
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
  `for_date` date NOT NULL,
  `confirmed` int(1) NOT NULL,
  PRIMARY KEY (`oremittance_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `offense_remittance_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offense_remittance`
--

LOCK TABLES `offense_remittance` WRITE;
/*!40000 ALTER TABLE `offense_remittance` DISABLE KEYS */;
/*!40000 ALTER TABLE `offense_remittance` ENABLE KEYS */;
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
  `offense_no` varchar(10) NOT NULL,
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
INSERT INTO `penalty` VALUES (1,1,'1st','1 week suspension'),(2,1,'2nd','1 month suspension'),(3,1,'3rd','3 months suspension'),(4,1,'Final','Termination of job'),(5,2,'1st','1 week suspension'),(6,2,'2nd','1 month suspension'),(7,2,'3rd','3 months suspension'),(8,2,'Final','Termination of job');
/*!40000 ALTER TABLE `penalty` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_report`
--

LOCK TABLES `repair_report` WRITE;
/*!40000 ALTER TABLE `repair_report` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_assignment`
--

LOCK TABLES `staff_assignment` WRITE;
/*!40000 ALTER TABLE `staff_assignment` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffs`
--

LOCK TABLES `staffs` WRITE;
/*!40000 ALTER TABLE `staffs` DISABLE KEYS */;
/*!40000 ALTER TABLE `staffs` ENABLE KEYS */;
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
  `unit_acquired` year(4) NOT NULL,
  `unit_warranty` date NOT NULL,
  PRIMARY KEY (`unit_id`),
  KEY `unittype_id` (`unittype_id`),
  KEY `unitnum_id` (`unitnum_id`),
  KEY `unitroute_id` (`unitroute_id`),
  KEY `brand_id` (`brand_id`),
  KEY `unit_boundary_id` (`unit_boundary_id`),
  CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`unittype_id`) REFERENCES `unit_type` (`unittype_id`),
  CONSTRAINT `unit_ibfk_2` FOREIGN KEY (`unitnum_id`) REFERENCES `unit_number` (`unitnum_id`),
  CONSTRAINT `unit_ibfk_3` FOREIGN KEY (`unitroute_id`) REFERENCES `unit_route` (`unitroute_id`),
  CONSTRAINT `unit_ibfk_4` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_body_inspection`
--

LOCK TABLES `unit_body_inspection` WRITE;
/*!40000 ALTER TABLE `unit_body_inspection` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_boundary`
--

LOCK TABLES `unit_boundary` WRITE;
/*!40000 ALTER TABLE `unit_boundary` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_engine/fluid_inspection`
--

LOCK TABLES `unit_engine/fluid_inspection` WRITE;
/*!40000 ALTER TABLE `unit_engine/fluid_inspection` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_number`
--

LOCK TABLES `unit_number` WRITE;
/*!40000 ALTER TABLE `unit_number` DISABLE KEYS */;
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
  KEY `route_id` (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_route`
--

LOCK TABLES `unit_route` WRITE;
/*!40000 ALTER TABLE `unit_route` DISABLE KEYS */;
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
  `unittype_minimum` decimal(10,0) NOT NULL,
  PRIMARY KEY (`unittype_id`),
  UNIQUE KEY `unittype_desc` (`unittype_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_type`
--

LOCK TABLES `unit_type` WRITE;
/*!40000 ALTER TABLE `unit_type` DISABLE KEYS */;
INSERT INTO `unit_type` VALUES (2,'FX',1,0),(3,'Jeep',1,0),(4,'Taxi',1,0),(5,'UV',1,0);
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

-- Dump completed on 2018-10-05 19:49:09
