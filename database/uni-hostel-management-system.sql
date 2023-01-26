-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2022 at 11:46 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uni-hostel-management-system`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_insert` (IN `name` VARCHAR(100), IN `reg_no` VARCHAR(15), IN `faculty` VARCHAR(50), IN `year` INT(11), IN `gender` VARCHAR(8), IN `email` VARCHAR(32), IN `password` VARCHAR(50), IN `telephone_number` INT(12))  BEGIN
insert into students(ID,name,reg_no,faculty,year,gender,
                    email,password,telephone_number) 
value(UUID(),name,reg_no,faculty,year,gender,
       email,password,telephone_number);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(16) NOT NULL,
  `email` varchar(32) NOT NULL,
  `role` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_number` int(12) NOT NULL,
  `hostel` int(16) DEFAULT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `email`, `role`, `name`, `phone_number`, `hostel`, `password`) VALUES
(1, 'warden1@eng.jfn.ac.lk', 'WARDEN', 'WARDEN NUMBER01', 712345678, 1, 'warden@123'),
(2, 'warden2@eng.jfn.ac.lk', 'WARDEN', 'WARDEN NUMBER02', 712355678, 2, 'warden2@123'),
(3, 'subwarden1@eng.jfn.ac.lk', 'SUBWARDEN', 'SUBWARDEN Name 01', 772345678, 3, 'subwarden1@123'),
(4, 'subwarden2@eng.jfn.ac.lk', 'SUBWARDEN', 'SUBWARDEN name 02', 713269856, 1, 'subwarden2@123'),
(5, 'subwarden3@eng.jfn.ac.lk', 'SUBWARDEN', 'SUBWARDEN name 03', 713267856, 1, 'subwarden3@123'),
(6, 'subwarden4@eng.jfn.ac.lk', 'SUBWARDEN', 'SUBWARDEN name 04', 783267856, 1, 'subwarden4@123');

-- --------------------------------------------------------

--
-- Table structure for table `hostel`
--

CREATE TABLE `hostel` (
  `hostel_id` int(16) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(10) NOT NULL,
  `no_of_storeys` int(2) NOT NULL,
  `no_of_rooms` int(4) NOT NULL,
  `no_of_bathrooms` int(2) NOT NULL,
  `location` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hostel`
--

INSERT INTO `hostel` (`hostel_id`, `name`, `type`, `no_of_storeys`, `no_of_rooms`, `no_of_bathrooms`, `location`) VALUES
(1, 'Block A', 'MALE', 2, 25, 4, 1),
(2, 'Block B', 'MALE', 4, 400, 8, 1),
(3, 'Block C', 'MALE', 4, 400, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(16) NOT NULL,
  `name` varchar(50) NOT NULL,
  `room_id` int(16) DEFAULT NULL,
  `conditionStatus` varchar(25) NOT NULL,
  `cost` int(5) NOT NULL,
  `note` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `name`, `room_id`, `conditionStatus`, `cost`, `note`) VALUES
(5, 'Bunk Bed - Wooden', 1, 'Used', 4850, 'This is note for Bunk Bed - Wooden'),
(6, 'Bunk Bed - Wooden', 1, 'Used', 4850, 'This is note for Bunk Bed - Wooden'),
(7, 'Study Table - Wooden', 1, 'Used', 3750, 'This is note for Study Table- Wooden'),
(8, 'Study Table - Wooden', 1, 'Used', 3750, 'This is note for Study Table- Wooden'),
(9, 'Study Table - Wooden', 1, 'Used', 3750, 'This is note for Study Table- Wooden'),
(10, 'Study Table - Wooden', 1, 'Used', 3750, 'leg broken'),
(11, 'Chair - Wooden', 1, 'Used', 1250, 'This is note for Chair- Wooden'),
(12, 'Chair - Wooden', 1, 'Used', 1250, 'This is note for Chair- Wooden'),
(13, 'Chair - Wooden', 1, 'Used', 1250, 'This is note for Chair- Wooden'),
(14, 'Chair - Wooden', 1, 'Used', 1250, 'This is note for Chair- Wooden'),
(15, 'Cloth Rack - Wooden', 1, 'Used', 2150, 'This is note for Cloth Rack- Wooden'),
(16, 'Cloth Rack - Wooden', 1, 'Used', 2150, 'This is note for Cloth Rack- Wooden'),
(17, 'Wall Mounted Light', 1, 'Used', 450, 'This is note for Wall Mounted Light'),
(18, 'Wall Mounted Light', 1, 'Used', 450, 'This is note for Wall Mounted Light'),
(19, 'Balcony Light', 1, 'Used', 450, 'This is note for Balcony Light'),
(20, 'Fan with Regulator', 1, 'Used', 450, 'This is note for Fan with Regulator'),
(21, 'Socket', 1, 'New', 600, 'This is note for Socket'),
(22, 'Socket', 1, 'Used', 600, 'This is note for Socket'),
(23, 'Switch', 1, 'Used', 600, 'This is note for Switch'),
(24, 'Main Door Key', 1, 'Used', 700, 'This is note for Main Door Key'),
(25, 'Main Door Key', 1, 'Used', 700, 'This is note for Main Door Key'),
(26, 'Window Key', 1, 'New', 700, 'This is note for Window Key'),
(27, 'Mettress', 1, 'Used', 1950, 'This is note for Mettress'),
(28, 'Mettress', 1, 'Used', 1950, 'This is note for Mettress'),
(29, 'Mettress', 1, 'Used', 1950, 'This is note for Mettress'),
(30, 'Mettress', 1, 'New', 1950, 'This is note for Mettress'),
(31, 'Bunk Bed - Wooden', 2, 'Used', 4850, 'This is note for Bunk Bed - Wooden'),
(32, 'Bunk Bed - Wooden', 2, 'Used', 4850, 'This is note for Bunk Bed - Wooden'),
(33, 'Study Table - Wooden', 2, 'Used', 3750, 'This is note for Study Table- Wooden'),
(34, 'Study Table - Wooden', 2, 'Used', 3750, 'This is note for Study Table- Wooden'),
(35, 'Study Table - Wooden', 2, 'Used', 3750, 'This is note for Study Table- Wooden'),
(36, 'Study Table - Wooden', 2, 'New', 3750, 'This is note for Study Table- Wooden'),
(37, 'Chair - Wooden', 2, 'New', 1250, 'This is note for Chair- Wooden'),
(38, 'Chair - Wooden', 2, 'New', 1250, 'This is note for Chair- Wooden'),
(39, 'Chair - Wooden', 2, 'New', 1250, 'This is note for Chair- Wooden'),
(40, 'Chair - Wooden', 2, 'New', 1250, 'This is note for Chair- Wooden'),
(41, 'Cloth Rack - Wooden', 2, 'New', 2150, 'This is note for Cloth Rack- Wooden'),
(42, 'Cloth Rack - Wooden', 2, 'New', 2150, 'This is note for Cloth Rack- Wooden'),
(43, 'Wall Mounted Light', 2, 'New', 450, 'This is note for Wall Mounted Light'),
(44, 'Wall Mounted Light', 2, 'New', 450, 'This is note for Wall Mounted Light'),
(45, 'Balcony Light', 2, 'New', 450, 'This is note for Balcony Light'),
(46, 'Fan with Regulator', 2, 'New', 450, 'This is note for Fan with Regulator'),
(47, 'Socket', 2, 'New', 600, 'This is note for Socket'),
(48, 'Socket', 2, 'New', 600, 'This is note for Socket'),
(49, 'Switch', 2, 'New', 600, 'This is note for Switch'),
(50, 'Main Door Key', 2, 'New', 700, 'This is note for Main Door Key'),
(51, 'Main Door Key', 2, 'New', 700, 'This is note for Main Door Key'),
(52, 'Window Key', 2, 'New', 700, 'This is note for Window Key'),
(53, 'Mettress', 2, 'New', 1950, 'This is note for Mettress'),
(54, 'Mettress', 2, 'New', 1950, 'This is note for Mettress'),
(55, 'Mettress', 2, 'New', 1950, 'This is note for Mettress'),
(56, 'Mettress', 2, 'New', 1950, 'This is note for Mettress'),
(57, 'Bunk Bed - Wooden', 3, 'New', 4850, 'This is note for Bunk Bed - Wooden'),
(58, 'Bunk Bed - Wooden', 3, 'New', 4850, 'This is note for Bunk Bed - Wooden'),
(59, 'Study Table - Wooden', 3, 'New', 3750, 'This is note for Study Table- Wooden'),
(60, 'Study Table - Wooden', 3, 'New', 3750, 'This is note for Study Table- Wooden'),
(61, 'Study Table - Wooden', 3, 'New', 3750, 'This is note for Study Table- Wooden'),
(62, 'Study Table - Wooden', 3, 'New', 3750, 'This is note for Study Table- Wooden'),
(63, 'Chair - Wooden', 3, 'New', 1250, 'This is note for Chair- Wooden'),
(64, 'Chair - Wooden', 3, 'New', 1250, 'This is note for Chair- Wooden'),
(65, 'Chair - Wooden', 3, 'New', 1250, 'This is note for Chair- Wooden'),
(66, 'Chair - Wooden', 3, 'New', 1250, 'This is note for Chair- Wooden'),
(67, 'Cloth Rack - Wooden', 3, 'New', 2150, 'This is note for Cloth Rack- Wooden'),
(68, 'Cloth Rack - Wooden', 3, 'New', 2150, 'This is note for Cloth Rack- Wooden'),
(69, 'Wall Mounted Light', 3, 'New', 450, 'This is note for Wall Mounted Light'),
(70, 'Wall Mounted Light', 3, 'New', 450, 'This is note for Wall Mounted Light'),
(71, 'Balcony Light', 3, 'New', 450, 'This is note for Balcony Light'),
(72, 'Fan with Regulator', 3, 'New', 450, 'This is note for Fan with Regulator'),
(73, 'Socket', 3, 'New', 600, 'This is note for Socket'),
(74, 'Socket', 3, 'New', 600, 'This is note for Socket'),
(75, 'Switch', 3, 'New', 600, 'This is note for Switch'),
(76, 'Main Door Key', 3, 'New', 700, 'This is note for Main Door Key'),
(77, 'Main Door Key', 3, 'New', 700, 'This is note for Main Door Key'),
(78, 'Window Key', 3, 'New', 700, 'This is note for Window Key'),
(79, 'Mettress', 3, 'New', 1950, 'This is note for Mettress'),
(80, 'Mettress', 3, 'New', 1950, 'This is note for Mettress'),
(81, 'Mettress', 3, 'New', 1950, 'This is note for Mettress'),
(82, 'Mettress', 3, 'New', 1950, 'This is note for Mettress'),
(83, 'Bunk Bed - Wooden', 4, 'Used', 4850, 'This is note for Bunk Bed - Wooden'),
(84, 'Bunk Bed - Wooden', 4, 'New', 4850, 'This is note for Bunk Bed - Wooden'),
(85, 'Study Table - Wooden', 4, 'New', 3750, 'This is note for Study Table- Wooden'),
(86, 'Study Table - Wooden', 4, 'New', 3750, 'This is note for Study Table- Wooden'),
(87, 'Study Table - Wooden', 4, 'Used', 3750, 'This is note for Study Table- Wooden'),
(88, 'Study Table - Wooden', 4, 'New', 3750, 'This is note for Study Table- Wooden'),
(89, 'Chair - Wooden', 4, 'Broken', 1250, 'This is note for Chair- Wooden'),
(90, 'Chair - Wooden', 4, 'New', 1250, 'This is note for Chair- Wooden'),
(91, 'Chair - Wooden', 4, 'New', 1250, 'This is note for Chair- Wooden'),
(92, 'Chair - Wooden', 4, 'Used', 1250, 'This is note for Chair- Wooden'),
(93, 'Cloth Rack - Wooden', 4, 'New', 2150, 'This is note for Cloth Rack- Wooden'),
(94, 'Cloth Rack - Wooden', 4, 'New', 2150, 'This is note for Cloth Rack- Wooden'),
(95, 'Wall Mounted Light', 4, 'New', 450, 'This is note for Wall Mounted Light'),
(96, 'Wall Mounted Light', 4, 'New', 450, 'This is note for Wall Mounted Light'),
(97, 'Balcony Light', 4, 'New', 450, 'This is note for Balcony Light'),
(98, 'Fan with Regulator', 4, 'New', 450, 'This is note for Fan with Regulator'),
(99, 'Socket', 4, 'New', 600, 'This is note for Socket'),
(100, 'Socket', 4, 'New', 600, 'This is note for Socket'),
(101, 'Switch', 4, 'New', 600, 'This is note for Switch'),
(102, 'Main Door Key', 4, 'New', 700, 'This is note for Main Door Key'),
(103, 'Main Door Key', 4, 'New', 700, 'This is note for Main Door Key'),
(104, 'Window Key', 4, 'New', 700, 'This is note for Window Key'),
(105, 'Mettress', 4, 'New', 1950, 'This is note for Mettress'),
(106, 'Mettress', 4, 'New', 1950, 'This is note for Mettress'),
(107, 'Mettress', 4, 'New', 1950, 'This is note for Mettress'),
(108, 'Mettress', 4, 'New', 1950, 'This is note for Mettress'),
(109, 'Bunk Bed - Wooden', 5, 'New', 4850, 'This is note for Bunk Bed - Wooden'),
(110, 'Bunk Bed - Wooden', 5, 'New', 4850, 'This is note for Bunk Bed - Wooden'),
(111, 'Study Table - Wooden', 5, 'New', 3750, 'This is note for Study Table- Wooden'),
(112, 'Study Table - Wooden', 5, 'New', 3750, 'This is note for Study Table- Wooden'),
(113, 'Study Table - Wooden', 5, 'New', 3750, 'This is note for Study Table- Wooden'),
(114, 'Study Table - Wooden', 5, 'New', 3750, 'This is note for Study Table- Wooden'),
(115, 'Chair - Wooden', 5, 'New', 1250, 'This is note for Chair- Wooden'),
(116, 'Chair - Wooden', 5, 'New', 1250, 'This is note for Chair- Wooden'),
(117, 'Chair - Wooden', 5, 'New', 1250, 'This is note for Chair- Wooden'),
(118, 'Chair - Wooden', 5, 'New', 1250, 'This is note for Chair- Wooden'),
(119, 'Cloth Rack - Wooden', 5, 'New', 2150, 'This is note for Cloth Rack- Wooden'),
(120, 'Cloth Rack - Wooden', 5, 'New', 2150, 'This is note for Cloth Rack- Wooden'),
(121, 'Wall Mounted Light', 5, 'New', 450, 'This is note for Wall Mounted Light'),
(122, 'Wall Mounted Light', 5, 'New', 450, 'This is note for Wall Mounted Light'),
(123, 'Balcony Light', 5, 'New', 450, 'This is note for Balcony Light'),
(124, 'Fan with Regulator1', 5, 'New', 450, 'This is note for Fan with Regulator'),
(125, 'Socket', 5, 'New', 600, 'This is note for Socket'),
(126, 'Socket', 5, 'New', 600, 'This is note for Socket'),
(127, 'Switch', 5, 'New', 600, 'This is note for Switch'),
(128, 'Main Door Key', 5, 'New', 700, 'This is note for Main Door Key'),
(129, 'Main Door Key', 5, 'New', 700, 'This is note for Main Door Key'),
(130, 'Window Key', 5, 'New', 700, 'This is note for Window Key'),
(131, 'Mettress', 5, 'New', 1950, 'This is note for Mettress'),
(132, 'Mettress', 5, 'New', 1950, 'This is note for Mettress'),
(133, 'Mettress', 5, 'New', 1950, 'This is note for Mettress'),
(134, 'Mettress', 5, 'New', 1950, 'This is note for Mettress');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(16) NOT NULL,
  `street` varchar(100) DEFAULT NULL,
  `town` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `street`, `town`) VALUES
(1, 'HOSTEL ROAD', 'ARAVIYAL NAGAR'),
(2, 'HOSPITAL ROAD', 'KONDAVIL');

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `notice_id` int(16) NOT NULL,
  `posted_by` int(16) NOT NULL,
  `expiry_time` datetime NOT NULL,
  `posted_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `audience` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `notice` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `roomhistory`
--

CREATE TABLE `roomhistory` (
  `id` int(32) NOT NULL,
  `entry_id` varchar(50) NOT NULL,
  `student_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `issued_date` date NOT NULL DEFAULT current_timestamp(),
  `received_date` date DEFAULT NULL,
  `issued_or_recieved` enum('issued','recieved') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roomhistory`
--

INSERT INTO `roomhistory` (`id`, `entry_id`, `student_id`, `room_id`, `admin_id`, `issued_date`, `received_date`, `issued_or_recieved`) VALUES
(151, '3301531c-796b-47b4-9e31-afc444a29a45', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(152, '3301531c-796b-47b4-9e31-afc444a29a45', 99441374, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(153, '3301531c-796b-47b4-9e31-afc444a29a45', 99441375, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(154, '30aa8538-a9cb-445b-a4d4-059af4ccdf00', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(155, '30aa8538-a9cb-445b-a4d4-059af4ccdf00', 99441374, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(156, '30aa8538-a9cb-445b-a4d4-059af4ccdf00', 99441375, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(157, 'a1436de6-9266-46d4-aec3-8b345aceca67', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(158, 'a1436de6-9266-46d4-aec3-8b345aceca67', 99441374, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(159, 'a1436de6-9266-46d4-aec3-8b345aceca67', 99441375, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(160, '857db7e2-57bd-4c10-9708-17513d6383b0', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(161, '857db7e2-57bd-4c10-9708-17513d6383b0', 99441374, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(162, 'c6a2b8c5-bf62-472b-9edb-5c9ad8cb357c', 99441373, 2, 2, '2022-01-11', '2022-01-11', 'recieved'),
(163, '974abac6-335c-4fe3-809e-aa44563213a8', 99441382, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(164, '5b052bf2-df4a-4ac2-b204-5409bbf777bd', 99441382, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(165, '5b052bf2-df4a-4ac2-b204-5409bbf777bd', 99441374, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(166, 'b9354e69-3ae5-4a44-a6a5-96350ecf8bb1', 99441373, 1, 2, '2022-01-11', '2022-01-05', 'recieved'),
(167, 'b9354e69-3ae5-4a44-a6a5-96350ecf8bb1', 99441374, 1, 2, '2022-01-11', '2022-01-04', 'recieved'),
(168, 'af6c8f85-6644-49c2-bc55-39cae3f04c13', 99441373, 1, 2, '2022-01-11', '2022-01-08', 'recieved'),
(169, '0239053c-5021-451b-9e39-bac1ab105153', 99441373, 1, 2, '2022-01-11', '2022-01-14', 'recieved'),
(170, '0239053c-5021-451b-9e39-bac1ab105153', 99441374, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(171, 'f5ce9573-9ad7-4c9f-8f84-11ee992931c5', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(172, '0f3971dd-86b5-4929-b55c-a35157faa50f', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(173, '054bbdf9-e4fb-4186-a1d8-1de6a93897dc', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(174, 'c4d63cc8-f063-4375-a685-3cf32e5ece2a', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(175, '5c5d3c36-8b09-43b2-b29d-8ef3cb0dd587', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(176, 'f5510774-b2c9-4071-8220-b8c8ac300633', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(177, '1e4c255d-5c89-4e78-bb82-fd727091638f', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(178, '2798576b-2d20-47f8-90b3-59074864c1c0', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(179, 'eb1aed1e-6a07-464b-ad73-465fafe9d607', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(180, '9380bff2-c3fa-48f2-a0f0-f9c6b23d9a6a', 99441373, 2, 2, '2022-01-11', '2022-01-11', 'recieved'),
(181, '9380bff2-c3fa-48f2-a0f0-f9c6b23d9a6a', 99441382, 2, 2, '2022-01-11', '2022-01-11', 'recieved'),
(182, 'e488ef6a-6268-46e1-844a-07befedbbc27', 99441376, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(183, 'b1ac2405-68e2-4bba-8058-fd93b747f3f6', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(184, '184aa43d-6ae4-4945-ac7e-1b60db027b8d', 99441382, 2, 2, '2022-01-11', '2022-01-11', 'recieved'),
(185, '184aa43d-6ae4-4945-ac7e-1b60db027b8d', 99441374, 2, 2, '2022-01-11', '2022-01-11', 'recieved'),
(186, '5be4878f-9b2d-4945-8cf7-dd093ab2aab6', 99441376, 3, 2, '2022-01-11', NULL, 'recieved'),
(187, '5be4878f-9b2d-4945-8cf7-dd093ab2aab6', 99441377, 3, 2, '2022-01-11', NULL, 'recieved'),
(188, '5be4878f-9b2d-4945-8cf7-dd093ab2aab6', 99441375, 3, 2, '2022-01-11', NULL, 'recieved'),
(189, '7806e34e-f7e2-4d94-8971-6412d2fc3922', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(190, '4f1de4a1-35c0-4e2f-89a4-cda122e54097', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(191, 'b5faf7c8-1efa-42a6-b1bd-49d20126c681', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(192, '6570f606-5109-4404-94fe-6f28982a0c6a', 99441382, 2, 2, '2022-01-11', '2022-01-11', 'recieved'),
(193, '6570f606-5109-4404-94fe-6f28982a0c6a', 99441374, 2, 2, '2022-01-11', '2022-01-11', 'recieved'),
(194, '7a1a89be-aa60-4157-af8f-e7901f8474d8', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(195, 'db88a129-687f-478e-af82-c40483c90a90', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(196, '5e9cd1bd-8797-4426-b0ee-ca80047ba2cb', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(197, '74b00840-2ee8-4ed6-957a-079fb0834a2b', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(198, '74b00840-2ee8-4ed6-957a-079fb0834a2b', 99441374, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(199, 'dd7d801a-d4db-4553-b95c-1b932533e7d9', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(200, 'dd7d801a-d4db-4553-b95c-1b932533e7d9', 99441374, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(201, '80011731-c850-4ad2-b90b-bc0405665629', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(202, '91942db0-fdb9-49ed-b3c2-e4b2316a708f', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(203, '91942db0-fdb9-49ed-b3c2-e4b2316a708f', 99441374, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(204, 'a010540f-5000-4da7-8138-e72c60cae8e6', 99441382, 2, 2, '2022-01-11', '2022-01-11', 'recieved'),
(205, '80d97db9-608d-459b-a56d-d69ccc751126', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(206, '80d97db9-608d-459b-a56d-d69ccc751126', 99441374, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(207, '7dc0a89d-4826-438c-8c3f-67f7061acb1c', 99441373, 1, 2, '2022-01-11', '2022-01-11', 'recieved'),
(208, 'f1eda06f-780d-40e5-aaf3-127df6cc6232', 99441373, 1, 2, '2022-01-16', '2022-01-16', 'recieved'),
(209, 'f1eda06f-780d-40e5-aaf3-127df6cc6232', 99441377, 1, 2, '2022-01-16', '2022-01-16', 'recieved'),
(210, 'f1eda06f-780d-40e5-aaf3-127df6cc6232', 99441375, 1, 2, '2022-01-16', '2022-01-16', 'recieved'),
(211, 'd8089ac0-fe61-4d46-9a7f-df1a1d8c9bb7', 99441373, 1, 2, '2022-01-27', '2022-01-27', 'recieved'),
(212, 'd8089ac0-fe61-4d46-9a7f-df1a1d8c9bb7', 99441374, 1, 2, '2022-01-27', '2022-01-27', 'recieved'),
(213, 'd8089ac0-fe61-4d46-9a7f-df1a1d8c9bb7', 99441375, 1, 2, '2022-01-27', '2022-01-27', 'recieved'),
(214, 'd8089ac0-fe61-4d46-9a7f-df1a1d8c9bb7', 99441376, 1, 2, '2022-01-27', '2022-01-27', 'recieved'),
(215, '71c4c4ac-9f36-40a0-b29b-f2fa3fb47c95', 99441373, 1, 2, '2022-01-27', '2022-01-27', 'recieved'),
(216, '71c4c4ac-9f36-40a0-b29b-f2fa3fb47c95', 99441374, 1, 2, '2022-01-27', '2022-01-27', 'recieved'),
(217, 'aecd0298-1515-4b38-85ee-3992675f1f4d', 99441373, 1, 2, '2022-01-27', '2022-01-27', 'recieved'),
(218, 'aecd0298-1515-4b38-85ee-3992675f1f4d', 99441374, 1, 2, '2022-01-27', '2022-01-27', 'recieved'),
(219, 'aecd0298-1515-4b38-85ee-3992675f1f4d', 99441375, 1, 2, '2022-01-27', '2022-01-27', 'recieved'),
(220, 'aecd0298-1515-4b38-85ee-3992675f1f4d', 99441376, 1, 2, '2022-01-27', '2022-01-27', 'recieved');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(16) NOT NULL,
  `room_no` varchar(10) NOT NULL,
  `floor` int(2) NOT NULL,
  `hostel_id` int(16) NOT NULL,
  `no_of_students` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_no`, `floor`, `hostel_id`, `no_of_students`) VALUES
(1, 'G01', 0, 1, 4),
(2, 'G02', 0, 1, 4),
(3, 'G03', 0, 1, 4),
(4, 'G04', 0, 1, 4),
(5, 'G05', 0, 1, 4),
(6, 'G06', 0, 1, 4),
(7, 'G07', 0, 1, 4),
(8, 'G08', 0, 1, 4),
(9, 'G09', 0, 1, 4),
(10, 'G10', 0, 1, 4),
(11, 'G11', 0, 1, 4),
(12, 'G12', 0, 1, 4),
(13, 'G13', 0, 1, 4),
(14, 'G14', 0, 1, 4),
(15, 'G15', 0, 1, 4),
(16, 'G16', 0, 1, 4),
(17, 'G17', 0, 1, 4),
(18, 'G18', 0, 1, 4),
(19, 'G19', 0, 1, 4),
(20, 'G20', 0, 1, 4),
(21, 'G21', 0, 1, 4),
(22, 'G22', 0, 1, 4),
(23, 'G23', 0, 1, 4),
(24, 'G24', 0, 1, 4),
(25, 'G25', 0, 1, 4),
(26, 'F01', 1, 1, 4),
(27, 'F02', 1, 1, 4),
(28, 'F03', 1, 1, 4),
(29, 'F04', 1, 1, 4),
(30, 'F05', 1, 1, 4),
(31, 'F06', 1, 1, 4),
(32, 'F07', 1, 1, 4),
(33, 'F08', 1, 1, 4),
(34, 'F09', 1, 1, 4),
(35, 'F10', 1, 1, 4),
(36, 'F11', 1, 1, 4),
(37, 'F12', 1, 1, 4),
(38, 'F13', 1, 1, 4),
(39, 'F14', 1, 1, 4),
(40, 'F15', 1, 1, 4),
(41, 'F16', 1, 1, 4),
(42, 'F17', 1, 1, 4),
(43, 'F18', 1, 1, 4),
(44, 'F19', 1, 1, 4),
(45, 'F20', 1, 1, 4),
(46, 'F21', 1, 1, 4),
(47, 'F22', 1, 1, 4),
(48, 'F23', 1, 1, 4),
(49, 'F24', 1, 1, 4),
(50, 'F25', 1, 1, 4),
(51, 'S01', 2, 1, 4),
(52, 'S02', 2, 1, 4),
(53, 'S03', 2, 1, 4),
(54, 'S04', 2, 1, 4),
(55, 'S05', 2, 1, 4),
(56, 'S06', 2, 1, 4),
(57, 'S07', 2, 1, 4),
(58, 'S08', 2, 1, 4),
(59, 'S09', 2, 1, 4),
(60, 'S10', 2, 1, 4),
(61, 'S11', 2, 1, 4),
(62, 'S12', 2, 1, 4),
(63, 'S13', 2, 1, 4),
(64, 'S14', 2, 1, 4),
(65, 'S15', 2, 1, 4),
(66, 'S16', 2, 1, 4),
(67, 'S17', 2, 1, 4),
(68, 'S18', 2, 1, 4),
(69, 'S19', 2, 1, 4),
(70, 'S20', 2, 1, 4),
(71, 'S21', 2, 1, 4),
(72, 'S22', 2, 1, 4),
(73, 'S23', 2, 1, 4),
(74, 'S24', 2, 1, 4),
(75, 'S25', 2, 1, 4),
(76, 'T01', 3, 1, 4),
(77, 'T02', 3, 1, 4),
(78, 'F03', 3, 1, 4),
(79, 'T04', 3, 1, 4),
(80, 'T05', 3, 1, 4),
(81, 'T06', 3, 1, 4),
(82, 'T07', 3, 1, 4),
(83, 'T08', 3, 1, 4),
(84, 'T09', 3, 1, 4),
(85, 'T10', 3, 1, 4),
(86, 'T11', 3, 1, 4),
(87, 'T12', 3, 1, 4),
(88, 'T13', 3, 1, 4),
(89, 'T14', 3, 1, 4),
(90, 'T15', 3, 1, 4),
(91, 'T16', 3, 1, 4),
(92, 'T17', 3, 1, 4),
(93, 'T18', 3, 1, 4),
(94, 'T19', 3, 1, 4),
(95, 'T20', 3, 1, 4),
(96, 'T21', 3, 1, 4),
(97, 'T22', 3, 1, 4),
(98, 'T23', 3, 1, 4),
(99, 'T24', 3, 1, 4),
(100, 'T25', 3, 1, 4),
(101, 'G01', 0, 2, 4),
(102, 'G02', 0, 2, 4),
(103, 'G03', 0, 2, 4),
(104, 'G04', 0, 2, 4),
(105, 'G05', 0, 2, 4),
(106, 'G06', 0, 2, 4),
(107, 'G07', 0, 2, 4),
(108, 'G08', 0, 2, 4),
(109, 'G09', 0, 2, 4),
(110, 'G10', 0, 2, 4),
(111, 'G11', 0, 2, 4),
(112, 'G12', 0, 2, 4),
(113, 'G13', 0, 2, 4),
(114, 'G14', 0, 2, 4),
(115, 'G15', 0, 2, 4),
(116, 'G16', 0, 2, 4),
(117, 'G17', 0, 2, 4),
(118, 'G18', 0, 2, 4),
(119, 'G19', 0, 2, 4),
(120, 'G20', 0, 2, 4),
(121, 'G21', 0, 2, 4),
(122, 'G22', 0, 2, 4),
(123, 'G23', 0, 2, 4),
(124, 'G24', 0, 2, 4),
(125, 'G25', 0, 2, 4),
(126, 'F01', 1, 2, 4),
(127, 'F02', 1, 2, 4),
(128, 'F03', 1, 2, 4),
(129, 'F04', 1, 2, 4),
(130, 'F05', 1, 2, 4),
(131, 'F06', 1, 2, 4),
(132, 'F07', 1, 2, 4),
(133, 'F08', 1, 2, 4),
(134, 'F09', 1, 2, 4),
(135, 'F10', 1, 2, 4),
(136, 'F11', 1, 2, 4),
(137, 'F12', 1, 2, 4),
(138, 'F13', 1, 2, 4),
(139, 'F14', 1, 2, 4),
(140, 'F15', 1, 2, 4),
(141, 'F16', 1, 2, 4),
(142, 'F17', 1, 2, 4),
(143, 'F18', 1, 2, 4),
(144, 'F19', 1, 2, 4),
(145, 'F20', 1, 2, 4),
(146, 'F21', 1, 2, 4),
(147, 'F22', 1, 2, 4),
(148, 'F23', 1, 2, 4),
(149, 'F24', 1, 2, 4),
(150, 'F25', 1, 2, 4),
(151, 'S01', 2, 2, 4),
(152, 'S02', 2, 2, 4),
(153, 'S03', 2, 2, 4),
(154, 'S04', 2, 2, 4),
(155, 'S05', 2, 2, 4),
(156, 'S06', 2, 2, 4),
(157, 'S07', 2, 2, 4),
(158, 'S08', 2, 2, 4),
(159, 'S09', 2, 2, 4),
(160, 'S10', 2, 2, 4),
(161, 'S11', 2, 2, 4),
(162, 'S12', 2, 2, 4),
(163, 'S13', 2, 2, 4),
(164, 'S14', 2, 2, 4),
(165, 'S15', 2, 2, 4),
(166, 'S16', 2, 2, 4),
(167, 'S17', 2, 2, 4),
(168, 'S18', 2, 2, 4),
(169, 'S19', 2, 2, 4),
(170, 'S20', 2, 2, 4),
(171, 'S21', 2, 2, 4),
(172, 'S22', 2, 2, 4),
(173, 'S23', 2, 2, 4),
(174, 'S24', 2, 2, 4),
(175, 'S25', 2, 2, 4),
(176, 'T01', 3, 2, 4),
(177, 'T02', 3, 2, 4),
(178, 'F03', 3, 2, 4),
(179, 'T04', 3, 2, 4),
(180, 'T05', 3, 2, 4),
(181, 'T06', 3, 2, 4),
(182, 'T07', 3, 2, 4),
(183, 'T08', 3, 2, 4),
(184, 'T09', 3, 2, 4),
(185, 'T10', 3, 2, 4),
(186, 'T11', 3, 2, 4),
(187, 'T12', 3, 2, 4),
(188, 'T13', 3, 2, 4),
(189, 'T14', 3, 2, 4),
(190, 'T15', 3, 2, 4),
(191, 'T16', 3, 2, 4),
(192, 'T17', 3, 2, 4),
(193, 'T18', 3, 2, 4),
(194, 'T19', 3, 2, 4),
(195, 'T20', 3, 2, 4),
(196, 'T21', 3, 2, 4),
(197, 'T22', 3, 2, 4),
(198, 'T23', 3, 2, 4),
(199, 'T24', 3, 2, 4),
(200, 'T25', 3, 2, 4),
(201, 'G01', 0, 3, 4),
(202, 'G02', 0, 3, 4),
(203, 'G03', 0, 3, 4),
(204, 'G04', 0, 3, 4),
(205, 'G05', 0, 3, 4),
(206, 'G06', 0, 3, 4),
(207, 'G07', 0, 3, 4),
(208, 'G08', 0, 3, 4),
(209, 'G09', 0, 3, 4),
(210, 'G10', 0, 3, 4),
(211, 'G11', 0, 3, 4),
(212, 'G12', 0, 3, 4),
(213, 'G13', 0, 3, 4),
(214, 'G14', 0, 3, 4),
(215, 'G15', 0, 3, 4),
(216, 'G16', 0, 3, 4),
(217, 'G17', 0, 3, 4),
(218, 'G18', 0, 3, 4),
(219, 'G19', 0, 3, 4),
(220, 'G20', 0, 3, 4),
(221, 'G21', 0, 3, 4),
(222, 'G22', 0, 3, 4),
(223, 'G23', 0, 3, 4),
(224, 'G24', 0, 3, 4),
(225, 'G25', 0, 3, 4),
(226, 'F01', 1, 3, 4),
(227, 'F02', 1, 3, 4),
(228, 'F03', 1, 3, 4),
(229, 'F04', 1, 3, 4),
(230, 'F05', 1, 3, 4),
(231, 'F06', 1, 3, 4),
(232, 'F07', 1, 3, 4),
(233, 'F08', 1, 3, 4),
(234, 'F09', 1, 3, 4),
(235, 'F10', 1, 3, 4),
(236, 'F11', 1, 3, 4),
(237, 'F12', 1, 3, 4),
(238, 'F13', 1, 3, 4),
(239, 'F14', 1, 3, 4),
(240, 'F15', 1, 3, 4),
(241, 'F16', 1, 3, 4),
(242, 'F17', 1, 3, 4),
(243, 'F18', 1, 3, 4),
(244, 'F19', 1, 3, 4),
(245, 'F20', 1, 3, 4),
(246, 'F21', 1, 3, 4),
(247, 'F22', 1, 3, 4),
(248, 'F23', 1, 3, 4),
(249, 'F24', 1, 3, 4),
(250, 'F25', 1, 3, 4),
(251, 'S01', 2, 3, 4),
(252, 'S02', 2, 3, 4),
(253, 'S03', 2, 3, 4),
(254, 'S04', 2, 3, 4),
(255, 'S05', 2, 3, 4),
(256, 'S06', 2, 3, 4),
(257, 'S07', 2, 3, 4),
(258, 'S08', 2, 3, 4),
(259, 'S09', 2, 3, 4),
(260, 'S10', 2, 3, 4),
(261, 'S11', 2, 3, 4),
(262, 'S12', 2, 3, 4),
(263, 'S13', 2, 3, 4),
(264, 'S14', 2, 3, 4),
(265, 'S15', 2, 3, 4),
(266, 'S16', 2, 3, 4),
(267, 'S17', 2, 3, 4),
(268, 'S18', 2, 3, 4),
(269, 'S19', 2, 3, 4),
(270, 'S20', 2, 3, 4),
(271, 'S21', 2, 3, 4),
(272, 'S22', 2, 3, 4),
(273, 'S23', 2, 3, 4),
(274, 'S24', 2, 3, 4),
(275, 'S25', 2, 3, 4),
(276, 'T01', 3, 3, 4),
(277, 'T02', 3, 3, 4),
(278, 'F03', 3, 3, 4),
(279, 'T04', 3, 3, 4),
(280, 'T05', 3, 3, 4),
(281, 'T06', 3, 3, 4),
(282, 'T07', 3, 3, 4),
(283, 'T08', 3, 3, 4),
(284, 'T09', 3, 3, 4),
(285, 'T10', 3, 3, 4),
(286, 'T11', 3, 3, 4),
(287, 'T12', 3, 3, 4),
(288, 'T13', 3, 3, 4),
(289, 'T14', 3, 3, 4),
(290, 'T15', 3, 3, 4),
(291, 'T16', 3, 3, 4),
(292, 'T17', 3, 3, 4),
(293, 'T18', 3, 3, 4),
(294, 'T19', 3, 3, 4),
(295, 'T20', 3, 3, 4),
(296, 'T21', 3, 3, 4),
(297, 'T22', 3, 3, 4),
(298, 'T23', 3, 3, 4),
(299, 'T24', 3, 3, 4),
(300, 'T25', 3, 3, 4),
(301, 'G01', 0, 2, 4),
(302, 'G02', 0, 2, 4),
(303, 'G03', 0, 2, 4),
(304, 'G04', 0, 2, 4),
(305, 'G05', 0, 2, 4),
(306, 'G06', 0, 2, 4),
(307, 'G07', 0, 2, 4),
(308, 'G08', 0, 2, 4),
(309, 'G09', 0, 2, 4),
(310, 'G10', 0, 2, 4),
(311, 'G01', 0, 3, 4),
(312, 'G02', 0, 3, 4),
(313, 'G03', 0, 3, 4),
(314, 'G04', 0, 3, 4),
(315, 'G05', 0, 3, 4),
(316, 'G06', 0, 3, 4),
(317, 'G07', 0, 3, 4),
(318, 'G08', 0, 3, 4),
(319, 'G09', 0, 3, 4),
(320, 'G10', 0, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `ID` int(16) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `reg_no` varchar(15) NOT NULL,
  `faculty` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `gender` varchar(8) NOT NULL,
  `email` varchar(32) NOT NULL,
  `password` varchar(50) NOT NULL,
  `telephone_number` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`ID`, `student_name`, `reg_no`, `faculty`, `year`, `gender`, `email`, `password`, `telephone_number`) VALUES
(99441373, 'LAKINDU OSHADHA', '2018E007', 'FACULTY OF ENGINEERING', 3, 'MALE', '2018e007@eng.jfn.ac.lk', 'ThisI$myPassword123', 713803709),
(99441374, 'ISURU AKALANKA', '2018E022', 'FACULTY OF AGRICULTURE', 4, 'MALE', '2018e022@agri.jfn.ac.lk', 'IsuruAkalanka@12', 711234567),
(99441375, 'MADHUSHA KESHAN', '2018ET062', 'FACULTY OF TECHNOLOGY', 4, 'MALE', '2018et062@tech.jfn.ac.lk', 'MadhushaKeshan@12', 789632541),
(99441376, 'NETHMINI SUBHODA', '2020E001', 'FACULTY OF ENGINEERING', 1, 'MALE', '2020e001@eng.jfn.ac.lk', 'NethminiSubhoda@12', 789321456),
(99441377, 'JOHN RICHARD SEBASTHIYAN', '2018E002', 'FACULTY OF TECHNOLOGY', 3, 'FEMALE', '2018e187@eng.jfn.ac.lk', 'Qaaxxx2xxxxxxxx@xx', 713803709),
(99441378, 'FFSDAF', '2018E009', 'FACULTY OF ENGINEERING', 1, 'MALE', '2018e045@eng.jfn.ac.lk', 'ThisI$myPassword123', 714928766),
(99441382, 'AMAL', '2018E145', 'FACULTY OF ENGINEERING', 3, 'MALE', '2018e145@eng.jfn.ac.lk', 'Namal@123', 719198456),
(99441383, 'SADASDAS', '2018E144', 'FACULTY OF ENGINEERING', 1, 'MALE', '2018e144@eng.jfn.ac.lk', 'ThisI$myPassword123', 714928766),
(99441387, 'SADASDAS', '2018E101', 'FACULTY OF ENGINEERING', 1, 'MALE', '2018e101@eng.jfn.ac.lk', 'ThisI$myPassword123', 714928766),
(99441388, 'SUPUN SAMEERA', '2018E123', 'FACULTY OF ENGINEERING', 2, 'MALE', '2018e123@eng.jfn.ac.lk', 'Supun@123', 719929233);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `FK1` (`hostel`);

--
-- Indexes for table `hostel`
--
ALTER TABLE `hostel`
  ADD PRIMARY KEY (`hostel_id`),
  ADD KEY `FK` (`location`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `FK2` (`room_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`notice_id`),
  ADD KEY `FK3` (`posted_by`),
  ADD KEY `FK_Audiance` (`audience`);

--
-- Indexes for table `roomhistory`
--
ALTER TABLE `roomhistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_StudentID` (`student_id`),
  ADD KEY `FK_AdminID` (`admin_id`),
  ADD KEY `FK_RoomID` (`room_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `FK4` (`hostel_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `reg_no` (`reg_no`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hostel`
--
ALTER TABLE `hostel`
  MODIFY `hostel_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `notice_id` int(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roomhistory`
--
ALTER TABLE `roomhistory`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=321;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `ID` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99441389;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `FK1` FOREIGN KEY (`hostel`) REFERENCES `hostel` (`hostel_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `hostel`
--
ALTER TABLE `hostel`
  ADD CONSTRAINT `FK` FOREIGN KEY (`location`) REFERENCES `location` (`location_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `FK2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE ON UPDATE SET NULL;

--
-- Constraints for table `notices`
--
ALTER TABLE `notices`
  ADD CONSTRAINT `FK3` FOREIGN KEY (`posted_by`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Audiance` FOREIGN KEY (`audience`) REFERENCES `hostel` (`hostel_id`);

--
-- Constraints for table `roomhistory`
--
ALTER TABLE `roomhistory`
  ADD CONSTRAINT `FK_AdminID` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`),
  ADD CONSTRAINT `FK_RoomID` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`),
  ADD CONSTRAINT `FK_StudentID` FOREIGN KEY (`student_id`) REFERENCES `students` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `FK4` FOREIGN KEY (`hostel_id`) REFERENCES `hostel` (`hostel_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
