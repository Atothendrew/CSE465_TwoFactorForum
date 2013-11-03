-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 03, 2013 at 01:00 PM
-- Server version: 5.5.32
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `andre124_jeff`
--

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE IF NOT EXISTS `otp` (
  `user_name` varchar(100) NOT NULL,
  `otp_pass` varchar(100) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `user_name` (`user_name`,`otp_pass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otp`
--

INSERT INTO `otp` (`user_name`, `otp_pass`, `date_created`) VALUES
('', 'blah', '2013-10-08 12:13:19'),
('456132', '55cea197140dd38ffb06ed57a68effc9', '0000-00-00 00:00:00'),
('admin', '7a53bda01e97f9ce820fa6573f45d588', '2013-10-28 06:21:42'),
('Andrew', '192d69a9c8c7eef93ccc27f753fd910b', '2013-10-25 07:43:21'),
('df', '119f97125289fcba1e30314683f0250f', '2013-10-28 06:40:06'),
('hello', 'df0b7babf08e498087fe0fefb3d0969e', '2013-10-30 05:38:29'),
('Jeff', '8030dc11e9d90886d283a102f9088d24', '2013-11-01 23:39:18'),
('Jeff1', 'dc1291de7b77128b23aecbd84b135ddd', '2013-11-01 23:54:01'),
('joe', '129558abb2d317c8dac23c9e9535cfe5', '0000-00-00 00:00:00'),
('landarch05@gmail.com', '36ca5c8b46efd3d0ae95f4a4744205e4', '0000-00-00 00:00:00'),
('nina', '0d6354a6e35ae45e8292e43831b6e0c7', '2013-10-25 08:04:19'),
('nina123', '29efc52c5286f8c1c4d547a4a5eaa3c3', '2013-10-31 04:08:59'),
('ninai'' OR 1=1 --', '60054fddf98da6122508c29841ee09a7', '2013-10-25 09:04:41'),
('pip', '80fa0b0f00f0bc71531fd5284287f4ad', '0000-00-00 00:00:00'),
('who.am.i@mailinator.com', '4f81531c3e2f955c88d6c0a3d006b1b9', '2013-10-28 06:22:24'),
('whoami123456', '346798e97d8fa42c398e04cc0903508a', '2013-10-28 06:43:58');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
