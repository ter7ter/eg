<?php
/**
 * Страница регистрации пользователя
 * @var string[] $errors
 */?>
<div class="data-form">
    <h2>Регистрация</h2>
    <?if (isset($errors) && count($errors) > 0):?>
        <div class="msg-error">
            <?foreach ($errors as $error):?>
                <?=$error?><br>
            <?endforeach;?>
        </div>
    <?endif;?>
    <form action="/register" method="post">
        <div class="data-line">
            <input type="text" name="login" value="<?=@$_POST['login']?>" placeholder="Логин" required minlength="<?=USER_MIN_LOGIN?>" maxlength="<?=USER_MAX_LOGIN?>" pattern="^[a-zA-Z0-9]+$">
        </div>
        <div class="data-line">
            <input type="password" name="password" placeholder="Пароль" required>
        </div>
        <div class="data-line">
            <input style="margin-top: 15px;" type="submit" value="Зарегистрироваться">
        </div>
    </form>
</div>