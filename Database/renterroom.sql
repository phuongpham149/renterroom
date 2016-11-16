-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2016 at 09:01 AM
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
INSERT INTO users(username, password,phoneNumber, role, email, address,status) VALUES (p_username,p_password,p_phoneNumber,p_role,p_email,p_address,1);
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `editStatusBooking` (IN `p_status` INT(11), IN `p_booking_id` INT(11))  BEGIN
UPDATE booking SET idStatus = p_status WHERE idBooking = p_booking_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getBookingDetail` (IN `p_booking_id` INT(11))  BEGIN
SELECT idBooking, users.idUser, idRoom, idStatus,username, email FROM  booking INNER JOIN users on users.idUser = booking.idUser
where idBooking = p_booking_id;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `getListHost` ()  BEGIN
SELECT idUser,username, password, phoneNumber, role,email, address,status from users WHERE role = 1 ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetListRoom` ()  BEGIN
   SELECT idRoom, idUser,category.idCategory,nameCategory,cost,description,isActive,timeCreated, timeUpdate,isEmpty, nameRoom, image, street, district from rooms INNER JOIN category ON rooms.idCategory = category.idCategory;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getListStatus` ()  SELECT idStatus,nameStatus from status$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getListUser` ()  BEGIN
SELECT idUser,username, password, phoneNumber, role,email, address,status from users ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getRoomDetail` (IN `p_room_id` INT)  BEGIN
SELECT idRoom,idUser,idCategory,cost,description,isActive, timeCreated, timeUpdate,isEmpty,nameRoom,image,street,district from rooms where idRoom = p_room_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getStatusDetail` (IN `p_status_id` INT(11))  BEGIN
SELECT idStatus,nameStatus FROM status WHERE idStatus = p_status_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserByUsername` (IN `p_username` VARCHAR(255))  BEGIN
SELECT `idUser`, `username`, `password`, `phoneNumber`, `role`, `email`, `address`, `status` FROM `users` WHERE username = p_username;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserByUsernamePassword` (IN `p_username` VARCHAR(255), IN `p_password` VARCHAR(255))  BEGIN
SELECT `idUser`, `username`, `password`, `phoneNumber`, `role`, `email`, `address`, `status` FROM `users` WHERE username = p_username and password = p_password ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserDetail` (IN `p_user_id` INT(11))  BEGIN
SELECT idUser,username, password, phoneNumber, role, email, address,status from users where idUser = p_user_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lockHost` (IN `p_host_id` INT(11))  BEGIN
UPDATE `users` SET `status`=0 WHERE idUser = p_host_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `unlockHost` (IN `p_host_id` INT(11))  BEGIN
UPDATE `users` SET `status`=1 WHERE idUser = p_host_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateActiveRoom` (IN `p_id_Room` INT(11))  BEGIN
UPDATE `rooms` SET `isActive`=1 WHERE idRoom = p_id_Room;
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

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`idBooking`, `idUser`, `idRoom`, `idStatus`, `note`, `timeCreated`) VALUES
(1, 1, 1, 1, 'Phòng đẹp,sau hai ngày sẽ tới đặt phòng ', '2016-09-01 00:00:00'),
(3, 1, 3, 1, 'Phòng phù hợp', '2016-09-23 00:00:00'),
(4, 1, 4, 2, 'Rất  thích ', '2016-09-23 00:00:00'),
(5, 2, 4, 0, 'Sẽ đến sớm', '3916-11-12 00:00:00'),
(6, 1, 2, 0, 'Vừa ý', '2016-11-02 00:00:00'),
(7, 1, 2, 0, 'Sau hai ngày sẽ tới đặt phòng \r\n', '2016-11-02 00:00:00'),
(8, 1, 2, 0, 'Đồng ý ', '2016-11-02 00:00:00'),
(9, 1, 2, 0, 'Rất phù hợp', '2016-11-11 00:00:00'),
(10, 1, 2, 0, 'Phòng đẹp', '2016-11-11 00:00:00'),
(11, 1, 2, 0, 'Sẽ tới sớm để gặp', '2016-11-16 00:00:00'),
(12, 1, 2, 0, 'Sẽ tới sớm để gặp mặt', '2016-11-16 00:00:00');

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
(6, 'abc', 'buithithan.cntt@gmail.com', '090909909090', 'I like your page');

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
(2, 2, 1, 1000, 'Rộng rãi, có chỗ để xe ', 1, '2016-09-03 00:00:00', '2016-09-09 00:00:00', 1, 'nguyên căn', 'hinh2.jpg', '758 Tôn Đức Thắng', 'Liên Chiểu'),
(3, 2, 2, 700, 'Tiện nghi, thoáng mát', 1, '2016-09-01 00:00:00', '2016-09-03 00:00:00', 1, 'Phòng đơn', 'hinh3.png', '27 Nguyễn Lương Bằng', 'Liên Chiểu'),
(4, 2, 1, 1200, 'Mặt tiền, sạch sẽ', 1, '2016-09-14 00:00:00', '2016-09-28 00:00:00', 1, 'nguyên căn', 'hinh4.png', '685 Trường Chinh', 'Cẩm Lệ'),
(5, 1, 2, 550, 'Mặt tiền, thoáng mát         ', 1, '2016-09-22 17:27:41', '2016-09-22 17:27:41', 0, 'Phòng đơn', 'hinh1.jpg', '60 Ông Ích Đường', 'Cẩm Lệ'),
(6, 1, 1, 700, 'Thoáng mát, an toàn tuyệt đối          ', 1, '2016-09-22 17:29:49', '2016-09-22 17:29:49', 0, 'Nguyên căn', 'hinh16.jpg', '11 Nguyễn Lương Bằng', 'Liên Chiểu'),
(7, 1, 2, 650, 'Phòng thoáng mát, tiện nghi, có điều hòa             ', 1, '2016-09-22 17:34:23', '2016-09-22 17:34:23', 0, 'Phòng đơn', 'hinh5.jpg', '28 Duy Tân', 'Hải Châu'),
(8, 1, 1, 800, 'Sạch sẽ, có vườn trái cây           ', 1, '2016-09-22 17:36:00', '2016-09-22 17:36:00', 0, 'Nguyên căn ', 'hinh6.jpg', '91 Nguyễn Hữu Thọ', 'Hải Châu'),
(9, 1, 2, 1000, 'Phòng an ninh tốt,đầy đủ tiện nghi            ', 1, '2016-09-22 17:44:39', '2016-09-22 17:44:39', 0, 'Phòng đơn', 'hinh7.jpg', '21 Núi Thành', 'Hải Châu'),
(10, 1, 2, 500, 'Sạch sẽ, thoáng mát, tiện nghỉ	            ', 0, '2016-09-22 17:51:20', '2016-09-22 17:51:20', 0, 'Phòng đơn ', 'hinh8.jpg', '333 Nguyễn Tri Phương', 'Hải Châu'),
(11, 1, 1, 1000, 'Phòng có gác lửng, phòng vệ sinh trong   ', 0, '2016-09-22 17:55:42', '2016-09-22 17:55:42', 0, 'Nguên căn', 'hinh9.jpg', '135 Điện Biên Phủ', 'Thanh Khê '),
(12, 1, 2, 400, 'Phòng an ninh tốt, cây cối thoáng mát            ', 0, '2016-09-22 18:21:15', '2016-09-22 18:21:15', 0, 'Phòng đơn', 'hinh10.jpg', '442 Ngô Quyền', 'Sơn Trà '),
(13, 1, 1, 800, 'Đầy đủ tiện nghi, có tivi, máy giặc           ', 0, '2016-09-22 18:22:21', '2016-09-22 18:22:21', 0, 'Nguyên căn', 'hinh11.jpg', '45 Hồ Tùng Mậu', 'Liên Chiểu'),
(14, 1, 1, 900, 'Phòng thoáng mát, an ninh tốt, chỗ đậu xe rộng	            ', 0, '2016-09-22 18:24:16', '2016-09-22 18:24:16', 0, 'Nguyên căn', 'hinh12.jpg', '22 Ngô Thì Nhậm', 'Liên Chiểu'),
(15, 1, 1, 1000, 'Phòng có đầy đủ tiện nghi, thoáng mát		            ', 0, '2016-09-22 18:25:36', '2016-09-22 18:25:36', 0, 'Nguyên căn', 'hinh13.jpg', '15 Lê Đại Hành', 'Cẩm Lệ '),
(18, 2, 2, 400, 'An ninh tốt , phòng đẹp', 0, '3916-11-10 00:00:00', '3916-11-12 00:00:00', 1, 'Phòng đơn', 'hinh14.jpg', '22 Tiểu La ', 'Hải Châu'),
(23, 1, 1, 1200, 'Phòng sạch sẽ , không ẩm mốc		            ', 0, '2016-11-11 00:00:00', '2016-11-11 00:00:00', 0, 'Nguyên căn', 'hinh15.jpg', '111 Núi Thành', 'Hải Châu');

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
  `address` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idUser`, `username`, `password`, `phoneNumber`, `role`, `email`, `address`, `status`) VALUES
(1, 'buithithan', 'e10adc3949ba59abbe56e057f20f883e', '1234567', 2, 'buithithan.cntt@gmail.com', '43 nhơn hòa 1, quận cẩm lệ, tp đầ nẵng', 1),
(2, 'phuongpham', 'e10adc3949ba59abbe56e057f20f883e', '123456765', 1, 'phamthiphuong@gmail.com', '12 ngô thì nhậm', 1),
(3, 'meomeocon', 'e10adc3949ba59abbe56e057f20f883e', '1231231231', 0, 'phamthiphuong.cntt@gmail.com', '12 Hà Huy Tập', 1),
(4, 'meomeoconcuachi', '8d70d8ab2768f232ebe874175065ead3', '909897567a', 1, 'phamthiphuong.cntt@gmail.com', '102  Hải Châu Đà Nẵng', 0),
(5, 'meo!12cdkcdk', '202cb962ac59075b964b07152d234b70', '12345678', 1, 'buithithan.cntt@gmail.com', '1 Ngô Thị Nhậm Liên Chiểu Đà Nẵng', 0),
(6, 'thuthanh', 'd9f2b64c47e309b78c5fa3eecc5ca808', '01234292', 1, 'buithithan.cntt@gmail.com', 'Liên Chiểu Đà Nẵng', 0),
(7, 'phuong@lala', '202cb962ac59075b964b07152d234b70', '123456789', 1, 'phamphuong@gmail.com', 'Hải Châu Đà Nẵng', 1),
(8, 'lethai', 'ace25026648f0a8f3bd0eab37405e894', '140258673', 1, 'doichomotngaymai@gmail.com', '33 Lê Thanh Nghị Hải Châu Đà Nẵng', 1),
(9, 'thanhhoa', '30c81266c64bb09194fbb76d80c99fc1', '8738475383', 1, 'thaihongbk@gmail.com', '102 Nguyễn Hữu Thọ Hải Châu Đà Nẵng', 1),
(10, 'thunhu', 'd41d8cd98f00b204e9800998ecf8427e', '1234567899', 1, 'hoacomay@gmail.com', ' Thanh Khuê Đà Nẵng', 1),
(11, 'maymuadong', 'e10adc3949ba59abbe56e057f20f883e', '90989756712', 1, 'phamthiphuong.cntt@gmail.com', '102 Nguyễn Hữu Thọ Hải Châu Đà Nẵng', 1),
(12, 'thu@thathiet', '733e62cc86764d490dbeeb7a3fa22caa', '1234345678', 1, 'banglang@gmail.com', '22 Hùng Vương Thanh Khuê Đà Nẵng', 1),
(13, 'thu@tayta', 'e10adc3949ba59abbe56e057f20f883e', '90989756712', 1, 'phamthiphuong.cntt@gmail.com', '102 Nguyễn Hữu Thọ Thanh Khuê Đà Nẵng', 1);

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
  MODIFY `idBooking` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `idCategory` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `idContact` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `idRoom` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `idStatus` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
