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
        <ul>
            <li>
                <a href="/main">Компания</a>
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