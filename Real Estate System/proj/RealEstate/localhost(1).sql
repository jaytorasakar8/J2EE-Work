-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 10, 2016 at 10:09 AM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `propertywala`
--
CREATE DATABASE `propertywala` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `propertywala`;

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE IF NOT EXISTS `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` text,
  `area` text,
  `price` text,
  `seller_name` text,
  `contact` text,
  `image` text,
  `description` text NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_property_user_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`id`, `location`, `area`, `price`, `seller_name`, `contact`, `image`, `description`, `user_id`) VALUES
(1, 'Andheri', '1500', '789005', 'Manoj Shukla', '9000012345', '1.jpg', 'High Class Description, Low Class Property', 1),
(2, 'Andheri', '1200', '7450000', 'Manoj Shukla', '9000012345', '2.jpg', 'Not Available', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` text,
  `name` text,
  `password` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `password`) VALUES
(1, 'shuklamanoj79@gmail.com', 'Manoj Shukla', '123'),
(2, 'shuklamanoj119@gmail.com', 'Manoj', '147'),
(3, 'shuklamanoj134@gmail.com', 'Manoj Shukla', '10'),
(4, 'msfreecharge@gmail.com', 'Manoj Shukla', '023');
