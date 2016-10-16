-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2016 at 07:01 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `renterroom`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addBooking` (IN `p_user_id` INT(11), IN `p_room_id` INT(11), IN `p_status_id` INT(11), IN `p_note` TEXT, IN `p_timeCreated` DATE)  BEGIN
INSERT INTO booking(idUser, idRoom, idStatus, note, timeCreated) VALUES (p_user_id,p_room_id,p_status_id,p_note,p_timeCreated);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addCat` (IN `p_cat_name` VARCHAR(255))  BEGIN
INSERT INTO category(nameCategory) VALUES (p_cat_name);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addContact` (IN `p_contact_name` VARCHAR(255), IN `p_email` VARCHAR(255), IN `p_phoneNumber` VARCHAR(255), IN `p_content` TEXT)  BEGIN
INSERT INTO contact(nameContact, email, phoneNumber, content) VALUES (p_contact_name,p_email,p_phoneNumber,p_content);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addRoom` (IN `p_user_id` INT(11), IN `p_cat_id` INT(11), IN `p_cost` INT(11), IN `p_description` TEXT, IN `p_isActive` INT(11), IN `p_timeCreate` DATE, IN `p_timeUpdate` DATE, IN `p_isEmpty` INT(11), IN `p_nameRoom` VARCHAR(255), IN `p_image` TEXT, IN `p_street` VARCHAR(255), IN `p_district` VARCHAR(255))  BEGIN
INSERT INTO rooms( idUser, idCategory, cost,  description,isActive,timeCreated, timeUpdate, isEmpty, nameRoom, image,street,district) VALUES (p_user_id,p_cat_id,p_cost,p_description,p_isActive,p_timeCreate,p_timeUpdate,p_isEmpty,p_nameRoom,p_image,p_street,p_district);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addStatus` (IN `p_status_name` VARCHAR(255))  BEGIN
INSERT INTO status(nameStatus) VALUES (p_status_name);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `addUser` (IN `p_username` VARCHAR(255), IN `p_password` VARCHAR(255), IN `p_phoneNumber` VARCHAR(255), IN `p_role` INT(11), IN `p_email` VARCHAR(255), IN `p_address` TEXT)  NO SQL
BEGIN
INSERT INTO users(username, password,phoneNumber, role, email, address) VALUES (p_username,p_password,p_phoneNumber,p_role,p_email,p_address);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delBooking` (IN `p_booking_id` INT(11))  BEGIN
delete from booking where idBooking= p_booking_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delCat` (IN `p_cat_id` INT(11))  BEGIN
DELETE FROM category WHERE idCategory=p_cat_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delContact` (IN `p_contact_id` INT(11))  BEGIN

DELETE FROM contact WHERE idContact = p_contact_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delRoom` (IN `p_room_id` INT(11))  BEGIN
delete FROM rooms WHERE idRoom = p_room_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delStatus` (IN `p_status_id` INT(11))  BEGIN
delete from status where idStatus = p_status_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delUser` (IN `p_user_id` INT(11))  BEGIN
delete from users where idUser=p_user_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editIsEmptyRoom` (IN `p_isEmpty` INT(11), IN `p_room_id` INT(11))  BEGIN
UPDATE rooms set  isEmpty=p_isEmpty where idRoom= p_room_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editRoom` (IN `p_user_id` INT(11), IN `p_cat_id` INT(11), IN `p_cost` INT(11), IN `p_description` TEXT, IN `p_isActive` INT(11), IN `p_timeCreated` DATE, IN `p_timeUpdated` DATE, IN `p_isEmpty` INT(11), IN `p_nameRoom` VARCHAR(255), IN `p_image` TEXT, IN `p_street` VARCHAR(255), IN `p_district` INT(11), IN `p_room_id` INT(11))  BEGIN
UPDATE rooms set idUser= p_user_id,idCategory =p_cat_id, cost = p_cost , description = p_description, isActive = p_isActive, timeCreated = p_timeCreated, timeUpdate = p_timeUpdated, isEmpty = p_isEmpty, nameRoom = p_nameRoom, image =p_image, street =p_street, district = p_district where idRoom= p_room_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getBookingDetail` (IN `p_booking_id` INT(11))  BEGIN
SELECT idBooking, idUser, idRoom, idStatus, note, timeCreated FROM  booking where idBooking = p_booking_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getCatDetail` (IN `p_cat_id` INT(11))  BEGIN
SELECT idCategory,nameCategory FROM category WHERE idCategory = p_cat_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getContactDetail` (IN `p_contact_id` INT(11))  BEGIN
SELECT idContact,nameContact, email, phoneNumber, content FROM contact WHERE idContact = p_contact_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getIsEmpty` (IN `p_room_id` INT)  BEGIN
SELECT isEmpty FROM rooms where idRoom = p_room_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getListBooking` ()  BEGIN
SELECT idBooking, booking.idUser, username,phoneNumber, address, idRoom, idStatus, note , timeCreated FROM  booking,users WHERE booking.idUser = users.idUser;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getListCat` ()  BEGIN
SELECT idCategory,nameCategory from category; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getListContact` ()  BEGIN
SELECT idContact,nameContact,email, phoneNumber, content  FROM contact;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetListRoom` ()  BEGIN
   SELECT idRoom, idUser,category.idCategory,nameCategory,cost,description,isActive,timeCreated, timeUpdate,isEmpty, nameRoom, image, street, district from rooms INNER JOIN category ON rooms.idCategory = category.idCategory;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getListStatus` ()  SELECT idStatus,nameStatus from status$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getListUser` ()  BEGIN
SELECT idUser,username, password, phoneNumber, role,email, address from users ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getRoomDetail` (IN `p_room_id` INT)  BEGIN
SELECT idRoom,idUser,idCategory,cost,description,isActive, timeCreated, timeUpdate,isEmpty,nameRoom,image,street,district from rooms where idRoom = p_room_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getStatusDetail` (IN `p_status_id` INT(11))  BEGIN
SELECT * FROM status WHERE idStatus = p_status_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserDetail` (IN `p_user_id` INT(11))  BEGIN
SELECT idUser,username, password, phoneNumber, role, email, address from users where idUser = p_user_id;
END$$

DELIMITER ;

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

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `idCategory` int(100) NOT NULL,
  `nameCategory` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `idStatus` int(10) NOT NULL,
  `nameStatus` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  MODIFY `idBooking` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `idCategory` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `idContact` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `idRoom` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `idStatus` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
