-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2015 at 06:23 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `delphixdb`
--
CREATE DATABASE IF NOT EXISTS `delphixdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `delphixdb`;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `FIRST_NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `DEPT_NAME` varchar(50) DEFAULT NULL,
  `CITY` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`FIRST_NAME`, `LAST_NAME`, `DEPT_NAME`, `CITY`) VALUES
('Woody', 'Evans', 'Solution Architects', 'Hoboken'),
('Jeff', 'Zeisler', 'Solution Architects', 'Menlo Park'),
('Dr. Jeff', 'Wootton', 'Lyrical Rap Studies', 'Reston'),
('Dino', 'Konstantinos', 'Sales', 'Fantasyland'),
('Ted', 'Girard', 'Sales', 'Bethesda'),
('Adam', 'Bowen', 'No Sleep Till', 'Brooklyn'),
('Adam', 'Bowen', 'Solution Architects', 'Ashland'),
('Luther', 'Vandross', 'Superstar', 'NYC'),
('Ted', 'Girard', 'Sales', 'Bethesda'),
('Jude', 'Seth', 'Solution Architects', 'DK');

-- --------------------------------------------------------

--
-- Table structure for table `medical_records`
--

DROP TABLE IF EXISTS `medical_records`;
CREATE TABLE IF NOT EXISTS `medical_records` (
  `PATIENT_ID` int(15) NOT NULL,
  `PHONE_NUMBER` varchar(30) DEFAULT NULL,
  `MEDICAL_RECORD_NUMBER` varchar(30) DEFAULT NULL,
  `EMAIL` varchar(40) DEFAULT NULL,
  `ADDRESS` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medical_records`
--

INSERT INTO `medical_records` (`PATIENT_ID`, `PHONE_NUMBER`, `MEDICAL_RECORD_NUMBER`, `EMAIL`, `ADDRESS`) VALUES
(1, '803-345-6789', '4483838', 'raygun@aol.com', '40 Presidential Dr'),
(2, '415-345-6789', '5483838', 'bush@aol.com', '2943 SMU Blvd'),
(3, '650-456-0987', '6483838', 'obama@aol.com', '1600 Pennsylvania Ave'),
(4, '123-321-9990', '7483838', 'abe@hotmail.com', '112 N 6th St'),
(5, '440-345-2345', '8483838', 'Jeff@whitehouse.gov', '7415 Arlington Blvd');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `PATIENT_ID` int(15) NOT NULL,
  `FIRSTNAME` varchar(40) DEFAULT NULL,
  `LASTNAME` varchar(40) DEFAULT NULL,
  `SOCIAL_SECURITY_NUMBER` varchar(11) DEFAULT NULL,
  `ADDRESS` varchar(60) DEFAULT NULL,
  `CITY` varchar(15) DEFAULT NULL,
  `ZIPCODE` varchar(10) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `PHONE_NUMBER` varchar(24) DEFAULT NULL,
  `EMAIL` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`PATIENT_ID`, `FIRSTNAME`, `LASTNAME`, `SOCIAL_SECURITY_NUMBER`, `ADDRESS`, `CITY`, `ZIPCODE`, `DOB`, `PHONE_NUMBER`, `EMAIL`) VALUES
(1, 'Ronald', 'Reagan', '474-78-1234', '40 Presidential Dr', 'Simi Valley', '93065-0987', NULL, '803-345-6789', 'raygun@aol.com'),
(2, 'George', 'Bush', '111-67-4321', '2943 SMU Blvd', 'Dallas', '75205-7367', NULL, '415-345-6789', 'bush@aol.com'),
(3, 'Barack', 'Obama', '650-12-5432', '1600 Pennsylvania Ave', 'Washington DC', '20500-6353', NULL, '650-456-0987', 'obama@aol.com'),
(4, 'Abraham', 'Lincoln', '673-11-3479', '112 N 6th St', 'Springfield', '62701-6363', NULL, '123-321-9990', 'abe@hotmail.com'),
(5, 'Thomas', 'Jefferson', '123-68-8765', '7415 Arlington Blvd', 'Falls Church', '22042-4242', NULL, '440-345-2345', 'Jeff@whitehouse.gov');

-- --------------------------------------------------------

--
-- Table structure for table `patient_details`
--

DROP TABLE IF EXISTS `patient_details`;
CREATE TABLE IF NOT EXISTS `patient_details` (
  `PATIENT_ID` int(15) NOT NULL,
  `PHONE_NUMBER` varchar(30) DEFAULT NULL,
  `MEDICAL_RECORD_NUMBER` varchar(30) DEFAULT NULL,
  `ACCOUNT_NUMBER` varchar(30) DEFAULT NULL,
  `CC_NUMBER` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_details`
--

INSERT INTO `patient_details` (`PATIENT_ID`, `PHONE_NUMBER`, `MEDICAL_RECORD_NUMBER`, `ACCOUNT_NUMBER`, `CC_NUMBER`) VALUES
(1, '803-345-6789', '3338383', '4483838', '4283897623459088'),
(2, '415-345-6789', '7338383', '5483838', '5683897623459088'),
(3, '650-456-0987', '8338383', '6483838', '3783897623459088'),
(4, '123-321-9990', '2338383', '7483838', '4283897623459088');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `medical_records`
--
ALTER TABLE `medical_records` ADD PRIMARY KEY (`PATIENT_ID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient` ADD PRIMARY KEY (`PATIENT_ID`);

--
-- Indexes for table `patient_details`
--
ALTER TABLE `patient_details` ADD PRIMARY KEY (`PATIENT_ID`);


--
-- Create user ... 
--
CREATE USER 'delphixdb'@'%' IDENTIFIED BY 'delphixdb';
GRANT USAGE ON *.* TO 'delphixdb'@'%' IDENTIFIED BY 'delphixdb' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;
GRANT ALL PRIVILEGES ON 'delphixdb'.* TO 'delphixdb'@'%';

CREATE USER 'delphixdb'@'localhost' IDENTIFIED BY 'delphixdb';
GRANT USAGE ON *.* TO 'delphixdb'@'localhost' IDENTIFIED BY 'delphixdb' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;

-- 
-- End of Data ...
--
