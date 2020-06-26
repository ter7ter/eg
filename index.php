<?php
require_once("includes.php");
$user = false;
session_start();
if (isset($_REQUEST['omethod'])) {
    $page = $_REQUEST['omethod'];
} else {
    $page = 'index';
}
$page = preg_replace('/[^a-z0-9_]+/', '', $page);

MyDB::start_transaction();
if (isset($_SESSION['uid'])) {
    if ($_SESSION['last_activ'] > time() - USER_LOGOUT) {
        $user = User::get((int)$_SESSION['uid']);
        $_SESSION['last_activ'] = time();
    } else {
        unset($_SESSION['uid']);
    }
}
if (!file_exists("pages/{$page}.php")) {
    header("HTTP/1.1 404 Forbidden");
    die();
}
$pageNoLogin = ['index', 'login', 'register', 'captcha', 'help', 'feedback', 'rules'];
$pageExternal = ['index', 'login', 'register', 'help', 'feedback', 'rules'];
$data = [];

if (!in_array($page, $pageNoLogin) && !$user) {
    //Нужно залогиниться
    $page = 'login';
}
if ($user && !is_null($user->block) && !in_array($page, ['logout', 'feedback', 'help', 'rules', 'blocked'])) {
    $page = 'blocked';
}
$error = false;
$errors = [];
$endPage = false;
$data = [];
if (!isset($_REQUEST['json'])) {
    MyDB::insert("visit",
        ['page' => $page,
        'userId' => ($user) ? $user->id : null,
        'refer' => (isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '')]);
}
$nextPage = false;
do {
    if ($nextPage) {
        $page = $nextPage;
        $nextPage = false;
    }
    include "pages/{$page}.php";
} while ($endPage == false && $nextPage !== false);
MyDB::end_transaction();

if (!$endPage) {
    if (isset($_REQUEST['json'])) {
        if ($error) {
            $response = ['status' => 'error',
                'error' => $error];
        } elseif (count($errors)) {
            $response = ['status' => 'error',
                'errors' => $errors];
        } else {
            $response = ['status' => 'ok',
                'data' => $data];
        }
        print json_encode($response);
    } elseif (in_array($page, $pageExternal)) {
        include "tpl/ext.php";
    } else {
        include "tpl/int.php";
    }
}
