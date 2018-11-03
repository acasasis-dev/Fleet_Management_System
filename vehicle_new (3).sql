-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2018 at 04:17 PM
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
-- Database: `vehicle_new`
--

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
  `paid` double(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `for_date` date NOT NULL,
  `staff_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `boundary_remittance`
--

CREATE TABLE `boundary_remittance` (
  `bremittance_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `for_date` date NOT NULL,
  `confirmed` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(4, 'Sarao'),
(5, 'Mitsubishi'),
(6, 'Toyota'),
(7, 'Honda'),
(9, 'Hello'),
(15, 'New Brand'),
(16, 'Matt'),
(17, 'Jerevon'),
(18, 'Lexus');

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
(4, 4, 3),
(5, 5, 2),
(6, 5, 3),
(7, 5, 4),
(8, 5, 5),
(9, 6, 2),
(10, 6, 4),
(11, 6, 5),
(12, 7, 2),
(13, 7, 3),
(14, 7, 4),
(15, 7, 5),
(16, 9, 2),
(17, 9, 3),
(18, 9, 4),
(19, 9, 5),
(20, 15, 2),
(21, 15, 3),
(22, 16, 2),
(23, 16, 4),
(24, 17, 2),
(25, 17, 3),
(26, 17, 4),
(27, 17, 5),
(28, 18, 4);

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
(1, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-24'),
(2, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-24'),
(3, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-25'),
(4, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-25'),
(5, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2018-09-25');

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
  `driver_license` varchar(7) NOT NULL,
  `driver_licreg` date NOT NULL,
  `driver_licexp` date NOT NULL,
  `unit_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`driver_id`, `driver_fn`, `driver_mn`, `driver_ln`, `driver_type_id`, `driver_pic`, `driver_sex`, `driver_bday`, `driver_address`, `driver_contact`, `driver_license`, `driver_licreg`, `driver_licexp`, `unit_id`) VALUES
(1, 'Jerevon', 'None', 'Carreon', 1, 'NULL', 'Male', '1999-05-13', '498 Neptali Gonzales St Mandaluyong City', '09208047723', '656565', '2018-08-26', '2023-08-26', 3),
(2, 'Roberto', 'Joaqin', 'Zulueta', 2, 'NULL', 'Male', '1999-12-12', '123 Sapang Palay Bulacan', '09126127311', '127239', '2016-03-15', '2021-03-15', NULL),
(3, 'Sendo', 'Roque', 'de Guia', 1, 'NULL', 'Male', '1998-08-17', 'Molino Cavite', '09784219203', '984710', '2013-02-28', '2018-02-28', 2),
(4, 'Piolo', 'Sal', 'Sales', 1, 'NULL', 'Male', '2000-12-25', 'Sampaloc Manila', '09222881261', '1236134', '2018-09-11', '2023-09-11', 1),
(5, 'Vince', 'Ortega', 'Oreta', 1, 'NULL', 'Male', '1999-04-04', 'Antipolo', '09163561235', '091235', '2018-06-01', '2023-06-01', 4);

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
  `for_repairs_deadline` date NOT NULL,
  `for_repairs_content` varchar(300) NOT NULL,
  `for_repairs_status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `for_repair`
--

INSERT INTO `for_repair` (`for_repairs_id`, `staff_id`, `unit_id`, `for_repairs_deadline`, `for_repairs_content`, `for_repairs_status`) VALUES
(3, 2, 6, '2018-08-30', 'Needed ASAP', 'Fixed'),
(4, NULL, 6, '2018-09-06', 'NEEDED ASAP SOONER BETTER', 'Pending');

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
  `mechanic_id` int(11) NOT NULL,
  `penalty_amount` decimal(10,0) DEFAULT NULL,
  `paid` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `for_date` date NOT NULL,
  `collector_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `offense_remittance`
--

CREATE TABLE `offense_remittance` (
  `oremittance_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `for_date` date NOT NULL,
  `confirmed` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penalty`
--

CREATE TABLE `penalty` (
  `penalty_id` int(11) NOT NULL,
  `offensecat_id` int(11) NOT NULL,
  `offense_no` varchar(10) NOT NULL,
  `penalty_desc` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penalty`
--

INSERT INTO `penalty` (`penalty_id`, `offensecat_id`, `offense_no`, `penalty_desc`) VALUES
(1, 1, '1st', '1 week suspension'),
(2, 1, '2nd', '1 month suspension'),
(3, 1, '3rd', '3 months suspension'),
(4, 1, 'Final', 'Termination of job'),
(5, 2, '1st', '1 week suspension'),
(6, 2, '2nd', '1 month suspension'),
(7, 2, '3rd', '3 months suspension'),
(8, 2, 'Final', 'Termination of job');

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
(1, 'Punta', 'Quiapo'),
(2, 'Pasig', 'Quiapo'),
(3, 'Boni', 'Stop&Shop'),
(4, 'Sulu', 'Marawi'),
(5, 'Vergara', 'Kalentong');

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
(1, 1, 3, 3, '2018-09-24', '2018-09-30', 2, '2018-09-25'),
(2, 3, 2, 3, '2018-09-24', '2018-09-30', 2, '2018-09-23'),
(3, 4, 1, 3, '2018-09-24', '2018-09-30', 2, '2018-09-23'),
(4, 5, 4, 3, '2018-09-24', '2018-09-30', NULL, NULL);

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
(1, 'Matthew James', 'Estoesta', 'Victore', 4, NULL, 'Male', '1998-07-08', '727 Bagumbayan Manila', '09485733222', NULL, 'mattpogi'),
(2, 'Reannie', 'Cacal', 'Exiomo', 1, NULL, 'Female', '1999-05-18', 'Pasig City', '09071281234', 1, 'yanie'),
(3, 'Princes Joi', 'Valeros', 'Isaac', 3, NULL, 'Female', '1998-10-24', 'Pureza Manila', '09457381211', 2, 'ces'),
(4, 'Angelito', 'Balingan', 'Casasis', 2, NULL, 'Male', '1999-01-01', 'Paranaque', '09125562134', 3, 'ang');

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
(1, 0, 1, 1, 1, 1),
(2, 0, 1, 1, 1, 1),
(3, 0, 1, 1, 1, 1);

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
  `unit_boundary_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`unit_id`, `unittype_id`, `unitnum_id`, `unitroute_id`, `unit_capacity`, `unit_model`, `brand_id`, `unit_coding`, `unit_boundary_id`) VALUES
(1, 3, 1, 1, 23, '2017', 5, 'Wednesday', 1),
(2, 3, 2, 2, 19, '2015', 4, 'Tuesday', 2),
(3, 2, 3, 3, 25, 'Mirage', 5, 'Monday', 3),
(4, 5, 4, 4, 23, 'Grandia', 6, 'Monday', 4),
(5, 3, 5, 5, 21, '2017', 4, 'Monday', 5);

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
(1, NULL, NULL, '1500', '1500', '2000', 2),
(2, NULL, NULL, '1000', '1000', '1500', 2),
(3, NULL, NULL, '1700', '1700', '2300', 2),
(4, NULL, NULL, '2000', '2000', '2500', 2),
(5, NULL, NULL, '1200', '1200', '1700', 2);

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
(1, 'PWU 1235', '123456', '123612', '204813'),
(2, 'ASD 5793', '012741', '628511', '871264'),
(3, 'MAT 2311', '529610', '891200', '471260'),
(4, 'JCN 1000', '396124', '751271', '983714'),
(5, 'MAS 6661', '182561', '751123', '958311');

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
(1, 1, '2016-05-12', '2021-05-12'),
(2, 2, '2017-02-12', '2022-02-12'),
(3, 2, '2016-07-01', '2021-07-01'),
(4, 2, '2017-12-25', '2022-12-25'),
(5, 3, '2017-07-08', '2022-07-08');

-- --------------------------------------------------------

--
-- Table structure for table `unit_type`
--

CREATE TABLE `unit_type` (
  `unittype_id` int(11) NOT NULL,
  `unittype_desc` varchar(15) NOT NULL,
  `unittype_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unit_type`
--

INSERT INTO `unit_type` (`unittype_id`, `unittype_desc`, `unittype_status`) VALUES
(2, 'FX', 0),
(3, 'Jeep', 1),
(4, 'Taxi', 1),
(5, 'UV', 1);

--
-- Indexes for dumped tables
--

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
  ADD KEY `sched_id` (`sched_id`),
  ADD KEY `staff_id` (`staff_id`);

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
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `brand_unit_type`
--
ALTER TABLE `brand_unit_type`
  ADD PRIMARY KEY (`butype_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `unittype_id` (`unittype_id`);

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
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `collector_id` (`collector_id`);

--
-- Indexes for table `offense_remittance`
--
ALTER TABLE `offense_remittance`
  ADD PRIMARY KEY (`oremittance_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `penalty`
--
ALTER TABLE `penalty`
  ADD PRIMARY KEY (`penalty_id`),
  ADD KEY `offensecat_id` (`offensecat_id`);

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
  ADD PRIMARY KEY (`route_id`);

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
  ADD PRIMARY KEY (`unitnum_id`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `arrival_inspection_record`
--
ALTER TABLE `arrival_inspection_record`
  MODIFY `arrival_inspection_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `arrival_record`
--
ALTER TABLE `arrival_record`
  MODIFY `arrival_id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `brecord_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `boundary_remittance`
--
ALTER TABLE `boundary_remittance`
  MODIFY `bremittance_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `brand_unit_type`
--
ALTER TABLE `brand_unit_type`
  MODIFY `butype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `dispatching_record`
--
ALTER TABLE `dispatching_record`
  MODIFY `dispatching_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dispatch_inspection_record`
--
ALTER TABLE `dispatch_inspection_record`
  MODIFY `dispatch_inspection_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `driver_type`
--
ALTER TABLE `driver_type`
  MODIFY `driver_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `for_repair`
--
ALTER TABLE `for_repair`
  MODIFY `for_repairs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `offense_category`
--
ALTER TABLE `offense_category`
  MODIFY `offensecat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `offense_record`
--
ALTER TABLE `offense_record`
  MODIFY `offense_rec_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `offense_remittance`
--
ALTER TABLE `offense_remittance`
  MODIFY `oremittance_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `penalty`
--
ALTER TABLE `penalty`
  MODIFY `penalty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `repair_report`
--
ALTER TABLE `repair_report`
  MODIFY `repair_report_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `sched_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sched_type`
--
ALTER TABLE `sched_type`
  MODIFY `sctype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `staff_assignment`
--
ALTER TABLE `staff_assignment`
  MODIFY `s_assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `staff_type`
--
ALTER TABLE `staff_type`
  MODIFY `staff_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `unit_body_inspection`
--
ALTER TABLE `unit_body_inspection`
  MODIFY `u_parts_inspection_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unit_boundary`
--
ALTER TABLE `unit_boundary`
  MODIFY `unit_boundary_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `unit_coding`
--
ALTER TABLE `unit_coding`
  MODIFY `unit_coding_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unit_engine/fluid_inspection`
--
ALTER TABLE `unit_engine/fluid_inspection`
  MODIFY `u_ef_inspection_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unit_number`
--
ALTER TABLE `unit_number`
  MODIFY `unitnum_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `unit_route`
--
ALTER TABLE `unit_route`
  MODIFY `unitroute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `unit_type`
--
ALTER TABLE `unit_type`
  MODIFY `unittype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

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
  ADD CONSTRAINT `boundary_record_ibfk_1` FOREIGN KEY (`sched_id`) REFERENCES `schedule` (`sched_id`),
  ADD CONSTRAINT `boundary_record_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`);

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
-- Constraints for table `offense_record`
--
ALTER TABLE `offense_record`
  ADD CONSTRAINT `offense_record_ibfk_2` FOREIGN KEY (`penalty_id`) REFERENCES `penalty` (`penalty_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `offense_record_ibfk_3` FOREIGN KEY (`mechanic_id`) REFERENCES `staffs` (`staff_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `offense_record_ibfk_4` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`),
  ADD CONSTRAINT `offense_record_ibfk_5` FOREIGN KEY (`collector_id`) REFERENCES `staffs` (`staff_id`);

--
-- Constraints for table `offense_remittance`
--
ALTER TABLE `offense_remittance`
  ADD CONSTRAINT `offense_remittance_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`);

--
-- Constraints for table `penalty`
--
ALTER TABLE `penalty`
  ADD CONSTRAINT `penalty_ibfk_1` FOREIGN KEY (`offensecat_id`) REFERENCES `offense_category` (`offensecat_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `staffs`
--
ALTER TABLE `staffs`
  ADD CONSTRAINT `staffs_ibfk_1` FOREIGN KEY (`staff_assignment_id`) REFERENCES `staff_assignment` (`s_assignment_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `staffs_ibfk_2` FOREIGN KEY (`staff_type_id`) REFERENCES `staff_type` (`staff_type_id`) ON UPDATE CASCADE;

--
-- Constraints for table `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`unittype_id`) REFERENCES `unit_type` (`unittype_id`),
  ADD CONSTRAINT `unit_ibfk_2` FOREIGN KEY (`unitnum_id`) REFERENCES `unit_number` (`unitnum_id`),
  ADD CONSTRAINT `unit_ibfk_3` FOREIGN KEY (`unitroute_id`) REFERENCES `unit_route` (`unitroute_id`),
  ADD CONSTRAINT `unit_ibfk_4` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`);

--
-- Constraints for table `unit_boundary`
--
ALTER TABLE `unit_boundary`
  ADD CONSTRAINT `unit_boundary_ibfk_1` FOREIGN KEY (`unittype_id`) REFERENCES `unit_type` (`unittype_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
