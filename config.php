<?php
define('USER_MAX_LOGIN', 20);
define('USER_MIN_LOGIN', 4);

define('USER_START_MONEY', 100000);

define('COMPANY_MIN_START', 50000);
define('COMPANY_TITLE_MIN', 4);
define('COMPANY_TITLE_MAX', 30);

define('UNIT_TITLE_MIN', 4);
define('UNIT_TITLE_MAX', 30);
define('UNIT_SUPPLY_PAGE', 10);

/**
 * Размеры картинки пользователя
 */
define("USERPIC_W", 100);
define("USERPIC_H", 100);

define("PICTURE_MAX_W", 1024);
define("PICTURE_MAX_H", 768);
define("PICTURE_MAX_LOAD_PX", 10000000);

/**
 * Пути сохранения картинок
 */
define("PICTURES_SEVAPATH", $_SERVER['DOCUMENT_ROOT'].'/pictures/');

/**
 * В течении скольких секунд после последнего посещения считаем пользователя онлайн
 */
define('USER_ONLINE_TIME', 15*60);
//Через сколько секунд неактивности разлогиниваем пользователя
define('USER_LOGOUT', 30*60);


define('OUR_ADDRESS', [ 'eg.game']);