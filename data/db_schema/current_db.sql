-- phpMyAdmin SQL Dump
-- version 4.6.5.2deb1+deb.cihar.com~trusty.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 08, 2017 at 01:19 PM
-- Server version: 5.5.52-0ubuntu0.14.04.1-log
-- PHP Version: 5.5.9-1ubuntu4

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
  `name` varchar(50) NOT NULL,
  `price` double NOT NULL,
  `barcode` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `barcode`, `created_at`, `updated_at`) VALUES
(1, 'GOOD DAY BUTTER COOKIES', 10, '8901063092280', '2016-12-21 05:16:36', '2016-12-21 17:48:59'),
(3, 'MOMS MAGIC', 10, '8901725135454', '2016-12-21 07:08:18', '2016-12-27 17:09:11'),
(4, 'BOURBON', 10, '8901063139190', '2016-12-21 07:08:19', '2016-12-21 17:50:05'),
(5, 'BRITANNIA 50-50 MASTI', 10, '901063017290', '2016-12-21 07:08:19', '2016-12-21 17:51:19'),
(6, 'BRITANNIA 50-50 MASKA CHASKA', 10, '8901063017252', '2016-12-21 07:08:19', '2016-12-21 17:51:51'),
(8, 'BRITANNIA CAKE PINEAPPLE', 15, '8901063362819', '2016-12-21 12:24:49', '2016-12-21 17:54:49'),
(14, 'BRITANIA JIM JAM', 20, '8901063029163', '2017-01-24 07:39:19', '0000-00-00 00:00:00'),
(15, 'BRITANIA CAKE BUTTER BLAST', 15, '8901063362789', '2017-01-25 09:27:57', '0000-00-00 00:00:00'),
(16, 'BINGO TANGLES', 10, '8901725195120', '2017-01-31 11:50:51', '0000-00-00 00:00:00'),
(17, 'BINGO YUMITOS', 10, '8901725191122', '2017-01-31 12:07:54', '0000-00-00 00:00:00'),
(18, 'BINGO MAD ANGLES', 10, '8901725198329', '2017-01-31 12:08:37', '0000-00-00 00:00:00'),
(19, 'BINGO TANGLES', 10, '8901725195229', '2017-01-31 12:09:23', '0000-00-00 00:00:00'),
(20, 'BINGO YUMITOS', 10, '8901725193225', '2017-01-31 12:12:18', '0000-00-00 00:00:00'),
(21, 'BRITANNIA CAKE', 15, '8901063362772', '2017-01-31 12:16:57', '0000-00-00 00:00:00'),
(22, 'BRITANNIA CAKE', 15, '8901063362765', '2017-01-31 12:17:17', '0000-00-00 00:00:00'),
(23, 'BRITANNIA CAKE', 15, '8901063362802', '2017-01-31 12:17:37', '0000-00-00 00:00:00'),
(24, 'Test product CELLO BOOK', 0, '8904187942455', '2017-02-01 13:13:43', '0000-00-00 00:00:00'),
(25, 'PARLE-G', 3, '8901719255120', '2017-02-02 06:16:24', '0000-00-00 00:00:00'),
(26, 'GOOD LIFE MILK', 10, '8906036673947', '2017-02-02 06:17:19', '0000-00-00 00:00:00'),
(999, 'Amount Deposited', 0, '', '2017-02-08 06:12:38', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(30) CHARACTER SET utf8 NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `pin` varchar(1000) CHARACTER SET utf8 NOT NULL,
  `authorised` tinyint(1) NOT NULL,
  `is_password_changed` tinyint(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `employee_id`, `name`, `pin`, `authorised`, `is_password_changed`, `created_at`, `updated_at`) VALUES
(1, '135', 'Nitesh Sakle', '$2y$10$JnN1Uo3K8ytFSO60dtS05utBSSct8elcWovdE8sYU9MsBU3xNb7GW', 1, 1, '2016-12-20 17:45:35', '2017-01-31 13:13:54'),
(2, '133', 'Sharat chandra K', '$2y$10$DZjr7ratqQuCFj4aa5vpYORJiqrJszqmOwjsQCob2RJU.MVzmteDi', 0, 1, '2016-12-21 17:56:59', '2017-02-02 05:27:33'),
(5, '137', 'Chaitanya Sai Ramu', '$2y$10$iAla7nBCZ1yBklpKU256Oe5u0yP2rvcnFeix9nrhjEO.sgNMdF2z.', 0, 1, '2016-12-21 18:32:05', '2017-01-27 06:18:58'),
(6, '136', 'Sachin Yedle', '$2y$10$gxecO3Fb89q1Qit4mQKkKeeHoXZz7gJAQBJ6R6.wPdJYVF49eSJV.', 0, 1, '2016-12-21 18:32:05', '2017-02-07 12:46:49'),
(7, '134', 'Ravali Dodda', '$2y$10$TRKcVxMTxjpZQrm7AFCwDeg0KTXJtWoX12hvs5hsVY9XAb/rR3ScO', 0, 1, '2016-12-21 18:32:06', '2017-01-31 12:27:07'),
(8, '132', 'Ashok Madduru', '$2y$10$uwj8ydV8ACeEKd4tonHkseOMEKBdBBATPVjPyUhnuJhjpWbZXviLa', 0, 1, '2016-12-21 18:32:06', '2017-01-31 12:28:29'),
(9, '131', 'Anusha Reddy', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', 0, 0, '2016-12-21 18:32:06', '2017-01-24 11:50:20'),
(10, '130', 'Hemanjali Majji', '$2y$10$FdL/g5XFMiPC6Hs1xJjXUO2yFQ4FjKLDJZ8oWKEhOqcKTEGH.SK1u', 0, 1, '2016-12-21 18:32:06', '2017-01-27 06:24:29'),
(11, '129', 'Ch. Ramesh Babu', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', 0, 0, '2016-12-21 18:32:06', '2017-02-07 12:46:58'),
(12, '125', 'Mahesh Doma', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', 0, 0, '2016-12-21 18:32:06', '0000-00-00 00:00:00'),
(13, '120', 'Sunil Kumar Mahto', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', 0, 0, '2016-12-21 18:32:06', '0000-00-00 00:00:00'),
(14, '117', 'Dasari Venkata Rami Reddy', '$2y$10$AxsWAMWycU2heJw6osZHwOPTEpo6WT70INbebxu/hA7jHr1.wrvDq', 1, 1, '2016-12-21 18:32:06', '2017-02-02 06:06:10'),
(15, '113', 'Ch. Chandra Sekar', '$2y$10$.FRrffqt1VRDjfC6WWSJ4.7c7j3PVcORfJdv0DHOz7Tfu5OXUn/eS', 0, 1, '2016-12-21 18:32:06', '2017-02-01 06:54:57'),
(16, '111', 'Sreenu Cheedella', '$2y$10$lPHJLvl/zJ2p8M/NxwCvIOkdPV.R6yu3eBis8L1BUIC6uGLjjq8JW', 0, 1, '2016-12-27 11:58:27', '2017-02-07 12:40:32'),
(17, '110', 'Gautham Aditya Ravi', '$2y$10$yF1pKiyecwkUNaKR8R7rI.06k2KW9QlqrRfOmupPaKrtbM85C7NvK', 0, 1, '2016-12-27 12:04:41', '2017-01-25 13:26:07'),
(18, '108', 'Geetha Krishna', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', 0, 0, '2016-12-27 12:04:42', '0000-00-00 00:00:00'),
(19, '107', 'Santhosh Kumar', '$2y$10$F.zC0ZCl2wXgRD4wOPzxr.ymChhPcXDwx/5QdqiBtvNGHwCyv.4Ae', 0, 1, '2016-12-27 12:04:42', '2017-02-03 07:19:09'),
(20, '102', 'Vishwa Teja J', '$2y$10$Q9mpRBbWbNFLqbWE.ZggaeeCgpzZhxTWInMFTjF9YU/yN5ms8wkwe', 0, 1, '2016-12-27 12:04:42', '2017-01-27 06:41:57'),
(21, '100', 'Karri Satya Venkata Reddy', '$2y$10$zueptH8GHDnsEKJwVrMxY.Ai84W7W32TCKX.GCycfZ896Sfbvr17u', 0, 1, '2016-12-27 12:04:42', '2017-02-03 07:29:08'),
(22, '95', 'Vishvajeet Singh Rathore', '$2y$10$LY6NTChoLLDNfuBj1sHAw.WNpw4XJfzrBfdtmhAf/1/LbVZ0iUxPW', 0, 1, '2016-12-27 12:04:42', '2017-02-02 08:21:35'),
(23, '56', 'N. Revathi', '$2y$10$AOK4d2Phtxtrwwi9.ViYreAk.Gw3T9fAKCvAq6nXsLrdwksSyHlFi', 0, 1, '2016-12-27 12:04:42', '2017-02-01 10:15:07'),
(24, '59', 'S Siva Shankara Rao', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', 0, 0, '2016-12-27 12:04:42', '2017-01-24 11:50:20'),
(25, '67', 'Sravan Kumar', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', 0, 0, '2016-12-27 12:04:42', '0000-00-00 00:00:00'),
(26, '85', 'M. Revathi', '$2y$10$mlYpcB7nGRlMt2.W0gnireTueatSLaOSB0ctU2r84gd2sqT3GR1Ra', 0, 1, '2016-12-27 12:04:42', '2017-02-03 11:08:00'),
(27, '2', 'Prasad Kancharla', '$2y$10$WQCXe0OOh6VBEmXzl5rg6O9e/h6uagjbbS77yBYqjlGZsdmckLx22', 0, 1, '2016-12-27 12:07:10', '2017-01-27 06:23:39'),
(28, '7', 'Sunand Chakradhar', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', 0, 0, '2016-12-27 12:07:10', '0000-00-00 00:00:00'),
(29, '8', 'Venu Gopal Thotakura', '$2y$10$IRpeLhGL7Hb860j6kEkeP.4g3W7d2RQD5hsdRHqpw861C8UKwb6DK', 0, 1, '2016-12-27 12:07:10', '2017-01-27 06:23:10'),
(30, '15', 'VV Ravishankar Achanta', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', 0, 0, '2016-12-27 12:07:10', '0000-00-00 00:00:00'),
(31, '17', 'Gali Bala Satya Swathi', '$2y$10$neSmhUdz5vW6ahBlFVjEsuza0F0oJiELaoHRQPlTZJdwubcaLa7Za', 0, 1, '2016-12-27 12:07:10', '2017-01-31 13:11:23'),
(32, '21', 'Shaik Hema', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', 0, 0, '2016-12-27 12:07:10', '0000-00-00 00:00:00'),
(33, '39', 'Ramya Yenduri', '$2y$10$XSJ5JxDjrCpAmatlg59lceSrxrkbbjVI7ayraApzB1LIIEyyz/Qq6', 0, 1, '2016-12-27 12:07:11', '2017-01-27 06:11:31'),
(34, '42', 'Badam Bharath Kumar', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', 0, 0, '2016-12-27 12:07:11', '0000-00-00 00:00:00'),
(35, '1', 'Siddharam Shingshetty', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', 0, 0, '2016-12-27 12:07:11', '2017-02-01 06:58:57'),
(36, '11', 'Siddhartha Kongara', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', 0, 0, '2016-12-27 12:07:11', '2017-02-01 06:58:57'),
(37, '116', 'Manohar Pilankar', '$2y$10$uF0Wxw2R/fOwEOD5gcdsROSBydAYuGFmlLlTUCesvIZDdlaA9bEDC', 0, 1, '2016-12-27 12:07:11', '2017-02-07 12:41:52'),
(38, '40', 'Sunayana Pilankar', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', 0, 0, '2016-12-27 12:07:11', '2017-02-01 06:58:57'),
(39, '112', 'Eknath Pilankar', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', 0, 0, '2016-12-27 12:07:11', '2017-02-01 06:58:57'),
(40, '128', 'Preeti Sahu', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', 0, 0, '2016-12-27 12:07:11', '2017-02-01 06:58:57'),
(41, '27', 'Gouri Patil', '$2y$10$sENE1jYlVn85v0wQ4hFrGOvkcibzmrXViF7k.2h.Q.IzVE1Hobsnm', 0, 1, '2016-12-27 12:07:11', '2017-02-01 06:58:57'),
(42, '1111', 'Shyam Jadhav', '$2y$10$lA/FX1ZAoomTQiWfxyRZ8.Lpdcidj2llnzOXwCGgC6k6KDRxjPYVi', 1, 1, '2016-12-27 12:07:11', '2017-02-03 11:40:01'),
(43, '84', 'Enja Pradeep Reddy', '$2y$10$CWvU6XohuL2gcSHg9mj.8esOdRdoiTU.6ERbV.4HJC.90T3CxYnU2', 0, 1, '2016-12-27 12:07:11', '2017-02-01 10:05:14'),
(44, '109', 'RASHMA DHANAWADE', '$2y$10$xwIE4JovKf/BL3c7mPz4TuPkkQEu5vb0WY9hdxfp8hZ7/FOtR4A06', 0, 1, '2016-12-27 12:07:11', '2017-02-01 06:58:57'),
(45, '1313', 'Example', '$2y$10$KsUvyrFxfS.3n/xNJq.goOzaNxuyQsoY.2Uk4F7IGJak4JVUqgEPa', 0, 0, '2016-12-27 12:07:11', '2017-02-01 06:58:57');

-- --------------------------------------------------------

--
-- Table structure for table `user_buy`
--

CREATE TABLE `user_buy` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `is_deposit` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_buy`
--

INSERT INTO `user_buy` (`id`, `user_id`, `product_id`, `price`, `is_deposit`, `created_at`, `updated_at`) VALUES
(32, '29', 1, 10, 0, '2017-02-01 07:08:10', '0000-00-00 00:00:00'),
(33, '7', 6, 10, 0, '2017-02-01 07:09:22', '0000-00-00 00:00:00'),
(34, '43', 3, 10, 0, '2017-02-01 10:02:28', '0000-00-00 00:00:00'),
(36, '21', 4, 10, 0, '2017-02-02 05:37:31', '0000-00-00 00:00:00'),
(37, '5', 22, 15, 0, '2017-02-02 06:33:21', '0000-00-00 00:00:00'),
(38, '22', 21, 15, 0, '2017-02-02 08:23:04', '0000-00-00 00:00:00'),
(39, '43', 25, 3, 0, '2017-02-02 11:44:11', '0000-00-00 00:00:00'),
(48, '22', 19, 10, 0, '2017-02-02 13:56:06', '0000-00-00 00:00:00'),
(49, '29', 25, 3, 0, '2017-02-03 06:16:17', '0000-00-00 00:00:00'),
(50, '29', 1, 10, 0, '2017-02-03 06:16:46', '0000-00-00 00:00:00'),
(54, '19', 17, 10, 0, '2017-02-03 07:19:32', '0000-00-00 00:00:00'),
(55, '21', 4, 10, 0, '2017-02-03 07:29:25', '0000-00-00 00:00:00'),
(71, '14', 14, 20, 0, '2017-02-03 14:50:52', '0000-00-00 00:00:00'),
(74, '21', 4, 10, 0, '2017-02-06 08:25:52', '0000-00-00 00:00:00'),
(75, '28', 26, 10, 0, '2017-02-06 11:10:08', '0000-00-00 00:00:00'),
(76, '28', 26, 10, 0, '2017-02-06 11:10:15', '0000-00-00 00:00:00'),
(77, '28', 25, 3, 0, '2017-02-06 11:10:29', '0000-00-00 00:00:00'),
(78, '28', 25, 3, 0, '2017-02-06 11:10:33', '0000-00-00 00:00:00'),
(79, '43', 3, 10, 0, '2017-02-06 12:37:27', '0000-00-00 00:00:00'),
(80, '42', 24, 0, 0, '2017-02-07 05:06:13', '0000-00-00 00:00:00'),
(81, '42', 24, 0, 0, '2017-02-07 05:06:25', '0000-00-00 00:00:00'),
(82, '29', 1, 10, 0, '2017-02-07 06:11:33', '0000-00-00 00:00:00'),
(83, '42', 24, 0, 0, '2017-02-07 09:17:52', '0000-00-00 00:00:00'),
(84, '42', 24, 0, 0, '2017-02-07 09:17:57', '0000-00-00 00:00:00'),
(85, '42', 24, 0, 0, '2017-02-07 09:18:01', '0000-00-00 00:00:00'),
(86, '42', 24, 0, 0, '2017-02-07 09:18:06', '0000-00-00 00:00:00'),
(87, '42', 24, 0, 0, '2017-02-07 09:18:10', '0000-00-00 00:00:00'),
(88, '42', 24, 0, 0, '2017-02-07 09:23:27', '0000-00-00 00:00:00'),
(89, '42', 24, 0, 0, '2017-02-07 09:23:36', '0000-00-00 00:00:00'),
(90, '42', 24, 0, 0, '2017-02-07 09:23:44', '0000-00-00 00:00:00'),
(91, '42', 24, 0, 0, '2017-02-07 09:23:49', '0000-00-00 00:00:00'),
(92, '42', 24, 0, 0, '2017-02-07 09:23:53', '0000-00-00 00:00:00'),
(93, '42', 24, 0, 0, '2017-02-07 09:23:57', '0000-00-00 00:00:00'),
(94, '42', 24, 0, 0, '2017-02-07 09:24:01', '0000-00-00 00:00:00'),
(95, '42', 24, 0, 0, '2017-02-07 09:24:05', '0000-00-00 00:00:00'),
(96, '42', 24, 0, 0, '2017-02-07 09:24:10', '0000-00-00 00:00:00'),
(97, '42', 24, 0, 0, '2017-02-07 09:24:15', '0000-00-00 00:00:00'),
(98, '43', 25, 3, 0, '2017-02-07 09:47:53', '0000-00-00 00:00:00'),
(99, '22', 8, 15, 0, '2017-02-07 10:42:31', '0000-00-00 00:00:00'),
(100, '16', 8, 15, 0, '2017-02-07 11:37:25', '0000-00-00 00:00:00'),
(101, '14', 14, 20, 0, '2017-02-07 11:40:22', '0000-00-00 00:00:00'),
(102, '1', 3, 10, 0, '2017-02-07 11:47:27', '0000-00-00 00:00:00'),
(103, '7', 3, 10, 0, '2017-02-07 12:37:08', '0000-00-00 00:00:00'),
(104, '16', 15, 15, 0, '2017-02-07 12:40:10', '0000-00-00 00:00:00'),
(105, '37', 3, 10, 0, '2017-02-07 12:44:31', '0000-00-00 00:00:00'),
(106, '37', 3, 10, 0, '2017-02-07 12:44:59', '0000-00-00 00:00:00'),
(107, '14', 26, 10, 0, '2017-02-08 05:51:15', '0000-00-00 00:00:00'),
(108, '14', 25, 3, 0, '2017-02-08 05:51:37', '0000-00-00 00:00:00'),
(109, '33', 6, 10, 0, '2017-02-08 06:45:05', '0000-00-00 00:00:00');

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `user_buy`
--
ALTER TABLE `user_buy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;