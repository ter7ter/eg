-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 29 2020 г., 17:56
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

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
(59, 'user_login', 1, 'Залогинился', NULL, '2020-06-28 16:50:40'),
(60, 'user_login', 1, 'Залогинился', NULL, '2020-06-29 05:45:21'),
(61, 'user_login', 1, 'Залогинился', NULL, '2020-06-29 06:28:42'),
(62, 'user_login', 1, 'Залогинился', NULL, '2020-06-29 09:05:38'),
(63, 'user_login', 1, 'Залогинился', NULL, '2020-06-29 09:26:05'),
(64, 'user_login', 1, 'Залогинился', NULL, '2020-06-29 12:20:06'),
(65, 'user_login', 1, 'Залогинился', NULL, '2020-06-29 13:45:26'),
(66, 'user_login', 1, 'Залогинился', NULL, '2020-06-29 17:18:43');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `typeId`, `amount`, `quality`, `unitId`) VALUES
(1, 2, 79, 2.00663, 4),
(2, 2, 39, 3, 5),
(7, 2, 37, 2.28314, 2),
(13, 11, 40, 4, 2),
(15, 11, 5, 4, 5),
(16, 11, 5, 4, 4),
(17, 1, 42900, 1, 6),
(18, 1, 1000, 1, 4),
(19, 14, 36100, 1, 4),
(20, 14, 4700, 1, 7),
(22, 14, 4000, 1, 9);

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
(3, 2, 900),
(11, 14, 1000),
(12, 14, 10000);

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
(4, 2, 50, 1, 'private'),
(4, 11, 5000, 1, 'all'),
(4, 14, 5, 1, 'all'),
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

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
(13, 'Грузовой автомобиль', 'final', 3, 1, 1),
(14, 'Стройматериалы', 'material', 2, 1, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `unit`
--

DROP TABLE IF EXISTS `unit`;
CREATE TABLE IF NOT EXISTS `unit` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `status` enum('build','work','update','close') NOT NULL DEFAULT 'work',
  `companyId` int(10) UNSIGNED NOT NULL,
  `cityId` int(10) UNSIGNED NOT NULL,
  `typeId` int(10) UNSIGNED NOT NULL,
  `lastUpdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `companyId` (`companyId`),
  KEY `cityId` (`cityId`),
  KEY `typeId` (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `unit`
--

INSERT INTO `unit` (`id`, `title`, `status`, `companyId`, `cityId`, `typeId`, `lastUpdate`) VALUES
(2, 'Первый магазин', 'work', 1, 1, 5, '2020-06-29 17:50:35'),
(3, 'Ларёк', 'work', 1, 1, 4, '2020-06-26 17:19:27'),
(4, 'Средний склад', 'work', 1, 4, 7, '2020-06-26 17:33:12'),
(5, 'Маленький склад', 'work', 1, 3, 6, '2020-06-28 08:13:34'),
(6, 'Нефтяная вышка 1', 'work', 1, 5, 1, '2020-06-29 17:50:49'),
(7, 'Строительное предприятие 1', 'work', 1, 1, 12, '2020-06-29 17:53:47'),
(8, 'Стройка СПБ', 'work', 1, 3, 12, '2020-06-29 17:50:49'),
(9, 'Строительная бригада', 'work', 1, 1, 11, '2020-06-29 17:50:49'),
(11, 'Маленький склад', 'work', 1, 1, 6, '2020-06-29 17:53:47'),
(12, 'Нефтеперерабатывающий завод', 'build', 1, 1, 2, '2020-06-29 17:53:47');

-- --------------------------------------------------------

--
-- Структура таблицы `unit_construction`
--

DROP TABLE IF EXISTS `unit_construction`;
CREATE TABLE IF NOT EXISTS `unit_construction` (
  `unitId` int(10) UNSIGNED NOT NULL,
  `price` float UNSIGNED NOT NULL,
  `access` enum('all','private','list','close') NOT NULL,
  PRIMARY KEY (`unitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `unit_construction`
--

INSERT INTO `unit_construction` (`unitId`, `price`, `access`) VALUES
(7, 9, 'all'),
(8, 0, 'close'),
(9, 8, 'all');

-- --------------------------------------------------------

--
-- Структура таблицы `unit_making`
--

DROP TABLE IF EXISTS `unit_making`;
CREATE TABLE IF NOT EXISTS `unit_making` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `unitId` int(10) UNSIGNED NOT NULL,
  `makeId` int(10) UNSIGNED NOT NULL,
  `makingPrice` float UNSIGNED NOT NULL,
  `remaindCost` float NOT NULL,
  `quality` float UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `makeId` (`makeId`),
  KEY `unitId` (`unitId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `unit_making`
--

INSERT INTO `unit_making` (`id`, `unitId`, `makeId`, `makingPrice`, `remaindCost`, `quality`) VALUES
(3, 7, 12, 45000, 5000, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `unit_sale`
--

DROP TABLE IF EXISTS `unit_sale`;
CREATE TABLE IF NOT EXISTS `unit_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('sale','shop','build','') NOT NULL DEFAULT 'sale',
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `unit_sale`
--

INSERT INTO `unit_sale` (`id`, `type`, `unitFrom`, `unitTo`, `productType`, `valueFrom`, `valueTo`, `amount`, `quality`, `date`) VALUES
(6, 'sale', 4, 2, 2, 25, -25, 5, 2, '2020-06-28 10:01:54'),
(7, 'sale', 4, 2, 2, 50, -50, 10, 2, '2020-06-28 10:03:44'),
(8, 'sale', 4, 2, 2, 25, -25, 5, 2, '2020-06-28 10:20:30'),
(9, 'sale', 4, 2, 2, 50, -50, 10, 2, '2020-06-28 10:22:55'),
(10, 'sale', 5, 2, 2, 100, -100, 10, 3, '2020-06-28 10:26:48'),
(11, 'sale', 5, 2, 2, 10, -10, 1, 3, '2020-06-28 10:27:16'),
(12, 'sale', 4, 2, 2, 35, -35, 7, 2, '2020-06-28 11:50:20'),
(13, 'sale', 4, 2, 2, 50, -50, 10, 2, '2020-06-28 11:50:43'),
(14, 'sale', 2, NULL, 3, 10000, 0, 100, 3, '2020-06-28 13:49:24'),
(15, 'sale', 4, 7, 14, 50000, -50000, 10000, 1, '2020-06-29 06:46:26'),
(16, 'sale', 4, 9, 14, 20000, -20000, 4000, 1, '2020-06-29 13:46:47'),
(17, 'build', 7, 11, 14, 1800, -1800, 200, 1, '2020-06-29 17:47:49'),
(18, 'build', 7, 12, 14, 45000, -45000, 5000, 1, '2020-06-29 17:53:47');

-- --------------------------------------------------------

--
-- Структура таблицы `unit_type`
--

DROP TABLE IF EXISTS `unit_type`;
CREATE TABLE IF NOT EXISTS `unit_type` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `type` enum('shop','factory','farm','storage','mine','construction') NOT NULL,
  `cost` int(10) UNSIGNED NOT NULL DEFAULT '10000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `unit_type`
--

INSERT INTO `unit_type` (`id`, `title`, `type`, `cost`) VALUES
(1, 'Нефтяная вышка', 'mine', 5000),
(2, 'Нефтеперерабатывающий завод', 'factory', 5000),
(3, 'Завод автомобильных шин', 'factory', 5000),
(4, 'Ларёк', 'shop', 100),
(5, 'Магазин', 'shop', 400),
(6, 'Маленький склад', 'storage', 200),
(7, 'Средний склад', 'storage', 1000),
(8, 'Большой склад', 'storage', 10000),
(9, 'Железный рудник', 'mine', 5000),
(10, 'Угольный рудник', 'mine', 5000),
(11, 'Строительная бригада', 'construction', 500),
(12, 'Строительное предприятие', 'construction', 5000);

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
) ENGINE=InnoDB AUTO_INCREMENT=1337 DEFAULT CHARSET=utf8;

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
(847, '2020-06-28 20:23:37', 'add_supply', 1, 'http://eg.game/unit&id=4&tab=supply'),
(848, '2020-06-28 20:26:24', 'unit', 1, 'http://eg.game/unit&id=4'),
(849, '2020-06-28 20:26:25', 'unit', 1, 'http://eg.game/unit&id=4'),
(850, '2020-06-28 20:26:41', 'unit', 1, 'http://eg.game/unit&id=4'),
(851, '2020-06-28 20:26:43', 'unit', 1, 'http://eg.game/unit&id=4'),
(852, '2020-06-28 20:26:43', 'unit', 1, 'http://eg.game/unit&id=4'),
(853, '2020-06-28 20:26:44', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(854, '2020-06-28 20:26:47', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(855, '2020-06-28 20:26:56', 'main', 1, 'http://eg.game/unit&id=4&tab=supply'),
(856, '2020-06-28 20:26:56', 'units', 1, 'http://eg.game/main'),
(857, '2020-06-28 20:26:59', 'units', 1, 'http://eg.game/main'),
(858, '2020-06-28 20:27:09', 'create_unit', 1, 'http://eg.game/units'),
(859, '2020-06-28 20:27:29', 'create_unit', 1, 'http://eg.game/create_unit&type=mine'),
(860, '2020-06-28 20:27:29', 'units', 1, 'http://eg.game/create_unit&type=mine'),
(861, '2020-06-28 20:27:31', 'unit', 1, 'http://eg.game/units'),
(862, '2020-06-28 20:27:32', 'unit', 1, 'http://eg.game/unit&id=6'),
(863, '2020-06-28 20:27:33', 'add_supply', 1, 'http://eg.game/unit&id=6&tab=supply'),
(864, '2020-06-28 20:27:35', 'unit', 1, 'http://eg.game/unit&id=6&tab=supply'),
(865, '2020-06-28 20:27:35', 'unit', 1, 'http://eg.game/unit&id=6&tab=sale'),
(866, '2020-06-28 20:30:12', 'unit', 1, 'http://eg.game/unit&id=6&tab=sale'),
(867, '2020-06-28 20:30:14', 'unit', 1, 'http://eg.game/unit&id=6&tab=info'),
(868, '2020-06-28 20:30:14', 'unit', 1, 'http://eg.game/unit&id=6&tab=production'),
(869, '2020-06-28 20:30:16', 'unit', 1, 'http://eg.game/unit&id=6&tab=supply'),
(870, '2020-06-28 20:51:08', 'unit', 1, 'http://eg.game/unit&id=6&tab=supply'),
(871, '2020-06-28 20:51:09', 'unit', 1, 'http://eg.game/unit&id=6&tab=info'),
(872, '2020-06-28 20:51:40', 'unit', 1, 'http://eg.game/unit&id=6&tab=info'),
(873, '2020-06-28 20:51:41', 'unit', 1, 'http://eg.game/unit&id=6&tab=production'),
(874, '2020-06-28 20:51:42', 'unit', 1, 'http://eg.game/unit&id=6&tab=production'),
(875, '2020-06-28 20:51:54', 'unit', 1, 'http://eg.game/unit&id=6&tab=production'),
(876, '2020-06-28 20:52:06', 'unit', 1, 'http://eg.game/unit&id=6&tab=production'),
(877, '2020-06-28 20:52:21', 'storage_unload', 1, 'http://eg.game/unit&id=6&tab=production'),
(878, '2020-06-28 20:52:25', 'storage_unload', 1, 'http://eg.game/unit&id=6&tab=production'),
(879, '2020-06-28 20:52:29', 'storage_unload', 1, 'http://eg.game/unit&id=6&tab=production'),
(880, '2020-06-28 20:53:26', 'unit', 1, 'http://eg.game/unit&id=6&tab=production'),
(881, '2020-06-28 20:53:26', 'unit', 1, 'http://eg.game/unit&id=6&tab=production'),
(882, '2020-06-28 20:54:03', 'unit', 1, 'http://eg.game/unit&id=6&tab=production'),
(884, '2020-06-28 20:54:42', 'unit', 1, 'http://eg.game/unit&id=6&tab=production'),
(885, '2020-06-28 20:55:13', 'unit', 1, 'http://eg.game/unit&id=6&tab=production'),
(886, '2020-06-28 20:55:26', 'unit', 1, 'http://eg.game/unit&id=6&tab=production'),
(887, '2020-06-28 20:55:26', 'unit', 1, 'http://eg.game/unit&id=6&tab=production'),
(888, '2020-06-28 20:58:17', 'unit', 1, 'http://eg.game/unit&id=6&tab=production'),
(889, '2020-06-28 20:59:23', 'unit', 1, 'http://eg.game/unit&id=6&tab=production'),
(890, '2020-06-29 08:45:12', 'index', NULL, ''),
(891, '2020-06-29 08:45:16', 'login', NULL, 'http://eg.game/'),
(892, '2020-06-29 08:45:20', 'login', NULL, 'http://eg.game/login'),
(893, '2020-06-29 08:45:27', 'units', 1, 'http://eg.game/login'),
(894, '2020-06-29 08:45:31', 'unit', 1, 'http://eg.game/units'),
(895, '2020-06-29 08:45:33', 'unit', 1, 'http://eg.game/unit&id=6'),
(896, '2020-06-29 08:45:40', 'storage_unload', 1, 'http://eg.game/unit&id=6&tab=production'),
(897, '2020-06-29 08:47:20', 'unit', 1, 'http://eg.game/unit&id=6'),
(898, '2020-06-29 08:47:22', 'unit', 1, 'http://eg.game/unit&id=6'),
(899, '2020-06-29 08:47:22', 'unit', 1, 'http://eg.game/unit&id=6'),
(900, '2020-06-29 08:47:30', 'unit', 1, 'http://eg.game/unit&id=6'),
(901, '2020-06-29 08:47:31', 'unit', 1, 'http://eg.game/unit&id=6'),
(902, '2020-06-29 08:47:35', 'unit', 1, 'http://eg.game/unit&id=6'),
(903, '2020-06-29 08:47:37', 'unit', 1, 'http://eg.game/unit&id=6'),
(904, '2020-06-29 08:47:38', 'unit', 1, 'http://eg.game/unit&id=6'),
(905, '2020-06-29 08:47:38', 'unit', 1, 'http://eg.game/unit&id=6'),
(906, '2020-06-29 08:47:53', 'storage_unload', 1, 'http://eg.game/unit&id=6&tab=production'),
(907, '2020-06-29 08:47:59', 'storage_unload', 1, 'http://eg.game/unit&id=6&tab=production'),
(908, '2020-06-29 08:48:32', 'storage_unload', 1, 'http://eg.game/unit&id=6&tab=production'),
(909, '2020-06-29 08:48:36', 'unit', 1, 'http://eg.game/unit&id=6&tab=production'),
(910, '2020-06-29 08:48:42', 'storage_unload', 1, 'http://eg.game/unit&id=6&tab=production'),
(911, '2020-06-29 08:49:37', 'units', 1, 'http://eg.game/unit&id=6&tab=production'),
(912, '2020-06-29 08:49:38', 'unit', 1, 'http://eg.game/units'),
(913, '2020-06-29 08:49:39', 'unit', 1, 'http://eg.game/unit&id=5'),
(914, '2020-06-29 08:49:43', 'units', 1, 'http://eg.game/unit&id=5&tab=supply'),
(915, '2020-06-29 08:49:44', 'unit', 1, 'http://eg.game/units'),
(916, '2020-06-29 08:49:45', 'unit', 1, 'http://eg.game/unit&id=4'),
(917, '2020-06-29 08:49:56', 'unit', 1, 'http://eg.game/unit&id=4'),
(918, '2020-06-29 08:52:20', 'unit', 1, 'http://eg.game/unit&id=4'),
(919, '2020-06-29 09:28:37', 'login', NULL, 'http://eg.game/unit&id=4&tab=supply'),
(920, '2020-06-29 09:28:42', 'login', NULL, 'http://eg.game/units'),
(921, '2020-06-29 09:28:43', 'units', 1, 'http://eg.game/login'),
(922, '2020-06-29 09:28:48', 'create_unit', 1, 'http://eg.game/units'),
(923, '2020-06-29 09:28:56', 'create_unit', 1, 'http://eg.game/create_unit&type=construction'),
(924, '2020-06-29 09:28:56', 'units', 1, 'http://eg.game/create_unit&type=construction'),
(925, '2020-06-29 09:29:07', 'unit', 1, 'http://eg.game/units'),
(926, '2020-06-29 09:29:09', 'units', 1, 'http://eg.game/create_unit&type=construction'),
(927, '2020-06-29 09:29:11', 'create_unit', 1, 'http://eg.game/units'),
(928, '2020-06-29 09:29:25', 'create_unit', 1, 'http://eg.game/create_unit&type=construction'),
(929, '2020-06-29 09:29:25', 'units', 1, 'http://eg.game/create_unit&type=construction'),
(930, '2020-06-29 09:29:33', 'unit', 1, 'http://eg.game/units'),
(931, '2020-06-29 09:31:43', 'unit', 1, 'http://eg.game/units'),
(932, '2020-06-29 09:31:43', 'unit', 1, 'http://eg.game/unit&id=7'),
(933, '2020-06-29 09:31:44', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(934, '2020-06-29 09:31:45', 'unit', 1, 'http://eg.game/unit&id=7&tab=storage'),
(935, '2020-06-29 09:31:46', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(936, '2020-06-29 09:35:35', 'units', 1, 'http://eg.game/unit&id=7&tab=info'),
(937, '2020-06-29 09:35:37', 'unit', 1, 'http://eg.game/units'),
(938, '2020-06-29 09:35:38', 'unit', 1, 'http://eg.game/unit&id=6'),
(939, '2020-06-29 09:35:42', 'unit', 1, 'http://eg.game/unit&id=6&tab=production'),
(940, '2020-06-29 09:35:44', 'units', 1, 'http://eg.game/unit&id=6&tab=supply'),
(941, '2020-06-29 09:37:35', 'unit', 1, 'http://eg.game/units'),
(942, '2020-06-29 09:38:25', 'unit', 1, 'http://eg.game/units'),
(943, '2020-06-29 09:38:26', 'unit', 1, 'http://eg.game/unit&id=4'),
(944, '2020-06-29 09:38:26', 'unit', 1, 'http://eg.game/unit&id=4&tab=supply'),
(945, '2020-06-29 09:38:27', 'units', 1, 'http://eg.game/unit&id=4&tab=sale'),
(946, '2020-06-29 09:38:29', 'unit', 1, 'http://eg.game/units'),
(947, '2020-06-29 09:38:29', 'unit', 1, 'http://eg.game/unit&id=6'),
(948, '2020-06-29 09:38:30', 'unit', 1, 'http://eg.game/unit&id=6&tab=production'),
(949, '2020-06-29 09:38:31', 'unit', 1, 'http://eg.game/unit&id=6&tab=sale'),
(950, '2020-06-29 09:38:31', 'unit', 1, 'http://eg.game/unit&id=6&tab=supply'),
(951, '2020-06-29 09:38:32', 'units', 1, 'http://eg.game/unit&id=6&tab=info'),
(952, '2020-06-29 09:38:33', 'unit', 1, 'http://eg.game/units'),
(953, '2020-06-29 09:38:34', 'unit', 1, 'http://eg.game/unit&id=7'),
(954, '2020-06-29 09:38:35', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(955, '2020-06-29 09:38:36', 'unit', 1, 'http://eg.game/unit&id=7&tab=storage'),
(956, '2020-06-29 09:38:36', 'unit', 1, 'http://eg.game/unit&id=7&tab=info'),
(957, '2020-06-29 09:39:03', 'add_supply', 1, 'http://eg.game/unit&id=7&tab=supply'),
(958, '2020-06-29 09:39:46', 'unit', 1, 'http://eg.game/unit&id=7&tab=info'),
(959, '2020-06-29 09:45:10', 'add_supply', 1, 'http://eg.game/unit&id=7&tab=supply'),
(960, '2020-06-29 09:45:12', 'unit', 1, 'http://eg.game/unit&id=7&tab=info'),
(961, '2020-06-29 09:45:13', 'add_supply', 1, 'http://eg.game/unit&id=7&tab=supply'),
(962, '2020-06-29 09:45:18', 'add_supply', 1, 'http://eg.game/unit&id=7&tab=supply'),
(963, '2020-06-29 09:45:27', 'unit', 1, 'http://eg.game/unit&id=7&tab=info'),
(964, '2020-06-29 09:45:29', 'add_supply', 1, 'http://eg.game/unit&id=7&tab=supply'),
(965, '2020-06-29 09:45:43', 'units', 1, 'http://eg.game/unit&id=7&tab=supply'),
(966, '2020-06-29 09:45:46', 'unit', 1, 'http://eg.game/units'),
(967, '2020-06-29 09:45:47', 'unit', 1, 'http://eg.game/unit&id=4'),
(968, '2020-06-29 09:46:09', 'unit', 1, 'http://eg.game/unit&id=4&tab=sale'),
(969, '2020-06-29 09:46:12', 'units', 1, 'http://eg.game/unit&id=4&tab=sale'),
(970, '2020-06-29 09:46:14', 'unit', 1, 'http://eg.game/units'),
(971, '2020-06-29 09:46:16', 'unit', 1, 'http://eg.game/unit&id=7'),
(972, '2020-06-29 09:46:17', 'unit', 1, 'http://eg.game/unit&id=7&tab=storage'),
(973, '2020-06-29 09:46:18', 'add_supply', 1, 'http://eg.game/unit&id=7&tab=supply'),
(974, '2020-06-29 09:46:26', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(975, '2020-06-29 09:46:38', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(976, '2020-06-29 09:46:38', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(977, '2020-06-29 09:46:39', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(978, '2020-06-29 09:46:39', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(979, '2020-06-29 09:46:39', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(980, '2020-06-29 09:46:40', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(981, '2020-06-29 09:46:45', 'add_supply', 1, 'http://eg.game/unit&id=7&tab=supply'),
(982, '2020-06-29 09:46:46', 'add_supply', 1, 'http://eg.game/unit&id=7&tab=supply'),
(983, '2020-06-29 09:46:58', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(984, '2020-06-29 09:47:00', 'unit', 1, 'http://eg.game/unit&id=7&tab=storage'),
(985, '2020-06-29 09:47:01', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(987, '2020-06-29 09:48:03', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(988, '2020-06-29 09:48:33', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(989, '2020-06-29 09:49:08', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(990, '2020-06-29 09:49:10', 'unit', 1, 'http://eg.game/unit&id=7&tab=storage'),
(991, '2020-06-29 09:49:11', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(992, '2020-06-29 09:50:28', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(993, '2020-06-29 09:50:29', 'unit', 1, 'http://eg.game/unit&id=7&tab=storage'),
(994, '2020-06-29 09:50:30', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(995, '2020-06-29 09:52:38', 'unit', 1, 'http://eg.game/unit&id=7&tab=storage'),
(996, '2020-06-29 09:52:44', 'unit', 1, 'http://eg.game/unit&id=7&tab=info'),
(997, '2020-06-29 09:52:44', 'unit', 1, 'http://eg.game/unit&id=7&tab=storage'),
(998, '2020-06-29 10:11:30', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(999, '2020-06-29 10:11:30', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1000, '2020-06-29 10:11:31', 'unit', 1, 'http://eg.game/unit&id=7&tab=storage'),
(1001, '2020-06-29 10:27:38', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1002, '2020-06-29 10:27:39', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1005, '2020-06-29 10:29:52', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1006, '2020-06-29 10:30:54', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1007, '2020-06-29 10:31:05', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1008, '2020-06-29 10:31:26', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1009, '2020-06-29 10:33:07', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1010, '2020-06-29 10:33:19', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1011, '2020-06-29 10:33:21', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1012, '2020-06-29 10:33:22', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1013, '2020-06-29 10:37:09', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1014, '2020-06-29 10:37:12', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1015, '2020-06-29 10:37:14', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1016, '2020-06-29 10:37:14', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1017, '2020-06-29 10:41:50', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1018, '2020-06-29 10:43:49', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1019, '2020-06-29 10:55:56', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1020, '2020-06-29 10:57:16', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1021, '2020-06-29 10:58:23', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1022, '2020-06-29 10:58:56', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1023, '2020-06-29 10:59:18', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1024, '2020-06-29 10:59:51', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1025, '2020-06-29 10:59:52', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1026, '2020-06-29 10:59:58', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1027, '2020-06-29 11:00:06', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1028, '2020-06-29 11:00:08', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1029, '2020-06-29 11:00:10', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1030, '2020-06-29 11:00:12', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1031, '2020-06-29 11:00:32', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1032, '2020-06-29 11:00:33', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1033, '2020-06-29 11:01:43', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1034, '2020-06-29 11:01:55', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1035, '2020-06-29 11:02:38', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1036, '2020-06-29 11:02:53', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1037, '2020-06-29 11:04:31', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1038, '2020-06-29 11:05:06', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1039, '2020-06-29 11:05:08', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1040, '2020-06-29 11:05:10', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1041, '2020-06-29 11:05:11', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1042, '2020-06-29 11:05:27', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1043, '2020-06-29 11:07:04', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1044, '2020-06-29 11:07:06', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1045, '2020-06-29 11:07:17', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1046, '2020-06-29 11:07:42', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1047, '2020-06-29 11:08:05', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1048, '2020-06-29 11:08:22', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1049, '2020-06-29 11:08:32', 'storage_unload', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1050, '2020-06-29 11:08:40', 'storage_unload', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1051, '2020-06-29 11:08:42', 'storage_unload', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1052, '2020-06-29 11:10:21', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1053, '2020-06-29 11:10:25', 'storage_unload', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1054, '2020-06-29 11:10:28', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1055, '2020-06-29 11:10:32', 'storage_unload', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1056, '2020-06-29 11:17:45', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1057, '2020-06-29 11:17:50', 'storage_unload', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1058, '2020-06-29 11:17:52', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1059, '2020-06-29 11:17:55', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1060, '2020-06-29 11:17:56', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1061, '2020-06-29 11:17:58', 'units', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1062, '2020-06-29 11:17:59', 'unit', 1, 'http://eg.game/units'),
(1063, '2020-06-29 11:18:00', 'unit', 1, 'http://eg.game/unit&id=4'),
(1064, '2020-06-29 11:18:04', 'units', 1, 'http://eg.game/unit&id=4&tab=supply'),
(1065, '2020-06-29 11:18:06', 'unit', 1, 'http://eg.game/units'),
(1066, '2020-06-29 11:18:08', 'unit', 1, 'http://eg.game/unit&id=7'),
(1067, '2020-06-29 11:18:09', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1068, '2020-06-29 11:18:22', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1069, '2020-06-29 11:21:41', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction?action=update_construction&access=all'),
(1070, '2020-06-29 11:21:48', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction?action=update_construction&access=all'),
(1071, '2020-06-29 11:23:50', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction?action=update_construction&access=all'),
(1072, '2020-06-29 11:24:22', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction?action=update_construction&access=all'),
(1073, '2020-06-29 11:24:23', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction?action=update_construction&access=all'),
(1075, '2020-06-29 11:24:48', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction?action=update_construction&access=all'),
(1076, '2020-06-29 11:24:51', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1077, '2020-06-29 11:24:51', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1078, '2020-06-29 11:25:02', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1079, '2020-06-29 11:25:03', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1080, '2020-06-29 11:25:12', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1081, '2020-06-29 11:25:13', 'unit', 1, 'http://eg.game/unit&id=7&tab=info'),
(1082, '2020-06-29 11:25:13', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1083, '2020-06-29 11:25:50', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1084, '2020-06-29 11:25:52', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1085, '2020-06-29 11:25:52', 'unit', 1, 'http://eg.game/unit&id=7&tab=info'),
(1086, '2020-06-29 11:25:53', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1087, '2020-06-29 11:25:54', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1088, '2020-06-29 11:25:55', 'unit', 1, 'http://eg.game/unit&id=7&tab=info'),
(1089, '2020-06-29 11:25:55', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1090, '2020-06-29 11:26:04', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1091, '2020-06-29 11:26:11', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1092, '2020-06-29 11:27:00', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1093, '2020-06-29 12:05:34', 'login', NULL, 'http://eg.game/unit&id=7&tab=construction'),
(1094, '2020-06-29 12:05:38', 'login', NULL, 'http://eg.game/unit&id=7&tab=supply'),
(1095, '2020-06-29 12:05:40', 'units', 1, 'http://eg.game/login'),
(1096, '2020-06-29 12:05:42', 'unit', 1, 'http://eg.game/units'),
(1097, '2020-06-29 12:05:43', 'unit', 1, 'http://eg.game/unit&id=7'),
(1098, '2020-06-29 12:05:46', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1099, '2020-06-29 12:05:48', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1100, '2020-06-29 12:05:50', 'units', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1101, '2020-06-29 12:05:53', 'create_unit', 1, 'http://eg.game/units'),
(1102, '2020-06-29 12:24:40', 'index', NULL, ''),
(1103, '2020-06-29 12:24:45', 'login', NULL, 'http://eg.game/'),
(1104, '2020-06-29 12:26:04', 'login', NULL, 'http://eg.game/login'),
(1105, '2020-06-29 12:26:09', 'units', 1, 'http://eg.game/login'),
(1106, '2020-06-29 12:51:18', 'unit', 1, 'http://eg.game/units'),
(1107, '2020-06-29 12:51:19', 'unit', 1, 'http://eg.game/unit&id=7'),
(1108, '2020-06-29 12:52:17', 'unit', 1, 'http://eg.game/unit&id=7'),
(1109, '2020-06-29 12:52:26', 'unit', 1, 'http://eg.game/unit&id=7'),
(1110, '2020-06-29 12:54:07', 'unit', 1, 'http://eg.game/unit&id=7'),
(1111, '2020-06-29 12:54:33', 'unit', 1, 'http://eg.game/unit&id=7'),
(1112, '2020-06-29 12:54:38', 'unit', 1, 'http://eg.game/unit&id=7'),
(1113, '2020-06-29 12:56:57', 'unit', 1, 'http://eg.game/unit&id=7'),
(1114, '2020-06-29 12:58:25', 'unit', 1, 'http://eg.game/unit&id=7'),
(1115, '2020-06-29 12:59:00', 'unit', 1, 'http://eg.game/unit&id=7'),
(1116, '2020-06-29 12:59:15', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1117, '2020-06-29 12:59:16', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1118, '2020-06-29 12:59:17', 'unit', 1, 'http://eg.game/unit&id=7&tab=info'),
(1119, '2020-06-29 12:59:21', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1120, '2020-06-29 13:06:35', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1121, '2020-06-29 13:27:38', 'units', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1122, '2020-06-29 13:27:44', 'create_unit', 1, 'http://eg.game/units'),
(1124, '2020-06-29 13:30:09', 'select_builder', 1, ''),
(1125, '2020-06-29 13:30:36', 'select_builder', 1, ''),
(1126, '2020-06-29 13:30:53', 'select_builder', 1, ''),
(1130, '2020-06-29 13:34:45', 'select_builder', 1, ''),
(1131, '2020-06-29 13:35:28', 'select_builder', 1, ''),
(1132, '2020-06-29 13:35:45', 'select_builder', 1, ''),
(1133, '2020-06-29 13:36:09', 'select_builder', 1, ''),
(1134, '2020-06-29 13:36:27', 'select_builder', 1, ''),
(1135, '2020-06-29 15:20:01', 'login', NULL, ''),
(1136, '2020-06-29 15:20:06', 'login', NULL, 'http://eg.game/select_builder&city_id=1&unit_type=5'),
(1137, '2020-06-29 15:21:02', 'units', 1, 'http://eg.game/login'),
(1138, '2020-06-29 15:21:06', 'create_unit', 1, 'http://eg.game/units'),
(1139, '2020-06-29 15:22:39', 'create_unit', 1, 'http://eg.game/units'),
(1140, '2020-06-29 15:22:41', 'create_unit', 1, 'http://eg.game/units'),
(1141, '2020-06-29 15:23:55', 'create_unit', 1, 'http://eg.game/units'),
(1142, '2020-06-29 15:23:57', 'create_unit', 1, 'http://eg.game/units'),
(1143, '2020-06-29 15:24:12', 'create_unit', 1, 'http://eg.game/units'),
(1144, '2020-06-29 15:25:20', 'create_unit', 1, 'http://eg.game/units'),
(1145, '2020-06-29 15:25:43', 'create_unit', 1, 'http://eg.game/units'),
(1146, '2020-06-29 15:25:59', 'create_unit', 1, 'http://eg.game/units'),
(1147, '2020-06-29 15:26:15', 'create_unit', 1, 'http://eg.game/units'),
(1148, '2020-06-29 15:26:29', 'create_unit', 1, 'http://eg.game/units'),
(1149, '2020-06-29 15:31:45', 'create_unit', 1, 'http://eg.game/units'),
(1150, '2020-06-29 15:31:47', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1151, '2020-06-29 15:32:28', 'create_unit', 1, 'http://eg.game/units'),
(1152, '2020-06-29 15:32:40', 'create_unit', 1, 'http://eg.game/units'),
(1153, '2020-06-29 15:32:40', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1154, '2020-06-29 15:32:54', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1155, '2020-06-29 15:32:57', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1156, '2020-06-29 15:33:45', 'create_unit', 1, 'http://eg.game/units'),
(1157, '2020-06-29 15:33:46', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1158, '2020-06-29 15:36:55', 'units', 1, 'http://eg.game/create_unit&type=factory'),
(1159, '2020-06-29 15:36:58', 'unit', 1, 'http://eg.game/units'),
(1160, '2020-06-29 15:38:00', 'units', 1, 'http://eg.game/create_unit&type=factory'),
(1161, '2020-06-29 15:38:03', 'unit', 1, 'http://eg.game/units'),
(1162, '2020-06-29 15:38:14', 'create_unit', 1, 'http://eg.game/units'),
(1163, '2020-06-29 15:38:14', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1164, '2020-06-29 15:38:50', 'create_unit', 1, 'http://eg.game/units'),
(1165, '2020-06-29 15:38:50', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1166, '2020-06-29 15:38:58', 'create_unit', 1, 'http://eg.game/units'),
(1167, '2020-06-29 15:38:58', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1168, '2020-06-29 15:38:58', 'create_unit', 1, 'http://eg.game/units'),
(1169, '2020-06-29 15:38:59', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1170, '2020-06-29 15:40:06', 'create_unit', 1, 'http://eg.game/units'),
(1171, '2020-06-29 15:40:06', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1172, '2020-06-29 15:40:17', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1173, '2020-06-29 15:40:18', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1174, '2020-06-29 15:41:21', 'create_unit', 1, 'http://eg.game/units'),
(1175, '2020-06-29 15:41:21', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1176, '2020-06-29 15:41:23', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1177, '2020-06-29 15:41:25', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1178, '2020-06-29 15:42:11', 'create_unit', 1, 'http://eg.game/units'),
(1179, '2020-06-29 15:42:11', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1180, '2020-06-29 15:42:50', 'create_unit', 1, 'http://eg.game/units'),
(1181, '2020-06-29 15:42:50', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1182, '2020-06-29 15:42:52', 'create_unit', 1, 'http://eg.game/units'),
(1183, '2020-06-29 15:42:52', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1184, '2020-06-29 15:43:25', 'create_unit', 1, 'http://eg.game/units'),
(1185, '2020-06-29 15:43:25', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1186, '2020-06-29 15:43:54', 'create_unit', 1, 'http://eg.game/units'),
(1187, '2020-06-29 15:43:55', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1188, '2020-06-29 15:44:04', 'create_unit', 1, 'http://eg.game/units'),
(1189, '2020-06-29 15:44:04', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1190, '2020-06-29 15:45:13', 'create_unit', 1, 'http://eg.game/units'),
(1191, '2020-06-29 15:45:13', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1192, '2020-06-29 15:46:19', 'create_unit', 1, 'http://eg.game/units'),
(1193, '2020-06-29 15:46:19', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1194, '2020-06-29 15:46:22', 'create_unit', 1, 'http://eg.game/units'),
(1195, '2020-06-29 15:46:23', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1196, '2020-06-29 15:46:29', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1197, '2020-06-29 15:46:37', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1198, '2020-06-29 15:46:38', 'units', 1, 'http://eg.game/create_unit&type=factory'),
(1199, '2020-06-29 15:46:39', 'create_unit', 1, 'http://eg.game/units'),
(1200, '2020-06-29 15:46:40', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1201, '2020-06-29 15:46:41', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1202, '2020-06-29 15:46:43', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1203, '2020-06-29 15:46:46', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1204, '2020-06-29 15:47:17', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1205, '2020-06-29 15:47:24', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1206, '2020-06-29 16:45:17', 'login', NULL, 'http://eg.game/units'),
(1207, '2020-06-29 16:45:23', 'login', NULL, 'http://eg.game/create_unit&type=storage'),
(1208, '2020-06-29 16:45:26', 'login', NULL, 'http://eg.game/login'),
(1209, '2020-06-29 16:45:27', 'units', 1, 'http://eg.game/login'),
(1210, '2020-06-29 16:45:28', 'unit', 1, 'http://eg.game/units'),
(1211, '2020-06-29 16:45:31', 'units', 1, 'http://eg.game/unit&id=4'),
(1212, '2020-06-29 16:45:32', 'create_unit', 1, 'http://eg.game/units'),
(1213, '2020-06-29 16:45:32', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1214, '2020-06-29 16:45:35', 'units', 1, 'http://eg.game/unit&id=4'),
(1215, '2020-06-29 16:45:37', 'create_unit', 1, 'http://eg.game/units'),
(1216, '2020-06-29 16:45:37', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1217, '2020-06-29 16:45:55', 'create_unit', 1, 'http://eg.game/units'),
(1218, '2020-06-29 16:45:55', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1219, '2020-06-29 16:45:59', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1220, '2020-06-29 16:46:01', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1221, '2020-06-29 16:46:10', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1222, '2020-06-29 16:46:15', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1223, '2020-06-29 16:46:16', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1224, '2020-06-29 16:46:23', 'units', 1, 'http://eg.game/create_unit&type=storage'),
(1225, '2020-06-29 16:46:27', 'create_unit', 1, 'http://eg.game/units'),
(1226, '2020-06-29 16:46:27', 'select_builder', 1, 'http://eg.game/create_unit&type=construction'),
(1227, '2020-06-29 16:46:34', 'create_unit', 1, 'http://eg.game/create_unit&type=construction'),
(1228, '2020-06-29 16:46:34', 'units', 1, 'http://eg.game/create_unit&type=construction'),
(1229, '2020-06-29 16:46:37', 'unit', 1, 'http://eg.game/units'),
(1230, '2020-06-29 16:46:37', 'unit', 1, 'http://eg.game/unit&id=9'),
(1231, '2020-06-29 16:46:39', 'add_supply', 1, 'http://eg.game/unit&id=9&tab=supply'),
(1232, '2020-06-29 16:46:47', 'unit', 1, 'http://eg.game/unit&id=9&tab=supply'),
(1233, '2020-06-29 16:51:23', 'unit', 1, 'http://eg.game/unit&id=9&tab=supply'),
(1234, '2020-06-29 16:51:24', 'unit', 1, 'http://eg.game/unit&id=9&tab=supply'),
(1235, '2020-06-29 16:54:25', 'unit', 1, 'http://eg.game/unit&id=9&tab=supply'),
(1236, '2020-06-29 17:00:56', 'units', 1, 'http://eg.game/unit&id=2'),
(1237, '2020-06-29 17:00:59', 'create_unit', 1, 'http://eg.game/units'),
(1238, '2020-06-29 17:00:59', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1239, '2020-06-29 17:01:01', 'units', 1, 'http://eg.game/create_unit&type=storage'),
(1240, '2020-06-29 17:01:07', 'unit', 1, 'http://eg.game/units'),
(1241, '2020-06-29 17:01:09', 'unit', 1, 'http://eg.game/unit&id=9'),
(1242, '2020-06-29 17:01:11', 'unit', 1, 'http://eg.game/unit&id=9&tab=supply'),
(1243, '2020-06-29 17:01:24', 'unit', 1, 'http://eg.game/unit&id=9&tab=construction'),
(1244, '2020-06-29 17:01:26', 'units', 1, 'http://eg.game/unit&id=9&tab=construction'),
(1245, '2020-06-29 17:01:27', 'unit', 1, 'http://eg.game/units'),
(1246, '2020-06-29 17:01:28', 'unit', 1, 'http://eg.game/unit&id=7'),
(1247, '2020-06-29 17:01:32', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1248, '2020-06-29 17:01:33', 'units', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1249, '2020-06-29 17:01:38', 'create_unit', 1, 'http://eg.game/units'),
(1250, '2020-06-29 17:01:38', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1251, '2020-06-29 17:01:40', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1252, '2020-06-29 17:01:42', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1253, '2020-06-29 17:01:49', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1254, '2020-06-29 17:01:50', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1255, '2020-06-29 17:01:52', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1258, '2020-06-29 17:02:57', 'create_unit', 1, 'http://eg.game/units'),
(1259, '2020-06-29 17:02:57', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1260, '2020-06-29 17:02:58', 'create_unit', 1, 'http://eg.game/units'),
(1261, '2020-06-29 17:02:58', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1263, '2020-06-29 17:03:06', 'create_unit', 1, 'http://eg.game/units'),
(1264, '2020-06-29 17:03:06', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1266, '2020-06-29 17:03:17', 'create_unit', 1, 'http://eg.game/units'),
(1267, '2020-06-29 17:03:17', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1268, '2020-06-29 17:03:51', 'create_unit', 1, 'http://eg.game/units'),
(1269, '2020-06-29 17:03:51', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1270, '2020-06-29 17:03:59', 'create_unit', 1, 'http://eg.game/units'),
(1271, '2020-06-29 17:04:00', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1272, '2020-06-29 17:04:12', 'create_unit', 1, 'http://eg.game/units'),
(1273, '2020-06-29 17:04:12', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1274, '2020-06-29 17:04:26', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1275, '2020-06-29 17:04:27', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1276, '2020-06-29 17:04:28', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1277, '2020-06-29 17:12:35', 'unit', 1, 'http://eg.game/unit&id=9&tab=supply'),
(1278, '2020-06-29 17:16:26', 'unit', 1, 'http://eg.game/unit&id=9&tab=supply'),
(1279, '2020-06-29 17:16:27', 'unit', 1, 'http://eg.game/unit&id=9&tab=supply'),
(1280, '2020-06-29 17:16:27', 'unit', 1, 'http://eg.game/unit&id=9&tab=supply'),
(1281, '2020-06-29 17:16:27', 'unit', 1, 'http://eg.game/unit&id=9&tab=supply'),
(1282, '2020-06-29 17:16:50', 'unit', 1, 'http://eg.game/unit&id=9&tab=supply'),
(1283, '2020-06-29 17:18:29', 'create_unit', 1, 'http://eg.game/units'),
(1285, '2020-06-29 17:19:22', 'create_unit', 1, 'http://eg.game/units'),
(1287, '2020-06-29 17:20:44', 'create_unit', 1, 'http://eg.game/units'),
(1289, '2020-06-29 17:22:04', 'create_unit', 1, 'http://eg.game/units'),
(1290, '2020-06-29 17:22:05', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1291, '2020-06-29 17:22:32', 'create_unit', 1, 'http://eg.game/units'),
(1292, '2020-06-29 17:22:32', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1293, '2020-06-29 17:23:19', 'create_unit', 1, 'http://eg.game/units'),
(1294, '2020-06-29 17:23:19', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1295, '2020-06-29 17:23:27', 'create_unit', 1, 'http://eg.game/create_unit&type=storage'),
(1296, '2020-06-29 17:23:27', 'select_builder', 1, 'http://eg.game/create_unit'),
(1297, '2020-06-29 20:18:37', 'login', NULL, 'http://eg.game/create_unit&type=storage'),
(1298, '2020-06-29 20:18:43', 'login', NULL, 'http://eg.game/create_unit'),
(1299, '2020-06-29 20:18:47', 'units', 1, 'http://eg.game/login'),
(1300, '2020-06-29 20:18:49', 'unit', 1, 'http://eg.game/units'),
(1301, '2020-06-29 20:18:51', 'unit', 1, 'http://eg.game/unit&id=7'),
(1302, '2020-06-29 20:18:52', 'unit', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1303, '2020-06-29 20:18:52', 'unit', 1, 'http://eg.game/unit&id=7&tab=supply'),
(1304, '2020-06-29 20:18:54', 'unit', 1, 'http://eg.game/unit&id=7&tab=info'),
(1305, '2020-06-29 20:18:57', 'units', 1, 'http://eg.game/unit&id=7&tab=construction'),
(1306, '2020-06-29 20:44:18', 'create_unit', 1, 'http://eg.game/units'),
(1307, '2020-06-29 20:44:18', 'select_builder', 1, 'http://eg.game/create_unit&type=storage'),
(1308, '2020-06-29 20:44:33', 'create_unit', 1, 'http://eg.game/create_unit&type=storage'),
(1309, '2020-06-29 20:44:33', 'select_builder', 1, 'http://eg.game/create_unit'),
(1310, '2020-06-29 20:44:39', 'create_unit', 1, 'http://eg.game/create_unit'),
(1311, '2020-06-29 20:44:39', 'select_builder', 1, 'http://eg.game/create_unit'),
(1312, '2020-06-29 20:45:47', 'create_unit', 1, 'http://eg.game/create_unit'),
(1313, '2020-06-29 20:45:48', 'select_builder', 1, 'http://eg.game/create_unit'),
(1314, '2020-06-29 20:46:00', 'create_unit', 1, 'http://eg.game/create_unit'),
(1315, '2020-06-29 20:46:01', 'select_builder', 1, 'http://eg.game/create_unit'),
(1316, '2020-06-29 20:46:17', 'create_unit', 1, 'http://eg.game/create_unit'),
(1317, '2020-06-29 20:46:17', 'select_builder', 1, 'http://eg.game/create_unit'),
(1318, '2020-06-29 20:46:43', 'create_unit', 1, 'http://eg.game/create_unit'),
(1319, '2020-06-29 20:46:44', 'select_builder', 1, 'http://eg.game/create_unit'),
(1320, '2020-06-29 20:46:48', 'create_unit', 1, 'http://eg.game/create_unit'),
(1321, '2020-06-29 20:46:49', 'select_builder', 1, 'http://eg.game/create_unit'),
(1322, '2020-06-29 20:46:57', 'create_unit', 1, 'http://eg.game/create_unit'),
(1323, '2020-06-29 20:46:57', 'select_builder', 1, 'http://eg.game/create_unit'),
(1325, '2020-06-29 20:47:49', 'create_unit', 1, 'http://eg.game/create_unit'),
(1326, '2020-06-29 20:47:49', 'units', 1, 'http://eg.game/create_unit'),
(1327, '2020-06-29 20:51:06', 'unit', 1, 'http://eg.game/units'),
(1328, '2020-06-29 20:51:08', 'unit', 1, 'http://eg.game/unit&id=11'),
(1329, '2020-06-29 20:51:09', 'unit', 1, 'http://eg.game/unit&id=11&tab=supply'),
(1330, '2020-06-29 20:51:14', 'units', 1, 'http://eg.game/unit&id=11&tab=info'),
(1331, '2020-06-29 20:53:25', 'create_unit', 1, 'http://eg.game/units'),
(1332, '2020-06-29 20:53:26', 'select_builder', 1, 'http://eg.game/create_unit&type=factory'),
(1333, '2020-06-29 20:53:47', 'create_unit', 1, 'http://eg.game/create_unit&type=factory'),
(1334, '2020-06-29 20:53:47', 'units', 1, 'http://eg.game/create_unit&type=factory'),
(1335, '2020-06-29 20:53:52', 'unit', 1, 'http://eg.game/units'),
(1336, '2020-06-29 20:54:40', 'unit', 1, 'http://eg.game/units');

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
-- Ограничения внешнего ключа таблицы `unit_making`
--
ALTER TABLE `unit_making`
  ADD CONSTRAINT `unit_making_ibfk_1` FOREIGN KEY (`makeId`) REFERENCES `unit` (`id`),
  ADD CONSTRAINT `unit_making_ibfk_2` FOREIGN KEY (`unitId`) REFERENCES `unit` (`id`);

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
