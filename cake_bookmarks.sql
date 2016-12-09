-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 09, 2016 at 04:18 PM
-- Server version: 5.5.53-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cake_bookmarks`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE IF NOT EXISTS `bookmarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text,
  `url` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_key` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `bookmarks`
--

INSERT INTO `bookmarks` (`id`, `user_id`, `title`, `description`, `url`, `created`, `modified`) VALUES
(1, 1, 'Google', 'Site do google', 'http://www.google.com.br', '2016-06-10 11:28:56', '2016-06-10 16:46:57'),
(2, 2, 'Yii Framework', 'O melhor e mais rápido Framework do mercado', 'http://www.yiiframework.com', '2016-06-10 18:18:35', '2016-06-10 18:18:35'),
(3, 1, 'Yii Framework', 'O Yii Framework é o único framework ágil do mercado', 'http://www.yiiframework.com', '2016-06-14 19:59:34', '2016-06-14 20:04:11'),
(4, 1, 'CodeIgniter', 'O Framework que está mais atrasado no mercado mas que ainda tem muitos usuários pela sua facilidade e simplicidade', 'https://codeigniter.com', '2016-06-14 20:03:55', '2016-06-14 20:03:55'),
(5, 3, 'Teste', 'Teste', 'Teste', '2016-12-09 15:36:13', '2016-12-09 15:36:13');

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks_tags`
--

CREATE TABLE IF NOT EXISTS `bookmarks_tags` (
  `bookmark_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`bookmark_id`,`tag_id`),
  KEY `tag_key` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookmarks_tags`
--

INSERT INTO `bookmarks_tags` (`bookmark_id`, `tag_id`) VALUES
(1, 1),
(3, 2),
(3, 3),
(4, 3),
(3, 4),
(3, 5),
(4, 6),
(4, 7),
(3, 8),
(5, 9),
(5, 10),
(5, 11);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `title`, `created`, `modified`) VALUES
(1, 'buscador', '2016-06-10 11:29:07', '2016-06-10 16:41:05'),
(2, 'Yii', '2016-06-14 19:59:34', '2016-06-14 19:59:34'),
(3, 'MVC', '2016-06-14 19:59:34', '2016-06-14 19:59:34'),
(4, 'Widgets', '2016-06-14 20:01:16', '2016-06-14 20:01:16'),
(5, 'Gii', '2016-06-14 20:01:16', '2016-06-14 20:01:16'),
(6, 'CI', '2016-06-14 20:03:55', '2016-06-14 20:03:55'),
(7, 'Fullstak', '2016-06-14 20:03:55', '2016-06-14 20:03:55'),
(8, 'Fullstack', '2016-06-14 20:04:11', '2016-06-14 20:04:11'),
(9, 'teste1', '2016-12-09 15:36:13', '2016-12-09 15:36:13'),
(10, 'teste2', '2016-12-09 15:36:13', '2016-12-09 15:36:13'),
(11, 'teste3', '2016-12-09 15:36:13', '2016-12-09 15:36:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created`, `modified`) VALUES
(1, 'calcionit@gmail.com', '$2y$10$tYWIt38XEr1x7i0.MNevEOwgLF3/jUCGTAmcjOTBreg5b0mW91J9C', '2016-06-10 11:28:00', '2016-06-10 15:02:48'),
(2, 'calcio_nit@hotmail.com', '$2y$10$NJHez4oQ7t6yPyPGKZGDBu5VpMNSnsLCPKWZNviBd2H4R24YFjTWa', '2016-06-10 15:10:49', '2016-06-10 15:10:49'),
(3, 'calcio_nit1@hotmail.com', '$2y$10$GDGoffF0lx9/sg3esSfnF.LFvkpFb5Gx9IQCZNOPnvtySaCpwxaE2', '2016-06-10 15:13:15', '2016-06-10 15:13:15');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `bookmarks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `bookmarks_tags`
--
ALTER TABLE `bookmarks_tags`
  ADD CONSTRAINT `bookmarks_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`),
  ADD CONSTRAINT `bookmarks_tags_ibfk_2` FOREIGN KEY (`bookmark_id`) REFERENCES `bookmarks` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
