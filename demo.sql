-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2021 at 06:31 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `isbn` char(13) NOT NULL,
  `name` varchar(30) NOT NULL,
  `author` varchar(30) NOT NULL,
  `Total_like` int(10) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `time` time NOT NULL,
  `username` varchar(30) NOT NULL,
  `cost` double NOT NULL DEFAULT 50,
  `isDonated` varchar(3) NOT NULL,
  `total_dislike` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`isbn`, `name`, `author`, `Total_like`, `image`, `description`, `time`, `username`, `cost`, `isDonated`, `total_dislike`) VALUES
('Bio', 'Biology', 'Gazi Azmol', 2, 'download (6).jpg', 'Quite Okay', '20:10:00', 'Tahsin Habib', 50, 'Yes', 2),
('che', 'CHEMISTRY', 'Sanjit Kumar', 2, 'download (8).jpg', 'Very Good', '20:05:29', 'Tahsin Habib', 50, 'Yes', 1),
('math', 'Higher Math', 'Akkhay Kumar', 2, 'download (2).jpg', 'Pretty Much Good', '22:08:59', 'Tahsin Habib', 50, 'No', 1),
('phy', 'Physics', 'Ishak', 1, 'download (1).jpg', 'Good', '20:04:29', 'Tahsin Habib', 50, 'Yes', 1);

-- --------------------------------------------------------

--
-- Table structure for table `deliveryman`
--

CREATE TABLE `deliveryman` (
  `id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `location` varchar(30) NOT NULL,
  `totalDelivery` int(10) NOT NULL DEFAULT 0,
  `toBePaid` float NOT NULL,
  `rating` int(1) DEFAULT NULL,
  `city` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `trxId` int(11) NOT NULL,
  `amount` double NOT NULL,
  `payerId` int(10) NOT NULL,
  `method` varchar(3) NOT NULL,
  `time` datetime NOT NULL,
  `isDone` int(1) NOT NULL,
  `username` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(10) NOT NULL,
  `title` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  `loved` int(10) NOT NULL DEFAULT 0,
  `isbn` char(13) NOT NULL,
  `username` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `text` text DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `postid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `reqId` int(11) NOT NULL,
  `time` time DEFAULT NULL,
  `accepted` varchar(10) NOT NULL DEFAULT 'Processing',
  `username` varchar(30) DEFAULT NULL,
  `book_id` char(13) DEFAULT NULL,
  `deliveryManid` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`reqId`, `time`, `accepted`, `username`, `book_id`, `deliveryManid`) VALUES
(12, '20:07:24', 'Processing', 'Tahsin Habib', 'che', NULL),
(13, '20:07:46', 'Processing', 'Tahsin Habib', 'phy', NULL),
(14, '20:10:07', 'Processing', 'Tahsin Habib', 'Bio', NULL),
(16, '00:00:55', 'Processing', 'Tahsin Habib', 'Bio', NULL),
(17, '00:59:06', 'Processing', 'Tahsin Habib', 'che', NULL),
(18, '01:04:02', 'Processing', 'Tahsin Habib', 'che', NULL),
(19, '01:06:52', 'Processing', 'Tahsin Habib', 'che', NULL),
(20, '22:13:55', 'Processing', 'Tahsin Habib', 'math', NULL),
(21, '22:20:13', 'Processing', 'Tahsin Habib', 'math', NULL),
(22, '22:20:26', 'Processing', 'Tahsin Habib', 'math', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(65) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `lastname` varchar(20) NOT NULL,
  `location` varchar(60) DEFAULT NULL,
  `totalCredit` float NOT NULL DEFAULT 0,
  `totalRead` int(10) NOT NULL DEFAULT 0,
  `totalGiven` int(10) NOT NULL DEFAULT 0,
  `rating` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `email`, `password`, `firstname`, `phone`, `lastname`, `location`, `totalCredit`, `totalRead`, `totalGiven`, `rating`) VALUES
('admin4', 'admin4@gmail.com', '3261ac86cf619938812e44a0fd7e2049', 'admin', 1795142544, 'four', 'localhost4', 0, 0, 0, 0),
('Tahsin Habib', 'tasanhabibbrinto@gmail.com', '16f6598d3b4b3a79eda797d5f2b98807', 'Tahsin Habib ', 1795142599, 'Brinto', 'Mokterpara, Kurigram Sada', 0, 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `FKbook798380` (`username`);

--
-- Indexes for table `deliveryman`
--
ALTER TABLE `deliveryman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`trxId`),
  ADD KEY `FKpayment510245` (`username`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpost381173` (`username`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`reqId`),
  ADD KEY `FKrequest865917` (`username`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `deliveryman`
--
ALTER TABLE `deliveryman`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `trxId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `reqId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `FKbook798380` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FKpayment510245` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FKpost381173` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `FKrequest865917` FOREIGN KEY (`username`) REFERENCES `user` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
