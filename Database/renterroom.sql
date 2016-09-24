-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2016 at 03:33 PM
-- Server version: 10.1.8-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `renterroom`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `idBooking` int(10) NOT NULL,
  `idUser` int(100) NOT NULL,
  `idRoom` int(100) NOT NULL,
  `idStatus` int(10) NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `timeCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`idBooking`, `idUser`, `idRoom`, `idStatus`, `note`, `timeCreated`) VALUES
(1, 1, 1, 1, 'ruytre', '2016-09-01 00:00:00'),
(2, 2, 2, 2, 'iuytre', '2016-09-08 00:00:00'),
(3, 1, 3, 2, 'ytrewq', '2016-09-23 00:00:00'),
(4, 1, 4, 2, 'uytrewq', '2016-09-23 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `idCategory` int(100) NOT NULL,
  `nameCategory` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`idCategory`, `nameCategory`) VALUES
(1, 'nguyên căn'),
(2, 'phòng đơn');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `idContact` int(100) NOT NULL,
  `nameContact` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNumber` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`idContact`, `nameContact`, `email`, `phoneNumber`, `content`) VALUES
(1, 'contact1', 'thanhthanh@gmail.com', '12345678', 'Thông tin được chấp nhận'),
(2, 'contact2', 'abc@gmail.com', '98765432', 'Thông tin hợp lệ ');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `idRoom` int(100) NOT NULL,
  `idUser` int(100) NOT NULL,
  `idCategory` int(100) NOT NULL,
  `cost` int(100) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `isActive` int(10) NOT NULL,
  `timeCreated` datetime NOT NULL,
  `timeUpdate` datetime NOT NULL,
  `isEmpty` int(10) NOT NULL,
  `nameRoom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `district` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`idRoom`, `idUser`, `idCategory`, `cost`, `description`, `isActive`, `timeCreated`, `timeUpdate`, `isEmpty`, `nameRoom`, `image`, `street`, `district`) VALUES
(1, 1, 1, 600000, 'tiện nghi', 1, '2016-09-01 00:00:00', '2016-09-02 00:00:00', 1, 'đơn', 'hinh1.png', '43 ngô thì nhậm', 'liên chiểu'),
(2, 2, 2, 1000000, 'rộng rãi', 1, '2016-09-03 00:00:00', '2016-09-09 00:00:00', 1, 'nguyên căn', 'hinh2.pnf', '11 lê văn hiển', 'cẩm lệ '),
(3, 2, 1, 700000, 'tiện nghi', 0, '2016-09-01 00:00:00', '2016-09-03 00:00:00', 0, 'đơn', 'hinh3.png', '12 hùng vương', 'thanh khê'),
(4, 2, 1, 1200000, 'mặt tiền', 1, '2016-09-14 00:00:00', '2016-09-28 00:00:00', 1, 'nguyên căn', 'hinh4.png', '43 nguyễn văn linh', 'thanh khê '),
(5, 1, 1, 567, '			                \r\n			 hjk           ', 0, '2016-09-22 17:27:41', '2016-09-22 17:27:41', 0, 'dfghj', '370.jpg', 'gh', ''),
(6, 1, 1, 4567, '			                \r\n			fghj            ', 0, '2016-09-22 17:29:49', '2016-09-22 17:29:49', 0, 'ghj', 'girl.jpg', 'ty', ''),
(7, 1, 1, 76, '			                \r\n		hgf	            ', 0, '2016-09-22 17:34:23', '2016-09-22 17:34:23', 0, 'ytrew', '370.jpg', 'ytr', ''),
(8, 1, 1, 876, '			                \r\n			hgf            ', 0, '2016-09-22 17:36:00', '2016-09-22 17:36:00', 0, 'jhgf', '370.jpg', 'gf', ''),
(9, 1, 1, 9, '			                \r\n		h	            ', 0, '2016-09-22 17:44:39', '2016-09-22 17:44:39', 0, 'dfghj', '370.jpg', 'hhhh', ''),
(10, 1, 1, 12, '			                \r\n		?221	            ', 0, '2016-09-22 17:51:20', '2016-09-22 17:51:20', 0, 'ưe', '370.jpg', '123', ''),
(11, 1, 1, 1234, '			                \r\n			q?            ', 0, '2016-09-22 17:55:42', '2016-09-22 17:55:42', 0, '1', 'tiếng.JPG', '1', ''),
(12, 1, 1, 4, '			                \r\n		4	            ', 0, '2016-09-22 18:21:15', '2016-09-22 18:21:15', 0, 't', '13645106_1764538787118715_8506968980098576690_n.jpg', '4', ''),
(13, 1, 1, 34444, '			                \r\n		5555555	            ', 0, '2016-09-22 18:22:21', '2016-09-22 18:22:21', 0, 'abc', '13645106_1764538787118715_8506968980098576690_n.jpg', '555', ''),
(14, 1, 1, 444, '			                \r\n	rrrrrrrrrrrrrrrrrr		            ', 0, '2016-09-22 18:24:16', '2016-09-22 18:24:16', 0, 'e', 'girl.jpg', 'rrrrrrrrr', ''),
(15, 1, 1, 10000, '			                \r\n	sssssssss		            ', 0, '2016-09-22 18:25:36', '2016-09-22 18:25:36', 0, '111', '13645106_1764538787118715_8506968980098576690_n.jpg', 's', ''),
(16, 1, 1, 8765, '			                \r\n		eeee	            ', 0, '2016-09-22 18:26:07', '2016-09-22 18:26:07', 0, 'oiu', '13645106_1764538787118715_8506968980098576690_n.jpg', 'eeeee', ''),
(17, 1, 1, 56, '			                \r\n			      fghj      ', 0, '2016-09-23 08:24:38', '2016-09-23 08:24:38', 0, 'fghj', '370.jpg', 'hj', '');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `idStatus` int(10) NOT NULL,
  `nameStatus` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`idStatus`, `nameStatus`) VALUES
(1, 'Đã duyệt '),
(2, 'Chưa duyệt');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `idUser` int(100) NOT NULL,
  `username` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNumber` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `role` int(10) NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idUser`, `username`, `password`, `phoneNumber`, `role`, `email`, `address`) VALUES
(1, 'than', '81dc9bdb52d04dc20036dbd8313ed055', '1234567', 2, 'buithithan@gmail.com', '43 nhơn hòa 1, quận cẩm lệ, tp đầ nẵng'),
(2, 'phương', '81dc9bdb52d04dc20036dbd8313ed055', '123456765', 1, 'phamthiphuong@gmail.com', '12 ngô thì nhậm');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`idBooking`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idCategory`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`idContact`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`idRoom`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`idStatus`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `idBooking` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `idCategory` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `idContact` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `idRoom` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `idStatus` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
