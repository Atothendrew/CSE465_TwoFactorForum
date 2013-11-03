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
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(8) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL,
  `cat_description` varchar(255) NOT NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_name_unique` (`cat_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `cat_description`) VALUES
(5, 'Politics', 'Complain about your least favorite party here.'),
(6, 'Sports', 'Try to convince everyone (including yourself) that your team is better.'),
(7, 'America', 'Obligatory category about how awesome America is. If you disagree, then we disagree with you. ');

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

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `post_id` int(8) NOT NULL AUTO_INCREMENT,
  `post_content` text NOT NULL,
  `post_date` datetime NOT NULL,
  `post_topic` int(8) NOT NULL,
  `post_by` int(8) NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `post_topic` (`post_topic`),
  KEY `post_by` (`post_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE IF NOT EXISTS `topics` (
  `topic_id` int(8) NOT NULL AUTO_INCREMENT,
  `topic_subject` varchar(255) NOT NULL,
  `topic_date` datetime NOT NULL,
  `topic_cat` int(8) NOT NULL,
  `topic_by` int(8) NOT NULL,
  PRIMARY KEY (`topic_id`),
  KEY `topic_cat` (`topic_cat`),
  KEY `topic_by` (`topic_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(8) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_date` datetime NOT NULL,
  `user_level` int(8) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name_unique` (`user_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_pass`, `user_email`, `user_date`, `user_level`) VALUES
(1, 'jeff', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'landarch05@gmail.com', '2013-09-10 10:56:01', 1),
(2, 'John', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'ho@eed.edd', '2013-09-10 16:31:43', 0),
(3, 'Atothendrew', '02e0a999c50b1f88df7a8f5a04e1b76b35ea6a88', 'atothendrew24@mac.com', '2013-09-11 12:12:00', 0),
(4, 'Andrew', '02e0a999c50b1f88df7a8f5a04e1b76b35ea6a88', 'arwill15@asu.edu', '2013-09-11 13:39:10', 1),
(5, 'Romstar', '5e14ae57fe236da8d609a8d5c2b46ecb62df8833', 'rrashid@asu.edu', '2013-09-11 14:39:36', 0),
(6, 'joe', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'landarch05@gmail.com', '2013-09-11 14:43:04', 0),
(8, 'pip', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'landarch05@ymail.com', '2013-09-11 15:04:50', 0),
(9, '5465', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '', '2013-09-12 14:29:29', 0),
(10, '465', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '456', '2013-09-12 14:29:54', 0),
(11, 'nina', 'b443de4b0ff48581d8743a5f5cad5321e40054c2', 'niarkova@asu.edu', '2013-09-24 11:37:25', 0),
(13, 'ninai', 'b443de4b0ff48581d8743a5f5cad5321e40054c2', 'ninaiarkova@live.com', '2013-09-24 11:39:35', 0),
(14, 'Test', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 'arwill15@asu.edu', '2013-10-01 17:37:39', 1),
(18, 'hello1', '6c9d5f041f5eb9e9a8587146ee98a242cb5a7cfc', 'ninaiarkova@live.com', '2013-10-25 00:32:37', 0),
(20, 'nina1', 'b443de4b0ff48581d8743a5f5cad5321e40054c2', 'nina_kittie@hotmail.com', '2013-10-25 00:33:53', 0),
(21, 'nina123', 'b443de4b0ff48581d8743a5f5cad5321e40054c2', 'niarkova@asu.edu', '2013-10-25 00:39:03', 0),
(22, 'whoami123456', '3823e79ab5eb5f2dff4e7e4aae3f09cc3424fe7a', 'who.am.i.123456@mailinator.com', '2013-10-27 23:24:40', 0),
(23, 'adamh', 'd54b76b2bad9d9946011ebc62a1d272f4122c7b5', 'adam.hensley@asu.edu', '2013-10-27 23:43:04', 0),
(24, 'test321', 'b443de4b0ff48581d8743a5f5cad5321e40054c2', 'ninaiarkova@live.com', '2013-10-30 21:09:17', 0),
(25, 'pants', 'b443de4b0ff48581d8743a5f5cad5321e40054c2', 'nina_kittie@hotmail.com', '2013-10-30 21:09:58', 0),
(26, 'yellow', 'b443de4b0ff48581d8743a5f5cad5321e40054c2', 'ninaiarkova@asu.edu', '2013-10-30 21:13:54', 0),
(27, 'Jeff1', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 'landarch05@hotmail.com', '2013-11-01 16:51:45', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`post_topic`) REFERENCES `topics` (`topic_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`post_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `topics_ibfk_1` FOREIGN KEY (`topic_cat`) REFERENCES `categories` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `topics_ibfk_2` FOREIGN KEY (`topic_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
