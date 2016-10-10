-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-10-10 20:26:13
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `votemovie`
--

-- --------------------------------------------------------

--
-- 表的结构 `stamp`
--

CREATE TABLE IF NOT EXISTS `stamp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` int(11) NOT NULL,
  `received` int(11) NOT NULL DEFAULT '0',
  `used` int(11) NOT NULL DEFAULT '0',
  `gettime` datetime NOT NULL,
  `receivetime` datetime NOT NULL,
  `usetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `stamp`
--

INSERT INTO `stamp` (`id`, `name`, `received`, `used`, `gettime`, `receivetime`, `usetime`) VALUES
(1, 32247314, 0, 0, '2016-10-11 01:16:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 28336181, 0, 0, '2016-10-11 01:17:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 79425354, 0, 0, '2016-10-11 01:17:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 66738891, 0, 0, '2016-10-11 01:17:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 0, 0, 0, '2016-10-11 01:19:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 33238830, 0, 0, '2016-10-11 01:27:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 49907836, 0, 0, '2016-10-11 01:27:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 93548278, 0, 0, '2016-10-11 01:30:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 22700195, 0, 0, '2016-10-11 01:31:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 50503845, 0, 0, '2016-10-11 01:48:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 32137451, 0, 0, '2016-10-11 01:54:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 77513732, 0, 0, '2016-10-11 01:54:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 38885803, 0, 0, '2016-10-11 01:57:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 36952209, 0, 0, '2016-10-11 01:59:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 55425720, 0, 0, '2016-10-11 02:09:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `vote`
--

CREATE TABLE IF NOT EXISTS `vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `details` text NOT NULL,
  `vote` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `vote`
--

INSERT INTO `vote` (`id`, `name`, `details`, `vote`) VALUES
(1, '21312', '34243', 60),
(2, '特傻对', '请问强大的期望', 66),
(3, '姨妈刀', '姨妈刀真可怕', 20),
(4, '姨妈刀', '姨妈刀真可怕', 66),
(5, '傅达礼', '傅达礼哈哈哈', 35);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
