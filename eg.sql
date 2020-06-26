-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 25 2020 г., 17:31
-- Версия сервера: 5.7.23
-- Версия PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `eg`
--

-- --------------------------------------------------------

--
-- Структура таблицы `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `regionId` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id` (`regionId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `city`
--

INSERT INTO `city` (`id`, `title`, `regionId`) VALUES
(1, 'Москва', 1),
(3, 'Санкт-Петербург', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `money` float NOT NULL,
  `currencyId` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `currencyId` (`currencyId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `company`
--

INSERT INTO `company` (`id`, `userId`, `title`, `money`, `currencyId`) VALUES
(1, 1, 'Первая компания', 7000000, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `currencyId` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `currency_id` (`currencyId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `country`
--

INSERT INTO `country` (`id`, `title`, `currencyId`) VALUES
(1, 'Россия', 1),
(2, 'Германия', 2),
(3, 'Франция', 2),
(4, 'США', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `currency`
--

DROP TABLE IF EXISTS `currency`;
CREATE TABLE IF NOT EXISTS `currency` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(8) NOT NULL,
  `title` varchar(80) NOT NULL,
  `baseRate` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `currency`
--

INSERT INTO `currency` (`id`, `name`, `title`, `baseRate`) VALUES
(1, 'RUB', 'Российский рубль', 70),
(2, 'EUR', 'Евро', 0.92),
(3, 'USD', 'Американский доллар', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `userId` int(10) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `params` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `log`
--

INSERT INTO `log` (`id`, `type`, `userId`, `message`, `params`, `date`) VALUES
(1, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 10:11:31'),
(2, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 10:12:32'),
(3, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:11:26'),
(4, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:14:47'),
(5, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:15:29'),
(6, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:16:14'),
(7, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:19:06'),
(8, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:19:10'),
(9, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:19:19'),
(10, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:19:32'),
(11, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:23:57'),
(12, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:24:36'),
(13, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:24:58'),
(14, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:29:15'),
(15, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:30:06'),
(16, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:31:04'),
(17, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:31:17'),
(18, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:31:24'),
(19, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:31:41'),
(20, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:50:42'),
(21, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:50:54'),
(22, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:51:53'),
(23, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:52:09'),
(24, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:52:18'),
(25, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:52:48'),
(26, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:53:20'),
(27, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:53:24'),
(28, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:53:45'),
(29, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:54:28'),
(30, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 11:54:33'),
(31, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 12:02:48'),
(32, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 14:10:37'),
(33, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 14:15:24'),
(34, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 14:16:18'),
(35, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 14:17:38'),
(36, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 15:19:43'),
(37, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 15:24:06'),
(38, 'user_login', 1, 'Залогинился', NULL, '2020-06-24 15:24:21'),
(39, 'user_login', 1, 'Залогинился', NULL, '2020-06-25 16:41:26'),
(40, 'user_login', 1, 'Залогинился', NULL, '2020-06-25 16:55:37'),
(41, 'user_login', 1, 'Залогинился', NULL, '2020-06-25 16:55:39'),
(42, 'user_login', 1, 'Залогинился', NULL, '2020-06-25 16:57:09'),
(43, 'user_login', 1, 'Залогинился', NULL, '2020-06-25 17:11:36'),
(44, 'user_login', 1, 'Залогинился', NULL, '2020-06-25 17:11:57'),
(45, 'user_login', 1, 'Залогинился', NULL, '2020-06-25 17:12:15');

-- --------------------------------------------------------

--
-- Структура таблицы `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(10) UNSIGNED NOT NULL,
  `type` varchar(25) NOT NULL,
  `message` text NOT NULL,
  `unread` int(1) NOT NULL DEFAULT '1',
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `typeId` int(10) UNSIGNED NOT NULL,
  `amount` float NOT NULL,
  `quality` float NOT NULL,
  `unitId` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeId` (`typeId`),
  KEY `unitId` (`unitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `production_cost`
--

DROP TABLE IF EXISTS `production_cost`;
CREATE TABLE IF NOT EXISTS `production_cost` (
  `unitType` int(10) UNSIGNED NOT NULL,
  `productType` int(10) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`unitType`,`productType`),
  KEY `productType` (`productType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `production_cost`
--

INSERT INTO `production_cost` (`unitType`, `productType`, `amount`) VALUES
(2, 1, 1800),
(3, 2, 900);

-- --------------------------------------------------------

--
-- Структура таблицы `production_making`
--

DROP TABLE IF EXISTS `production_making`;
CREATE TABLE IF NOT EXISTS `production_making` (
  `unitType` int(10) UNSIGNED NOT NULL,
  `productType` int(10) UNSIGNED NOT NULL,
  `amount` float NOT NULL,
  `quality` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`unitType`,`productType`),
  KEY `productType` (`productType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `production_making`
--

INSERT INTO `production_making` (`unitType`, `productType`, `amount`, `quality`) VALUES
(1, 1, 1800, 1),
(2, 2, 900, 1),
(3, 3, 300, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_demand`
--

DROP TABLE IF EXISTS `product_demand`;
CREATE TABLE IF NOT EXISTS `product_demand` (
  `cityId` int(10) UNSIGNED NOT NULL,
  `productType` int(10) UNSIGNED NOT NULL,
  `baseCount` int(10) UNSIGNED NOT NULL,
  `deficitCount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `amount` float UNSIGNED NOT NULL,
  KEY `cityId` (`cityId`),
  KEY `productType` (`productType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_demand`
--

INSERT INTO `product_demand` (`cityId`, `productType`, `baseCount`, `deficitCount`, `amount`) VALUES
(1, 3, 500, 0, 1500000),
(3, 3, 300, 0, 800000);

-- --------------------------------------------------------

--
-- Структура таблицы `product_type`
--

DROP TABLE IF EXISTS `product_type`;
CREATE TABLE IF NOT EXISTS `product_type` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `type` enum('final','material','equipment','') NOT NULL,
  `weight` float UNSIGNED NOT NULL DEFAULT '1',
  `elasticity` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_type`
--

INSERT INTO `product_type` (`id`, `title`, `type`, `weight`, `elasticity`) VALUES
(1, 'Нефть', 'material', 1, 1),
(2, 'Резина', 'material', 1, 1),
(3, 'Автомобильные шины', 'final', 5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `countryId` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `countryId` (`countryId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `region`
--

INSERT INTO `region` (`id`, `countryId`, `title`) VALUES
(1, 1, 'Центральный'),
(2, 1, 'Северо-Западный');

-- --------------------------------------------------------

--
-- Структура таблицы `transport`
--

DROP TABLE IF EXISTS `transport`;
CREATE TABLE IF NOT EXISTS `transport` (
  `id` int(11) UNSIGNED NOT NULL,
  `productId` int(10) UNSIGNED NOT NULL,
  `unitFrom` int(10) UNSIGNED NOT NULL,
  `unitTo` int(10) UNSIGNED NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `unitFrom` (`unitFrom`),
  KEY `unitTo` (`unitTo`),
  KEY `productId` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `unit`
--

DROP TABLE IF EXISTS `unit`;
CREATE TABLE IF NOT EXISTS `unit` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `companyId` int(10) UNSIGNED NOT NULL,
  `cityId` int(10) UNSIGNED NOT NULL,
  `typeId` int(10) UNSIGNED NOT NULL,
  `lastUpdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `companyId` (`companyId`),
  KEY `cityId` (`cityId`),
  KEY `typeId` (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `unit_type`
--

DROP TABLE IF EXISTS `unit_type`;
CREATE TABLE IF NOT EXISTS `unit_type` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `type` enum('shop','factory','farm','storage','mine') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `unit_type`
--

INSERT INTO `unit_type` (`id`, `title`, `type`) VALUES
(1, 'Нефтяная вышка', 'mine'),
(2, 'Нефтеперерабатывающий завод', 'factory'),
(3, 'Завод автомобильных шин', 'factory');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `money` int(11) NOT NULL,
  `lastLogin` datetime NOT NULL,
  `lastActiv` datetime NOT NULL,
  `registerDate` datetime NOT NULL,
  `block` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `money`, `lastLogin`, `lastActiv`, `registerDate`, `block`) VALUES
(1, 'test1', '00c6c8269a12845bb87d846416dabe8a', 0, '2020-06-24 09:07:59', '2020-06-24 09:07:59', '2020-06-24 09:07:59', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `visit`
--

DROP TABLE IF EXISTS `visit`;
CREATE TABLE IF NOT EXISTS `visit` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `page` varchar(40) NOT NULL,
  `userId` int(10) UNSIGNED DEFAULT NULL,
  `refer` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `visit`
--

INSERT INTO `visit` (`id`, `date`, `page`, `userId`, `refer`) VALUES
(1, '2020-06-24 10:33:51', 'index', NULL, ''),
(2, '2020-06-24 10:34:13', 'index', NULL, ''),
(3, '2020-06-24 10:34:22', 'index', NULL, ''),
(4, '2020-06-24 10:34:30', 'index', NULL, ''),
(5, '2020-06-24 10:34:42', 'index', NULL, ''),
(6, '2020-06-24 10:34:58', 'index', NULL, ''),
(7, '2020-06-24 10:35:01', 'index', NULL, ''),
(8, '2020-06-24 10:35:12', 'index', NULL, ''),
(9, '2020-06-24 11:08:24', 'index', NULL, ''),
(10, '2020-06-24 11:11:16', 'index', NULL, 'http://eg.game/'),
(11, '2020-06-24 11:11:16', 'index', NULL, 'http://eg.game/register'),
(12, '2020-06-24 11:16:19', 'register', NULL, 'http://eg.game/'),
(13, '2020-06-24 11:17:16', 'register', NULL, 'http://eg.game/'),
(14, '2020-06-24 11:18:37', 'register', NULL, 'http://eg.game/'),
(15, '2020-06-24 11:18:38', 'register', NULL, 'http://eg.game/'),
(16, '2020-06-24 11:19:00', 'register', NULL, 'http://eg.game/'),
(17, '2020-06-24 11:19:33', 'register', NULL, 'http://eg.game/'),
(18, '2020-06-24 11:26:57', 'register', NULL, ''),
(19, '2020-06-24 11:27:10', 'register', NULL, 'http://eg.game/register'),
(20, '2020-06-24 11:28:02', 'register', NULL, 'http://eg.game/register'),
(25, '2020-06-24 12:07:59', 'register', NULL, 'http://eg.game/register'),
(26, '2020-06-24 13:07:48', 'index', NULL, ''),
(27, '2020-06-24 13:09:03', 'index', NULL, ''),
(28, '2020-06-24 13:09:07', 'login', NULL, 'http://eg.game/'),
(29, '2020-06-24 13:10:48', 'login', NULL, 'http://eg.game/'),
(30, '2020-06-24 13:10:52', 'login', NULL, 'http://eg.game/login'),
(31, '2020-06-24 13:10:54', 'login', NULL, 'http://eg.game/login'),
(32, '2020-06-24 13:10:56', 'login', NULL, 'http://eg.game/login'),
(33, '2020-06-24 13:11:15', 'login', NULL, 'http://eg.game/login'),
(34, '2020-06-24 13:11:31', 'login', NULL, 'http://eg.game/login'),
(35, '2020-06-24 13:12:32', 'login', 1, 'http://eg.game/login'),
(36, '2020-06-24 14:11:26', 'login', NULL, 'http://eg.game/login'),
(37, '2020-06-24 14:14:47', 'login', 1, 'http://eg.game/login'),
(38, '2020-06-24 14:15:29', 'login', 1, 'http://eg.game/login'),
(39, '2020-06-24 14:16:14', 'login', 1, 'http://eg.game/login'),
(40, '2020-06-24 14:19:06', 'login', 1, 'http://eg.game/login'),
(41, '2020-06-24 14:19:10', 'login', 1, 'http://eg.game/login'),
(42, '2020-06-24 14:19:19', 'login', 1, 'http://eg.game/login'),
(43, '2020-06-24 14:19:32', 'login', 1, 'http://eg.game/login'),
(44, '2020-06-24 14:23:57', 'login', 1, 'http://eg.game/login'),
(45, '2020-06-24 14:24:36', 'login', 1, 'http://eg.game/login'),
(46, '2020-06-24 14:24:58', 'login', 1, 'http://eg.game/login'),
(47, '2020-06-24 14:29:15', 'login', 1, 'http://eg.game/login'),
(48, '2020-06-24 14:30:06', 'login', 1, 'http://eg.game/login'),
(49, '2020-06-24 14:31:04', 'login', 1, 'http://eg.game/login'),
(50, '2020-06-24 14:31:17', 'login', 1, 'http://eg.game/login'),
(51, '2020-06-24 14:31:24', 'login', 1, 'http://eg.game/login'),
(52, '2020-06-24 14:31:41', 'login', 1, 'http://eg.game/login'),
(53, '2020-06-24 14:50:42', 'login', 1, 'http://eg.game/login'),
(54, '2020-06-24 14:50:54', 'login', 1, 'http://eg.game/login'),
(55, '2020-06-24 14:51:53', 'login', 1, 'http://eg.game/login'),
(56, '2020-06-24 14:52:09', 'login', 1, 'http://eg.game/login'),
(57, '2020-06-24 14:52:18', 'login', 1, 'http://eg.game/login'),
(58, '2020-06-24 14:52:48', 'login', 1, 'http://eg.game/login'),
(59, '2020-06-24 14:53:20', 'login', 1, 'http://eg.game/login'),
(60, '2020-06-24 14:53:24', 'login', 1, 'http://eg.game/login'),
(61, '2020-06-24 14:53:45', 'login', 1, 'http://eg.game/login'),
(62, '2020-06-24 14:54:28', 'login', 1, 'http://eg.game/login'),
(63, '2020-06-24 14:54:33', 'login', 1, 'http://eg.game/login'),
(64, '2020-06-24 15:02:23', 'login', 1, ''),
(65, '2020-06-24 15:02:26', 'login', 1, ''),
(66, '2020-06-24 15:02:44', 'login', 1, ''),
(67, '2020-06-24 15:02:48', 'login', 1, 'http://eg.game/login'),
(68, '2020-06-24 15:10:59', 'login', 1, ''),
(69, '2020-06-24 15:11:23', 'createcompany', 1, ''),
(70, '2020-06-24 15:12:34', 'create_company', 1, ''),
(71, '2020-06-24 15:12:54', 'create_company', 1, ''),
(72, '2020-06-24 15:13:38', 'create_company', 1, ''),
(73, '2020-06-24 15:13:52', 'create_company', 1, 'http://eg.game/create_company'),
(74, '2020-06-24 15:14:46', 'create_company', 1, 'http://eg.game/create_company'),
(75, '2020-06-24 15:14:47', 'create_company', 1, 'http://eg.game/create_company'),
(76, '2020-06-24 15:14:47', 'create_company', 1, 'http://eg.game/create_company'),
(77, '2020-06-24 15:14:48', 'create_company', 1, 'http://eg.game/create_company'),
(78, '2020-06-24 15:15:27', 'create_company', 1, 'http://eg.game/create_company'),
(79, '2020-06-24 15:15:58', 'create_company', 1, 'http://eg.game/create_company'),
(80, '2020-06-24 15:16:55', 'create_company', 1, 'http://eg.game/create_company'),
(81, '2020-06-24 15:16:56', 'create_company', 1, 'http://eg.game/create_company'),
(82, '2020-06-24 15:16:58', 'create_company', 1, 'http://eg.game/create_company'),
(83, '2020-06-24 15:17:05', 'create_company', 1, 'http://eg.game/create_company'),
(84, '2020-06-24 15:17:12', 'create_company', 1, 'http://eg.game/create_company'),
(85, '2020-06-24 15:17:14', 'create_company', 1, 'http://eg.game/create_company'),
(86, '2020-06-24 15:17:22', 'create_company', 1, 'http://eg.game/create_company'),
(87, '2020-06-24 15:17:30', 'create_company', 1, 'http://eg.game/create_company'),
(88, '2020-06-24 15:17:31', 'create_company', 1, 'http://eg.game/create_company'),
(89, '2020-06-24 15:17:33', 'create_company', 1, 'http://eg.game/create_company'),
(90, '2020-06-24 15:18:39', 'create_company', 1, 'http://eg.game/create_company'),
(91, '2020-06-24 15:18:56', 'create_company', 1, 'http://eg.game/create_company'),
(92, '2020-06-24 15:19:30', 'create_company', 1, 'http://eg.game/create_company'),
(93, '2020-06-24 15:19:31', 'create_company', 1, 'http://eg.game/create_company'),
(94, '2020-06-24 15:20:13', 'create_company', 1, 'http://eg.game/create_company'),
(95, '2020-06-24 17:10:33', 'login', NULL, 'http://eg.game/create_company'),
(96, '2020-06-24 17:10:37', 'login', NULL, 'http://eg.game/create_company'),
(97, '2020-06-24 17:15:24', 'login', 1, 'http://eg.game/create_company'),
(98, '2020-06-24 17:16:18', 'login', 1, 'http://eg.game/create_company'),
(99, '2020-06-24 17:17:38', 'login', 1, 'http://eg.game/create_company'),
(100, '2020-06-24 17:17:41', 'create_company', 1, 'http://eg.game/login'),
(101, '2020-06-24 17:19:13', 'create_company', 1, ''),
(102, '2020-06-24 17:19:22', 'create_company', 1, 'http://eg.game/create_company'),
(103, '2020-06-24 17:20:24', 'create_company', 1, 'http://eg.game/create_company'),
(104, '2020-06-24 17:20:33', 'create_company', 1, 'http://eg.game/create_company'),
(105, '2020-06-24 17:20:46', 'create_company', 1, 'http://eg.game/create_company'),
(106, '2020-06-24 17:20:53', 'create_company', 1, 'http://eg.game/create_company'),
(107, '2020-06-24 17:21:16', 'create_company', 1, 'http://eg.game/create_company'),
(108, '2020-06-24 17:21:40', 'create_company', 1, 'http://eg.game/create_company'),
(109, '2020-06-24 17:21:45', 'create_company', 1, ''),
(110, '2020-06-24 17:23:30', 'create_company', 1, ''),
(111, '2020-06-24 18:19:38', 'login', NULL, ''),
(112, '2020-06-24 18:19:43', 'login', NULL, 'http://eg.game/main'),
(113, '2020-06-24 18:24:06', 'login', 1, 'http://eg.game/main'),
(114, '2020-06-24 18:24:21', 'login', 1, 'http://eg.game/main'),
(115, '2020-06-25 19:41:20', 'index', NULL, ''),
(116, '2020-06-25 19:41:22', 'login', NULL, 'http://eg.game/'),
(117, '2020-06-25 19:41:26', 'login', NULL, 'http://eg.game/login'),
(118, '2020-06-25 19:55:37', 'login', 1, 'http://eg.game/login'),
(119, '2020-06-25 19:55:39', 'login', 1, 'http://eg.game/login'),
(120, '2020-06-25 19:57:09', 'login', 1, 'http://eg.game/login'),
(121, '2020-06-25 20:11:36', 'login', 1, 'http://eg.game/login'),
(122, '2020-06-25 20:11:57', 'login', 1, 'http://eg.game/login'),
(123, '2020-06-25 20:12:15', 'login', 1, 'http://eg.game/login'),
(124, '2020-06-25 20:18:33', 'units', 1, 'http://eg.game/login'),
(125, '2020-06-25 20:19:29', 'units', 1, 'http://eg.game/login'),
(126, '2020-06-25 20:20:17', 'units', 1, 'http://eg.game/login'),
(127, '2020-06-25 20:22:02', 'units', 1, 'http://eg.game/login'),
(128, '2020-06-25 20:27:47', 'units', 1, 'http://eg.game/login'),
(129, '2020-06-25 20:29:40', 'units', 1, 'http://eg.game/login'),
(130, '2020-06-25 20:29:41', 'units', 1, 'http://eg.game/login'),
(131, '2020-06-25 20:30:44', 'units', 1, 'http://eg.game/login');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`regionId`) REFERENCES `region` (`id`);

--
-- Ограничения внешнего ключа таблицы `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `company_ibfk_2` FOREIGN KEY (`currencyId`) REFERENCES `currency` (`id`);

--
-- Ограничения внешнего ключа таблицы `country`
--
ALTER TABLE `country`
  ADD CONSTRAINT `country_ibfk_1` FOREIGN KEY (`currencyId`) REFERENCES `currency` (`id`);

--
-- Ограничения внешнего ключа таблицы `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `product_type` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`unitId`) REFERENCES `unit` (`id`);

--
-- Ограничения внешнего ключа таблицы `production_cost`
--
ALTER TABLE `production_cost`
  ADD CONSTRAINT `production_cost_ibfk_1` FOREIGN KEY (`productType`) REFERENCES `product_type` (`id`),
  ADD CONSTRAINT `production_cost_ibfk_2` FOREIGN KEY (`unitType`) REFERENCES `unit_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `production_making`
--
ALTER TABLE `production_making`
  ADD CONSTRAINT `production_making_ibfk_1` FOREIGN KEY (`productType`) REFERENCES `product_type` (`id`),
  ADD CONSTRAINT `production_making_ibfk_2` FOREIGN KEY (`unitType`) REFERENCES `unit_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `product_demand`
--
ALTER TABLE `product_demand`
  ADD CONSTRAINT `product_demand_ibfk_1` FOREIGN KEY (`cityId`) REFERENCES `city` (`id`),
  ADD CONSTRAINT `product_demand_ibfk_2` FOREIGN KEY (`productType`) REFERENCES `product_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `region`
--
ALTER TABLE `region`
  ADD CONSTRAINT `region_ibfk_1` FOREIGN KEY (`countryId`) REFERENCES `country` (`id`);

--
-- Ограничения внешнего ключа таблицы `transport`
--
ALTER TABLE `transport`
  ADD CONSTRAINT `transport_ibfk_1` FOREIGN KEY (`unitFrom`) REFERENCES `unit` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transport_ibfk_2` FOREIGN KEY (`unitTo`) REFERENCES `unit` (`id`),
  ADD CONSTRAINT `transport_ibfk_3` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);

--
-- Ограничения внешнего ключа таблицы `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `unit_ibfk_2` FOREIGN KEY (`cityId`) REFERENCES `city` (`id`),
  ADD CONSTRAINT `unit_ibfk_3` FOREIGN KEY (`typeId`) REFERENCES `unit_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `visit`
--
ALTER TABLE `visit`
  ADD CONSTRAINT `visit_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
