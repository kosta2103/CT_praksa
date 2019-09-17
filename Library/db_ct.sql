-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 17, 2019 at 06:59 AM
-- Server version: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ct`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `author` varchar(150) NOT NULL,
  `published_at` date NOT NULL,
  `quantity` int(10) NOT NULL,
  `available` int(10) NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `name`, `author`, `published_at`, `quantity`, `available`) VALUES
(1, 'The Testaments', 'Margaret Atwood', '2019-09-01', 20, 20),
(2, 'Talking to Strangers', 'Malcolm Gladwell', '2019-07-03', 10, 10),
(3, 'The Water Dancer', 'Ta-Nehisi Coates', '2018-02-19', 30, 30),
(4, 'Things You Save in a Fire', 'Katherine Center', '2016-04-25', 50, 50),
(5, 'Naslov1', 'Autor1, Autor2, Autor3', '2019-09-11', 100, 100),
(6, 'Naslov2', 'Autor1', '2019-09-28', 20, 20),
(7, 'Naslov3', 'Autor2, Autor3', '2019-09-01', 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

DROP TABLE IF EXISTS `borrow`;
CREATE TABLE IF NOT EXISTS `borrow` (
  `borrow_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `borrowed_at` timestamp NOT NULL,
  `returned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`borrow_id`),
  KEY `user_id_fk` (`user_id`),
  KEY `book_id_fk` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `borrow`
--

INSERT INTO `borrow` (`borrow_id`, `user_id`, `book_id`, `borrowed_at`, `returned_at`) VALUES
(1, 22, 1, '2019-09-17 22:53:00', '2019-09-26 12:02:00'),
(2, 22, 2, '2019-09-12 00:00:00', '2019-09-26 09:11:00'),
(3, 22, 3, '2019-09-10 12:22:00', '2019-09-27 12:51:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='User table';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `surname`, `email`) VALUES
(7, 'Marko', 'Markovic', 'mare@gmail.com'),
(8, 'Nikola', 'Samardzic', 'nikola@gmail.com'),
(22, 'Kosta', 'Eric', 'kosta@gmail.com'),
(23, 'Test', 'Test', 'test@gmail.com'),
(24, 'hghk', 'gkjgj', 'dh@gmail.com');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrow`
--
ALTER TABLE `borrow`
  ADD CONSTRAINT `book_id_fk` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
