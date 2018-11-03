-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2018 at 06:06 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `finals_latest`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifs`
--

CREATE TABLE `admin_notifs` (
  `an_id` int(11) NOT NULL,
  `an_desc` varchar(1000) NOT NULL,
  `seen` int(11) NOT NULL,
  `for_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_notifs`
--

INSERT INTO `admin_notifs` (`an_id`, `an_desc`, `seen`, `for_date`) VALUES
(12, 'EFG 9021, inspected by Exiomo, Reannie Danielle Cacal, has failed to dispatch', 1, '2018-10-02 05:33:55'),
(13, 'PWU 1235, inspected by Exiomo, Reannie Danielle Cacal, has failed to dispatch', 1, '2018-10-02 05:34:01'),
(14, 'PWU 1235, has been fixed by Exiomo, Reannie Danielle Cacal', 1, '2018-10-02 05:38:21'),
(15, 'ABC 1234, inspected by Exiomo, Reannie Danielle Cacal, has failed after arrival', 1, '2018-10-02 05:40:20'),
(16, 'Collector, Dummy None has requested a remittance of 2025', 1, '2018-10-02 05:57:05'),
(17, 'ABC 1235, inspected by Exiomo, Reannie Danielle Cacal, has failed to dispatch', 1, '2018-11-06 14:31:47'),
(18, 'EFG 9021, inspected by Exiomo, Reannie Danielle Cacal, has failed to dispatch', 1, '2018-10-19 01:39:56'),
(19, 'PWU 1235, inspected by Exiomo, Reannie Danielle Cacal, has failed to dispatch', 1, '2018-10-19 01:40:00'),
(20, 'PWU 1235, inspected by Exiomo, Reannie Danielle Cacal, has failed to dispatch', 1, '2018-10-19 01:40:07'),
(21, 'ABC 1234, inspected by Exiomo, Reannie Danielle Cacal, has failed to dispatch', 1, '2018-10-20 03:12:34'),
(22, 'PWU 1235, inspected by Exiomo, Reannie Danielle Cacal, has failed to dispatch', 1, '2018-10-20 03:13:02'),
(23, 'PWU 1235, inspected by Exiomo, Reannie Danielle Cacal, has failed after arrival', 1, '2018-10-20 03:21:05'),
(24, 'TYU 0921, inspected by Exiomo, Reannie Danielle Cacal, has failed after arrival', 1, '2018-10-20 03:21:47'),
(25, 'Collector, Dummy None has requested a remittance of 7555', 1, '2018-10-20 17:51:52');

-- --------------------------------------------------------

--
-- Table structure for table `annual_maintenance`
--

CREATE TABLE `annual_maintenance` (
  `annualmain_id` int(11) NOT NULL,
  `battery` tinyint(1) NOT NULL,
  `chassis_lubrication` tinyint(1) NOT NULL,
  `cabin_air_filter` tinyint(1) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `schedmain_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `arrival_inspection_record`
--

CREATE TABLE `arrival_inspection_record` (
  `arrival_inspection_id` int(11) NOT NULL,
  `sched_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `inspection_time` timestamp NULL DEFAULT NULL,
  `u_parts_inspection_id` int(11) DEFAULT NULL,
  `u_ef_inspection_id` int(11) DEFAULT NULL,
  `u_inspection_comment` varchar(200) DEFAULT NULL,
  `u_inspection_status` int(11) DEFAULT NULL,
  `for_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `arrival_inspection_record`
--

INSERT INTO `arrival_inspection_record` (`arrival_inspection_id`, `sched_id`, `staff_id`, `inspection_time`, `u_parts_inspection_id`, `u_ef_inspection_id`, `u_inspection_comment`, `u_inspection_status`, `for_date`) VALUES
(24, 217, 2, '2018-10-01 21:40:20', 87, 87, '', 0, '2018-10-02'),
(25, 221, 2, '2018-10-01 21:41:07', 88, 88, '', 1, '2018-10-02'),
(26, 218, NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-02'),
(27, 258, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-06'),
(28, 262, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-06'),
(29, 266, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-06'),
(30, 233, 2, '2018-10-19 18:16:53', 103, 103, '', 1, '2018-10-20'),
(31, 236, 2, '2018-10-19 19:21:47', 108, 108, '', 0, '2018-10-20'),
(32, 235, 2, '2018-10-19 19:21:05', 107, 107, '', 0, '2018-10-20');

-- --------------------------------------------------------

--
-- Table structure for table `arrival_record`
--

CREATE TABLE `arrival_record` (
  `arrival_id` int(11) NOT NULL,
  `sched_id` int(11) NOT NULL,
  `time_arrived` timestamp NULL DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `for_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `arrival_record`
--

INSERT INTO `arrival_record` (`arrival_id`, `sched_id`, `time_arrived`, `staff_id`, `for_date`) VALUES
(23, 217, '2018-10-01 21:36:07', 3, '2018-10-02'),
(24, 221, '2018-10-01 21:39:37', 3, '2018-10-02'),
(25, 218, '2018-10-01 21:56:07', 3, '2018-10-02'),
(26, 266, '2018-11-06 06:48:14', 3, '2018-11-06'),
(27, 258, '2018-11-06 06:39:20', 3, '2018-11-06'),
(28, 262, '2018-11-06 06:39:25', 3, '2018-11-06'),
(29, 263, NULL, NULL, '2018-11-06'),
(30, 233, NULL, NULL, '2018-10-19'),
(31, 237, NULL, NULL, '2018-10-19'),
(32, 234, NULL, NULL, '2018-10-19'),
(33, 236, NULL, NULL, '2018-10-19'),
(34, 239, NULL, NULL, '2018-10-19'),
(35, 233, '2018-10-19 18:15:44', 3, '2018-10-20'),
(36, 236, '2018-10-19 19:19:56', 3, '2018-10-20'),
(37, 235, '2018-10-19 19:20:00', 3, '2018-10-20');

-- --------------------------------------------------------

--
-- Table structure for table `auto_supply`
--

CREATE TABLE `auto_supply` (
  `asupply_id` int(11) NOT NULL,
  `ascategory_id` int(11) NOT NULL,
  `asupply_desc` varchar(20) NOT NULL,
  `asupply_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auto_supply`
--

INSERT INTO `auto_supply` (`asupply_id`, `ascategory_id`, `asupply_desc`, `asupply_quantity`) VALUES
(1, 2, 'GTX 1070i', 2),
(2, 2, 'DDR4 RAM', 4),
(5, 3, 'lights', 0),
(6, 2, 'Gecko', 1),
(7, 2, 'DDR3 RAM', 0);

-- --------------------------------------------------------

--
-- Table structure for table `auto_supply_category`
--

CREATE TABLE `auto_supply_category` (
  `ascategory_id` int(11) NOT NULL,
  `ascategory_desc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auto_supply_category`
--

INSERT INTO `auto_supply_category` (`ascategory_id`, `ascategory_desc`) VALUES
(2, 'Engines'),
(3, 'Fuel System Part'),
(1, 'Mami'),
(4, 'Spark Plug Ignition System Part'),
(5, 'Transmission Part'),
(6, 'Valve Mechanism Part');

-- --------------------------------------------------------

--
-- Table structure for table `boundary_record`
--

CREATE TABLE `boundary_record` (
  `brecord_id` int(11) NOT NULL,
  `sched_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `for_date` date NOT NULL,
  `brecord_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `boundary_record`
--

INSERT INTO `boundary_record` (`brecord_id`, `sched_id`, `amount`, `for_date`, `brecord_type`) VALUES
(27, 217, '10.00', '2018-10-02', 2),
(28, 221, '2000.00', '2018-10-02', 1),
(29, 218, '15.00', '2018-10-02', 2),
(30, 258, '2000.00', '2018-11-06', 1),
(31, 262, '10.00', '2018-11-06', 2),
(32, 266, '12.00', '2018-11-06', 2),
(33, 233, '2000.00', '2018-10-20', 1),
(34, 236, '2500.00', '2018-10-20', 1),
(35, 235, '10.00', '2018-10-20', 2);

-- --------------------------------------------------------

--
-- Table structure for table `boundary_remittance`
--

CREATE TABLE `boundary_remittance` (
  `bremittance_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `date_received` datetime DEFAULT NULL,
  `confirmed` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `boundary_remittance`
--

INSERT INTO `boundary_remittance` (`bremittance_id`, `amount`, `staff_id`, `date_received`, `confirmed`) VALUES
(13, '2025.00', 4, '2018-10-20 17:52:23', 1),
(14, '7555.00', 4, '2018-10-20 17:52:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL,
  `brand_desc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `brand_desc`) VALUES
(33, 'Ferrari'),
(14, 'Hino'),
(13, 'Honda'),
(29, 'Lexus'),
(31, 'Lykan'),
(10, 'Mitsubishi'),
(26, 'Morales'),
(9, 'Sarao'),
(11, 'Toyota');

-- --------------------------------------------------------

--
-- Table structure for table `brand_unit_type`
--

CREATE TABLE `brand_unit_type` (
  `butype_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `unittype_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand_unit_type`
--

INSERT INTO `brand_unit_type` (`butype_id`, `brand_id`, `unittype_id`) VALUES
(22, 10, 1),
(23, 10, 2),
(24, 10, 3),
(25, 10, 4),
(26, 10, 5),
(27, 11, 4),
(29, 13, 2),
(30, 13, 3),
(31, 13, 4),
(32, 13, 5),
(33, 14, 1),
(37, 26, 1),
(38, 26, 2),
(39, 26, 3),
(40, 26, 4),
(41, 26, 5),
(42, 29, 4),
(47, 31, 4),
(55, 9, 3);

-- --------------------------------------------------------

--
-- Table structure for table `code_lift`
--

CREATE TABLE `code_lift` (
  `clift_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `for_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `code_lift`
--

INSERT INTO `code_lift` (`clift_id`, `route_id`, `for_date`) VALUES
(6, 46, '2018-10-03'),
(7, 42, '2018-10-03'),
(8, 44, '2018-10-03'),
(9, 45, '2018-10-03'),
(10, 48, '2018-10-03');

-- --------------------------------------------------------

--
-- Table structure for table `collector_notifs`
--

CREATE TABLE `collector_notifs` (
  `cn_id` int(11) NOT NULL,
  `cn_desc` varchar(1000) NOT NULL,
  `seen` int(11) NOT NULL,
  `for_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `collector_notifs`
--

INSERT INTO `collector_notifs` (`cn_id`, `cn_desc`, `seen`, `for_date`) VALUES
(1, 'Your 7555.00 remittance has been confirmed and collected!', 0, '2018-10-20 17:52:21'),
(2, 'Your 2025.00 remittance has been confirmed and collected!', 0, '2018-10-20 17:52:23');

-- --------------------------------------------------------

--
-- Table structure for table `dispatcher_notifs`
--

CREATE TABLE `dispatcher_notifs` (
  `dn_id` int(11) NOT NULL,
  `dn_desc` varchar(1000) NOT NULL,
  `seen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dispatching_record`
--

CREATE TABLE `dispatching_record` (
  `dispatching_id` int(11) NOT NULL,
  `sched_id` int(11) NOT NULL,
  `time_dispatched` timestamp NULL DEFAULT NULL,
  `staff_id` int(11) NOT NULL,
  `for_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dispatching_record`
--

INSERT INTO `dispatching_record` (`dispatching_id`, `sched_id`, `time_dispatched`, `staff_id`, `for_date`) VALUES
(23, 217, '2018-10-01 21:34:19', 3, '2018-10-02'),
(24, 221, '2018-10-01 21:34:21', 3, '2018-10-02'),
(25, 218, '2018-10-01 21:39:21', 3, '2018-10-02'),
(26, 266, '2018-11-06 06:35:23', 3, '2018-11-06'),
(27, 258, '2018-11-06 06:38:06', 3, '2018-11-06'),
(28, 262, '2018-11-06 06:38:18', 3, '2018-11-06'),
(29, 263, '2018-11-06 06:38:26', 3, '2018-11-06'),
(30, 233, '2018-10-18 17:43:44', 3, '2018-10-19'),
(31, 237, '2018-10-18 17:43:50', 3, '2018-10-19'),
(32, 234, '2018-10-18 17:43:52', 3, '2018-10-19'),
(33, 236, '2018-10-18 17:43:54', 3, '2018-10-19'),
(34, 239, '2018-10-18 17:43:56', 3, '2018-10-19'),
(35, 233, '2018-10-19 18:15:35', 3, '2018-10-20'),
(36, 236, '2018-10-19 19:19:39', 3, '2018-10-20'),
(37, 235, '2018-10-19 19:19:41', 3, '2018-10-20');

-- --------------------------------------------------------

--
-- Table structure for table `dispatch_inspection_record`
--

CREATE TABLE `dispatch_inspection_record` (
  `dispatch_inspection_id` int(11) NOT NULL,
  `sched_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `inspection_time` timestamp NULL DEFAULT NULL,
  `u_parts_inspection_id` int(11) DEFAULT NULL,
  `u_ef_inspection_id` int(11) DEFAULT NULL,
  `u_inspection_comment` varchar(200) DEFAULT NULL,
  `u_inspection_status` int(1) DEFAULT NULL,
  `for_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dispatch_inspection_record`
--

INSERT INTO `dispatch_inspection_record` (`dispatch_inspection_id`, `sched_id`, `staff_id`, `inspection_time`, `u_parts_inspection_id`, `u_ef_inspection_id`, `u_inspection_comment`, `u_inspection_status`, `for_date`) VALUES
(162, 217, 2, '2018-10-01 21:33:26', 82, 82, '', 1, '2018-10-02'),
(163, 218, 2, '2018-10-01 21:33:50', 84, 84, '', 1, '2018-10-02'),
(164, 219, 2, '2018-10-01 21:34:01', 86, 86, '', 0, '2018-10-02'),
(165, 220, NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-02'),
(166, 221, 2, '2018-10-01 21:33:36', 83, 83, '', 1, '2018-10-02'),
(167, 222, 2, '2018-10-01 21:33:55', 85, 85, '', 0, '2018-10-02'),
(168, 223, NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-02'),
(169, 224, NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-02'),
(170, 258, 2, '2018-11-06 06:36:25', 91, 91, '', 1, '2018-11-06'),
(171, 262, 2, '2018-11-06 06:36:38', 92, 92, '', 1, '2018-11-06'),
(172, 259, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-06'),
(173, 263, 2, '2018-11-06 06:37:32', 93, 93, '', 1, '2018-11-06'),
(174, 260, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-06'),
(175, 265, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-06'),
(176, 261, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-06'),
(177, 264, 2, '2018-11-06 06:31:47', 90, 90, '', 0, '2018-11-06'),
(178, 266, 2, '2018-11-06 06:30:05', 89, 89, '', 1, '2018-11-06'),
(179, 233, 2, '2018-10-18 17:39:26', 94, 94, '', 1, '2018-10-19'),
(180, 237, 2, '2018-10-18 17:39:39', 95, 95, '', 1, '2018-10-19'),
(181, 234, 2, '2018-10-18 17:39:52', 96, 96, '', 1, '2018-10-19'),
(182, 238, 2, '2018-10-18 17:39:56', 97, 97, '', 0, '2018-10-19'),
(183, 235, 2, '2018-10-18 17:40:00', 98, 98, '', 0, '2018-10-19'),
(184, 240, 2, '2018-10-18 17:40:07', 99, 99, '', 0, '2018-10-19'),
(185, 236, 2, '2018-10-18 17:41:02', 100, 100, '', 1, '2018-10-19'),
(186, 239, 2, '2018-10-18 17:41:16', 101, 101, '', 1, '2018-10-19'),
(187, 233, 2, '2018-10-19 18:14:40', 102, 102, '', 1, '2018-10-20'),
(188, 237, 2, '2018-10-19 19:12:34', 104, 104, '', 0, '2018-10-20'),
(189, 234, NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-20'),
(190, 238, NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-20'),
(191, 235, 2, '2018-10-19 19:13:02', 106, 106, '', 1, '2018-10-20'),
(192, 240, NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-20'),
(193, 236, 2, '2018-10-19 19:12:54', 105, 105, '', 1, '2018-10-20'),
(194, 239, NULL, NULL, NULL, NULL, NULL, NULL, '2018-10-20');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `driver_id` int(11) NOT NULL,
  `driver_fn` varchar(20) NOT NULL,
  `driver_mn` varchar(15) NOT NULL,
  `driver_ln` varchar(15) NOT NULL,
  `driver_type_id` int(11) DEFAULT NULL,
  `driver_pic` varchar(50) DEFAULT NULL,
  `driver_sex` varchar(7) NOT NULL,
  `driver_bday` date NOT NULL,
  `driver_address` varchar(50) NOT NULL,
  `driver_contact` varchar(11) NOT NULL,
  `driver_license` varchar(13) NOT NULL,
  `driver_licreg` date NOT NULL,
  `driver_licexp` date NOT NULL,
  `unit_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`driver_id`, `driver_fn`, `driver_mn`, `driver_ln`, `driver_type_id`, `driver_pic`, `driver_sex`, `driver_bday`, `driver_address`, `driver_contact`, `driver_license`, `driver_licreg`, `driver_licexp`, `unit_id`) VALUES
(17, 'Piolo', '', 'Sales', 1, 'NULL', 'Male', '2000-11-11', 'Sampaloc Manila', '09125562134', 'A12-00-111123', '2017-03-12', '2022-03-12', 11),
(18, 'Rosendo', '', 'de Guia', 1, 'NULL', 'Male', '1998-07-17', 'Tatalon Quezon City', '09353334515', 'B21-01-246421', '2017-03-21', '2022-03-21', 12),
(19, 'Roberto', '', 'Zulueta', 1, 'NULL', 'Male', '1999-02-09', 'Bulacan', '09208047723', 'W02-12-666126', '2017-04-21', '2022-04-21', 13),
(20, 'Jerevon', '', 'Carreon', 1, 'NULL', 'Male', '2000-11-11', 'Mandaluyong', '0909090909', 'M72-21-870000', '2017-08-05', '2022-08-05', 14),
(21, 'Joshua', '', 'Ganila', 2, 'NULL', 'Male', '1998-12-30', 'Pandacan', '09353334515', 'P09-22-135623', '2017-03-21', '2022-03-21', NULL),
(22, 'Carlo', '', 'Doronila', 2, 'NULL', 'Male', '1998-01-01', 'Muntinlupa', '09248712351', 'K12-25-981241', '2017-03-12', '2022-03-12', NULL),
(23, 'John Carlos ', '', 'Pgaduan', 1, 'NULL', 'Male', '1989-05-04', '554 Pureza Manila', '09123456789', 'K09-43-564658', '2017-02-24', '2022-02-24', 11),
(24, 'Jon Ervin', '', 'Balmaceda', 1, 'NULL', 'Male', '1987-04-24', 'A120 El Pueblo Manila', '09425378125', 'I99-24-134365', '2018-10-12', '2023-09-12', 12),
(25, 'Homer', '', 'Cadena', 1, 'NULL', 'Male', '1982-08-13', 'A121 El Pueblo', '09126382499', 'H13-23-849340', '2017-07-27', '2022-06-27', 16),
(26, 'Ralf', '', 'Sotelo', 1, 'NULL', 'Male', '1996-01-23', 'A122 El Pueblo Sta. Mesa Manila', '09183536472', 'R12-23-283224', '2014-02-06', '2019-02-06', 13),
(27, 'Lance Jeron', '', 'San Pablo', 2, 'NULL', 'Male', '1994-03-09', '1237 Sampaloc Manila', '09126436345', 'L83-34-237238', '2013-10-25', '2018-10-25', NULL),
(28, 'Ely', '', 'Austria', 1, 'NULL', 'Male', '1983-12-25', 'PUP', '09208047723', 'N01-18-031771', '2018-12-31', '2023-12-31', 16);

-- --------------------------------------------------------

--
-- Table structure for table `driver_type`
--

CREATE TABLE `driver_type` (
  `driver_type_id` int(11) NOT NULL,
  `driver_type_desc` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driver_type`
--

INSERT INTO `driver_type` (`driver_type_id`, `driver_type_desc`) VALUES
(1, 'Regular'),
(2, 'Reliever');

-- --------------------------------------------------------

--
-- Table structure for table `for_repair`
--

CREATE TABLE `for_repair` (
  `for_repairs_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `for_repairs_deadline` date DEFAULT NULL,
  `for_repairs_content` varchar(300) DEFAULT NULL,
  `for_repairs_status` varchar(15) NOT NULL,
  `recorded` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `for_repair`
--

INSERT INTO `for_repair` (`for_repairs_id`, `staff_id`, `unit_id`, `for_repairs_deadline`, `for_repairs_content`, `for_repairs_status`, `recorded`) VALUES
(14, NULL, 12, NULL, NULL, 'Warranty Repair', '2018-10-02'),
(15, NULL, 13, '2018-10-31', '', 'Fixed', '2018-10-02'),
(16, NULL, 11, NULL, NULL, 'Warranty Repair', '2018-10-20');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_type`
--

CREATE TABLE `maintenance_type` (
  `maintype_id` int(11) NOT NULL,
  `maintype_desc` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mechanic_notifs`
--

CREATE TABLE `mechanic_notifs` (
  `mn_id` int(11) NOT NULL,
  `mn_desc` varchar(1000) NOT NULL,
  `seen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `monthly_maintenance`
--

CREATE TABLE `monthly_maintenance` (
  `monthlymain_id` int(11) NOT NULL,
  `windshield_washer` tinyint(1) NOT NULL,
  `windshield_wiper` tinyint(1) NOT NULL,
  `brake_lights` tinyint(1) NOT NULL,
  `headlight_lights` tinyint(1) NOT NULL,
  `hazard_lights` tinyint(1) NOT NULL,
  `engine_belt` tinyint(1) NOT NULL,
  `engine_hoses` tinyint(1) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `schedmain_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `offense_category`
--

CREATE TABLE `offense_category` (
  `offensecat_id` int(11) NOT NULL,
  `offensecat_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offense_category`
--

INSERT INTO `offense_category` (`offensecat_id`, `offensecat_desc`) VALUES
(1, 'Boundary'),
(2, 'Damage');

-- --------------------------------------------------------

--
-- Table structure for table `offense_record`
--

CREATE TABLE `offense_record` (
  `offense_rec_id` int(11) NOT NULL,
  `penalty_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `mechanic_id` int(11) DEFAULT NULL,
  `penalty_amount` decimal(10,0) DEFAULT NULL,
  `for_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offense_record`
--

INSERT INTO `offense_record` (`offense_rec_id`, `penalty_id`, `driver_id`, `mechanic_id`, `penalty_amount`, `for_date`) VALUES
(1, 5, 17, 2, '3000', '2018-10-02'),
(2, 5, 19, 2, '2000', '2018-10-20'),
(3, 5, 20, 2, '200', '2018-10-20');

-- --------------------------------------------------------

--
-- Table structure for table `offense_remittance`
--

CREATE TABLE `offense_remittance` (
  `oremittance_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `date_received` datetime DEFAULT NULL,
  `confirmed` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_log`
--

CREATE TABLE `payment_log` (
  `plog_id` int(11) NOT NULL,
  `brecord_id` int(11) NOT NULL,
  `paid` decimal(10,2) NOT NULL,
  `plog_time` datetime NOT NULL,
  `staff_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_log`
--

INSERT INTO `payment_log` (`plog_id`, `brecord_id`, `paid`, `plog_time`, `staff_id`) VALUES
(20, 27, '10.00', '2018-10-02 05:56:36', 4),
(21, 28, '2000.00', '2018-10-02 05:56:52', 4),
(22, 29, '15.00', '2018-10-02 05:56:57', 4),
(23, 30, '1000.00', '2018-11-06 14:40:50', 4),
(24, 31, '20.00', '2018-11-06 14:41:45', 4),
(25, 33, '2000.00', '2018-10-20 17:51:35', 4),
(26, 34, '2500.00', '2018-10-20 17:51:41', 4),
(27, 35, '10.00', '2018-10-20 17:51:44', 4);

-- --------------------------------------------------------

--
-- Table structure for table `penalty`
--

CREATE TABLE `penalty` (
  `penalty_id` int(11) NOT NULL,
  `offensecat_id` int(11) NOT NULL,
  `offense_no` int(11) NOT NULL,
  `penalty_desc` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penalty`
--

INSERT INTO `penalty` (`penalty_id`, `offensecat_id`, `offense_no`, `penalty_desc`) VALUES
(1, 1, 1, '1 week suspension'),
(2, 1, 2, '1 month suspension'),
(3, 1, 3, '3 months suspension'),
(4, 1, 4, 'Termination of job'),
(5, 2, 1, '1 week suspension'),
(6, 2, 2, '1 month suspension'),
(7, 2, 3, '3 months suspension'),
(8, 2, 4, 'Termination of job');

-- --------------------------------------------------------

--
-- Table structure for table `penalty_payment_log`
--

CREATE TABLE `penalty_payment_log` (
  `pplog_id` int(11) NOT NULL,
  `offense_rec_id` int(11) NOT NULL,
  `paid` decimal(10,2) NOT NULL,
  `pplog_time` datetime NOT NULL,
  `staff_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quarterly_maintenance`
--

CREATE TABLE `quarterly_maintenance` (
  `quartmain_id` int(11) NOT NULL,
  `engine_oil` tinyint(1) NOT NULL,
  `engine_oil_filter` tinyint(1) NOT NULL,
  `steering_drag_link` tinyint(1) NOT NULL,
  `fuel_pump` tinyint(1) NOT NULL,
  `fuel_lines` tinyint(1) NOT NULL,
  `fuel_filter` tinyint(1) NOT NULL,
  `automatic_trans_fluid` tinyint(1) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `schedmain_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `repair_report`
--

CREATE TABLE `repair_report` (
  `repair_report_id` int(11) NOT NULL,
  `for_repair_id` int(11) NOT NULL,
  `repair_report_content` varchar(300) DEFAULT NULL,
  `repair_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `repair_report`
--

INSERT INTO `repair_report` (`repair_report_id`, `for_repair_id`, `repair_report_content`, `repair_status`) VALUES
(9, 15, 'okie', 1);

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `route_id` int(11) NOT NULL,
  `route_from` varchar(50) NOT NULL,
  `route_to` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`route_id`, `route_from`, `route_to`) VALUES
(50, 'Bacood', 'Quiapo'),
(46, 'Binangonan', 'JRU'),
(42, 'Boni', 'Stop and Shop'),
(49, 'Divisoria', 'Cubao'),
(44, 'Pasig', 'Quiapo'),
(45, 'Punta', 'Quiapo'),
(48, 'Vergara', 'Kalentong');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `sched_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `sctype_id` int(11) NOT NULL,
  `sched_from` date NOT NULL,
  `sched_to` date NOT NULL,
  `reliever_id` int(11) DEFAULT NULL,
  `relieve_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`sched_id`, `driver_id`, `unit_id`, `sctype_id`, `sched_from`, `sched_to`, `reliever_id`, `relieve_date`) VALUES
(217, 17, 11, 1, '2018-10-02', '2018-10-08', NULL, NULL),
(218, 18, 12, 1, '2018-10-02', '2018-10-08', NULL, NULL),
(219, 19, 13, 1, '2018-10-02', '2018-10-08', NULL, NULL),
(220, 20, 14, 1, '2018-10-02', '2018-10-08', NULL, NULL),
(221, 23, 11, 2, '2018-10-02', '2018-10-08', NULL, NULL),
(222, 24, 12, 2, '2018-10-02', '2018-10-08', NULL, NULL),
(223, 25, 14, 2, '2018-10-02', '2018-10-08', NULL, NULL),
(224, 26, 13, 2, '2018-10-02', '2018-10-08', 21, '2018-10-02'),
(225, 17, 11, 2, '2018-10-09', '2018-10-15', NULL, NULL),
(226, 18, 12, 2, '2018-10-09', '2018-10-15', NULL, NULL),
(227, 19, 13, 2, '2018-10-09', '2018-10-15', NULL, NULL),
(228, 20, 14, 2, '2018-10-09', '2018-10-15', NULL, NULL),
(229, 23, 11, 1, '2018-10-09', '2018-10-15', NULL, NULL),
(230, 24, 12, 1, '2018-10-09', '2018-10-15', NULL, NULL),
(231, 25, 14, 1, '2018-10-09', '2018-10-15', NULL, NULL),
(232, 26, 13, 1, '2018-10-09', '2018-10-15', NULL, NULL),
(233, 17, 11, 1, '2018-10-16', '2018-10-22', NULL, NULL),
(234, 18, 12, 1, '2018-10-16', '2018-10-22', NULL, NULL),
(235, 19, 13, 1, '2018-10-16', '2018-10-22', NULL, NULL),
(236, 20, 14, 1, '2018-10-16', '2018-10-22', NULL, NULL),
(237, 23, 11, 2, '2018-10-16', '2018-10-22', NULL, NULL),
(238, 24, 12, 2, '2018-10-16', '2018-10-22', NULL, NULL),
(239, 25, 14, 2, '2018-10-16', '2018-10-22', NULL, NULL),
(240, 26, 13, 2, '2018-10-16', '2018-10-22', NULL, NULL),
(241, 17, 11, 2, '2018-10-23', '2018-10-29', NULL, NULL),
(242, 18, 12, 2, '2018-10-23', '2018-10-29', NULL, NULL),
(243, 19, 13, 2, '2018-10-23', '2018-10-29', NULL, NULL),
(244, 20, 14, 2, '2018-10-23', '2018-10-29', NULL, NULL),
(245, 23, 11, 1, '2018-10-23', '2018-10-29', NULL, NULL),
(246, 24, 12, 1, '2018-10-23', '2018-10-29', NULL, NULL),
(247, 25, 14, 1, '2018-10-23', '2018-10-29', NULL, NULL),
(248, 26, 13, 1, '2018-10-23', '2018-10-29', NULL, NULL),
(249, 17, 11, 1, '2018-10-30', '2018-11-05', NULL, NULL),
(250, 18, 12, 1, '2018-10-30', '2018-11-05', NULL, NULL),
(251, 19, 13, 1, '2018-10-30', '2018-11-05', NULL, NULL),
(252, 20, 14, 1, '2018-10-30', '2018-11-05', NULL, NULL),
(253, 23, 11, 2, '2018-10-30', '2018-11-05', NULL, NULL),
(254, 24, 12, 2, '2018-10-30', '2018-11-05', NULL, NULL),
(255, 25, 14, 2, '2018-10-30', '2018-11-05', NULL, NULL),
(256, 26, 13, 2, '2018-10-30', '2018-11-05', NULL, NULL),
(257, 28, 16, 3, '2018-10-30', '2018-11-05', NULL, NULL),
(258, 17, 11, 2, '2018-11-06', '2018-11-12', NULL, NULL),
(259, 18, 12, 2, '2018-11-06', '2018-11-12', NULL, NULL),
(260, 19, 13, 2, '2018-11-06', '2018-11-12', NULL, NULL),
(261, 20, 14, 3, '2018-11-06', '2018-11-12', NULL, NULL),
(262, 23, 11, 1, '2018-11-06', '2018-11-12', NULL, NULL),
(263, 24, 12, 1, '2018-11-06', '2018-11-12', NULL, NULL),
(264, 25, 16, 1, '2018-11-06', '2018-11-12', NULL, NULL),
(265, 26, 13, 1, '2018-11-06', '2018-11-12', NULL, NULL),
(266, 28, 16, 1, '2018-11-06', '2018-11-12', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schedule_maintenance`
--

CREATE TABLE `schedule_maintenance` (
  `schedmain_id` int(11) NOT NULL,
  `maintype_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `unit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sched_type`
--

CREATE TABLE `sched_type` (
  `sctype_id` int(11) NOT NULL,
  `sctype_desc` varchar(20) NOT NULL,
  `sctype_from` time NOT NULL,
  `sctype_to` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sched_type`
--

INSERT INTO `sched_type` (`sctype_id`, `sctype_desc`, `sctype_from`, `sctype_to`) VALUES
(1, 'Morning', '03:00:00', '14:00:00'),
(2, 'Afternoon', '15:00:00', '02:00:00'),
(3, 'Whole Day', '04:00:00', '21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `staff_id` int(11) NOT NULL,
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
  `staff_password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`staff_id`, `staff_fn`, `staff_mn`, `staff_ln`, `staff_type_id`, `staff_pic`, `staff_sex`, `staff_bday`, `staff_address`, `staff_contact`, `staff_assignment_id`, `staff_password`) VALUES
(1, 'Matthew James ', 'Estoesta', 'Victore', 4, '', 'Male', '1998-07-08', '727 Int. 8 Bagumbayan St., Sta. Mesa, Manila', '09485733222', NULL, 'mattpogi'),
(2, 'Reannie Danielle', 'Cacal', 'Exiomo', 1, '', 'Female', '1999-04-18', 'Pinagbuhatan, Pasig City', '09353334515', 1, 'yanie'),
(3, 'Dummy', 'None', 'Dispatcher', 2, NULL, 'Male', '1994-07-01', 'Nowhere', '09123456789', 2, 'hello'),
(4, 'Dummy', 'None', 'Collector', 3, NULL, 'Male', '2018-08-23', 'Nowhere', '09123456789', 3, 'hello'),
(5, 'Dummy', 'None', 'Mechanic', 1, NULL, 'Male', '2018-08-31', 'Nowhere', '09123456789', 4, 'hello'),
(6, 'Juan', '', 'Dela Cruz', 2, NULL, 'Male', '1995-10-04', 'Nowhere', '09089090900', 5, 'jokelang'),
(7, 'Angelito', '', 'Casasis', 1, NULL, 'Male', '2017-06-13', 'Paranaque', '09425378125', 6, 'ang'),
(8, 'Princes Joi', '', 'Isaac', 3, NULL, 'Female', '2000-12-09', 'Pureza Manila', '09353334515', 7, 'ces');

-- --------------------------------------------------------

--
-- Table structure for table `staff_assignment`
--

CREATE TABLE `staff_assignment` (
  `s_assignment_id` int(11) NOT NULL,
  `Bus` tinyint(1) NOT NULL,
  `FX` tinyint(1) NOT NULL,
  `Jeep` tinyint(1) NOT NULL,
  `Taxi` tinyint(1) NOT NULL,
  `UV` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff_assignment`
--

INSERT INTO `staff_assignment` (`s_assignment_id`, `Bus`, `FX`, `Jeep`, `Taxi`, `UV`) VALUES
(1, 1, 1, 1, 1, 1),
(2, 1, 1, 1, 1, 1),
(3, 0, 1, 1, 1, 0),
(4, 0, 1, 1, 1, 1),
(5, 0, 0, 0, 0, 0),
(6, 0, 0, 0, 0, 0),
(7, 0, 0, 0, 0, 0),
(8, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `staff_type`
--

CREATE TABLE `staff_type` (
  `staff_type_id` int(11) NOT NULL,
  `staff_type_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff_type`
--

INSERT INTO `staff_type` (`staff_type_id`, `staff_type_desc`) VALUES
(3, 'Collector'),
(2, 'Dispatcher'),
(1, 'Mechanic'),
(4, 'Operator');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `tid` int(11) NOT NULL,
  `tdata` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL,
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
  `unit_plate_registration` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`unit_id`, `unittype_id`, `unitnum_id`, `unitroute_id`, `unit_capacity`, `unit_model`, `brand_id`, `unit_coding`, `unit_boundary_id`, `unit_warranty`, `unit_acquired`, `unit_plate_registration`) VALUES
(11, 5, 17, 17, 15, '2017', 26, 'Wednesday', 13, '2021-02-12', 2016, '2017-05-12'),
(12, 2, 18, 18, 21, '2017', 9, 'Monday', 14, '2022-11-10', 2017, '2017-08-07'),
(13, 4, 19, 19, 4, '2016', 11, 'Wednesday', 15, '2021-02-22', 2017, '2017-06-12'),
(14, 5, 20, 20, 12, '2016', 13, 'Monday', 16, '2021-09-09', 2018, '2018-06-04'),
(16, 3, 26, 22, 23, '2018', 26, 'Thursday', 18, '2023-12-25', 2018, '2018-08-16'),
(17, 3, 28, 23, 23, '2017', 26, 'Monday', 19, '2022-11-06', 2018, '2018-06-27'),
(18, 3, 29, 24, 19, '2015', 9, 'Monday', 20, '2020-10-10', 2015, '2015-11-10');

-- --------------------------------------------------------

--
-- Table structure for table `unit_body_inspection`
--

CREATE TABLE `unit_body_inspection` (
  `u_parts_inspection_id` int(11) NOT NULL,
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
  `cleanliness` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unit_body_inspection`
--

INSERT INTO `unit_body_inspection` (`u_parts_inspection_id`, `brake`, `light`, `mirror`, `horn`, `tires`, `steer`, `seatbelt`, `door`, `air_conditioning`, `body_condition`, `cleanliness`) VALUES
(82, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(83, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(84, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(87, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(88, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(89, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(90, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1),
(91, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(92, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(93, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(94, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(95, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(96, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(97, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(98, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(100, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(101, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(102, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(103, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(104, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(105, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(106, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(107, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `unit_boundary`
--

CREATE TABLE `unit_boundary` (
  `unit_boundary_id` int(11) NOT NULL,
  `unittype_id` int(11) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `morning_boundary` decimal(10,0) NOT NULL,
  `afternoon_boundary` decimal(10,0) NOT NULL,
  `wholeday_boundary` decimal(10,0) NOT NULL,
  `unit_boundary_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unit_boundary`
--

INSERT INTO `unit_boundary` (`unit_boundary_id`, `unittype_id`, `capacity`, `morning_boundary`, `afternoon_boundary`, `wholeday_boundary`, `unit_boundary_type`) VALUES
(13, NULL, NULL, '2000', '2000', '2500', 2),
(14, NULL, NULL, '1000', '1000', '1500', 2),
(15, NULL, NULL, '1500', '1500', '2000', 2),
(16, NULL, NULL, '2500', '2500', '3000', 2),
(17, NULL, NULL, '2000', '2000', '2000', 2),
(18, NULL, NULL, '1000', '1000', '1500', 2),
(19, NULL, NULL, '1500', '1500', '2000', 2),
(20, NULL, NULL, '2000', '2000', '2500', 2),
(21, NULL, NULL, '1500', '1500', '2000', 2);

-- --------------------------------------------------------

--
-- Table structure for table `unit_coding`
--

CREATE TABLE `unit_coding` (
  `unit_coding_id` int(11) NOT NULL,
  `unit_coding_no` int(11) NOT NULL,
  `unit_coding_day` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `unit_engine/fluid_inspection`
--

CREATE TABLE `unit_engine/fluid_inspection` (
  `u_ef_inspection_id` int(11) NOT NULL,
  `fuel` varchar(9) NOT NULL,
  `engine_oil` varchar(9) NOT NULL,
  `brake_fluid` varchar(9) NOT NULL,
  `battery_charge` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unit_engine/fluid_inspection`
--

INSERT INTO `unit_engine/fluid_inspection` (`u_ef_inspection_id`, `fuel`, `engine_oil`, `brake_fluid`, `battery_charge`) VALUES
(82, 'High', 'High', 'High', 'High'),
(83, 'High', 'High', 'High', 'High'),
(84, 'High', 'High', 'High', 'High'),
(85, 'undefined', 'undefined', 'undefined', 'undefined'),
(86, 'undefined', 'undefined', 'undefined', 'undefined'),
(87, 'Low', 'Low', 'Low', 'Low'),
(88, 'High', 'High', 'High', 'High'),
(89, 'High', 'High', 'High', 'High'),
(90, 'Low', 'Low', 'Low', 'Low'),
(91, 'High', 'High', 'High', 'High'),
(92, 'High', 'High', 'High', 'High'),
(93, 'High', 'High', 'High', 'High'),
(94, 'High', 'High', 'High', 'High'),
(95, 'High', 'High', 'High', 'High'),
(96, 'High', 'High', 'High', 'High'),
(97, 'undefined', 'undefined', 'undefined', 'undefined'),
(98, 'undefined', 'undefined', 'undefined', 'undefined'),
(99, 'undefined', 'undefined', 'undefined', 'undefined'),
(100, 'undefined', 'undefined', 'undefined', 'undefined'),
(101, 'undefined', 'undefined', 'undefined', 'undefined'),
(102, 'High', 'High', 'High', 'High'),
(103, 'High', 'High', 'High', 'High'),
(104, 'undefined', 'undefined', 'undefined', 'undefined'),
(105, 'High', 'High', 'High', 'High'),
(106, 'undefined', 'undefined', 'undefined', 'undefined'),
(107, 'undefined', 'undefined', 'undefined', 'undefined'),
(108, 'undefined', 'undefined', 'undefined', 'undefined');

-- --------------------------------------------------------

--
-- Table structure for table `unit_number`
--

CREATE TABLE `unit_number` (
  `unitnum_id` int(11) NOT NULL,
  `unitplate_no` varchar(11) NOT NULL,
  `unitchassi_no` varchar(11) DEFAULT NULL,
  `unitengine_no` varchar(11) NOT NULL,
  `unitbody_no` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unit_number`
--

INSERT INTO `unit_number` (`unitnum_id`, `unitplate_no`, `unitchassi_no`, `unitengine_no`, `unitbody_no`) VALUES
(17, 'ABC 1234', '123XFG', 'AS12TDA', '1ASD241DFHG'),
(18, 'EFG 9021', '61SAAS', 'LK3J1F1', 'TYA123FDFG3'),
(19, 'PWU 1235', '1225AS', 'JHFCVX2', '12HGF23KJH1'),
(20, 'TYU 0921', '33SDF6', 'ASBNBY1', 'ASYUD123JH3'),
(26, 'ABC 1235', '123512', 'FD251AS', 'AS2124ASDGF'),
(28, 'JKL 0271', '125121', 'ASDHFG2', 'JKA214LSKDF'),
(29, 'MAT 0911', '126SDF', 'JAS81CD', 'K12VKASKJ45'),
(30, 'PAT 1262', 'N1FJG2', 'JDGS126', 'AS2B932SDJF');

-- --------------------------------------------------------

--
-- Table structure for table `unit_route`
--

CREATE TABLE `unit_route` (
  `unitroute_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `unitroute_registered` date NOT NULL,
  `unitroute_expiration` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unit_route`
--

INSERT INTO `unit_route` (`unitroute_id`, `route_id`, `unitroute_registered`, `unitroute_expiration`) VALUES
(17, 46, '2017-10-12', '2022-10-12'),
(18, 42, '2018-10-20', '2023-10-20'),
(19, 48, '2018-10-27', '2023-10-27'),
(20, 44, '2018-10-30', '2023-10-30'),
(21, 46, '1223-04-12', '1228-04-12'),
(22, 49, '2018-09-12', '2023-09-12'),
(23, 49, '2018-02-13', '2023-02-13'),
(24, 49, '2015-11-11', '2020-11-11'),
(25, 50, '2017-11-01', '2022-11-01');

-- --------------------------------------------------------

--
-- Table structure for table `unit_type`
--

CREATE TABLE `unit_type` (
  `unittype_id` int(11) NOT NULL,
  `unittype_desc` varchar(15) NOT NULL,
  `unittype_status` tinyint(1) NOT NULL,
  `unittype_minimum` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unit_type`
--

INSERT INTO `unit_type` (`unittype_id`, `unittype_desc`, `unittype_status`, `unittype_minimum`) VALUES
(1, 'Bus', 0, '10.00'),
(2, 'FX', 1, '10.00'),
(3, 'Jeep', 1, '10.00'),
(4, 'Taxi', 1, '10.00'),
(5, 'UV', 1, '10.00');

-- --------------------------------------------------------

--
-- Table structure for table `weekly_maintenance`
--

CREATE TABLE `weekly_maintenance` (
  `weeklymain_id` int(11) NOT NULL,
  `steering_wheel` tinyint(1) NOT NULL,
  `tire_air _pressure` tinyint(1) NOT NULL,
  `tire_tread_depth` tinyint(1) NOT NULL,
  `transmission` tinyint(1) NOT NULL,
  `clutch` tinyint(1) NOT NULL,
  `hand_brake` tinyint(1) NOT NULL,
  `foot_brake` tinyint(1) NOT NULL,
  `engine _noises` tinyint(1) NOT NULL,
  `exhaust` tinyint(1) NOT NULL,
  `leak_check` tinyint(1) NOT NULL,
  `cleanliness_interior` tinyint(1) NOT NULL,
  `cleanliness_exterior` tinyint(1) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `schedmain_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_notifs`
--
ALTER TABLE `admin_notifs`
  ADD PRIMARY KEY (`an_id`);

--
-- Indexes for table `annual_maintenance`
--
ALTER TABLE `annual_maintenance`
  ADD PRIMARY KEY (`annualmain_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `annual_maintenance_ibfk_2` (`schedmain_id`);

--
-- Indexes for table `arrival_inspection_record`
--
ALTER TABLE `arrival_inspection_record`
  ADD PRIMARY KEY (`arrival_inspection_id`),
  ADD KEY `sched_id` (`sched_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `u_parts_inspection_id` (`u_parts_inspection_id`),
  ADD KEY `u_ef_inspection_id` (`u_ef_inspection_id`);

--
-- Indexes for table `arrival_record`
--
ALTER TABLE `arrival_record`
  ADD PRIMARY KEY (`arrival_id`),
  ADD KEY `sched_id` (`sched_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `auto_supply`
--
ALTER TABLE `auto_supply`
  ADD PRIMARY KEY (`asupply_id`),
  ADD UNIQUE KEY `asupply_desc` (`asupply_desc`),
  ADD KEY `ascategory_id` (`ascategory_id`);

--
-- Indexes for table `auto_supply_category`
--
ALTER TABLE `auto_supply_category`
  ADD PRIMARY KEY (`ascategory_id`),
  ADD UNIQUE KEY `ascategory_desc` (`ascategory_desc`);

--
-- Indexes for table `boundary_record`
--
ALTER TABLE `boundary_record`
  ADD PRIMARY KEY (`brecord_id`),
  ADD KEY `sched_id` (`sched_id`);

--
-- Indexes for table `boundary_remittance`
--
ALTER TABLE `boundary_remittance`
  ADD PRIMARY KEY (`bremittance_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`),
  ADD UNIQUE KEY `brand_desc` (`brand_desc`);

--
-- Indexes for table `brand_unit_type`
--
ALTER TABLE `brand_unit_type`
  ADD PRIMARY KEY (`butype_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `unittype_id` (`unittype_id`);

--
-- Indexes for table `code_lift`
--
ALTER TABLE `code_lift`
  ADD PRIMARY KEY (`clift_id`),
  ADD KEY `route_id` (`route_id`);

--
-- Indexes for table `collector_notifs`
--
ALTER TABLE `collector_notifs`
  ADD PRIMARY KEY (`cn_id`);

--
-- Indexes for table `dispatcher_notifs`
--
ALTER TABLE `dispatcher_notifs`
  ADD PRIMARY KEY (`dn_id`);

--
-- Indexes for table `dispatching_record`
--
ALTER TABLE `dispatching_record`
  ADD PRIMARY KEY (`dispatching_id`),
  ADD KEY `sched_id` (`sched_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `dispatch_inspection_record`
--
ALTER TABLE `dispatch_inspection_record`
  ADD PRIMARY KEY (`dispatch_inspection_id`),
  ADD KEY `u_ef_inspection_id` (`u_ef_inspection_id`),
  ADD KEY `u_parts_inspection_id` (`u_parts_inspection_id`),
  ADD KEY `sched_id` (`sched_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`driver_id`,`driver_fn`,`driver_mn`,`driver_ln`),
  ADD UNIQUE KEY `driver_license` (`driver_license`),
  ADD KEY `driver_type_id` (`driver_type_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `driver_type`
--
ALTER TABLE `driver_type`
  ADD PRIMARY KEY (`driver_type_id`),
  ADD UNIQUE KEY `driver_type_desc` (`driver_type_desc`);

--
-- Indexes for table `for_repair`
--
ALTER TABLE `for_repair`
  ADD PRIMARY KEY (`for_repairs_id`);

--
-- Indexes for table `maintenance_type`
--
ALTER TABLE `maintenance_type`
  ADD PRIMARY KEY (`maintype_id`);

--
-- Indexes for table `mechanic_notifs`
--
ALTER TABLE `mechanic_notifs`
  ADD PRIMARY KEY (`mn_id`);

--
-- Indexes for table `monthly_maintenance`
--
ALTER TABLE `monthly_maintenance`
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `monthly_maintenance_ibfk_2` (`schedmain_id`);

--
-- Indexes for table `offense_category`
--
ALTER TABLE `offense_category`
  ADD PRIMARY KEY (`offensecat_id`),
  ADD UNIQUE KEY `offensecat_desc` (`offensecat_desc`);

--
-- Indexes for table `offense_record`
--
ALTER TABLE `offense_record`
  ADD PRIMARY KEY (`offense_rec_id`),
  ADD KEY `penalty_id` (`penalty_id`),
  ADD KEY `staff_id` (`mechanic_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `offense_remittance`
--
ALTER TABLE `offense_remittance`
  ADD PRIMARY KEY (`oremittance_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `payment_log`
--
ALTER TABLE `payment_log`
  ADD PRIMARY KEY (`plog_id`),
  ADD KEY `brecord_id` (`brecord_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `penalty`
--
ALTER TABLE `penalty`
  ADD PRIMARY KEY (`penalty_id`),
  ADD KEY `offensecat_id` (`offensecat_id`);

--
-- Indexes for table `penalty_payment_log`
--
ALTER TABLE `penalty_payment_log`
  ADD PRIMARY KEY (`pplog_id`),
  ADD KEY `offense_rec_id` (`offense_rec_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `quarterly_maintenance`
--
ALTER TABLE `quarterly_maintenance`
  ADD PRIMARY KEY (`quartmain_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `mainsched_id` (`schedmain_id`);

--
-- Indexes for table `repair_report`
--
ALTER TABLE `repair_report`
  ADD PRIMARY KEY (`repair_report_id`),
  ADD KEY `for_repair_id` (`for_repair_id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`route_id`),
  ADD UNIQUE KEY `route_from` (`route_from`,`route_to`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`sched_id`),
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `sctype_id` (`sctype_id`),
  ADD KEY `reliever_id` (`reliever_id`);

--
-- Indexes for table `schedule_maintenance`
--
ALTER TABLE `schedule_maintenance`
  ADD PRIMARY KEY (`schedmain_id`),
  ADD KEY `maintype_id` (`maintype_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `sched_type`
--
ALTER TABLE `sched_type`
  ADD PRIMARY KEY (`sctype_id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`staff_id`,`staff_fn`,`staff_mn`,`staff_ln`),
  ADD KEY `staff_assignment_id` (`staff_assignment_id`),
  ADD KEY `staff_type_id` (`staff_type_id`);

--
-- Indexes for table `staff_assignment`
--
ALTER TABLE `staff_assignment`
  ADD PRIMARY KEY (`s_assignment_id`);

--
-- Indexes for table `staff_type`
--
ALTER TABLE `staff_type`
  ADD PRIMARY KEY (`staff_type_id`),
  ADD UNIQUE KEY `staff_type_desc` (`staff_type_desc`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`unit_id`),
  ADD KEY `unittype_id` (`unittype_id`),
  ADD KEY `unitnum_id` (`unitnum_id`),
  ADD KEY `unitroute_id` (`unitroute_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `unit_boundary_id` (`unit_boundary_id`);

--
-- Indexes for table `unit_body_inspection`
--
ALTER TABLE `unit_body_inspection`
  ADD PRIMARY KEY (`u_parts_inspection_id`);

--
-- Indexes for table `unit_boundary`
--
ALTER TABLE `unit_boundary`
  ADD PRIMARY KEY (`unit_boundary_id`),
  ADD KEY `unittype_id` (`unittype_id`);

--
-- Indexes for table `unit_coding`
--
ALTER TABLE `unit_coding`
  ADD PRIMARY KEY (`unit_coding_id`);

--
-- Indexes for table `unit_engine/fluid_inspection`
--
ALTER TABLE `unit_engine/fluid_inspection`
  ADD PRIMARY KEY (`u_ef_inspection_id`);

--
-- Indexes for table `unit_number`
--
ALTER TABLE `unit_number`
  ADD PRIMARY KEY (`unitnum_id`),
  ADD UNIQUE KEY `unitplate_no` (`unitplate_no`),
  ADD UNIQUE KEY `unitengine_no` (`unitengine_no`),
  ADD UNIQUE KEY `unitbody_no` (`unitbody_no`),
  ADD UNIQUE KEY `unitchassi_no` (`unitchassi_no`);

--
-- Indexes for table `unit_route`
--
ALTER TABLE `unit_route`
  ADD PRIMARY KEY (`unitroute_id`),
  ADD KEY `route_id` (`route_id`);

--
-- Indexes for table `unit_type`
--
ALTER TABLE `unit_type`
  ADD PRIMARY KEY (`unittype_id`),
  ADD UNIQUE KEY `unittype_desc` (`unittype_desc`);

--
-- Indexes for table `weekly_maintenance`
--
ALTER TABLE `weekly_maintenance`
  ADD PRIMARY KEY (`weeklymain_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `mainsched_id` (`schedmain_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_notifs`
--
ALTER TABLE `admin_notifs`
  MODIFY `an_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `annual_maintenance`
--
ALTER TABLE `annual_maintenance`
  MODIFY `annualmain_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `arrival_inspection_record`
--
ALTER TABLE `arrival_inspection_record`
  MODIFY `arrival_inspection_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `arrival_record`
--
ALTER TABLE `arrival_record`
  MODIFY `arrival_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `auto_supply`
--
ALTER TABLE `auto_supply`
  MODIFY `asupply_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `auto_supply_category`
--
ALTER TABLE `auto_supply_category`
  MODIFY `ascategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `boundary_record`
--
ALTER TABLE `boundary_record`
  MODIFY `brecord_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `boundary_remittance`
--
ALTER TABLE `boundary_remittance`
  MODIFY `bremittance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `brand_unit_type`
--
ALTER TABLE `brand_unit_type`
  MODIFY `butype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `code_lift`
--
ALTER TABLE `code_lift`
  MODIFY `clift_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `collector_notifs`
--
ALTER TABLE `collector_notifs`
  MODIFY `cn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `dispatcher_notifs`
--
ALTER TABLE `dispatcher_notifs`
  MODIFY `dn_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dispatching_record`
--
ALTER TABLE `dispatching_record`
  MODIFY `dispatching_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `dispatch_inspection_record`
--
ALTER TABLE `dispatch_inspection_record`
  MODIFY `dispatch_inspection_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;
--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `driver_type`
--
ALTER TABLE `driver_type`
  MODIFY `driver_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `for_repair`
--
ALTER TABLE `for_repair`
  MODIFY `for_repairs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `maintenance_type`
--
ALTER TABLE `maintenance_type`
  MODIFY `maintype_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mechanic_notifs`
--
ALTER TABLE `mechanic_notifs`
  MODIFY `mn_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `offense_category`
--
ALTER TABLE `offense_category`
  MODIFY `offensecat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `offense_record`
--
ALTER TABLE `offense_record`
  MODIFY `offense_rec_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `offense_remittance`
--
ALTER TABLE `offense_remittance`
  MODIFY `oremittance_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_log`
--
ALTER TABLE `payment_log`
  MODIFY `plog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `penalty`
--
ALTER TABLE `penalty`
  MODIFY `penalty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `penalty_payment_log`
--
ALTER TABLE `penalty_payment_log`
  MODIFY `pplog_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `quarterly_maintenance`
--
ALTER TABLE `quarterly_maintenance`
  MODIFY `quartmain_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `repair_report`
--
ALTER TABLE `repair_report`
  MODIFY `repair_report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `sched_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;
--
-- AUTO_INCREMENT for table `schedule_maintenance`
--
ALTER TABLE `schedule_maintenance`
  MODIFY `schedmain_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sched_type`
--
ALTER TABLE `sched_type`
  MODIFY `sctype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `staff_assignment`
--
ALTER TABLE `staff_assignment`
  MODIFY `s_assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `staff_type`
--
ALTER TABLE `staff_type`
  MODIFY `staff_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `unit_body_inspection`
--
ALTER TABLE `unit_body_inspection`
  MODIFY `u_parts_inspection_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;
--
-- AUTO_INCREMENT for table `unit_boundary`
--
ALTER TABLE `unit_boundary`
  MODIFY `unit_boundary_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `unit_coding`
--
ALTER TABLE `unit_coding`
  MODIFY `unit_coding_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unit_engine/fluid_inspection`
--
ALTER TABLE `unit_engine/fluid_inspection`
  MODIFY `u_ef_inspection_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;
--
-- AUTO_INCREMENT for table `unit_number`
--
ALTER TABLE `unit_number`
  MODIFY `unitnum_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `unit_route`
--
ALTER TABLE `unit_route`
  MODIFY `unitroute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `unit_type`
--
ALTER TABLE `unit_type`
  MODIFY `unittype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `weekly_maintenance`
--
ALTER TABLE `weekly_maintenance`
  MODIFY `weeklymain_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `annual_maintenance`
--
ALTER TABLE `annual_maintenance`
  ADD CONSTRAINT `annual_maintenance_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `annual_maintenance_ibfk_2` FOREIGN KEY (`schedmain_id`) REFERENCES `schedule_maintenance` (`schedmain_id`) ON UPDATE CASCADE;

--
-- Constraints for table `arrival_inspection_record`
--
ALTER TABLE `arrival_inspection_record`
  ADD CONSTRAINT `arrival_inspection_record_ibfk_1` FOREIGN KEY (`sched_id`) REFERENCES `schedule` (`sched_id`),
  ADD CONSTRAINT `arrival_inspection_record_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`),
  ADD CONSTRAINT `arrival_inspection_record_ibfk_3` FOREIGN KEY (`u_parts_inspection_id`) REFERENCES `unit_body_inspection` (`u_parts_inspection_id`),
  ADD CONSTRAINT `arrival_inspection_record_ibfk_4` FOREIGN KEY (`u_ef_inspection_id`) REFERENCES `unit_engine/fluid_inspection` (`u_ef_inspection_id`);

--
-- Constraints for table `arrival_record`
--
ALTER TABLE `arrival_record`
  ADD CONSTRAINT `arrival_record_ibfk_1` FOREIGN KEY (`sched_id`) REFERENCES `schedule` (`sched_id`),
  ADD CONSTRAINT `arrival_record_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`);

--
-- Constraints for table `auto_supply`
--
ALTER TABLE `auto_supply`
  ADD CONSTRAINT `auto_supply_ibfk_1` FOREIGN KEY (`ascategory_id`) REFERENCES `auto_supply_category` (`ascategory_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `boundary_record`
--
ALTER TABLE `boundary_record`
  ADD CONSTRAINT `boundary_record_ibfk_1` FOREIGN KEY (`sched_id`) REFERENCES `schedule` (`sched_id`);

--
-- Constraints for table `boundary_remittance`
--
ALTER TABLE `boundary_remittance`
  ADD CONSTRAINT `boundary_remittance_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`);

--
-- Constraints for table `brand_unit_type`
--
ALTER TABLE `brand_unit_type`
  ADD CONSTRAINT `brand_unit_type_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`),
  ADD CONSTRAINT `brand_unit_type_ibfk_2` FOREIGN KEY (`unittype_id`) REFERENCES `unit_type` (`unittype_id`);

--
-- Constraints for table `code_lift`
--
ALTER TABLE `code_lift`
  ADD CONSTRAINT `code_lift_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`);

--
-- Constraints for table `dispatching_record`
--
ALTER TABLE `dispatching_record`
  ADD CONSTRAINT `dispatching_record_ibfk_1` FOREIGN KEY (`sched_id`) REFERENCES `schedule` (`sched_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dispatching_record_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`) ON UPDATE CASCADE;

--
-- Constraints for table `dispatch_inspection_record`
--
ALTER TABLE `dispatch_inspection_record`
  ADD CONSTRAINT `dispatch_inspection_record_ibfk_1` FOREIGN KEY (`u_ef_inspection_id`) REFERENCES `unit_engine/fluid_inspection` (`u_ef_inspection_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dispatch_inspection_record_ibfk_2` FOREIGN KEY (`u_parts_inspection_id`) REFERENCES `unit_body_inspection` (`u_parts_inspection_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dispatch_inspection_record_ibfk_3` FOREIGN KEY (`sched_id`) REFERENCES `schedule` (`sched_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dispatch_inspection_record_ibfk_4` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`);

--
-- Constraints for table `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `drivers_ibfk_1` FOREIGN KEY (`driver_type_id`) REFERENCES `driver_type` (`driver_type_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `drivers_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`unit_id`) ON UPDATE CASCADE;

--
-- Constraints for table `monthly_maintenance`
--
ALTER TABLE `monthly_maintenance`
  ADD CONSTRAINT `monthly_maintenance_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `monthly_maintenance_ibfk_2` FOREIGN KEY (`schedmain_id`) REFERENCES `schedule_maintenance` (`schedmain_id`) ON UPDATE CASCADE;

--
-- Constraints for table `offense_record`
--
ALTER TABLE `offense_record`
  ADD CONSTRAINT `offense_record_ibfk_2` FOREIGN KEY (`penalty_id`) REFERENCES `penalty` (`penalty_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `offense_record_ibfk_3` FOREIGN KEY (`mechanic_id`) REFERENCES `staffs` (`staff_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `offense_record_ibfk_4` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`);

--
-- Constraints for table `offense_remittance`
--
ALTER TABLE `offense_remittance`
  ADD CONSTRAINT `offense_remittance_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`);

--
-- Constraints for table `payment_log`
--
ALTER TABLE `payment_log`
  ADD CONSTRAINT `payment_log_ibfk_1` FOREIGN KEY (`brecord_id`) REFERENCES `boundary_record` (`brecord_id`),
  ADD CONSTRAINT `payment_log_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`),
  ADD CONSTRAINT `payment_log_ibfk_3` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`);

--
-- Constraints for table `penalty`
--
ALTER TABLE `penalty`
  ADD CONSTRAINT `penalty_ibfk_1` FOREIGN KEY (`offensecat_id`) REFERENCES `offense_category` (`offensecat_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penalty_payment_log`
--
ALTER TABLE `penalty_payment_log`
  ADD CONSTRAINT `penalty_payment_log_ibfk_1` FOREIGN KEY (`offense_rec_id`) REFERENCES `offense_record` (`offense_rec_id`),
  ADD CONSTRAINT `penalty_payment_log_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`);

--
-- Constraints for table `quarterly_maintenance`
--
ALTER TABLE `quarterly_maintenance`
  ADD CONSTRAINT `quarterly_maintenance_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `quarterly_maintenance_ibfk_2` FOREIGN KEY (`schedmain_id`) REFERENCES `schedule_maintenance` (`schedmain_id`);

--
-- Constraints for table `repair_report`
--
ALTER TABLE `repair_report`
  ADD CONSTRAINT `repair_report_ibfk_2` FOREIGN KEY (`for_repair_id`) REFERENCES `for_repair` (`for_repairs_id`) ON UPDATE CASCADE;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`unit_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`sctype_id`) REFERENCES `sched_type` (`sctype_id`),
  ADD CONSTRAINT `schedule_ibfk_4` FOREIGN KEY (`reliever_id`) REFERENCES `drivers` (`driver_id`);

--
-- Constraints for table `schedule_maintenance`
--
ALTER TABLE `schedule_maintenance`
  ADD CONSTRAINT `schedule_maintenance_ibfk_1` FOREIGN KEY (`maintype_id`) REFERENCES `maintenance_type` (`maintype_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `schedule_maintenance_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`unit_id`) ON UPDATE CASCADE;

--
-- Constraints for table `staffs`
--
ALTER TABLE `staffs`
  ADD CONSTRAINT `staffs_ibfk_1` FOREIGN KEY (`staff_assignment_id`) REFERENCES `staff_assignment` (`s_assignment_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `staffs_ibfk_2` FOREIGN KEY (`staff_type_id`) REFERENCES `staff_type` (`staff_type_id`) ON UPDATE CASCADE;

--
-- Constraints for table `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`unittype_id`) REFERENCES `unit_type` (`unittype_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `unit_ibfk_2` FOREIGN KEY (`unitnum_id`) REFERENCES `unit_number` (`unitnum_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `unit_ibfk_3` FOREIGN KEY (`unitroute_id`) REFERENCES `unit_route` (`unitroute_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `unit_ibfk_4` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `unit_ibfk_5` FOREIGN KEY (`unit_boundary_id`) REFERENCES `unit_boundary` (`unit_boundary_id`) ON UPDATE CASCADE;

--
-- Constraints for table `unit_boundary`
--
ALTER TABLE `unit_boundary`
  ADD CONSTRAINT `unit_boundary_ibfk_1` FOREIGN KEY (`unittype_id`) REFERENCES `unit_type` (`unittype_id`);

--
-- Constraints for table `unit_route`
--
ALTER TABLE `unit_route`
  ADD CONSTRAINT `unit_route_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`);

--
-- Constraints for table `weekly_maintenance`
--
ALTER TABLE `weekly_maintenance`
  ADD CONSTRAINT `weekly_maintenance_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `weekly_maintenance_ibfk_2` FOREIGN KEY (`schedmain_id`) REFERENCES `schedule_maintenance` (`schedmain_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
