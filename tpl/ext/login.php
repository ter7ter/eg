<?php
/**
 * Страница регистрации пользователя
 * @var string[] $errors
 */?>
<div class="data-form">
    <h2 style="padding: 0">Вход</h2>
    <?if ($error):?>
        <div class="msg-error"><?=$error?></div>
    <?endif;?>
    <form action="/login" method="post" enctype="multipart/form-data">
        <input type="text" name="login" value="<?=@$_POST['login']?>" placeholder="Логин" required minlength="<?=USER_MIN_LOGIN?>" maxlength="<?=USER_MAX_LOGIN?>" pattern="^[a-zA-Z0-9]+$"><br>
        <input type="password" name="password" placeholder="Пароль" required><br>
        <input style="margin-top: 15px;" type="submit" value="Войти">
    </form>
</div>