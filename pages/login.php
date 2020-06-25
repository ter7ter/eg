<?php
/**
 * Страница логина
 * параметры login и password - пытаемся залогинится
 */
$error = false;
if (isset($_POST['login']) && isset($_POST['password'])) {
    $login = htmlspecialchars(mb_substr($_POST['login'], 0, USER_MAX_LOGIN));
    $user = User::login($login, $_POST['password']);
    if ($user) {
        $_SESSION['uid'] = $user->id;
        $_SESSION['last_activ'] = time();
        $nextPage = 'main';
    } else {
        $error = 'Неверный логин или пароль';
    }
}