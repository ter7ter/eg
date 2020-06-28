-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 28 2020 г., 17:24
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `city`
--

INSERT INTO `city` (`id`, `title`, `regionId`) VALUES
(1, 'Москва', 1),
(3, 'Санкт-Петербург', 2),
(4, 'Владимир', 1),
(5, 'Нижний новгород', 1),
(6, 'Тула', 1);

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
(1, 1, 'Первая компания', 7010520, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

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
(45, 'user_login', 1, 'Залогинился', NULL, '2020-06-25 17:12:15'),
(46, 'user_login', 1, 'Залогинился', NULL, '2020-06-26 14:13:29'),
(48, 'user_login', 1, 'Залогинился', NULL, '2020-06-26 15:16:09'),
(50, 'user_login', 1, 'Залогинился', NULL, '2020-06-27 06:31:03'),
(51, 'user_login', 1, 'Залогинился', NULL, '2020-06-27 16:19:19'),
(52, 'user_login', 1, 'Залогинился', NULL, '2020-06-28 05:45:36'),
(53, 'user_login', 1, 'Залогинился', NULL, '2020-06-28 07:51:48'),
(54, 'user_login', 1, 'Залогинился', NULL, '2020-06-28 09:48:32'),
(55, 'user_login', 1, 'Залогинился', NULL, '2020-06-28 11:48:03'),
(56, 'user_login', 1, 'Залогинился', NULL, '2020-06-28 12:28:44'),
(57, 'user_login', 1, 'Залогинился', NULL, '2020-06-28 13:36:27'),
(58, 'user_login', 1, 'Залогинился', NULL, '2020-06-28 15:15:15'),
(59, 'user_login', 1, 'Залогинился', NULL, '2020-06-28 16:50:40');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `typeId`, `amount`, `quality`, `unitId`) VALUES
(1, 2, 78, 2, 4),
(2, 2, 39, 3, 5),
(7, 2, 20, 2.52381, 2),
(10, 2, 7, 2, NULL),
(11, 2, 10, 2, NULL),
(13, 11, 40, 4, 2),
(14, 2, 1, 2.52381, NULL),
(15, 11, 5, 4, NULL),
(16, 11, 5, 4, NULL);

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
-- Структура таблицы `product_category`
--

DROP TABLE IF EXISTS `product_category`;
CREATE TABLE IF NOT EXISTS `product_category` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_category`
--

INSERT INTO `product_category` (`id`, `title`) VALUES
(1, 'Природные ресурсы'),
(2, 'Материалы'),
(3, 'Автомобильные товары'),
(4, 'Продовольственные товары'),
(5, 'Одежда, обувь'),
(6, 'Мебель'),
(7, 'Оборудование'),
(8, 'Стройматериалы'),
(9, 'Офисная техника'),
(10, 'Бытовая техника');

-- --------------------------------------------------------

--
-- Структура таблицы `product_demand`
--

DROP TABLE IF EXISTS `product_demand`;
CREATE TABLE IF NOT EXISTS `product_demand` (
  `cityId` int(10) UNSIGNED NOT NULL,
  `productType` int(10) UNSIGNED NOT NULL,
  `baseCount` int(10) UNSIGNED NOT NULL,
  `remCount` float NOT NULL DEFAULT '0',
  `deficitCount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `amount` float UNSIGNED NOT NULL,
  `lastUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cityId`,`productType`),
  KEY `productType` (`productType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_demand`
--

INSERT INTO `product_demand` (`cityId`, `productType`, `baseCount`, `remCount`, `deficitCount`, `amount`, `lastUpdate`) VALUES
(1, 3, 500, 1106480000, 0, 1500000, '2020-06-28 16:49:24'),
(3, 3, 300, 132765000, 0, 800000, '2020-06-28 16:38:51');

-- --------------------------------------------------------

--
-- Структура таблицы `product_sale`
--

DROP TABLE IF EXISTS `product_sale`;
CREATE TABLE IF NOT EXISTS `product_sale` (
  `unitId` int(10) UNSIGNED NOT NULL,
  `typeId` int(10) UNSIGNED NOT NULL,
  `price` float NOT NULL,
  `currencyId` int(10) UNSIGNED NOT NULL,
  `access` enum('all','private','list','close') NOT NULL DEFAULT 'private',
  PRIMARY KEY (`unitId`,`typeId`),
  KEY `currencyId` (`currencyId`),
  KEY `typeId` (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_sale`
--

INSERT INTO `product_sale` (`unitId`, `typeId`, `price`, `currencyId`, `access`) VALUES
(2, 2, 30, 1, 'all'),
(4, 2, 5, 1, 'private'),
(5, 2, 10, 1, 'all');

-- --------------------------------------------------------

--
-- Структура таблицы `product_shop`
--

DROP TABLE IF EXISTS `product_shop`;
CREATE TABLE IF NOT EXISTS `product_shop` (
  `unitId` int(10) UNSIGNED NOT NULL,
  `typeId` int(10) UNSIGNED NOT NULL,
  `cityId` int(10) UNSIGNED NOT NULL,
  `price` float NOT NULL,
  `shopFactor` float NOT NULL,
  PRIMARY KEY (`unitId`,`typeId`),
  KEY `cityId` (`cityId`),
  KEY `productId` (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_shop`
--

INSERT INTO `product_shop` (`unitId`, `typeId`, `cityId`, `price`, `shopFactor`) VALUES
(2, 3, 1, 100, 3),
(2, 11, 1, 5000, 0.08);

-- --------------------------------------------------------

--
-- Структура таблицы `product_type`
--

DROP TABLE IF EXISTS `product_type`;
CREATE TABLE IF NOT EXISTS `product_type` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `type` enum('final','material','equipment','') NOT NULL,
  `categoryId` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL DEFAULT '1',
  `elasticity` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `categoryId` (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_type`
--

INSERT INTO `product_type` (`id`, `title`, `type`, `categoryId`, `weight`, `elasticity`) VALUES
(1, 'Нефть', 'material', 1, 1, 1),
(2, 'Резина', 'material', 2, 1, 1),
(3, 'Автомобильные шины', 'final', 3, 5, 1),
(4, 'Уголь', 'material', 1, 1, 1),
(5, 'Золото', 'material', 1, 1, 1),
(6, 'Железо', 'material', 1, 1, 1),
(7, 'Никель', 'material', 1, 1, 1),
(8, 'Пластик', 'material', 2, 1, 1),
(9, 'Металопрокат', 'material', 2, 1, 1),
(10, 'Дерево', 'material', 1, 1, 1),
(11, 'Мотоцикл', 'final', 3, 1, 1),
(12, 'Легковой автомобиль', 'final', 3, 1, 1),
(13, 'Грузовой автомобиль', 'final', 3, 1, 1);

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
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `productId` int(10) UNSIGNED NOT NULL,
  `unitFrom` int(10) UNSIGNED NOT NULL,
  `unitTo` int(10) UNSIGNED NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `unitFrom` (`unitFrom`),
  KEY `unitTo` (`unitTo`),
  KEY `productId` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `transport`
--

INSERT INTO `transport` (`id`, `productId`, `unitFrom`, `unitTo`, `startTime`, `endTime`) VALUES
(7, 10, 4, 2, '2020-06-28 11:50:20', '2020-06-28 12:02:20'),
(8, 11, 4, 2, '2020-06-28 11:50:43', '2020-06-28 12:02:43'),
(9, 14, 2, 4, '2020-06-28 17:14:03', '2020-06-28 17:26:03'),
(10, 15, 2, 5, '2020-06-28 17:22:19', '2020-06-28 18:34:19'),
(11, 16, 2, 4, '2020-06-28 17:23:21', '2020-06-28 17:35:21');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `unit`
--

INSERT INTO `unit` (`id`, `title`, `companyId`, `cityId`, `typeId`, `lastUpdate`) VALUES
(2, 'Первый магазин', 1, 1, 5, '2020-06-26 16:56:55'),
(3, 'Ларёк', 1, 1, 4, '2020-06-26 17:19:27'),
(4, 'Средний склад', 1, 4, 7, '2020-06-26 17:33:12'),
(5, 'Маленький склад', 1, 3, 6, '2020-06-28 08:13:34');

-- --------------------------------------------------------

--
-- Структура таблицы `unit_sale`
--

DROP TABLE IF EXISTS `unit_sale`;
CREATE TABLE IF NOT EXISTS `unit_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unitFrom` int(10) UNSIGNED DEFAULT NULL,
  `unitTo` int(10) UNSIGNED DEFAULT NULL,
  `productType` int(10) UNSIGNED NOT NULL,
  `valueFrom` float NOT NULL,
  `valueTo` float NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `quality` float UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productType` (`productType`),
  KEY `unitFrom` (`unitFrom`),
  KEY `unitTo` (`unitTo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `unit_sale`
--

INSERT INTO `unit_sale` (`id`, `unitFrom`, `unitTo`, `productType`, `valueFrom`, `valueTo`, `amount`, `quality`, `date`) VALUES
(6, 4, 2, 2, 25, -25, 5, 2, '2020-06-28 10:01:54'),
(7, 4, 2, 2, 50, -50, 10, 2, '2020-06-28 10:03:44'),
(8, 4, 2, 2, 25, -25, 5, 2, '2020-06-28 10:20:30'),
(9, 4, 2, 2, 50, -50, 10, 2, '2020-06-28 10:22:55'),
(10, 5, 2, 2, 100, -100, 10, 3, '2020-06-28 10:26:48'),
(11, 5, 2, 2, 10, -10, 1, 3, '2020-06-28 10:27:16'),
(12, 4, 2, 2, 35, -35, 7, 2, '2020-06-28 11:50:20'),
(13, 4, 2, 2, 50, -50, 10, 2, '2020-06-28 11:50:43'),
(14, 2, NULL, 3, 10000, 0, 100, 3, '2020-06-28 13:49:24');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `unit_type`
--

INSERT INTO `unit_type` (`id`, `title`, `type`) VALUES
(1, 'Нефтяная вышка', 'mine'),
(2, 'Нефтеперерабатывающий завод', 'factory'),
(3, 'Завод автомобильных шин', 'factory'),
(4, 'Ларёк', 'shop'),
(5, 'Магазин', 'shop'),
(6, 'Маленький склад', 'storage'),
(7, 'Средний склад', 'storage'),
(8, 'Большой склад', 'storage'),
(9, 'Железный рудник', 'mine'),
(10, 'Угольный рудник', 'mine');

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
) ENGINE=InnoDB AUTO_INCREMENT=848 DEFAULT CHARSET=utf8;

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
(131, '2020-06-25 20:30:44', 'units', 1, 'http://eg.game/login'),
(132, '2020-06-26 17:13:21', 'index', NULL, ''),
(133, '2020-06-26 17:13:22', 'login', NULL, 'http://eg.game/'),
(134, '2020-06-26 17:13:29', 'login', NULL, 'http://eg.game/login'),
(135, '2020-06-26 17:13:37', 'main', 1, ''),
(136, '2020-06-26 17:13:48', 'main', 1, 'http://eg.game/main'),
(137, '2020-06-26 17:13:50', 'units', 1, 'http://eg.game/main'),
(138, '2020-06-26 17:30:33', 'units', 1, 'http://eg.game/main'),
(139, '2020-06-26 17:30:45', 'units', 1, 'http://eg.game/main'),
(140, '2020-06-26 17:31:08', 'units', 1, 'http://eg.game/main'),
(141, '2020-06-26 17:31:27', 'units', 1, 'http://eg.game/main'),
(142, '2020-06-26 17:31:39', 'units', 1, 'http://eg.game/main'),
(143, '2020-06-26 17:31:44', 'units', 1, 'http://eg.game/main'),
(144, '2020-06-26 17:31:54', 'units', 1, 'http://eg.game/main'),
(145, '2020-06-26 17:32:06', 'units', 1, 'http://eg.game/main'),
(146, '2020-06-26 17:32:20', 'units', 1, 'http://eg.game/main'),
(147, '2020-06-26 17:32:39', 'units', 1, 'http://eg.game/main'),
(148, '2020-06-26 17:33:08', 'units', 1, 'http://eg.game/main'),
(149, '2020-06-26 17:33:56', 'units', 1, 'http://eg.game/main'),
(150, '2020-06-26 17:33:57', 'units', 1, 'http://eg.game/main'),
(151, '2020-06-26 17:39:07', 'units', 1, 'http://eg.game/main'),
(152, '2020-06-26 18:15:42', 'login', NULL, 'http://eg.game/main'),
(153, '2020-06-26 18:15:47', 'login', NULL, 'http://eg.game/units'),
(155, '2020-06-26 18:16:09', 'login', 1, 'http://eg.game/login'),
(156, '2020-06-26 18:16:11', 'units', 1, 'http://eg.game/login'),
(157, '2020-06-26 18:32:54', 'create_unit', 1, 'http://eg.game/units'),
(159, '2020-06-26 18:44:19', 'create_unit', 1, 'http://eg.game/units'),
(161, '2020-06-26 18:53:52', 'create_unit', 1, 'http://eg.game/units'),
(162, '2020-06-26 19:01:52', 'create_unit', 1, 'http://eg.game/units'),
(163, '2020-06-26 19:04:05', 'create_unit', 1, 'http://eg.game/units'),
(164, '2020-06-26 19:05:02', 'create_unit', 1, 'http://eg.game/units'),
(165, '2020-06-26 19:05:04', 'create_unit', 1, 'http://eg.game/units'),
(166, '2020-06-26 19:06:34', 'create_unit', 1, 'http://eg.game/units'),
(167, '2020-06-26 19:10:28', 'create_unit', 1, 'http://eg.game/units'),
(168, '2020-06-26 19:12:49', 'create_unit', 1, 'http://eg.game/units'),
(169, '2020-06-26 19:12:50', 'get_cities', 1, 'http://eg.game/create_unit?type=shop'),
(170, '2020-06-26 19:13:01', 'get_cities', 1, ''),
(171, '2020-06-26 19:13:36', 'get_cities', 1, ''),
(172, '2020-06-26 19:13:43', 'get_cities', 1, ''),
(173, '2020-06-26 19:13:51', 'get_cities', 1, ''),
(174, '2020-06-26 19:14:48', 'get_cities', 1, ''),
(175, '2020-06-26 19:18:59', 'get_cities', 1, ''),
(176, '2020-06-26 19:19:10', 'get_cities', 1, ''),
(177, '2020-06-26 19:19:15', 'get_cities', 1, ''),
(178, '2020-06-26 19:19:40', 'get_cities', 1, ''),
(179, '2020-06-26 19:23:44', 'get_cities', 1, ''),
(180, '2020-06-26 19:24:15', 'get_cities', 1, ''),
(181, '2020-06-26 19:24:42', 'create_unit', 1, 'http://eg.game/units'),
(182, '2020-06-26 19:28:14', 'create_unit', 1, 'http://eg.game/units'),
(183, '2020-06-26 19:28:43', 'create_unit', 1, 'http://eg.game/units'),
(184, '2020-06-26 19:51:54', 'create_company', 1, 'http://eg.game/create_unit?type=shop'),
(185, '2020-06-26 19:51:57', 'create_unit', 1, 'http://eg.game/units'),
(186, '2020-06-26 19:52:06', 'create_unit', 1, 'http://eg.game/units'),
(187, '2020-06-26 19:52:08', 'create_unit', 1, 'http://eg.game/create_unit?type=shop'),
(188, '2020-06-26 19:52:09', 'create_unit', 1, 'http://eg.game/create_unit'),
(189, '2020-06-26 19:53:25', 'create_unit', 1, 'http://eg.game/create_unit'),
(190, '2020-06-26 19:54:01', 'create_unit', 1, 'http://eg.game/create_unit'),
(193, '2020-06-26 19:56:55', 'create_unit', 1, 'http://eg.game/create_unit'),
(194, '2020-06-26 19:56:55', 'units', 1, 'http://eg.game/create_unit'),
(195, '2020-06-26 20:01:28', 'units', 1, 'http://eg.game/create_unit'),
(196, '2020-06-26 20:01:49', 'units', 1, 'http://eg.game/create_unit'),
(197, '2020-06-26 20:03:20', 'units', 1, 'http://eg.game/create_unit'),
(198, '2020-06-26 20:05:56', 'units', 1, 'http://eg.game/create_unit'),
(199, '2020-06-26 20:15:46', 'units', 1, 'http://eg.game/create_unit'),
(200, '2020-06-26 20:15:46', 'units', 1, 'http://eg.game/create_unit'),
(201, '2020-06-26 20:15:48', 'create_unit', 1, 'http://eg.game/units'),
(202, '2020-06-26 20:17:38', 'create_unit', 1, 'http://eg.game/units'),
(203, '2020-06-26 20:18:55', 'units', 1, 'http://eg.game/create_unit?type=shop'),
(204, '2020-06-26 20:18:58', 'units', 1, 'http://eg.game/units'),
(205, '2020-06-26 20:18:59', 'create_unit', 1, 'http://eg.game/units'),
(206, '2020-06-26 20:19:25', 'create_unit', 1, 'http://eg.game/units'),
(207, '2020-06-26 20:19:27', 'create_unit', 1, 'http://eg.game/create_unit?type=shop'),
(208, '2020-06-26 20:19:27', 'units', 1, 'http://eg.game/create_unit?type=shop'),
(209, '2020-06-26 20:20:44', 'units', 1, 'http://eg.game/create_unit?type=shop'),
(210, '2020-06-26 20:24:00', 'create_unit', 1, 'http://eg.game/units'),
(211, '2020-06-26 20:24:05', 'units', 1, 'http://eg.game/create_unit?type=shop'),
(212, '2020-06-26 20:25:13', 'units', 1, 'http://eg.game/create_unit?type=shop'),
(213, '2020-06-26 20:25:14', 'create_unit', 1, 'http://eg.game/units'),
(214, '2020-06-26 20:26:41', 'create_unit', 1, 'http://eg.game/units'),
(215, '2020-06-26 20:27:20', 'create_unit', 1, 'http://eg.game/units'),
(216, '2020-06-26 20:32:21', 'create_unit', 1, 'http://eg.game/units'),
(217, '2020-06-26 20:32:28', 'create_unit', 1, 'http://eg.game/units'),
(218, '2020-06-26 20:32:48', 'create_unit', 1, 'http://eg.game/units'),
(219, '2020-06-26 20:32:59', 'units', 1, 'http://eg.game/create_unit&type=storage'),
(220, '2020-06-26 20:33:05', 'units', 1, 'http://eg.game/create_unit&type=storage'),
(221, '2020-06-26 20:33:06', 'create_unit', 1, 'http://eg.game/units'),
(222, '2020-06-26 20:33:12', 'create_unit', 1, 'http://eg.game/create_unit&type=storage'),
(223, '2020-06-26 20:33:12', 'units', 1, 'http://eg.game/create_unit&type=storage'),
(224, '2020-06-26 20:37:01', 'unit', 1, 'http://eg.game/units'),
(225, '2020-06-26 20:39:13', 'unit', 1, 'http://eg.game/units'),
(226, '2020-06-26 20:39:45', 'unit', 1, 'http://eg.game/units'),
(227, '2020-06-26 20:45:08', 'unit', 1, 'http://eg.game/units'),
(228, '2020-06-26 20:52:53', 'unit', 1, 'http://eg.game/units'),
(229, '2020-06-26 20:53:29', 'unit', 1, 'http://eg.game/units'),
(230, '2020-06-26 20:55:36', 'unit', 1, 'http://eg.game/unit&id=2'),
(231, '2020-06-26 20:55:59', 'unit', 1, 'http://eg.game/unit&id=2'),
(232, '2020-06-26 20:56:00', 'unit', 1, 'http://eg.game/unit&id=2&tab=info'),
(233, '2020-06-26 20:56:01', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(234, '2020-06-26 20:57:10', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(235, '2020-06-26 20:57:11', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(236, '2020-06-26 20:57:11', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(237, '2020-06-26 20:57:42', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(238, '2020-06-26 20:57:44', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(239, '2020-06-26 20:57:48', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(240, '2020-06-26 20:57:50', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(241, '2020-06-26 20:57:52', 'unit', 1, 'http://eg.game/unit&id=2&tab=info'),
(242, '2020-06-26 20:57:53', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(243, '2020-06-26 20:57:53', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(244, '2020-06-26 20:58:31', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(245, '2020-06-26 20:58:33', 'unit', 1, 'http://eg.game/unit&id=2&tab=info'),
(246, '2020-06-26 20:58:35', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(247, '2020-06-26 20:58:54', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(248, '2020-06-26 20:58:55', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(249, '2020-06-26 20:58:56', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(250, '2020-06-26 20:58:57', 'unit', 1, 'http://eg.game/unit&id=2&tab=info'),
(251, '2020-06-26 20:58:57', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(252, '2020-06-26 20:58:58', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(253, '2020-06-26 20:58:58', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(254, '2020-06-26 20:59:00', 'unit', 1, 'http://eg.game/unit&id=2&tab=info'),
(255, '2020-06-27 09:29:52', 'index', NULL, ''),
(256, '2020-06-27 09:29:53', 'login', NULL, 'http://eg.game/'),
(258, '2020-06-27 09:31:03', 'login', 1, 'http://eg.game/login'),
(259, '2020-06-27 09:31:06', 'units', 1, 'http://eg.game/login'),
(260, '2020-06-27 09:31:10', 'unit', 1, 'http://eg.game/units'),
(263, '2020-06-27 09:32:56', 'unit', 1, 'http://eg.game/unit&id=4'),
(264, '2020-06-27 09:33:15', 'unit', 1, 'http://eg.game/unit&id=4'),
(265, '2020-06-27 09:33:16', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(266, '2020-06-27 09:33:17', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(267, '2020-06-27 09:33:17', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(268, '2020-06-27 09:33:18', 'unit', 1, 'http://eg.game/unit&id=4&tab=info'),
(271, '2020-06-27 09:35:33', 'unit', 1, 'http://eg.game/unit&id=4&tab=info'),
(272, '2020-06-27 09:59:07', 'unit', 1, 'http://eg.game/unit&id=4&tab=info'),
(273, '2020-06-27 09:59:09', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(274, '2020-06-27 09:59:09', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(275, '2020-06-27 12:13:21', 'login', NULL, 'http://eg.game/unit&id=4&tab=supply'),
(276, '2020-06-27 19:19:13', 'index', NULL, ''),
(277, '2020-06-27 19:19:14', 'login', NULL, 'http://eg.game/'),
(278, '2020-06-27 19:19:17', 'login', NULL, 'http://eg.game/login'),
(279, '2020-06-27 19:19:19', 'login', NULL, 'http://eg.game/login'),
(280, '2020-06-27 19:19:22', 'units', 1, 'http://eg.game/login'),
(281, '2020-06-27 19:19:26', 'unit', 1, 'http://eg.game/units'),
(282, '2020-06-27 19:19:27', 'unit', 1, 'http://eg.game/unit&id=4'),
(283, '2020-06-27 19:19:30', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(284, '2020-06-27 19:19:30', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(285, '2020-06-27 19:19:30', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(286, '2020-06-27 19:20:07', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(287, '2020-06-27 19:21:08', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(288, '2020-06-27 19:23:06', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(289, '2020-06-27 19:23:12', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(290, '2020-06-27 19:44:06', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(291, '2020-06-27 19:44:07', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(292, '2020-06-27 19:45:05', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(293, '2020-06-27 19:45:09', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(294, '2020-06-27 19:45:10', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(295, '2020-06-27 19:46:08', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(296, '2020-06-27 19:46:29', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(297, '2020-06-27 19:47:55', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(298, '2020-06-27 19:47:58', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(299, '2020-06-27 19:47:59', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(300, '2020-06-27 19:48:00', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(301, '2020-06-27 19:48:01', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(302, '2020-06-27 19:48:30', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(303, '2020-06-27 19:48:32', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(304, '2020-06-27 19:48:39', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(305, '2020-06-27 19:48:40', 'unit', 1, 'http://eg.game/unit&id=4&tab=info'),
(306, '2020-06-27 19:48:40', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(307, '2020-06-27 19:48:41', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(308, '2020-06-27 19:48:57', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(309, '2020-06-27 19:49:24', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(310, '2020-06-27 19:49:29', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(311, '2020-06-27 19:49:30', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(312, '2020-06-27 19:49:31', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(313, '2020-06-27 19:49:32', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(314, '2020-06-27 19:49:34', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(315, '2020-06-27 19:50:03', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(316, '2020-06-27 19:50:37', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(317, '2020-06-27 19:50:46', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(318, '2020-06-27 19:51:38', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(321, '2020-06-27 20:00:31', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(322, '2020-06-27 20:01:10', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(323, '2020-06-27 20:01:13', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(324, '2020-06-27 20:01:13', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(325, '2020-06-27 20:02:58', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(326, '2020-06-27 20:02:59', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(327, '2020-06-27 20:03:00', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(328, '2020-06-27 20:03:01', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(329, '2020-06-27 20:03:01', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(330, '2020-06-27 20:18:25', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(331, '2020-06-27 20:21:57', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(332, '2020-06-27 20:22:07', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(333, '2020-06-27 20:22:09', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(334, '2020-06-27 20:22:29', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(335, '2020-06-27 20:22:31', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(336, '2020-06-27 20:22:50', 'units', 1, 'http://eg.game/unit&id=4&tab=supply'),
(337, '2020-06-27 20:24:25', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(338, '2020-06-27 20:24:27', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(339, '2020-06-27 20:26:09', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(340, '2020-06-27 20:26:09', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(341, '2020-06-27 20:26:11', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(342, '2020-06-27 20:27:21', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(343, '2020-06-27 20:27:22', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(344, '2020-06-27 20:28:11', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(345, '2020-06-27 20:28:13', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(346, '2020-06-27 20:30:23', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(347, '2020-06-27 20:30:24', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(348, '2020-06-27 20:31:46', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(349, '2020-06-27 20:31:46', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(350, '2020-06-27 20:31:48', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(351, '2020-06-27 20:31:51', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(352, '2020-06-27 20:32:30', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(353, '2020-06-27 20:32:32', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(354, '2020-06-27 20:34:45', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(355, '2020-06-27 20:34:52', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(356, '2020-06-27 20:36:27', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(357, '2020-06-27 20:36:28', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(358, '2020-06-27 20:37:31', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(359, '2020-06-27 20:37:32', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(360, '2020-06-27 20:38:14', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(361, '2020-06-27 20:38:16', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(362, '2020-06-27 20:52:15', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(363, '2020-06-27 20:52:16', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(364, '2020-06-27 20:53:30', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(365, '2020-06-27 20:53:31', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(366, '2020-06-27 20:53:34', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(367, '2020-06-27 20:54:19', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(368, '2020-06-27 20:54:20', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(369, '2020-06-27 20:54:22', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(370, '2020-06-27 20:54:25', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(371, '2020-06-27 20:54:27', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(372, '2020-06-27 20:54:27', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(373, '2020-06-27 20:56:08', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(374, '2020-06-27 20:56:09', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(375, '2020-06-27 20:56:11', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(376, '2020-06-27 20:56:27', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(377, '2020-06-27 20:56:29', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(378, '2020-06-27 20:56:29', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(379, '2020-06-27 20:56:31', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(380, '2020-06-27 20:56:32', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(381, '2020-06-27 20:56:36', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(382, '2020-06-27 20:57:03', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(383, '2020-06-27 20:58:27', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(384, '2020-06-28 08:44:59', 'index', NULL, ''),
(385, '2020-06-28 08:45:01', 'login', NULL, 'http://eg.game/'),
(386, '2020-06-28 08:45:03', 'login', NULL, 'http://eg.game/'),
(387, '2020-06-28 08:45:31', 'login', NULL, 'http://eg.game/'),
(388, '2020-06-28 08:45:36', 'login', NULL, 'http://eg.game/login'),
(389, '2020-06-28 08:45:38', 'units', 1, 'http://eg.game/login'),
(390, '2020-06-28 08:45:40', 'unit', 1, 'http://eg.game/units'),
(391, '2020-06-28 08:45:41', 'unit', 1, 'http://eg.game/unit&id=4'),
(392, '2020-06-28 08:49:30', 'unit', 1, 'http://eg.game/unit&id=4'),
(393, '2020-06-28 08:49:47', 'unit', 1, 'http://eg.game/unit&id=4'),
(394, '2020-06-28 08:49:50', 'unit', 1, 'http://eg.game/unit&id=4'),
(395, '2020-06-28 08:50:02', 'unit', 1, 'http://eg.game/unit&id=4'),
(396, '2020-06-28 08:50:02', 'unit', 1, 'http://eg.game/unit&id=4'),
(397, '2020-06-28 08:50:37', 'unit', 1, 'http://eg.game/unit&id=4'),
(398, '2020-06-28 08:50:39', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(399, '2020-06-28 08:51:31', 'unit', 1, 'http://eg.game/unit&id=4'),
(400, '2020-06-28 08:51:32', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(401, '2020-06-28 08:52:40', 'unit', 1, 'http://eg.game/unit&id=4'),
(402, '2020-06-28 08:52:42', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(403, '2020-06-28 08:52:46', 'unit', 1, 'http://eg.game/unit&id=4'),
(404, '2020-06-28 08:52:47', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(405, '2020-06-28 08:52:49', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(406, '2020-06-28 10:51:36', 'login', NULL, 'http://eg.game/unit&id=4&tab=supply'),
(407, '2020-06-28 10:51:36', 'login', NULL, 'http://eg.game/unit&id=4&tab=supply'),
(408, '2020-06-28 10:51:46', 'login', NULL, 'http://eg.game/unit&id=4&tab=supply'),
(409, '2020-06-28 10:51:48', 'login', NULL, 'http://eg.game/login'),
(410, '2020-06-28 10:51:50', 'units', 1, 'http://eg.game/login'),
(411, '2020-06-28 10:51:53', 'unit', 1, 'http://eg.game/units'),
(412, '2020-06-28 10:51:54', 'unit', 1, 'http://eg.game/unit&id=4'),
(413, '2020-06-28 10:51:54', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(414, '2020-06-28 10:51:56', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(415, '2020-06-28 10:51:56', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(416, '2020-06-28 10:51:59', 'unit', 1, 'http://eg.game/unit&id=4&tab=info'),
(417, '2020-06-28 10:52:00', 'units', 1, 'http://eg.game/unit&id=4&tab=sale'),
(418, '2020-06-28 10:52:01', 'unit', 1, 'http://eg.game/units'),
(419, '2020-06-28 10:52:03', 'unit', 1, 'http://eg.game/unit&id=2'),
(420, '2020-06-28 10:52:04', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(421, '2020-06-28 10:52:07', 'units', 1, 'http://eg.game/unit&id=2&tab=supply'),
(422, '2020-06-28 10:52:08', 'unit', 1, 'http://eg.game/units'),
(423, '2020-06-28 10:52:09', 'unit', 1, 'http://eg.game/unit&id=4'),
(424, '2020-06-28 10:52:12', 'units', 1, 'http://eg.game/unit&id=4&tab=sale'),
(425, '2020-06-28 10:52:13', 'unit', 1, 'http://eg.game/units'),
(426, '2020-06-28 10:52:14', 'unit', 1, 'http://eg.game/unit&id=2'),
(427, '2020-06-28 10:52:15', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(428, '2020-06-28 10:52:17', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(430, '2020-06-28 10:53:42', 'unit', 1, 'http://eg.game/unit&id=2'),
(431, '2020-06-28 10:53:43', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(432, '2020-06-28 10:53:44', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(434, '2020-06-28 10:55:28', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(435, '2020-06-28 10:55:29', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(437, '2020-06-28 10:56:00', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(438, '2020-06-28 10:56:02', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(439, '2020-06-28 10:56:04', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(440, '2020-06-28 10:58:23', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(441, '2020-06-28 10:58:26', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(442, '2020-06-28 10:58:27', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(443, '2020-06-28 10:59:40', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(444, '2020-06-28 11:00:28', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(445, '2020-06-28 11:01:01', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(446, '2020-06-28 11:01:17', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(447, '2020-06-28 11:01:19', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(448, '2020-06-28 11:01:19', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(449, '2020-06-28 11:05:13', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(450, '2020-06-28 11:05:15', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(451, '2020-06-28 11:05:16', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(452, '2020-06-28 11:09:03', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(453, '2020-06-28 11:09:04', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(454, '2020-06-28 11:09:05', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(455, '2020-06-28 11:09:07', 'unit', 1, 'http://eg.game/unit&id=2'),
(456, '2020-06-28 11:09:08', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(457, '2020-06-28 11:09:09', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(458, '2020-06-28 11:09:10', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(459, '2020-06-28 11:09:44', 'unit', 1, 'http://eg.game/unit&id=2'),
(460, '2020-06-28 11:09:46', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(461, '2020-06-28 11:09:47', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(462, '2020-06-28 11:09:48', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(463, '2020-06-28 11:11:46', 'unit', 1, 'http://eg.game/unit&id=2'),
(464, '2020-06-28 11:11:47', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(465, '2020-06-28 11:11:48', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(466, '2020-06-28 11:11:49', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(467, '2020-06-28 11:12:51', 'unit', 1, 'http://eg.game/unit&id=2'),
(468, '2020-06-28 11:12:53', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(469, '2020-06-28 11:12:54', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(470, '2020-06-28 11:12:55', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(471, '2020-06-28 11:13:16', 'unit', 1, 'http://eg.game/unit&id=2'),
(472, '2020-06-28 11:13:17', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(473, '2020-06-28 11:13:19', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(474, '2020-06-28 11:13:20', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(475, '2020-06-28 11:13:24', 'units', 1, 'http://eg.game/unit&id=2&tab=supply'),
(476, '2020-06-28 11:13:27', 'create_unit', 1, 'http://eg.game/units'),
(477, '2020-06-28 11:13:34', 'create_unit', 1, 'http://eg.game/create_unit&type=storage'),
(478, '2020-06-28 11:13:34', 'units', 1, 'http://eg.game/create_unit&type=storage'),
(479, '2020-06-28 11:14:08', 'unit', 1, 'http://eg.game/units'),
(480, '2020-06-28 11:14:09', 'unit', 1, 'http://eg.game/unit&id=5'),
(481, '2020-06-28 11:14:17', 'unit', 1, 'http://eg.game/unit&id=5&tab=sale'),
(482, '2020-06-28 11:14:19', 'units', 1, 'http://eg.game/unit&id=5&tab=sale'),
(483, '2020-06-28 11:14:21', 'unit', 1, 'http://eg.game/units'),
(484, '2020-06-28 11:14:22', 'unit', 1, 'http://eg.game/unit&id=2'),
(485, '2020-06-28 11:14:23', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(486, '2020-06-28 11:14:24', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(487, '2020-06-28 11:14:25', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(488, '2020-06-28 11:15:38', 'unit', 1, 'http://eg.game/unit&id=2'),
(489, '2020-06-28 11:15:39', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(490, '2020-06-28 11:15:40', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(491, '2020-06-28 11:15:41', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(492, '2020-06-28 11:16:21', 'unit', 1, 'http://eg.game/unit&id=2'),
(493, '2020-06-28 11:16:22', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(494, '2020-06-28 11:16:24', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(495, '2020-06-28 11:16:24', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(496, '2020-06-28 11:16:40', 'unit', 1, 'http://eg.game/unit&id=2'),
(497, '2020-06-28 11:16:42', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(498, '2020-06-28 11:16:43', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(499, '2020-06-28 11:16:43', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(500, '2020-06-28 11:16:51', 'unit', 1, 'http://eg.game/unit&id=2'),
(501, '2020-06-28 11:16:52', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(502, '2020-06-28 11:16:53', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(503, '2020-06-28 11:16:53', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(504, '2020-06-28 11:17:14', 'unit', 1, 'http://eg.game/unit&id=2'),
(505, '2020-06-28 11:17:14', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(506, '2020-06-28 11:17:16', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(507, '2020-06-28 11:17:16', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(508, '2020-06-28 11:17:43', 'unit', 1, 'http://eg.game/unit&id=2'),
(509, '2020-06-28 11:17:43', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(510, '2020-06-28 11:17:44', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(511, '2020-06-28 11:17:45', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(512, '2020-06-28 11:18:55', 'unit', 1, 'http://eg.game/unit&id=2'),
(513, '2020-06-28 11:18:56', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(514, '2020-06-28 11:18:58', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(515, '2020-06-28 11:18:59', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(516, '2020-06-28 11:20:59', 'unit', 1, 'http://eg.game/unit&id=2'),
(517, '2020-06-28 11:21:00', 'unit', 1, 'http://eg.game/unit&id=2'),
(518, '2020-06-28 11:21:01', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(519, '2020-06-28 11:21:02', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(520, '2020-06-28 11:21:03', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(521, '2020-06-28 11:22:28', 'unit', 1, 'http://eg.game/unit&id=2'),
(522, '2020-06-28 11:22:28', 'unit', 1, 'http://eg.game/unit&id=2'),
(523, '2020-06-28 11:22:30', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(524, '2020-06-28 11:22:30', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(525, '2020-06-28 11:22:31', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(526, '2020-06-28 11:25:47', 'unit', 1, 'http://eg.game/unit&id=2'),
(527, '2020-06-28 11:26:36', 'unit', 1, 'http://eg.game/unit&id=2'),
(528, '2020-06-28 11:27:24', 'unit', 1, 'http://eg.game/unit&id=2'),
(529, '2020-06-28 11:27:49', 'unit', 1, 'http://eg.game/unit&id=2'),
(530, '2020-06-28 11:27:54', 'unit', 1, 'http://eg.game/unit&id=2'),
(531, '2020-06-28 11:28:01', 'unit', 1, 'http://eg.game/unit&id=2'),
(532, '2020-06-28 11:28:17', 'unit', 1, 'http://eg.game/unit&id=2'),
(533, '2020-06-28 12:48:23', 'login', NULL, 'http://eg.game/unit&id=2&tab=supply'),
(534, '2020-06-28 12:48:26', 'login', NULL, 'http://eg.game/unit&id=2&tab=supply'),
(535, '2020-06-28 12:48:29', 'login', NULL, 'http://eg.game/login'),
(536, '2020-06-28 12:48:31', 'login', NULL, 'http://eg.game/login'),
(537, '2020-06-28 12:48:32', 'login', NULL, 'http://eg.game/login'),
(538, '2020-06-28 12:48:34', 'units', 1, 'http://eg.game/login'),
(539, '2020-06-28 12:48:36', 'unit', 1, 'http://eg.game/units'),
(540, '2020-06-28 12:48:37', 'unit', 1, 'http://eg.game/unit&id=2'),
(541, '2020-06-28 12:48:38', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(542, '2020-06-28 12:48:39', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(543, '2020-06-28 12:48:39', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(544, '2020-06-28 12:48:40', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(545, '2020-06-28 12:49:07', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(546, '2020-06-28 12:49:09', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(547, '2020-06-28 12:49:10', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(548, '2020-06-28 12:49:11', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(549, '2020-06-28 12:50:04', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(550, '2020-06-28 12:50:05', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(551, '2020-06-28 12:50:06', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(552, '2020-06-28 12:52:06', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(553, '2020-06-28 12:52:11', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(554, '2020-06-28 12:52:12', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(555, '2020-06-28 12:55:32', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(556, '2020-06-28 12:55:33', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(557, '2020-06-28 12:55:35', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(558, '2020-06-28 12:55:36', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(559, '2020-06-28 12:55:37', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(560, '2020-06-28 12:55:38', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(561, '2020-06-28 12:55:39', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(562, '2020-06-28 12:56:04', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(563, '2020-06-28 12:56:04', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(564, '2020-06-28 12:56:05', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(565, '2020-06-28 12:56:06', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(566, '2020-06-28 12:58:10', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(567, '2020-06-28 12:58:13', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(568, '2020-06-28 12:58:14', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(569, '2020-06-28 13:02:00', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(570, '2020-06-28 13:02:00', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(571, '2020-06-28 13:02:01', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(572, '2020-06-28 13:03:47', 'units', 1, 'http://eg.game/unit&id=2&tab=supply'),
(573, '2020-06-28 13:04:46', 'unit', 1, 'http://eg.game/units'),
(574, '2020-06-28 13:04:47', 'unit', 1, 'http://eg.game/unit&id=2'),
(576, '2020-06-28 13:07:08', 'unit', 1, 'http://eg.game/unit&id=2'),
(577, '2020-06-28 13:07:11', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(578, '2020-06-28 13:07:12', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(579, '2020-06-28 13:08:03', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(580, '2020-06-28 13:08:16', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(581, '2020-06-28 13:08:16', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(582, '2020-06-28 13:08:22', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(583, '2020-06-28 13:08:44', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(584, '2020-06-28 13:08:53', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(585, '2020-06-28 13:14:15', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(586, '2020-06-28 13:14:16', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(587, '2020-06-28 13:19:39', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(588, '2020-06-28 13:19:40', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(589, '2020-06-28 13:19:40', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(590, '2020-06-28 13:19:41', 'unit', 1, 'http://eg.game/unit&id=2&tab=info'),
(591, '2020-06-28 13:20:19', 'units', 1, 'http://eg.game/unit&id=2&tab=supply'),
(592, '2020-06-28 13:20:20', 'unit', 1, 'http://eg.game/units'),
(593, '2020-06-28 13:20:21', 'unit', 1, 'http://eg.game/unit&id=2'),
(594, '2020-06-28 13:20:22', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(595, '2020-06-28 13:20:23', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(596, '2020-06-28 13:20:24', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(597, '2020-06-28 13:20:30', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(598, '2020-06-28 13:21:15', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(599, '2020-06-28 13:21:15', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(600, '2020-06-28 13:21:22', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(601, '2020-06-28 13:21:22', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(602, '2020-06-28 13:21:23', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(603, '2020-06-28 13:22:55', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(604, '2020-06-28 13:24:19', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(605, '2020-06-28 13:24:23', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(606, '2020-06-28 13:24:23', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(607, '2020-06-28 13:24:24', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(608, '2020-06-28 13:24:25', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(609, '2020-06-28 13:24:32', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(610, '2020-06-28 13:24:34', 'units', 1, 'http://eg.game/unit&id=2&tab=sale'),
(611, '2020-06-28 13:24:40', 'unit', 1, 'http://eg.game/units'),
(612, '2020-06-28 13:24:42', 'unit', 1, 'http://eg.game/unit&id=2'),
(613, '2020-06-28 13:24:44', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(614, '2020-06-28 13:24:47', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(615, '2020-06-28 13:24:48', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(616, '2020-06-28 13:24:55', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(617, '2020-06-28 13:26:39', 'unit', 1, 'http://eg.game/unit&id=2'),
(618, '2020-06-28 13:26:40', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(619, '2020-06-28 13:26:48', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(620, '2020-06-28 13:26:56', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(621, '2020-06-28 13:26:56', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(622, '2020-06-28 13:27:11', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(623, '2020-06-28 13:27:16', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(624, '2020-06-28 13:28:59', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(625, '2020-06-28 13:29:06', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(626, '2020-06-28 13:29:06', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(627, '2020-06-28 13:31:12', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(628, '2020-06-28 13:31:19', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(629, '2020-06-28 13:31:49', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(630, '2020-06-28 13:32:01', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(633, '2020-06-28 13:41:09', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(634, '2020-06-28 13:41:56', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(635, '2020-06-28 13:42:21', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(636, '2020-06-28 13:45:54', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(637, '2020-06-28 13:45:58', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(638, '2020-06-28 13:45:59', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(639, '2020-06-28 13:46:00', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(640, '2020-06-28 13:46:34', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(641, '2020-06-28 13:46:36', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(642, '2020-06-28 13:48:04', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(643, '2020-06-28 13:48:05', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(644, '2020-06-28 14:47:58', 'login', NULL, 'http://eg.game/unit&id=2&tab=sale'),
(645, '2020-06-28 14:48:03', 'login', NULL, 'http://eg.game/unit&id=2&tab=supply'),
(646, '2020-06-28 14:48:04', 'units', 1, 'http://eg.game/login'),
(647, '2020-06-28 14:48:09', 'unit', 1, 'http://eg.game/units'),
(648, '2020-06-28 14:48:10', 'unit', 1, 'http://eg.game/unit&id=2'),
(649, '2020-06-28 14:48:19', 'unit', 1, 'http://eg.game/unit&id=2'),
(650, '2020-06-28 14:48:26', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(651, '2020-06-28 14:48:28', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(652, '2020-06-28 14:48:39', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(653, '2020-06-28 14:48:41', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(654, '2020-06-28 14:50:11', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(655, '2020-06-28 14:50:13', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(656, '2020-06-28 14:50:14', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(657, '2020-06-28 14:50:20', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(658, '2020-06-28 14:50:27', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(659, '2020-06-28 14:50:28', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(660, '2020-06-28 14:50:33', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(661, '2020-06-28 14:50:34', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(662, '2020-06-28 14:50:35', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(663, '2020-06-28 14:50:43', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(664, '2020-06-28 14:50:45', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(665, '2020-06-28 14:50:45', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(666, '2020-06-28 14:50:56', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(667, '2020-06-28 14:50:57', 'unit', 1, 'http://eg.game/unit&id=2&tab=info'),
(668, '2020-06-28 14:50:58', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(669, '2020-06-28 14:50:58', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(670, '2020-06-28 14:50:59', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(671, '2020-06-28 14:56:08', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(672, '2020-06-28 14:56:10', 'unit', 1, 'http://eg.game/unit&id=2&tab=info'),
(673, '2020-06-28 14:56:11', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(674, '2020-06-28 15:28:37', 'login', NULL, 'http://eg.game/unit&id=2&tab=info'),
(675, '2020-06-28 15:28:44', 'login', NULL, 'http://eg.game/unit&id=2&tab=shop'),
(676, '2020-06-28 15:28:45', 'units', 1, 'http://eg.game/login'),
(677, '2020-06-28 15:28:50', 'unit', 1, 'http://eg.game/units'),
(678, '2020-06-28 15:28:51', 'unit', 1, 'http://eg.game/unit&id=2'),
(679, '2020-06-28 15:28:51', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(680, '2020-06-28 15:28:52', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(681, '2020-06-28 15:28:53', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(682, '2020-06-28 15:28:54', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(683, '2020-06-28 15:29:04', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(684, '2020-06-28 15:29:04', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(685, '2020-06-28 15:29:29', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(686, '2020-06-28 15:29:31', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(687, '2020-06-28 15:29:32', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(688, '2020-06-28 15:29:33', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(689, '2020-06-28 15:29:35', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(690, '2020-06-28 15:29:40', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(691, '2020-06-28 15:29:43', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(692, '2020-06-28 15:29:45', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(693, '2020-06-28 15:31:27', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(694, '2020-06-28 15:31:34', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(695, '2020-06-28 15:31:37', 'unit', 1, 'http://eg.game/unit&id=2&tab=sale'),
(697, '2020-06-28 15:33:31', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(698, '2020-06-28 15:33:33', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(699, '2020-06-28 15:34:14', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(700, '2020-06-28 15:43:11', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(701, '2020-06-28 15:43:11', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(702, '2020-06-28 15:43:12', 'unit', 1, 'http://eg.game/unit&id=2&tab=storage'),
(703, '2020-06-28 15:43:12', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop');
INSERT INTO `visit` (`id`, `date`, `page`, `userId`, `refer`) VALUES
(704, '2020-06-28 16:36:21', 'login', NULL, 'http://eg.game/unit&id=2&tab=storage'),
(705, '2020-06-28 16:36:27', 'login', NULL, 'http://eg.game/unit&id=2&tab=supply'),
(706, '2020-06-28 16:36:28', 'units', 1, 'http://eg.game/login'),
(707, '2020-06-28 16:36:29', 'unit', 1, 'http://eg.game/units'),
(708, '2020-06-28 16:36:31', 'unit', 1, 'http://eg.game/unit&id=2'),
(709, '2020-06-28 16:36:32', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(710, '2020-06-28 16:36:34', 'unit', 1, 'http://eg.game/unit&id=2&tab=storage'),
(711, '2020-06-28 16:36:36', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(712, '2020-06-28 16:36:41', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(713, '2020-06-28 16:39:37', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(714, '2020-06-28 16:49:28', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(716, '2020-06-28 17:03:45', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(717, '2020-06-28 17:03:51', 'unit', 1, 'http://eg.game/unit&id=2&tab=info'),
(718, '2020-06-28 17:03:52', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(719, '2020-06-28 17:03:52', 'unit', 1, 'http://eg.game/unit&id=2&tab=storage'),
(720, '2020-06-28 17:03:53', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(721, '2020-06-28 17:04:21', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(722, '2020-06-28 17:04:22', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(723, '2020-06-28 17:05:45', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(724, '2020-06-28 17:05:51', 'unit', 1, 'http://eg.game/unit&id=2&tab=info'),
(725, '2020-06-28 17:05:52', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(726, '2020-06-28 17:05:53', 'unit', 1, 'http://eg.game/unit&id=2&tab=storage'),
(727, '2020-06-28 17:05:54', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(728, '2020-06-28 17:05:55', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(729, '2020-06-28 17:05:56', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(730, '2020-06-28 17:05:56', 'unit', 1, 'http://eg.game/unit&id=2&tab=storage'),
(731, '2020-06-28 17:05:57', 'unit', 1, 'http://eg.game/unit&id=2&tab=info'),
(732, '2020-06-28 17:05:58', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(733, '2020-06-28 17:08:02', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(734, '2020-06-28 17:08:04', 'unit', 1, 'http://eg.game/unit&id=2&tab=info'),
(735, '2020-06-28 17:12:09', 'unit', 1, 'http://eg.game/unit&id=2&tab=storage'),
(736, '2020-06-28 17:12:12', 'unit', 1, 'http://eg.game/unit&id=2&tab=storage'),
(737, '2020-06-28 17:12:13', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(738, '2020-06-28 17:12:14', 'unit', 1, 'http://eg.game/unit&id=2&tab=storage'),
(739, '2020-06-28 17:13:16', 'unit', 1, 'http://eg.game/unit&id=2&tab=storage'),
(740, '2020-06-28 17:13:17', 'unit', 1, 'http://eg.game/unit&id=2&tab=storage'),
(741, '2020-06-28 17:13:18', 'unit', 1, 'http://eg.game/unit&id=2&tab=storage'),
(742, '2020-06-28 17:13:49', 'unit', 1, 'http://eg.game/unit&id=2&tab=storage'),
(743, '2020-06-28 17:14:03', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(744, '2020-06-28 17:14:10', 'unit', 1, 'http://eg.game/unit&id=2&tab=storage'),
(745, '2020-06-28 17:14:11', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(746, '2020-06-28 17:14:13', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(747, '2020-06-28 17:14:37', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(748, '2020-06-28 17:27:33', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(749, '2020-06-28 17:27:34', 'unit', 1, 'http://eg.game/unit&id=2&tab=storage'),
(750, '2020-06-28 17:27:35', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(751, '2020-06-28 17:27:35', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(752, '2020-06-28 17:27:39', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(753, '2020-06-28 17:27:42', 'main', 1, 'http://eg.game/unit&id=2&tab=info'),
(754, '2020-06-28 17:27:42', 'units', 1, 'http://eg.game/main'),
(755, '2020-06-28 17:27:44', 'unit', 1, 'http://eg.game/units'),
(756, '2020-06-28 17:27:46', 'unit', 1, 'http://eg.game/unit&id=2'),
(757, '2020-06-28 17:27:47', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(758, '2020-06-28 17:34:33', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(759, '2020-06-28 17:35:01', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(760, '2020-06-28 17:35:47', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(761, '2020-06-28 17:36:07', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(765, '2020-06-28 18:15:11', 'login', NULL, 'http://eg.game/unit&id=2&tab=storage'),
(766, '2020-06-28 18:15:15', 'login', NULL, 'http://eg.game/unit&id=2&tab=shop'),
(767, '2020-06-28 18:15:16', 'units', 1, 'http://eg.game/login'),
(768, '2020-06-28 18:15:18', 'unit', 1, 'http://eg.game/units'),
(769, '2020-06-28 18:15:20', 'unit', 1, 'http://eg.game/unit&id=2'),
(770, '2020-06-28 18:15:25', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(771, '2020-06-28 18:15:27', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(772, '2020-06-28 18:15:33', 'unit', 1, 'http://eg.game/unit&id=2&tab=storage'),
(773, '2020-06-28 18:15:34', 'unit', 1, 'http://eg.game/unit&id=2&tab=shop'),
(776, '2020-06-28 18:16:26', 'storage_unload', 1, 'http://eg.game/unit&id=2&tab=storage'),
(777, '2020-06-28 19:50:37', 'login', NULL, 'http://eg.game/unit&id=2&tab=shop'),
(778, '2020-06-28 19:50:40', 'login', NULL, 'http://eg.game/unit&id=2&tab=storage'),
(779, '2020-06-28 19:50:42', 'units', 1, 'http://eg.game/login'),
(780, '2020-06-28 19:50:43', 'unit', 1, 'http://eg.game/units'),
(781, '2020-06-28 19:50:44', 'unit', 1, 'http://eg.game/unit&id=2'),
(782, '2020-06-28 19:50:46', 'unit', 1, 'http://eg.game/unit&id=2&tab=storage'),
(783, '2020-06-28 19:50:46', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(784, '2020-06-28 19:50:54', 'storage_unload', 1, 'http://eg.game/unit&id=2&tab=storage'),
(785, '2020-06-28 19:51:58', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(786, '2020-06-28 19:52:03', 'storage_unload', 1, 'http://eg.game/unit&id=2&tab=storage'),
(787, '2020-06-28 19:52:31', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(788, '2020-06-28 19:52:35', 'storage_unload', 1, 'http://eg.game/unit&id=2&tab=storage'),
(789, '2020-06-28 19:54:24', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(790, '2020-06-28 19:54:26', 'storage_unload', 1, 'http://eg.game/unit&id=2&tab=storage'),
(791, '2020-06-28 19:54:54', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(792, '2020-06-28 19:54:56', 'storage_unload', 1, 'http://eg.game/unit&id=2&tab=storage'),
(793, '2020-06-28 19:56:15', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(794, '2020-06-28 19:56:17', 'storage_unload', 1, 'http://eg.game/unit&id=2&tab=storage'),
(795, '2020-06-28 19:56:20', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(796, '2020-06-28 19:56:21', 'storage_unload', 1, 'http://eg.game/unit&id=2&tab=storage'),
(797, '2020-06-28 19:56:30', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(798, '2020-06-28 19:56:31', 'unit', 1, 'http://eg.game/unit&id=2&tab=storage'),
(799, '2020-06-28 19:56:32', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(800, '2020-06-28 19:57:11', 'unit', 1, 'http://eg.game/unit&id=2&tab=storage'),
(801, '2020-06-28 19:57:13', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(802, '2020-06-28 19:57:17', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(803, '2020-06-28 19:57:18', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(804, '2020-06-28 19:57:36', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(805, '2020-06-28 19:59:59', 'unit', 1, 'http://eg.game/unit&id=2&tab=storage'),
(806, '2020-06-28 20:00:00', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(807, '2020-06-28 20:00:02', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(808, '2020-06-28 20:00:04', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(809, '2020-06-28 20:00:05', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(810, '2020-06-28 20:00:07', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(811, '2020-06-28 20:00:08', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(812, '2020-06-28 20:00:20', 'unit', 1, 'http://eg.game/unit&id=2&tab=storage'),
(813, '2020-06-28 20:00:21', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(814, '2020-06-28 20:00:24', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(815, '2020-06-28 20:00:26', 'unit', 1, 'http://eg.game/unit&id=2&tab=storage'),
(816, '2020-06-28 20:00:27', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(817, '2020-06-28 20:00:28', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(818, '2020-06-28 20:00:48', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(819, '2020-06-28 20:00:50', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(820, '2020-06-28 20:01:13', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(821, '2020-06-28 20:01:59', 'unit', 1, 'http://eg.game/unit&id=2&tab=storage'),
(822, '2020-06-28 20:02:01', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(823, '2020-06-28 20:02:02', 'add_supply', 1, 'http://eg.game/unit&id=2&tab=supply'),
(824, '2020-06-28 20:02:07', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(825, '2020-06-28 20:02:10', 'storage_unload', 1, 'http://eg.game/unit&id=2&tab=storage'),
(826, '2020-06-28 20:02:13', 'storage_unload', 1, 'http://eg.game/unit&id=2&tab=storage'),
(827, '2020-06-28 20:12:37', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(828, '2020-06-28 20:12:40', 'storage_unload', 1, 'http://eg.game/unit&id=2&tab=storage'),
(829, '2020-06-28 20:12:44', 'storage_unload', 1, 'http://eg.game/unit&id=2&tab=storage'),
(830, '2020-06-28 20:13:00', 'storage_unload', 1, 'http://eg.game/unit&id=2&tab=storage'),
(831, '2020-06-28 20:13:06', 'storage_unload', 1, 'http://eg.game/unit&id=2&tab=storage'),
(832, '2020-06-28 20:13:47', 'storage_unload', 1, 'http://eg.game/unit&id=2&tab=storage'),
(833, '2020-06-28 20:13:52', 'storage_unload', 1, 'http://eg.game/unit&id=2&tab=storage'),
(834, '2020-06-28 20:13:53', 'storage_unload', 1, 'http://eg.game/unit&id=2&tab=storage'),
(835, '2020-06-28 20:13:58', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(836, '2020-06-28 20:14:02', 'storage_unload', 1, 'http://eg.game/unit&id=2&tab=storage'),
(837, '2020-06-28 20:14:03', 'storage_unload', 1, 'http://eg.game/unit&id=2&tab=storage'),
(838, '2020-06-28 20:22:13', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(839, '2020-06-28 20:22:17', 'storage_unload', 1, 'http://eg.game/unit&id=2&tab=storage'),
(840, '2020-06-28 20:22:19', 'storage_unload', 1, 'http://eg.game/unit&id=2&tab=storage'),
(841, '2020-06-28 20:23:13', 'unit', 1, 'http://eg.game/unit&id=2&tab=supply'),
(842, '2020-06-28 20:23:19', 'storage_unload', 1, 'http://eg.game/unit&id=2&tab=storage'),
(843, '2020-06-28 20:23:21', 'unit', 1, 'http://eg.game/unit&id=2&tab=storage'),
(844, '2020-06-28 20:23:24', 'units', 1, 'http://eg.game/unit&id=2&tab=storage'),
(845, '2020-06-28 20:23:25', 'unit', 1, 'http://eg.game/units'),
(846, '2020-06-28 20:23:27', 'unit', 1, 'http://eg.game/unit&id=4'),
(847, '2020-06-28 20:23:37', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply');

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
-- Ограничения внешнего ключа таблицы `product_sale`
--
ALTER TABLE `product_sale`
  ADD CONSTRAINT `product_sale_ibfk_1` FOREIGN KEY (`unitId`) REFERENCES `unit` (`id`),
  ADD CONSTRAINT `product_sale_ibfk_2` FOREIGN KEY (`currencyId`) REFERENCES `currency` (`id`),
  ADD CONSTRAINT `product_sale_ibfk_3` FOREIGN KEY (`typeId`) REFERENCES `product_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `product_shop`
--
ALTER TABLE `product_shop`
  ADD CONSTRAINT `product_shop_ibfk_1` FOREIGN KEY (`cityId`) REFERENCES `city` (`id`),
  ADD CONSTRAINT `product_shop_ibfk_3` FOREIGN KEY (`unitId`) REFERENCES `unit` (`id`);

--
-- Ограничения внешнего ключа таблицы `product_type`
--
ALTER TABLE `product_type`
  ADD CONSTRAINT `product_type_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `product_category` (`id`);

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
-- Ограничения внешнего ключа таблицы `unit_sale`
--
ALTER TABLE `unit_sale`
  ADD CONSTRAINT `unit_sale_ibfk_1` FOREIGN KEY (`productType`) REFERENCES `product_type` (`id`),
  ADD CONSTRAINT `unit_sale_ibfk_2` FOREIGN KEY (`unitFrom`) REFERENCES `unit` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `unit_sale_ibfk_3` FOREIGN KEY (`unitTo`) REFERENCES `unit` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Ограничения внешнего ключа таблицы `visit`
--
ALTER TABLE `visit`
  ADD CONSTRAINT `visit_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
