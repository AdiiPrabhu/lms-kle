-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2022 at 06:43 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leave_management_system`
--
CREATE DATABASE IF NOT EXISTS `leave_management_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `leave_management_system`;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DID` varchar(10) NOT NULL,
  `DName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DID`, `DName`) VALUES
('BME', 'Bio-Medical Engineering'),
('CHE', 'Chemical Engineering'),
('CSE', 'Computer Science and Engineering'),
('CVE', 'Civil Engineering'),
('ECE', 'Electronics and Communication Engineering'),
('ME', 'Mechanical Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `FID` varchar(10) NOT NULL,
  `FName` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Mobile` varchar(13) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `DID` varchar(10) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Birthday` date NOT NULL,
  `Role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`FID`, `FName`, `Email`, `Mobile`, `Password`, `DID`, `Address`, `Birthday`, `Role`) VALUES
('CS01', 'Swapnil Mannurkar', 'admin@gmail.com', '9242239078', 'Admin', 'CSE', 'Belgaum', '2001-03-14', 'Admin'),
('CS02', 'Craze', 'craze@gmail.com', '9242239078', 'craze', 'CSE', 'Belgaum', '2001-03-14', 'Faculty'),
('CS06', 'Faculty 1', 'Faculty@gmail.com', '9876543210', 'Faculty', 'CSE', 'Belgaum', '2012-02-08', 'Faculty'),
('CS10', 'CSHOD', 'cshod@gmail.com', '95175384260', 'cshod', 'CSE', 'Belgaum', '1980-01-01', 'HOD'),
('ME01', 'MechFaculty', 'mechfaculty@gmail.com', '74108529630', 'mech', 'ME', 'Belgaum', '1982-01-12', 'Faculty');

-- --------------------------------------------------------

--
-- Table structure for table `leave`
--
-- Error reading structure for table leave_management_system.leave: #1932 - Table &#039;leave_management_system.leave&#039; doesn&#039;t exist in engine
-- Error reading data for table leave_management_system.leave: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `leave_management_system`.`leave`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `leave_applied`
--

CREATE TABLE `leave_applied` (
  `LID` int(4) NOT NULL,
  `FID` varchar(10) NOT NULL,
  `Leave_type` varchar(100) NOT NULL,
  `Leave_from` date NOT NULL,
  `Leave_to` date NOT NULL,
  `FAdjusted` varchar(10) NOT NULL,
  `Leave_desc` text NOT NULL,
  `Leave_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leave_applied`
--

INSERT INTO `leave_applied` (`LID`, `FID`, `Leave_type`, `Leave_from`, `Leave_to`, `FAdjusted`, `Leave_desc`, `Leave_status`) VALUES
(10, 'CS02', 'Academic', '2022-02-07', '2022-02-11', '', '', 3),
(11, 'CS02', 'Casual', '2022-02-09', '2022-02-19', '', '', 2),
(12, 'CS02', 'Duty', '2022-02-19', '2022-02-24', '', '', 3),
(13, 'CS02', 'Leave', '2022-02-10', '2022-02-19', '', '', 2),
(14, 'CS02', 'Leave', '2022-02-11', '2022-02-24', '', '', 2),
(15, 'CS01', 'Duty', '2022-02-09', '2022-02-04', '', '', 2),
(16, 'CS02', 'Casual', '2022-02-16', '2022-02-18', '', 'I\'m not feeling well.', 2),
(18, 'CS02', 'Academic', '2022-02-01', '2022-02-10', 'CS06', '', 1),
(19, 'CS02', 'Duty', '2022-02-02', '2022-02-09', 'Faculty', '', 1),
(20, 'CS02', 'Academic', '2022-02-22', '2022-02-02', 'Faculty', '', 1),
(21, 'CS02', 'Casual', '2022-02-08', '2022-02-22', 'Faculty', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `leave_type`
--

CREATE TABLE `leave_type` (
  `LTID` varchar(10) NOT NULL,
  `Leave_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leave_type`
--

INSERT INTO `leave_type` (`LTID`, `Leave_type`) VALUES
('AL', 'Academic leave'),
('CL', 'Casual leave'),
('DL', 'Duty leave'),
('LWP', 'Leave without pay');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DID`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`FID`);

--
-- Indexes for table `leave_applied`
--
ALTER TABLE `leave_applied`
  ADD PRIMARY KEY (`LID`);

--
-- Indexes for table `leave_type`
--
ALTER TABLE `leave_type`
  ADD PRIMARY KEY (`LTID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `leave_applied`
--
ALTER TABLE `leave_applied`
  MODIFY `LID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
