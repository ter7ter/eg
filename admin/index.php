<?php
require_once("../includes.php");
session_start();
if (isset($_REQUEST['method'])) {
    $page = $_REQUEST['method'];
} else {
    $page = 'login';
}
$page = preg_replace('/[^a-z0-9_]+/', '', $page);

if (!isset($_SESSION['auth']) || $_SESSION['auth'] !== 'admin') {
    $page = 'login';
}

if (!file_exists("../pages/admin/{$page}.php")) {
    die('404 Not found');
}

MyDB::start_transaction();

$error = false;
$endPage = false;
include "../pages/admin/{$page}.php";
MyDB::end_transaction();
if (!$endPage) {
    include "../tpl/admin/main.php";
}