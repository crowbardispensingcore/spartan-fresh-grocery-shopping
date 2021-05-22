-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: sql3.freesqldatabase.com:3306
-- Generation Time: May 22, 2021 at 11:19 PM
-- Server version: 5.5.54-0ubuntu0.12.04.1
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sql3402886`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Fruit'),
(2, 'Vegetable'),
(3, 'Protein'),
(4, 'Dairy'),
(5, 'Baked Good'),
(6, 'Snack');

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `address_id` int(11) NOT NULL,
  `FK_customer_id` int(11) NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip_code` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`address_id`, `FK_customer_id`, `street`, `city`, `state`, `zip_code`) VALUES
(30, 1, 'wew', '1231', 'XQ', '22222'),
(31, 1, '231', '212312', 'XA', '33333'),
(32, 1, '375 S', 'San Jose22', 'CA', '12332'),
(33, 2, 'rqrqw', 'wqwe', 'CA', '12345'),
(34, 3, 'dasaw 323rrr', 'wqe2', 'CA', '44444'),
(36, 51, 'some street', 'some city', 'CA', '12345'),
(37, 67, 'some street', 'some city', 'CA', '12345'),
(38, 89, '3430 Sampson Street', 'Julian', 'CA', '12345'),
(39, 62, '123123', '123', 'CA', '12345'),
(40, 141, 'Some street', 'Some city', 'CA', '00000'),
(41, 142, 'Street', 'City', 'CA', '00000'),
(42, 144, '72 South Riverside Drive', 'Pearl', 'MS', '39208'),
(43, 89, '10880 Malibu Point', 'Point Dume', 'CA', '95382'),
(44, 148, '35195 Annette Square', 'Fremont', 'CA', '94536'),
(45, 150, '123 happened', 'san jose ', 'CA', '96132'),
(46, 156, '123 lane', 'san jose', 'CA', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE `customer_order` (
  `order_id` int(11) NOT NULL,
  `FK_customer_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `order_total` double NOT NULL DEFAULT '0',
  `FK_status_id` int(11) NOT NULL,
  `order_address` varchar(255) NOT NULL,
  `order_payment` varchar(255) NOT NULL,
  `delivery_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_order`
--

INSERT INTO `customer_order` (`order_id`, `FK_customer_id`, `order_date`, `order_total`, `FK_status_id`, `order_address`, `order_payment`, `delivery_date`) VALUES
(131, 51, '2021-05-06 19:00:17', 6.64, 1, 'some street, some city, CA, 12345', 'Ending in 2222, Name On Card: some body, expires: 23/4231', 'Friday, May/07'),
(132, 1, '2021-05-06 20:19:33', 148.21, 1, 'some street, some city, CA, 12345', 'Ending in 1111, Name On Card: somebody, expires: 01/1234', 'Saturday, May/08'),
(133, 89, '2021-05-06 22:01:30', 11.68, 1, 'Julian, Julian, CA, 12345', 'Ending in 1111, Name On Card: Julian Ju, expires: 01/1234', 'Saturday, May/08'),
(134, 1, '2021-05-09 16:42:40', 9.8, 1, '231, 212312, XA, 33333', 'Ending in 6433, Name On Card: Percy, expires: 06/2022', 'Wednesday, May/12'),
(135, 1, '2021-05-09 17:50:52', 48585.57, 1, '231, 212312, XA, 33333', 'Ending in 5222, Name On Card: qwwewaa, expires: 12/2222', 'Monday, May/10'),
(136, 62, '2021-05-09 20:40:33', 105.26, 1, '123123, 123, CA, 12345', 'Ending in 1111, Name On Card: Paul, expires: 13/1234', 'Tuesday, May/11'),
(137, 141, '2021-05-09 23:23:48', 59.69, 1, 'Some street, Some city, CA, 00000', 'Ending in 0000, Name On Card: Paul R, expires: 01/2014', 'Tuesday, May/11'),
(138, 141, '2021-05-09 23:30:14', 445.36, 1, 'Some street, Some city, CA, 00000', 'Ending in 0000, Name On Card: Paul R, expires: 01/2014', 'Monday, May/10'),
(139, 141, '2021-05-10 14:07:54', 618.81, 1, 'Some street, Some city, CA, 00000', 'Ending in 0000, Name On Card: Some Body, expires: 01/4951', 'Monday, May/10'),
(140, 141, '2021-05-10 14:10:05', 1.74, 1, 'Some street, Some city, CA, 00000', 'Ending in 0000, Name On Card: Some Body, expires: 01/4951', 'Monday, May/10'),
(141, 141, '2021-05-10 14:11:22', 1.74, 1, 'Some street, Some city, CA, 00000', 'Ending in 0000, Name On Card: Some Body, expires: 01/4951', 'Monday, May/10'),
(142, 142, '2021-05-10 20:23:00', 316.09, 1, 'Street, City, CA, 00000', 'Ending in 0000, Name On Card: Kenneth Perry, expires: 01/2024', 'Wednesday, May/12'),
(143, 144, '2021-05-10 20:48:55', 38.99, 1, '72 South Riverside Drive, Pearl, MS, 39208', 'Ending in 3977, Name On Card: Wayne G. Hartsell, expires: 04/2026', 'Thursday, May/13'),
(144, 89, '2021-05-11 13:08:31', 1.74, 1, 'Julian, Julian, CA, 12345', 'Ending in 1111, Name On Card: Julian Ju, expires: 01/1234', 'Tuesday, May/11'),
(145, 89, '2021-05-11 13:10:19', 220.3, 1, 'Julian, Julian, CA, 12345', 'Ending in 1111, Name On Card: Julian Ju, expires: 01/1234', 'Tuesday, May/11'),
(146, 89, '2021-05-11 13:17:02', 5.34, 1, 'Julian, Julian, CA, 12345', 'Ending in 1111, Name On Card: Julian Ju, expires: 01/1234', 'Tuesday, May/11'),
(147, 89, '2021-05-11 14:59:15', 2.08, 1, '3430 Sampson Street, Julian, CA, 12345', 'Ending in 6991, Name On Card: Ryan Robinson, expires: 02/2028', 'Tuesday, May/11'),
(148, 89, '2021-05-11 15:02:33', 39.79, 1, '3430 Sampson Street, Julian, CA, 12345', 'Ending in 6991, Name On Card: Ryan Robinson, expires: 02/2028', 'Tuesday, May/11'),
(149, 89, '2021-05-11 23:54:25', 357.4, 1, '3430 Sampson Street, Julian, CA, 12345', 'Ending in 6991, Name On Card: Ryan Robinson, expires: 02/2028', 'Wednesday, May/12'),
(150, 89, '2021-05-12 09:04:14', 1145.19, 1, '3430 Sampson Street, Julian, CA, 12345', 'Ending in 6991, Name On Card: Ryan Robinson, expires: 02/2028', 'Wednesday, May/12'),
(151, 89, '2021-05-12 18:50:29', 72.27, 1, '3430 Sampson Street, Julian, CA, 12345', 'Ending in 6991, Name On Card: Ryan Robinson, expires: 02/2028', 'Thursday, May/13'),
(152, 89, '2021-05-12 19:34:14', 282.74, 1, '3430 Sampson Street, Julian, CA, 12345', 'Ending in 6991, Name On Card: Ryan Robinson, expires: 02/2028', 'Thursday, May/13'),
(153, 89, '2021-05-12 19:46:15', 71.73, 1, '3430 Sampson Street, Julian, CA, 12345', 'Ending in 1111, Name On Card: Julian Ju, expires: 01/1234', 'Saturday, May/15'),
(154, 89, '2021-05-12 23:58:23', 142.47, 1, '3430 Sampson Street, Julian, CA, 12345', 'Ending in 1111, Name On Card: Julian Ju, expires: 01/1234', 'Thursday, May/13'),
(155, 89, '2021-05-13 01:38:43', 3452.78, 1, '3430 Sampson Street, Julian, CA, 12345', 'Ending in 1111, Name On Card: Julian Ju, expires: 01/1234', 'Thursday, May/13'),
(156, 89, '2021-05-13 13:59:04', 293.21, 1, '3430 Sampson Street, Julian, CA, 12345', 'Ending in 8888, Name On Card: Tony Stark, expires: 01/2025', 'Thursday, May/13'),
(157, 89, '2021-05-13 14:09:45', 29.27, 1, '3430 Sampson Street, Julian, CA, 12345', 'Ending in 8888, Name On Card: Tony Stark, expires: 01/2025', 'Thursday, May/13'),
(158, 148, '2021-05-13 14:32:31', 47.22, 1, '35195 Annette Square, Fremont, CA, 94536', 'Ending in 6201, Name On Card: Talon Boehm, expires: 09/2023', 'Saturday, May/15'),
(159, 150, '2021-05-13 17:27:34', 30.18, 1, '123 happened, san jose , CA, 96132', 'Ending in 4444, Name On Card: ra, expires: 01/1234', 'Sunday, May/16'),
(160, 89, '2021-05-13 17:52:32', 22955.86, 1, '3430 Sampson Street, Julian, CA, 12345', 'Ending in 8888, Name On Card: Tony Stark, expires: 01/2025', 'Friday, May/14'),
(161, 89, '2021-05-13 17:54:52', 1.74, 1, '3430 Sampson Street, Julian, CA, 12345', 'Ending in 8888, Name On Card: Tony Stark, expires: 01/2025', 'Friday, May/14'),
(162, 89, '2021-05-13 19:17:24', 3287.68, 1, '3430 Sampson Street, Julian, CA, 12345', 'Ending in 8888, Name On Card: Tony Stark, expires: 01/2025', 'Friday, May/14'),
(163, 156, '2021-05-13 19:41:30', 168.61, 1, '123 lane, san jose, CA, 12345', 'Ending in 1111, Name On Card: Tom Sawyer, expires: 13/1234', 'Friday, May/14');

-- --------------------------------------------------------

--
-- Table structure for table `customer_payment`
--

CREATE TABLE `customer_payment` (
  `payment_id` int(11) NOT NULL,
  `FK_customer_id` int(11) NOT NULL,
  `name_on_card` varchar(255) NOT NULL,
  `card_number` varchar(25) NOT NULL,
  `exp_month` varchar(255) NOT NULL,
  `exp_year` varchar(255) NOT NULL,
  `cvc_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_payment`
--

INSERT INTO `customer_payment` (`payment_id`, `FK_customer_id`, `name_on_card`, `card_number`, `exp_month`, `exp_year`, `cvc_code`) VALUES
(18, 1, 'PPP', '1234 5678 9012 3456', '2', '2002', '13'),
(19, 1, 'qwwewaa', '1234 3333 1223 5222', '12', '2222', '127'),
(21, 2, 'wfwaf', '2345 3222 2111 4433', '12', '2222', '127'),
(22, 3, 'Roocky', '9345 3222 2111 4433', '12', '2022', '111'),
(23, 1, 'Percy', '1234 3212 4332 6433', '06', '2022', '040'),
(24, 1, 'qeewr', '1234 1234 1234 1234', '11', '1111', '123'),
(25, 51, 'some body', '2222 2222 2222 2222', '23', '4231', '456'),
(26, 67, 'somebody', '1111 1111 1111 1111', '01', '1234', '423'),
(27, 89, 'Julian Ju', '1111 1111 1111 1111', '01', '1234', '123'),
(28, 62, 'Paul', '1111 1111 1111 1111', '13', '1234', '123'),
(29, 141, 'Paul R', '0000 0000 0000 0000', '01', '2014', '024'),
(30, 141, 'Some Body', '0000 0000 0000 0000', '01', '4951', '304'),
(31, 142, 'Kenneth Perry', '0000 0000 0000 0000', '01', '2024', '707'),
(32, 144, 'Wayne G. Hartsell', '5450 9886 0460 3977', '04', '2026', '750'),
(33, 89, 'Ryan Robinson', '4773 4747 4478 6991', '02', '2028', '141'),
(34, 89, 'Tony Stark', '2222 4444 6666 8888', '01', '2025', '777'),
(35, 148, 'Talon Boehm', '4532 1253 9212 6201', '09', '2023', '544'),
(36, 150, 'ra', '4444 4444 4444 4444', '01', '1234', '123'),
(37, 156, 'Tom Sawyer', '1111 1111 1111 1111', '13', '1234', '123'),
(38, 156, 'rakan kandah', '1111 1111 1111 1111', '01', '1234', '112');

-- --------------------------------------------------------

--
-- Table structure for table `item_in_cart`
--

CREATE TABLE `item_in_cart` (
  `item_id` int(11) NOT NULL,
  `FK_customer_id` int(11) NOT NULL,
  `FK_product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_in_cart`
--

INSERT INTO `item_in_cart` (`item_id`, `FK_customer_id`, `FK_product_id`, `quantity`) VALUES
(275, 67, 17, 20),
(317, 62, 18, 1),
(331, 62, 32, 2),
(391, 62, 31, 3),
(409, 62, 47, 2),
(533, 89, 29, 1),
(534, 89, 32, 5),
(535, 89, 70, 1),
(536, 89, 71, 1),
(537, 89, 59, 1),
(538, 89, 53, 8);

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `order_item_id` int(11) NOT NULL,
  `FK_order_id` int(11) NOT NULL,
  `FK_product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`order_item_id`, `FK_order_id`, `FK_product_id`, `quantity`) VALUES
(139, 131, 6, 1),
(141, 132, 20, 34),
(142, 133, 6, 1),
(144, 134, 18, 3),
(146, 136, 20, 23),
(147, 137, 18, 1),
(148, 137, 67, 7),
(149, 137, 40, 2),
(150, 137, 50, 2),
(151, 138, 32, 99),
(152, 139, 29, 100),
(153, 139, 17, 200),
(154, 139, 64, 50),
(155, 139, 65, 40),
(156, 139, 6, 1),
(157, 139, 19, 1),
(158, 139, 23, 1),
(159, 139, 21, 1),
(160, 139, 20, 1),
(161, 139, 24, 1),
(162, 139, 25, 1),
(163, 139, 26, 1),
(164, 139, 27, 1),
(165, 140, 29, 1),
(166, 141, 29, 1),
(167, 142, 17, 4),
(168, 142, 45, 20),
(169, 142, 34, 30),
(170, 143, 17, 2),
(171, 143, 59, 1),
(172, 143, 32, 3),
(173, 143, 43, 2),
(174, 144, 29, 1),
(175, 145, 6, 1),
(176, 145, 17, 1),
(177, 145, 19, 1),
(178, 145, 20, 1),
(179, 145, 21, 1),
(180, 145, 23, 1),
(181, 145, 25, 1),
(182, 145, 26, 1),
(183, 145, 27, 1),
(184, 145, 28, 1),
(185, 145, 29, 1),
(186, 145, 30, 1),
(187, 145, 31, 1),
(188, 145, 32, 1),
(189, 145, 33, 15),
(190, 145, 46, 1),
(191, 145, 47, 1),
(192, 145, 48, 1),
(193, 145, 49, 1),
(194, 145, 50, 1),
(195, 145, 53, 1),
(196, 145, 67, 1),
(197, 145, 66, 1),
(198, 145, 63, 1),
(199, 145, 62, 1),
(200, 145, 59, 1),
(201, 145, 58, 1),
(202, 145, 57, 1),
(203, 146, 6, 1),
(204, 146, 17, 1),
(205, 147, 6, 1),
(206, 148, 29, 20),
(207, 149, 32, 40),
(208, 149, 40, 2),
(209, 149, 23, 1),
(210, 149, 21, 1),
(211, 149, 25, 7),
(212, 149, 26, 7),
(213, 149, 27, 3),
(214, 149, 30, 2),
(215, 149, 31, 2),
(216, 149, 38, 2),
(217, 149, 19, 14),
(218, 149, 63, 6),
(219, 149, 61, 2),
(220, 149, 37, 1),
(221, 150, 37, 199),
(222, 150, 57, 55),
(223, 150, 19, 2),
(224, 150, 26, 1),
(225, 150, 25, 1),
(226, 150, 31, 1),
(227, 150, 30, 1),
(228, 150, 34, 1),
(229, 150, 33, 1),
(230, 150, 29, 1),
(231, 150, 63, 1),
(232, 151, 58, 4),
(233, 151, 59, 1),
(234, 151, 60, 1),
(235, 151, 63, 1),
(236, 151, 62, 1),
(237, 151, 19, 10),
(238, 151, 20, 4),
(239, 152, 40, 3),
(240, 152, 32, 2),
(241, 152, 29, 4),
(242, 152, 63, 3),
(243, 152, 61, 1),
(244, 152, 38, 1),
(245, 152, 21, 2),
(246, 152, 20, 4),
(247, 152, 25, 1),
(248, 152, 26, 1),
(249, 152, 27, 1),
(250, 152, 30, 1),
(251, 152, 33, 37),
(252, 152, 39, 1),
(253, 153, 29, 2),
(254, 153, 32, 1),
(255, 153, 40, 1),
(256, 153, 38, 1),
(257, 153, 19, 24),
(258, 154, 21, 10),
(259, 154, 27, 5),
(260, 154, 44, 1),
(261, 154, 48, 1),
(262, 154, 40, 3),
(263, 154, 33, 4),
(264, 155, 61, 4),
(265, 155, 70, 1),
(266, 155, 29, 74),
(267, 155, 59, 3),
(268, 155, 21, 4),
(269, 156, 66, 6),
(270, 156, 25, 13),
(271, 156, 44, 39),
(272, 157, 32, 1),
(273, 157, 29, 8),
(274, 157, 56, 2),
(275, 158, 21, 2),
(276, 158, 59, 1),
(277, 158, 45, 1),
(278, 158, 29, 2),
(279, 158, 27, 1),
(280, 158, 28, 2),
(281, 158, 67, 1),
(282, 158, 68, 1),
(283, 158, 39, 1),
(284, 159, 33, 3),
(285, 159, 35, 1),
(286, 159, 66, 1),
(287, 160, 41, 3),
(288, 160, 70, 7),
(289, 161, 29, 1),
(290, 162, 17, 1),
(291, 162, 29, 1),
(292, 162, 70, 1),
(293, 163, 17, 22),
(294, 163, 21, 9);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `discount` int(11) NOT NULL DEFAULT '0',
  `unit` varchar(255) DEFAULT NULL,
  `weight_per_item` double DEFAULT NULL,
  `item_per_pack` int(11) DEFAULT NULL,
  `shipping_weight` double NOT NULL,
  `description` mediumtext,
  `image` varchar(100) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  `FK_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `price`, `discount`, `unit`, `weight_per_item`, `item_per_pack`, `shipping_weight`, `description`, `image`, `stock`, `FK_category_id`) VALUES
(6, 'Valencia Oranges', 2.71, 30, 'Lb', 0, 0, 1, 'Fresh. Juicy. What\'s not to love? ', 'https://m.media-amazon.com/images/I/71OUnvlyqVL._AC_UL480_QL65_.jpg', -6, 1),
(17, 'Organic Strawberries', 5.99, 30, 'Lb', 0, 0, 1, 'The finest berries in the world. Scan to join the panel. USDA Organic. Certified organic by CCOF. ', 'https://images-na.ssl-images-amazon.com/images/I/81knc9-4RHL._SL1500_.jpg', 27, 1),
(18, 'Cantaloupe Melon', 2.99, 0, 'Each', 0, 0, 0, 'Delicious Cantaloupe Melon', 'https://m.media-amazon.com/images/I/81sY9fWfIRL._AC_UL480_QL65_.jpg', 0, 1),
(19, 'Bartlett Pear', 1.99, 0, 'Lb', 0, 0, 1, 'Delicious Bartlett Pear', 'https://m.media-amazon.com/images/I/71nDfQ3aHwL._AC_UL480_QL65_.jpg', 0, 1),
(20, 'Green Asparagus', 3.99, 0, 'Lb', 0, 0, 1, 'Delicious Green Asparagus.', 'https://m.media-amazon.com/images/I/71qYLp6aluL._AC_UL480_QL65_.jpg', 333, 2),
(21, 'Beef Steak', 6.39, 0, 'Lb', 0.5, 1, 1, 'USDA Fresh Beef', 'https://m.media-amazon.com/images/I/71n4xD5QjQL._AC_UL480_QL65_.jpg', 0, 3),
(22, 'Chicken Legs', 5.39, 10, 'Lb', 2.25, 0, 0, 'Farm Fresh Chicken! Local! Not caged! ', 'https://m.media-amazon.com/images/I/81Gst6o3rQL._AC_UL480_QL65_.jpg', 0, 3),
(23, 'Chicken Breast', 11.99, 0, 'Lb', 2, 0, 0, 'Farm Fresh! Local! Not caged! ', 'https://m.media-amazon.com/images/I/815VzAKx46L._AC_UL480_QL65_.jpg', 0, 3),
(24, 'Large Gass Avocado', 2.5, 0, 'Each', 0, 0, 1, 'Delicious Large Hass Avocado.', 'https://m.media-amazon.com/images/I/714d4oRD6YL._AC_UL480_QL65_.jpg', 0, 1),
(25, 'Broccoli Crown', 2.99, 0, 'Lb', 0, 0, 1, 'Delicious Broccoli Crown.', 'https://m.media-amazon.com/images/I/81sEt4MSqEL._AC_UL480_QL65_.jpg', 226, 2),
(26, 'White Cauliflower', 3.99, 0, 'Each', 0, 0, 1.27, 'Delicious White Cauliflower.', 'https://m.media-amazon.com/images/I/81bQzjQLNIL._AC_UL480_QL65_.jpg', 389, 2),
(27, 'Brussels Sprouts', 3.99, 0, 'Lb', 0, 0, 1, 'Delicious Brussels Sprouts.', 'https://m.media-amazon.com/images/I/317Yk5ZWmJL._AC_UL480_QL65_.jpg', 288, 2),
(28, 'Celery', 2.29, 0, 'Each', 0.25, 0, 1, 'Delicious & Fresh Celery.', 'https://m.media-amazon.com/images/I/71wuBzEpc+L._AC_UL480_QL65_.jpg', 227, 2),
(29, 'Organic Carrots with Tops', 1.99, 20, 'Lb', 0, 0, 1, 'A colorful assortment that includes carrots, turnips, parsnips, and rutabaga, these humble workhorses of the kitchen are versatile enough to beef up soups or to stand alone as crave-able side dishes.	', 'https://m.media-amazon.com/images/I/41ZInO1t2VL._AC_UL480_QL65_.jpg', 454, 2),
(30, 'Meat Counter Pork Shoulder Country Style Ribs Boneless', 3.99, 0, 'Lb', 1, 0, 1, 'Pork Ribs, Shoulder, Country Style, Boneless.  Natural pork. No artificial ingredients - minimally processed. Product of USA.', 'https://m.media-amazon.com/images/I/81KZAc02bjL._AC_UL480_QL65_.jpg', 495, 3),
(31, ' Seafood Counter Fish Salmon Fresh Atlantic Salmon Fillet', 10.99, 0, 'Lb', 1, 0, 1, 'Fresh Seafood Counter Fish Salmon Fresh Atlantic Salmon Fillet.', 'https://m.media-amazon.com/images/I/51l3V5KgNWL._AC_UL480_QL65_.jpg', 496, 3),
(32, 'Meat Counter Pork Ribs Spareribs St Louis Style Previously Frozen', 4.79, 15, 'Lb', 3.5, 0, 1, 'Meat Counter Pork Ribs Spareribs St Louis Style Previously Frozen', 'https://m.media-amazon.com/images/I/51ncNZMGcQL._AC_UL480_QL65_.jpg', 23, 3),
(33, 'Milk Whole 1 Gallon - 128 Fl. Oz.', 4.69, 0, 'Each', 8, 1, 8, 'Fresh Lucerne Milk Whole 1 Gallon - 128 Fl. Oz.', 'https://m.media-amazon.com/images/I/71pokGgV2XL._AC_UL480_QL65_.jpg', 40, 4),
(34, 'Philadelphia Cream Cheese Spread Original - 16 Oz', 7.59, 0, 'Each', 1, 1, 1, 'Fresh Philadelphia Cream Cheese Spread Original - 16 Oz', 'https://m.media-amazon.com/images/I/71ZQqvrBAoL._AC_UL480_QL65_.jpg', 104, 4),
(35, 'Organics Organic Cheese Cottage 2% Milkfat Lowfat - 16 Oz', 3.99, 0, 'Each', 1, 1, 1, 'Fresh O Organics Organic Cheese Cottage 2% Milkfat Lowfat - 16 Oz.', 'https://m.media-amazon.com/images/I/71whuXEOglL._AC_UL480_QL65_.jpg', 174, 4),
(37, 'Chobani Yogurt Greek Blended Non-Fat Vanilla - 32 Oz', 2, 0, 'Each', 2, 1, 2, 'Fresh Chobani Yogurt Greek Blended Non-Fat Vanilla - 32 Oz.', 'https://m.media-amazon.com/images/I/81BSfqbOmtL._AC_UL480_QL65_.jpg', 0, 4),
(38, 'Lucerne Milk Reduced Fat 2% - 1 Quart', 1.99, 0, 'Each', 2, 1, 2, 'Fresh Lucerne Milk Reduced Fat 2% - 1 Quart.', 'https://m.media-amazon.com/images/I/7169KqBJYIL._AC_UL480_QL65_.jpg', 246, 4),
(39, 'Fresh Baked Famous Bake House Sourdough Bread', 3.99, 0, 'Each', 0.8, 1, 0.8, 'Delicious Fresh Baked Famous Bake House Sourdough Bread.', 'https://m.media-amazon.com/images/I/61db8GxVlhL._AC_UL480_QL65_.jpg', 298, 5),
(40, 'Fresh Baked Kaiser Rolls - 6 Count', 4.29, 5, 'Each', 1, 1, 1, 'Delicious Fresh Baked Kaiser Rolls - 6 Count.', 'https://m.media-amazon.com/images/I/518evwvN-HL._AC_UL480_QL65_.jpg', 139, 5),
(41, 'Fresh Baked Blueberry Muffins - 4 Count', 5, 0, 'Each', 1.2, 1, 1.2, 'Delicious Fresh Baked Blueberry Muffins - 4 Count.', 'https://m.media-amazon.com/images/I/81h1YmBrYNL._AC_UL480_QL65_.jpg', 77, 5),
(43, 'Fresh Baked Pumpkin Pie 11 Inch - Each', 9.49, 0, 'Each', 1.25, 1, 1.25, 'Delicious Fresh Baked Pumpkin Pie 11 Inch - Each.', 'https://m.media-amazon.com/images/I/81DF75fkklL._AC_UL480_QL65_.jpg', 28, 6),
(44, 'Fresh Baked Jumbo Croissants - 4 Count', 5, 0, 'Lb', 0.8, 0, 0, 'Delicious Fresh Baked Jumbo Croissants - 4 Count.', 'https://m.media-amazon.com/images/I/41SfjfWEn4L._AC_UL480_QL65_.jpg', 0, 5),
(45, 'HERSHEYS Candy Bar Special Dark Mildly Sweet Chocolate - 4.25 Oz', 2.99, 5, 'Each', 0.265, 1, 0.265, 'Delicious HERSHEYS Candy Bar Special Dark Mildly Sweet Chocolate - 4.25 Oz', 'https://m.media-amazon.com/images/I/717vv6YrryS._AC_UL480_QL65_.jpg', 179, 6),
(46, 'Angies BOOMCHICKAPOP Popcorn Sweet & Salty - 6-1 Oz', 5.99, 0, 'Each', 0.375, 1, 0.375, 'Delicious Angies BOOMCHICKAPOP Popcorn Sweet & Salty - 6-1 Oz.', 'https://m.media-amazon.com/images/I/71LyZOYcEwL._AC_UL480_QL65_.jpg', 149, 6),
(47, 'Sweet Lorens Cookie Dough Place & Bake Gluten Free Chocolate Chunk Wrapper - 12 Oz', 5.99, 0, 'Each', 0.75, 1, 0.75, 'Delicious Sweet Lorens Cookie Dough Place & Bake Gluten Free Chocolate Chunk Wrapper - 12 Oz.', 'https://m.media-amazon.com/images/I/71tr6jUvxzL._AC_UL480_QL65_.jpg', 199, 6),
(48, 'OREO Double Stuf Sandwich Cookies Chocolate Family Size - 20 Oz', 5.99, 0, 'Each', 1.25, 1, 1.25, 'Delicious OREO Double Stuf Sandwich Cookies Chocolate Family Size - 20 Oz.', 'https://m.media-amazon.com/images/I/81LQP+ubmZL._AC_UL480_QL65_.jpg', 173, 6),
(49, 'Chips Ahoy! Chunky Cookies Chocolate Chunk - 11.75 Oz', 4.39, 0, 'Each', 0.735, 1, 0.735, 'Delicious Chips Ahoy! Chunky Cookies Chocolate Chunk - 11.75 Oz.', 'https://m.media-amazon.com/images/I/81JegcYY+SL._AC_UL480_QL65_.jpg', 99, 6),
(50, 'Signature SELECT Trail Mix Mountain Mix - 32 Oz', 9.99, 45, 'Each', 2, 1, 2, 'Trail Mix, Mountain Mix  Peanuts. M&M\'s brand milk chocolate candies. Raisins. Almonds. Quality guaranteed. Our promise, quality & satisfaction 100% guaranteed or your money back. Per 1/4 Cup: 180 calories; 2.5 g sat fat (13% DV); 85 mg sodium (4% DV); 11 g total sugars. www.betterlivingbrandsLLC.com. SmartLabel.', 'https://m.media-amazon.com/images/I/81NUcYhsVEL._AC_UL480_QL65_.jpg', 77, 6),
(53, 'Vanilla Cupcakes', 3.49, 0, 'oz', 10.5, 1, 2, 'Ready to eat vanilla cupcakes', 'https://m.media-amazon.com/images/I/818ieawketL._AC_UL480_QL65_.jpg', 19, 6),
(54, 'White Cabbage', 2.49, 0, 'lb', 1, NULL, 1, 'Asian White Cabbage', 'https://images-na.ssl-images-amazon.com/images/I/71kJ8duCqQL._SL1500_.jpg', 250, 2),
(56, 'Clover, Butter Unsalted Quarters Organic', 4.99, 0, 'ounce', 8, NULL, 0.5, 'Grocery Dairy', 'https://images-na.ssl-images-amazon.com/images/I/81b%2BDu325pL._SL1500_.jpg', 0, 4),
(57, 'Chocolate Cake', 10.99, 0, 'oz', 21, 1, 3, 'Fresh baked chocolate cake', 'https://m.media-amazon.com/images/I/91+tEUnrstL._AC_UL480_QL65_.jpg', 0, 6),
(58, 'Forager Project, Organic Dairy-Free Blueberry Probiotic Drinkable Cashewmilk Yogurt', 2.49, 0, 'ounce', 8, NULL, 0.5, 'Cashewmilk (Filtered Water, Cashews), Cane Sugar, Blueberries, Tapioca Starch, Coconut Cream, Pectin, Natural Flavor, Fruit And Vegetable Juice (For Color), Lemon Juice Concentrate, Live Active Cultures.;s. Thermophilus, L. Bulgaricus, B. Bifidum, B. Lactis, L. Acidophilus, L. Casei, L. Paracasei, L. Plantarum, L. Rhamnosus.', 'https://images-na.ssl-images-amazon.com/images/I/71gp599V0cL._SL1500_.jpg', 76, 4),
(59, 'Planet Oat Non-Dairy Frozen Dessert, Chocolate Peanut Butter Swirl, One pint', 4.38, 0, 'ounce', 16, NULL, 1, 'An indulgent combination of chocolate & Peanut Butter delightfully rich & creamy\r\nOut-of-this world rich & creamy Texture\r\nFree from dairy\r\nFree from lactose\r\nKosher-certified', 'https://images-na.ssl-images-amazon.com/images/I/91ayx0T5iKL._SL1500_.jpg', 12, 4),
(60, 'So Delicious, Dairy-Free Coconut Milk Vanilla Bean Frozen Dessert (Frozen)', 5.99, 0, 'oz', 16, NULL, 1, 'Gluten free\r\nKosher\r\nVegan\r\nNon-GMO\r\nMade with organic ingredients', 'https://images-na.ssl-images-amazon.com/images/I/71aJ5pYfqAL._SL1500_.jpg', 39, 4),
(61, 'Kite Hill Plant Based Sour Cream', 4.99, 98, 'oz', 12, NULL, 0.9, 'Almond Milk (Water, Almonds), Coconut Oil, Rice Starch, Coconut Milk, Maltodextrin, Chickpea Protein, Salt, Cultures.', 'https://images-na.ssl-images-amazon.com/images/I/819zATagSQL._SL1500_.jpg', 3, 4),
(62, 'Eggs 12 ct', 3.99, 0, 'oz', 20, 12, 2, 'Fresh local eggs', 'https://m.media-amazon.com/images/I/51zZZK2954L._AC_UL480_QL65_.jpg', 48, 3),
(63, 'Green Onions', 1.39, 0, 'lb', 0.5, NULL, 0.3, 'Fresh green onion', 'https://images-na.ssl-images-amazon.com/images/I/71iYcmipTFL._SL1500_.jpg', 288, 2),
(64, 'Strawberries', 5.49, 0, 'lb', 1, 1, 2, 'Fresh farmed strawberries.\r\nAlways in season. ', 'https://m.media-amazon.com/images/I/81knc9-4RHL._AC_UL480_QL65_.jpg', 0, 1),
(65, 'Organic Green Leaf Lettuce', 1.99, 5, 'lb', 0.32, NULL, 0.8, 'Organic green leaf lettuce, good socurce of Vitamin C & vitamin K', 'https://images-na.ssl-images-amazon.com/images/I/81ChZAjCm0L._SL1500_.jpg', 0, 2),
(66, 'Blueberries', 4.99, 0, 'oz', 6.99, 1, 2, 'Farm fresh.\r\nAlways in season.', 'https://m.media-amazon.com/images/I/71vpI+umpSL._AC_UL480_QL65_.jpg', 42, 1),
(67, 'Sweet Corn', 3.99, 0, 'oz', 12, NULL, 2, 'USDA certified sweet corn', 'https://m.media-amazon.com/images/I/81CmB8ZIzuL._AC_UL480_QL65_.jpg', 41, 2),
(68, 'Green Peas', 3.49, 0, 'oz', 16, NULL, 2, 'Frozen green peas', 'https://m.media-amazon.com/images/I/81AHf9mU4oL._AC_UL480_QL65_.jpg', 49, 2),
(70, 'Authentic Japanese Wagyu Beef Kobe Beef Strip Steaks', 2998.95, 0, 'lbs', 20, 1, 24, 'Rich Marbling. Delectable Flavor and Buttery Tenderness Japanese Wagyu beef. Tender and juicy. Perfectly aged and hand trimmed. Great for parties.', 'https://images-na.ssl-images-amazon.com/images/I/51YIQD-V2hL.jpg', 1, 3),
(71, 'Supremo Italiano Wild Forest Mushroom Mix', 143.5, 0, 'Count', 0, NULL, 1, 'Good for Cooking', 'https://images-na.ssl-images-amazon.com/images/I/815MCQa3a0L._SL1500_.jpg', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_status`
--

CREATE TABLE `shipping_status` (
  `status_id` int(11) NOT NULL,
  `status_description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipping_status`
--

INSERT INTO `shipping_status` (`status_id`, `status_description`) VALUES
(1, 'Processing'),
(2, 'Completed'),
(3, 'Canceled');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `account_type` varchar(255) NOT NULL DEFAULT 'customer',
  `email` varchar(255) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `password_encrypted` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `FK_payment_id` int(11) DEFAULT NULL,
  `FK_address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `account_type`, `email`, `first_name`, `last_name`, `password_encrypted`, `phone`, `FK_payment_id`, `FK_address_id`) VALUES
(1, 'customer', 'rockykandah@gmail.com', 'Rocky', 'Kandah', 'h', '123 123 1234', 19, 31),
(2, 'customer', 'please', 'please', 'please', '$2y$10$xH8RpqADoiVRDeETQxSXbe0A4fSOqkQEIB8ECPQ5X7Djc6SLp/0ya', 'please', 21, 33),
(3, 'customer', 'asd', 'rak', 'rak', '$2y$10$AnL9s6sTjnEuccYLGiEnlO2C4Okijx3yQf.DcT8dz.MXhCkwPhW/S', 'has', 22, 34),
(4, 'customer', 'friends', 'hello', 'there', '$2y$10$BeBtYWOKY4jjKV4K6sW6NerjgDE.Yu9VuuVd7jmOVdWdZoahgAP8C', 'number', 0, 0),
(6, 'customer', 'asd123456', 'asd123', 'asd123', '$2y$10$6uAbevGXpVWB5yLE1yQmU.oZeHtM1qC08dfLrgVbDN4xdpaUAIPxG', 'asd123123', 0, 0),
(15, 'admin', 'will@gmail.com', '', '', '$2y$10$NtthTj/41WxqJPkCJKWMFu1wu/qFyuPQN5v8Er/fWLSPfx5DAXL3K', '', 0, 0),
(17, 'customer', 'rakan@gmail.com', '', '', '$2y$10$6CMkrPjY3H8uuYs3JZGQGO3NxoMpzf0cgy02u0clw1CqSKAKi3lMG', '408 218 2222', 0, 0),
(51, 'admin', 'iambatman@batman.com', 'Bruce', 'Wayne', '$2y$10$o3CcnSB5R6y0ABgfpYkhk.ulY7f8pPZq5kXOKuQDKfs8yRrB0NkXu', '000 000 0000', 25, 36),
(52, 'customer', 'asd@as.c', 'asd', 'asd', '$2y$10$k6WUSUBAbhCuQwPnnoXJZuhZ1lIBKvA.2eEVzD4pW7fXcWX/q60hu', 'asd', 0, 0),
(53, 'customer', '', '', '', '$2y$10$q6bz5E8W2RQr1aNrw1TXBODsfG4KfNi1x/rQQz.3XPb4A6G7A1Cg.', '', NULL, NULL),
(54, 'customer', 'er@a.com', 'e', 'e', '$2y$10$VcX52tv4Buu9JLf4QV2Uf..M7F8H95qdRTQBa.H/0.5A8Ft.LiOW6', '123123123', NULL, NULL),
(59, 'customer', 'a@a.c', 'a', 'a', '$2y$10$8YGTNPx/8hWyWZsaPBuDH.XmkSQ6tzBON.18JLCCp/MPUO9RK4Az.', '123123123', NULL, NULL),
(62, 'admin', '123@123.com', 'Paul', 'Z', '$2y$10$W.wJs1xZgqxk6eGhZHznGu.KlBAKqpVhJFNW8ne.5qZrORZ53dfXO', '123123123', 28, 39),
(64, 'customer', 'somebody@gamil.com', 'Some', 'Body', '$2y$10$hGoe6Y0eee6rK7H0G3Vj4OwuHYMVqC2pwNL2xg1KUAbAccvEgoOWW', '123123123', NULL, NULL),
(67, 'customer', 'admin@sf.com', 'Paul', 'Zhou', '$2y$10$WtQ/tmrlMkoSsRJ5Qon3a.7AnbCfH725Ng3EGGLcz1NXZ6OxToR1O', '11111111', 26, 37),
(86, 'customer', 'spartan@spartan.com', 'spartan', 'spart', '$2y$10$L1ZuuDA0HrRuB4avIUJca.zGP4mGolhYeIpUqJnWD5ZzJU6R6ps7u', '123', NULL, NULL),
(89, 'customer', 'julian@gmail.com', 'Julian', 'Ju', '$2y$10$OvyjfxhHsgJN0dSf6HhWAeF5qQCw9ndubhjI1xU6E9QL1xQCbXJSm', '707 000 0000', 33, 43),
(90, 'customer', 'email@email.com', 'Rocky', 'Kandah', '$2y$10$qkzrmS3b2.r9oysfQLnibuMMZz7oC/PswPn18S8FgVlXlTj9hGfIy', '123 123 1234', NULL, NULL),
(91, 'customer', 'rocky@gmail.com', 'r', 'r', '$2y$10$tJQ7.mMTRlNaTmGGtqPFfeIHfoqGc0y/7HD7aixY9OtBk.X3B7KZ6', '123 123 1234', NULL, NULL),
(92, 'customer', 'a@a.com', 'a', 'a', '$2y$10$ifvW/m7puct9jsdO3xwnl.WWb9mh.EdosVayGpQ/OrKsX5xBVc0ka', '123 123 1234', NULL, NULL),
(93, 'customer', 'arnold@gmail.com', 'a', 'a', '$2y$10$whz.CNBskuxAivuuxdtraOxLyuhGj7DwxDJ1y9yKHCnMwZanDunkK', '123 123 1234', NULL, NULL),
(94, 'customer', 'a@gmail.com', '', '', '$2y$10$xsmdBt1GMY.eSW.P4Wc.4uyyfzRhAoM53ZS.ktQzqbzXSOsUbCm/i', '', NULL, NULL),
(95, 'customer', 'a@aass.com', '', 'a', '$2y$10$ouA9U4O3.DAgRaMur0JSwusU7sUY3pH5VQlrqLSHKhv82L/GyzHGa', '123 123 1233', NULL, NULL),
(96, 'customer', 'ra2k@gmail.com', 'Rakan', 'a', '$2y$10$zagdChhJsgfI.zvZmnaN/ey5LV62ijObK.1exa60.eELn98bQMapa', '', NULL, NULL),
(97, 'customer', 'arno@gmail.com', 'a', 'a', '$2y$10$veT62lPpDZwNGek3Fz87Y.0pn0Pu/3kZDWoh41zg7Fd8mWCb51Vja', '123 134 1423', NULL, NULL),
(103, 'customer', '1224@er.com', '', '', '$2y$10$PMXBcRx4Je.uu4DXTOcLAOUwbySSMQExqzrLPWk6O2H1oox6mYRWy', '', NULL, NULL),
(104, 'customer', 'wwkjw@wjso.com', '', '', '$2y$10$MDIsN5itFcvcLOGHOdrYaupO/djKv0BQOqNLlfweu0/9ExepWtgU2', '', NULL, NULL),
(105, 'customer', 's@d.com', 's', 's', '$2y$10$FbHP0oD54KONxD/3uyQIc.HFopKxkGNsSABHuvmmOWnX6GFoi0UBe', '123 123 1234', NULL, NULL),
(113, 'customer', 's@s.com', 'rak', 'kar', '$2y$10$W4L4E5.U/8xoDSvVbT2Qw.vjOCqFrtRNTaBww1DuP2hwCXK5MMZgm', '123 123 1234', NULL, NULL),
(115, 'customer', 'a@s.com', 'a', 'a', '$2y$10$h18161smdbyHYZHYtJ6FkOI/LVyhgqX6XBzyXLTVAO6jV9W/smZES', '123 123 1234', NULL, NULL),
(122, 'customer', 'william@gmail.com', 'william', 'A', '$2y$10$4MMxJZMBHzF1H7nGjK4dUucy3BIjAlTXSSYruZ1u8Ce9B5Ll2.EZi', '669 789 7892', NULL, NULL),
(124, 'customer', 'sf@sf.com', 'Spartan', 'Fresh', '$2y$10$KrL1T3ZFQopRw7Zl/Vw4AeTGy1ByaOYDCGYbDncfmvKmKvAwQJKWq', '111 111 1111', NULL, NULL),
(128, 'customer', 'a12@a.com', 'a', 'a', '$2y$10$MdvggHcBlXaSD0OmhskgS.pIOUYVrH6TC./SIPlm4.xNvWZZDZ/y6', '111 111 1111', NULL, NULL),
(131, 'customer', '123123@q.com', 'a', 'a', '$2y$10$UH3JMh4.mJSphql9CbMuIe6kytOsAjKdvwemram.9c4y8PNkPRbvy', '111 111 1111', NULL, NULL),
(133, 'customer', 'asd@12.com', 'a', 'a', '$2y$10$GPuKgUz5ZzJD6.m9PbQgQ.CAn1yKJHbTX4uSwn98BGu9B/qJ6aWxi', '123 123 1234', NULL, NULL),
(137, 'customer', 'a@aa.com', 'a', 'a', '$2y$10$ANQBRS7ehKqlS79MAKUxAO4XMg8AVEXFGBaq3SEEnTn1QoztIUGYu', '123 123 1234', NULL, NULL),
(139, 'customer', 'we@will.com', 'we', 'will', '$2y$10$uXt99vEhhOBybPVfsmsqFecwfIOx5kKKIzQZ9x8TMKLuwTm76cvH6', '111 111 1111', NULL, NULL),
(140, 'customer', 'paulw@gmail.com', 'Paul', 'W', '$2y$10$CsG88qaGiXiD94fsAhCn8eF.gPi8Zq7/AO7aLHwhFOYJCQxdBPckK', '707 384 2617', NULL, NULL),
(141, 'customer', 'paulr@gmail.com', 'paul', 'r', '$2y$10$GM/BduC.4UDGX92d1I6AeOXXgi7DNBRC1i28s9FMPXM0X6W2Ok79m', '707 823 2435', 30, 40),
(142, 'customer', 'kp@gmail.com', 'Kenneth', 'Perry', '$2y$10$EaxbHq497/C0lWqMQEryiedgb2dDHC7CJGNSg8aILJ1MjZgWgRUU6', '707 091 2341', 31, 41),
(143, 'admin', 'admin@spartanfresh.com', 'Admin', '/', '$2y$10$b8eVFJkVz7J5WSDMV/H5/exKuOLvV9OnHz3bfG81mvDHE9HUHuG.K', '000 000 0000', NULL, NULL),
(144, 'customer', 'wh@gmail.com', 'Wayne', 'Hartsell', '$2y$10$AZ..5Iyk/Vx7sobX1xt12ui7iouOI8d2ug73x1.RtQGXxMpK7ryEi', '000 000 0000', 32, 42),
(146, 'customer', 'test1@gmail.com', 'Test', 'User1', '$2y$10$2NJaqgMtwKUv3WzCoMRmNeUs7/AmZ/7YWSvsiAero5KS4K1wXxrIq', '7079324567', NULL, NULL),
(148, 'customer', 'talonboehm@gmail.com', 'Talon', 'Boehm', '$2y$10$mZc0R2qnccSViGb.XFFZ2ORMrWLuR5LMQOGfF.RT9ujBVK7uWYuwW', '7502451184', 35, 44),
(149, 'customer', 'rockschmock@gmail.com', 'Rocky', 'Kandah', '$2y$10$O3844OmG/VP5H/PlX/OKmOhETHQ6KA.E2e34duGuvSkCLR0UIjbom', '7123123123', NULL, NULL),
(150, 'customer', 'rakkat@gmail.com', 'rak', 'kat', '$2y$10$auZ18oPeI1.Hf7KGTZ05guukA3drMw66E1Ik7wjJhw1aeZNudDyZy', '1231231234', 36, 45),
(151, 'customer', 'rakankandah@gmail.com', 'Rakan', 'Kandah', '$2y$10$GsUrhY.MPINGcGjZjUdENObJXsoSlU4adSiXntJ6Okm/Uoy8onAju', '4082189820', NULL, NULL),
(152, 'customer', 'ws@gmail.com', 'WILLIAM', 'SHAKESPEARE', '$2y$10$h311d6M28LufVMoVCLGsvu/9xvN93HPppmJVLKfIKM833790wggY2', '1231223213', NULL, NULL),
(154, 'customer', 'deersonchristmas@gmail.com', '123', '123', '$2y$10$HPJaNVsBV.Fb4VJEP3fgAOuhHkUKaAZhmc/cAwvq0Thg1NtQgb4tu', '1231123123', NULL, NULL),
(155, 'customer', 'william@shakespeare.com', 'WILLIAM', 'SHAKESPEARE', '$2y$10$kHHrcVOoKixhn/5705DqD..zqfgstCVVbvPYif0OtU59hP.RP..ce', '1231223213', NULL, NULL),
(156, 'customer', 'tom@gmail.com', 'Tommy', 'Sawyer', '$2y$10$NRbZ6OJ.LzN1bXoa6RUnieG70KnNm74Y1.uq1.mlM1BS1Z4PQCyly', '4081231234', 37, 46);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `FK_customer_id` (`FK_customer_id`);

--
-- Indexes for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `order_ibfk_2` (`FK_status_id`),
  ADD KEY `FK_customer_id` (`FK_customer_id`);

--
-- Indexes for table `customer_payment`
--
ALTER TABLE `customer_payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `customer_payment_ibfk_1` (`FK_customer_id`);

--
-- Indexes for table `item_in_cart`
--
ALTER TABLE `item_in_cart`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `item_in_cart_ibfk_2` (`FK_product_id`),
  ADD KEY `FK_customer_id` (`FK_customer_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_item_ibfk_2` (`FK_product_id`),
  ADD KEY `order_item_ibfk_1` (`FK_order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_ibfk_1` (`FK_category_id`);

--
-- Indexes for table `shipping_status`
--
ALTER TABLE `shipping_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `customer_order`
--
ALTER TABLE `customer_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `customer_payment`
--
ALTER TABLE `customer_payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `item_in_cart`
--
ALTER TABLE `item_in_cart`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=539;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=295;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `shipping_status`
--
ALTER TABLE `shipping_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD CONSTRAINT `customer_address_ibfk_1` FOREIGN KEY (`FK_customer_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD CONSTRAINT `customer_order_ibfk_2` FOREIGN KEY (`FK_status_id`) REFERENCES `shipping_status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `customer_order_ibfk_3` FOREIGN KEY (`FK_customer_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `item_in_cart`
--
ALTER TABLE `item_in_cart`
  ADD CONSTRAINT `item_in_cart_ibfk_3` FOREIGN KEY (`FK_customer_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `item_in_cart_ibfk_2` FOREIGN KEY (`FK_product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`FK_order_id`) REFERENCES `customer_order` (`order_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`FK_product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`FK_category_id`) REFERENCES `category` (`category_id`) ON DELETE SET NULL ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
