<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Economical game</title>
    <link href="/css/jquery-ui.min.css" rel="stylesheet" type="text/css" media="screen">
    <link href="/css/style.css" rel="stylesheet" type="text/css" media="screen">
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/js/script.js"></script>
</head>
<body>
    <div id="navbar">
        <?if (isset($data['companyList']) && count($data['companyList'])):?>
        <div id="header-select-company">
        <?if (count($data['companyList']) == 1):?>
        <div class="company-name">Компания "<?=$data['openedCompany']['title']?>"</div>
        <?endif;?>
        <div class="company-money">
            Ваш баланс <?=$data['openedCompany']['money']?> <?=$data['openedCompany']['currency']['name']?>
        </div>
        </div>
        <?endif;?>
        <ul>
            <li>
                <a href="/messages">Сообщения</a>
            </li>
            <li>
                <a href="/account">Личный кабинет</a>
            </li>
            <li>
                <a href="/map">Карта</a>
            </li>
            <li>
                <a href="/main">Компания</a>
            </li>
            <li>
                <a href="/units">Предприятия</a>
            </li>
            <li>
                <a href="/logout">Выход</a>
            </li>
        </ul>
    </div>
    <div id="content">
        <?php include("tpl/int/{$page}.php"); ?>
    </div>
</body>
</html>