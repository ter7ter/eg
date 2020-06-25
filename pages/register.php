<?php
/**
 * Страница регистрации
 * Без параметров - показать форму регистрации
 * параметр login - пытаемся зарегистрировать пользователя
 */
if (isset($_POST['login'])) {
    $_POST['login'] = htmlspecialchars($_POST['login']);
    $errors = [];
    $newUser = new User();
    if (!check_captha(@$_POST['captcha'])) {
        $errors[] = 'Неверно введён код с картинки';
    }
    $newUser->login = $_POST['login'];
    $password = $_POST['password'];
    if (!User::check_password($password)) {
        $errors[] = 'Пароль должен быть от 6 до 30 символов и обязательно должен содержать буквы в разных регистрах и цифры';
    } else {
        $newUser->set_password($password);
    }
    if (!$newUser->check_free_login()) {
        $errors[] = 'Такой логин уже занят';
    }
    $newUser->validate($errors);
    if (!$errors) {
        //Ни одной ошибки не найдено - регистрируем
        $result = $newUser->register();
        if (!$result) {
            $errors[] = 'Регистрация временно невозможна по техническим причинам. Попробуйте позже';
        } else {
            //Успешно зарегистрировали
            $newUser->save();
            $_SESSION['uid'] = $newUser->id;
            $_SESSION['last_activ'] = time();
            $user = $newUser;
            $nextPage = 'main';
        }
    }
    unset($_SESSION['captha_text']);
    unset($_SESSION['captha_time']);
}