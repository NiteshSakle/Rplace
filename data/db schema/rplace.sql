-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2016 at 01:10 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rplace`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `barcode` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `barcode`, `created_at`, `updated_at`) VALUES
(1, 'GoodDay', 10, 123456789, '2016-12-21 10:46:36', '2016-12-21 05:16:36'),
(3, 'cake', 16, 2253, '2016-12-21 12:38:18', '2016-12-21 07:08:18'),
(4, 'chikki', 32, 1444554, '2016-12-21 12:38:19', '2016-12-21 07:08:19'),
(5, 'kurkure', 10, 585873, '2016-12-21 12:38:19', '2016-12-21 07:08:19'),
(6, 'Lays', 5, 5299, '2016-12-21 12:38:19', '2016-12-21 07:08:19'),
(7, 'Juice', 50, 248977, '2016-12-21 17:34:27', '2016-12-21 12:04:27');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `pin` varchar(1000) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `employee_id`, `name`, `pin`, `created_at`, `updated_at`) VALUES
(1, '135', 'Nitesh Sakle', '$2y$10$l7SgYkeHqxc5.bMfs165/ODtaGfBuWeIftdG5Xr6lOZkPmplRccO.', '2016-12-20 17:45:35', '2016-12-21 12:09:01');

-- --------------------------------------------------------

--
-- Table structure for table `user_buy`
--

CREATE TABLE `user_buy` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_buy`
--

INSERT INTO `user_buy` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(2, '1', 1, '2016-12-21 11:17:15', '0000-00-00 00:00:00'),
(3, '1', 6, '2016-12-21 12:38:52', '0000-00-00 00:00:00'),
(4, '1', 3, '2016-12-21 12:39:10', '0000-00-00 00:00:00'),
(5, '1', 3, '2016-12-21 12:53:41', '0000-00-00 00:00:00'),
(6, '1', 6, '2016-12-21 13:48:14', '0000-00-00 00:00:00'),
(7, '1', 3, '2016-12-21 15:22:02', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_deposit`
--

CREATE TABLE `user_deposit` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_deposit`
--

INSERT INTO `user_deposit` (`id`, `user_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 10, '2016-12-21 13:42:36', '0000-00-00 00:00:00'),
(3, 1, 10, '2016-12-21 13:42:36', '0000-00-00 00:00:00'),
(4, 1, 200, '2016-12-21 15:31:28', '0000-00-00 00:00:00'),
(5, 1, 2, '2016-12-21 15:32:38', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_buy`
--
ALTER TABLE `user_buy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_deposit`
--
ALTER TABLE `user_deposit`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_buy`
--
ALTER TABLE `user_buy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user_deposit`
--
ALTER TABLE `user_deposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
