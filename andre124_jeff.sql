-- phpMyAdmin SQL Dump
-- version 3.5.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 17, 2013 at 04:48 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `cat_description`) VALUES
(1, 'test 1', 'this is a test of the forum functionality. please attempt to comment'),
(2, 'cats are kind of dope', '^ says it all');

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE IF NOT EXISTS `otp` (
  `user_name` varchar(100) NOT NULL,
  `otp_pass` varchar(100) NOT NULL,
  UNIQUE KEY `user_name` (`user_name`,`otp_pass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otp`
--

INSERT INTO `otp` (`user_name`, `otp_pass`) VALUES
('', 'ca67c0e9e28eafdbce19aeb392d756be'),
('456132', '55cea197140dd38ffb06ed57a68effc9'),
('Andrew', '395728a3dd983cdf6618880004ca78b2'),
('Jeff', '838ba0a5de54f7e601d30cbbef07a3a5'),
('joe', '129558abb2d317c8dac23c9e9535cfe5'),
('landarch05@gmail.com', '36ca5c8b46efd3d0ae95f4a4744205e4'),
('nina', 'a55ad36e6469101cacf36229cea51bad'),
('pip', '80fa0b0f00f0bc71531fd5284287f4ad'),
('Romstar', '7f732fce1d95a9dbb07bf6716953d8d3');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_content`, `post_date`, `post_topic`, `post_by`) VALUES
(1, 'this is a topic test', '2013-09-10 16:30:14', 1, 1),
(2, 'reply', '2013-09-10 16:30:38', 1, 1),
(3, 'more', '2013-09-10 17:36:41', 2, 1),
(4, 'adsfadsfasdf', '2013-09-10 17:36:49', 2, 1),
(5, 'test', '2013-09-11 12:12:38', 1, 3),
(6, 'cats are minorly dope. ', '2013-09-11 15:15:38', 10, 4);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`topic_id`, `topic_subject`, `topic_date`, `topic_cat`, `topic_by`) VALUES
(1, 'topic test', '2013-09-10 16:30:14', 1, 1),
(2, 'another', '2013-09-10 17:36:41', 1, 1),
(10, 'hell yea', '2013-09-11 15:15:38', 2, 4);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

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
(14, 'Test', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 'arwill15@asu.edu', '2013-10-01 17:37:39', 1);

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
