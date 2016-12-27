-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2016 at 01:30 PM
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
  `barcode` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `barcode`, `created_at`, `updated_at`) VALUES
(1, 'GOOD DAY BUTTER COOKIES', 10, '8901063092280', '2016-12-21 10:46:36', '2016-12-21 12:18:59'),
(3, 'MOMS MAGIC', 10, '8901725135454', '2016-12-21 12:38:18', '2016-12-27 11:39:11'),
(4, 'BOURBON', 10, '8901063139190', '2016-12-21 12:38:19', '2016-12-21 12:20:05'),
(5, 'BRITANNIA 50-50 MASTI', 10, '901063017290', '2016-12-21 12:38:19', '2016-12-21 12:21:19'),
(6, 'BRITANNIA 50-50 MASKA CHASKA', 10, '8901063017252', '2016-12-21 12:38:19', '2016-12-21 12:21:51'),
(7, 'CELLO NOTEBOOK 92 PAGES', 15, '8904187942455', '2016-12-21 17:34:27', '2016-12-21 12:22:27'),
(8, 'BRITANNIA CAKE PINEAPPLE', 15, '8901063362819', '2016-12-21 17:54:49', '2016-12-21 12:24:49'),
(9, 'TEST PRODUCT', 0, '123456789', '2016-12-21 18:21:32', '2016-12-21 12:51:32');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `pin` varchar(1000) NOT NULL DEFAULT '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `employee_id`, `name`, `pin`, `created_at`, `updated_at`) VALUES
(1, '135', 'Nitesh Sakle', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-20 17:45:35', '2016-12-21 12:40:46'),
(2, '133', 'Sharat chandra K', '$2y$10$L.ISYFgv/zFL0fDUJi3Aa.FGxRXyjZG8LlDq2OIk2bAveYPIroxaq', '2016-12-21 17:56:59', '2016-12-27 09:53:12'),
(4, '000', 'test', '$2y$10$XePgL0w.Wmq6HFI.xiKItu06nW/Cd7RTmwrUeiZbGq2B40TLaA8Sy', '2016-12-21 18:15:20', '2016-12-27 10:35:58'),
(5, '137', 'Chaitanya Sai Ramu', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-21 18:32:05', '0000-00-00 00:00:00'),
(6, '136', 'Sachin Yedle', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-21 18:32:05', '0000-00-00 00:00:00'),
(7, '134', 'Ravali Dodda', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-21 18:32:06', '0000-00-00 00:00:00'),
(8, '132', 'Ashok Madduru', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-21 18:32:06', '0000-00-00 00:00:00'),
(9, '131', 'Anusha Reddy', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-21 18:32:06', '0000-00-00 00:00:00'),
(10, '130', 'Hemanjali Majji', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-21 18:32:06', '0000-00-00 00:00:00'),
(11, '129', 'Ch. Ramesh Babu', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-21 18:32:06', '0000-00-00 00:00:00'),
(12, '125', 'Mahesh Doma', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-21 18:32:06', '0000-00-00 00:00:00'),
(13, '120', 'Sunil Kumar Mahto', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-21 18:32:06', '0000-00-00 00:00:00'),
(14, '117', 'Dasari Venkata Rami Reddy', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-21 18:32:06', '0000-00-00 00:00:00'),
(15, '113', 'Ch. Chandra Sekar', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-21 18:32:06', '0000-00-00 00:00:00'),
(16, '111', 'Sreenu Cheedella', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-27 11:58:27', '0000-00-00 00:00:00'),
(17, '110', 'Gautham Aditya Ravi', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-27 12:04:41', '0000-00-00 00:00:00'),
(18, '108', 'Geetha Krishna', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-27 12:04:42', '0000-00-00 00:00:00'),
(19, '107', 'Santhosh Kumar', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-27 12:04:42', '0000-00-00 00:00:00'),
(20, '102', 'Vishwa Teja J', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-27 12:04:42', '0000-00-00 00:00:00'),
(21, '100', 'Karri Satya Venkata Reddy', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-27 12:04:42', '0000-00-00 00:00:00'),
(22, '95', 'Vishvajeet Singh Rathore', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-27 12:04:42', '0000-00-00 00:00:00'),
(23, '56', 'N. Revathi', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-27 12:04:42', '0000-00-00 00:00:00'),
(24, '59', 'S Siva Shankara Rao', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-27 12:04:42', '0000-00-00 00:00:00'),
(25, '67', 'Sravan Kumar', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-27 12:04:42', '0000-00-00 00:00:00'),
(26, '85', 'M. Revathi', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-27 12:04:42', '0000-00-00 00:00:00'),
(27, '2', 'Prasad Kancharla', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-27 12:07:10', '0000-00-00 00:00:00'),
(28, '7', 'Sunand Chakradhar', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-27 12:07:10', '0000-00-00 00:00:00'),
(29, '8', 'Venu Gopal Thotakura', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-27 12:07:10', '0000-00-00 00:00:00'),
(30, '15', 'VV Ravishankar Achanta', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-27 12:07:10', '0000-00-00 00:00:00'),
(31, '17', 'Gali Bala Satya Swathi', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-27 12:07:10', '0000-00-00 00:00:00'),
(32, '21', 'Shaik Hema', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-27 12:07:10', '0000-00-00 00:00:00'),
(33, '39', 'Ramya Yenduri', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-27 12:07:11', '0000-00-00 00:00:00'),
(34, '42', 'Badam Bharath Kumar', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', '2016-12-27 12:07:11', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_buy`
--

CREATE TABLE `user_buy` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `price` float NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_buy`
--

INSERT INTO `user_buy` (`id`, `user_id`, `product_id`, `price`, `created_at`, `updated_at`) VALUES
(2, '1', 1, 0, '2016-12-21 11:17:15', '0000-00-00 00:00:00'),
(4, '1', 3, 0, '2016-12-21 12:39:10', '0000-00-00 00:00:00'),
(9, '2', 8, 0, '2016-12-21 18:06:02', '0000-00-00 00:00:00'),
(10, '4', 9, 0, '2016-12-21 18:23:30', '0000-00-00 00:00:00'),
(11, '4', 9, 0, '2016-12-21 18:24:17', '0000-00-00 00:00:00'),
(12, '4', 9, 0, '2016-12-21 18:34:19', '0000-00-00 00:00:00'),
(13, '4', 9, 0, '2016-12-21 18:37:38', '0000-00-00 00:00:00'),
(14, '4', 8, 0, '2016-12-21 18:38:07', '0000-00-00 00:00:00'),
(15, '4', 7, 0, '2016-12-27 12:32:10', '0000-00-00 00:00:00'),
(16, '4', 7, 0, '2016-12-27 14:52:11', '0000-00-00 00:00:00'),
(17, '1', 9, 0, '2016-12-27 15:03:49', '0000-00-00 00:00:00'),
(18, '1', 9, 0, '2016-12-27 15:04:14', '0000-00-00 00:00:00'),
(19, '2', 7, 0, '2016-12-27 15:05:37', '0000-00-00 00:00:00'),
(20, '2', 7, 0, '2016-12-27 15:05:55', '0000-00-00 00:00:00'),
(21, '4', 7, 0, '2016-12-27 16:09:30', '0000-00-00 00:00:00'),
(22, '4', 1, 0, '2016-12-27 16:12:06', '0000-00-00 00:00:00'),
(23, '4', 4, 0, '2016-12-27 16:12:48', '0000-00-00 00:00:00'),
(24, '1', 4, 0, '2016-12-27 16:49:16', '0000-00-00 00:00:00'),
(25, '4', 7, 0, '2016-12-27 17:47:01', '0000-00-00 00:00:00');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `user_buy`
--
ALTER TABLE `user_buy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `user_deposit`
--
ALTER TABLE `user_deposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
