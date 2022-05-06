-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 27, 2022 at 04:32 PM
-- Server version: 8.0.28-0ubuntu0.20.04.3
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dutyexchange`
--

-- --------------------------------------------------------

--
-- Table structure for table `duty`
--

CREATE TABLE `duty` (
  `tid` int NOT NULL,
  `dutyid` int NOT NULL,
  `Date` date NOT NULL,
  `meta` varchar(30) DEFAULT NULL,
  `exchanged` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `duty`
--

INSERT INTO `duty` (`tid`, `dutyid`, `Date`, `meta`, `exchanged`) VALUES
(1032, 1, '2004-04-22', NULL, 'FALSE'),
(1033, 2, '2005-04-22', NULL, 'FALSE'),
(1034, 3, '2006-04-22', NULL, 'FALSE'),
(1035, 4, '2007-04-22', NULL, 'FALSE'),
(1036, 5, '2008-04-22', NULL, 'FALSE'),
(1037, 6, '2011-04-22', NULL, 'FALSE'),
(1038, 7, '2012-04-22', NULL, 'FALSE'),
(1039, 8, '2013-04-22', NULL, 'FALSE'),
(1040, 9, '2014-04-22', NULL, 'FALSE'),
(1041, 10, '2015-04-22', NULL, 'FALSE'),
(1042, 11, '2004-04-22', NULL, 'FALSE'),
(1043, 12, '2005-04-22', NULL, 'FALSE'),
(1044, 13, '2006-04-22', NULL, 'FALSE'),
(1045, 14, '2007-04-22', NULL, 'FALSE'),
(1046, 15, '2008-04-22', NULL, 'FALSE'),
(1047, 16, '2011-04-22', NULL, 'FALSE'),
(1048, 17, '2012-04-22', NULL, 'FALSE'),
(1049, 18, '2013-04-22', NULL, 'FALSE'),
(1050, 19, '2014-04-22', NULL, 'FALSE'),
(1051, 20, '2015-04-22', NULL, 'FALSE');

-- --------------------------------------------------------

--
-- Table structure for table `exchange`
--

CREATE TABLE `exchange` (
  `dutyid1` int NOT NULL,
  `dutyid2` int NOT NULL,
  `requestor` int NOT NULL,
  `approver` int NOT NULL,
  `Status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Teachers`
--

CREATE TABLE `Teachers` (
  `eid` int NOT NULL,
  `name` varchar(24) NOT NULL,
  `Department` varchar(10) NOT NULL,
  `Affiliation` varchar(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Teachers`
--

INSERT INTO `Teachers` (`eid`, `name`, `Department`, `Affiliation`) VALUES
(1032, 'Balamohan Koduri', 'Computer', 'Assistant Professor'),
(1033, 'Sanabhi Vandan Karim', 'Computer', 'Assistant Professor'),
(1034, 'Nishok Vidi', 'Computer', 'Assistant Professor'),
(1035, 'Samiran Savdeep', 'Computer', 'Assistant Professor'),
(1036, 'Hassan Neeraj', 'Computer', 'Assistant Professor'),
(1037, 'Lohitaksha Natterraja', 'Computer', 'Assistant Professor'),
(1038, 'Nabarun Prajna', 'Mechanical', 'Assistant Professor'),
(1039, 'Shridhar Sur Vishnuraman', 'Mechanical', 'Assistant Professor'),
(1040, 'Habib Shahid', 'Mechanical', 'Assistant Professor'),
(1041, 'Yogendra Ramamohan', 'Mechanical', 'Assistant Professor'),
(1042, 'Sundar Maitreya', 'Mechanical', 'Assistant Professor'),
(1043, 'Krishnala Nachiketa', 'Mechanical', 'Assistant Professor'),
(1044, 'Kashiprasad Raza', 'Civil', 'Assistant Professor'),
(1045, 'Sukrit Subbaratnam', 'Civil', 'Assistant Professor'),
(1046, 'Abhyagni Hynala', 'Civil', 'Associate Professor'),
(1047, 'Phanindra Subramanyan', 'Civil', 'Associate Professor'),
(1048, 'Narsimha Sapthotharan', 'Civil', 'Associate Professor'),
(1049, 'Chandrashekhar Yamini', 'Computer', 'Associate Professor'),
(1050, 'Upagupta Sekhar', 'Computer', 'Associate Professor'),
(1051, 'Vikramajit Kadamuddi', 'Computer', 'Associate Professor');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `eid` int NOT NULL,
  `name` varchar(24) NOT NULL,
  `Department` varchar(10) NOT NULL,
  `Affiliation` varchar(19) NOT NULL,
  `Email` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`eid`, `name`, `Department`, `Affiliation`, `Email`, `password`) VALUES
(1032, 'Balamohan Koduri', 'Computer', 'Assistant Professor', '1032@gmail.com', '067958390d18bfa69c9ceaed05b3b41d'),
(1033, 'Sanabhi Vandan Karim', 'Computer', 'Assistant Professor', '1033@gmail.com', '3d150969bad275f3fef4de7e492f3f79'),
(1034, 'Nishok Vidi', 'Computer', 'Assistant Professor', '1034@gmail.com', '7e97ad5e20c585105b8df15666f24a62'),
(1035, 'Samiran Savdeep', 'Computer', 'Assistant Professor', '1035@gmail.com', '86380ca415244c066c49a6a002c30236'),
(1036, 'Hassan Neeraj', 'Computer', 'Assistant Professor', '1036@gmail.com', '1b52103c0d6631a6a988260cfde498ad'),
(1037, 'Lohitaksha Natterraja', 'Computer', 'Assistant Professor', '1037@gmail.com', '633f3dc3d9b001db959c1ebc2dd98788'),
(1038, 'Nabarun Prajna', 'Mechanical', 'Assistant Professor', '1038@gmail.com', '98373817a65abebf26d5389de54720a0'),
(1039, 'Shridhar Sur Vishnuraman', 'Mechanical', 'Assistant Professor', '1039@gmail.com', 'ab3455874f6f89544a96474018456dd7'),
(1040, 'Habib Shahid', 'Mechanical', 'Assistant Professor', '1040@gmail.com', '3aa3dc1662d91e7d72620b25a5dbafd2'),
(1041, 'Yogendra Ramamohan', 'Mechanical', 'Assistant Professor', '1041@gmail.com', 'ae75a192e0f83fd9ba207888eaa0ffbf'),
(1042, 'Sundar Maitreya', 'Mechanical', 'Assistant Professor', '1042@gmail.com', 'e8b36a463b3373a1ab3485852c673680'),
(1043, 'Krishnala Nachiketa', 'Mechanical', 'Assistant Professor', '1043@gmail.com', 'ed5e70d714729e6ebf68f15da875bbf7'),
(1044, 'Kashiprasad Raza', 'Civil', 'Assistant Professor', '1044@gmail.com', 'bba679d14d4bc1ba185cc75a3f248b06'),
(1045, 'Sukrit Subbaratnam', 'Civil', 'Assistant Professor', '1045@gmail.com', 'df66b18ee0bf5a64a87429f60158abc6'),
(1046, 'Abhyagni Hynala', 'Civil', 'Associate Professor', '1046@gmail.com', 'ce6c7261bc8dfd6732a640df5cceefd7'),
(1047, 'Phanindra Subramanyan', 'Civil', 'Associate Professor', '1047@gmail.com', 'f6e0cfdb1469c3b7e42884c85c35cbf2'),
(1048, 'Narsimha Sapthotharan', 'Civil', 'Associate Professor', '1048@gmail.com', 'deff76d23577839307381fd1dc6ab993'),
(1049, 'Chandrashekhar Yamini', 'Computer', 'Associate Professor', '1049@gmail.com', '0a13582cce7e8add8bbb10bea18ae16b'),
(1050, 'Upagupta Sekhar', 'Computer', 'Associate Professor', '1050@gmail.com', '2667ad71ccf66096237376a648b47e08'),
(1051, 'Vikramajit Kadamuddi', 'Computer', 'Associate Professor', '1051@gmail.com', 'b96dc39838ea96b196482c544576b91d');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `duty`
--
ALTER TABLE `duty`
  ADD PRIMARY KEY (`dutyid`);

--
-- Indexes for table `Teachers`
--
ALTER TABLE `Teachers`
  ADD PRIMARY KEY (`eid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`eid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
