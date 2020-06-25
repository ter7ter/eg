<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Economical game</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="/css/style.css" rel="stylesheet" type="text/css" media="screen">
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/script.js"></script>
    <?if (isset($meta_redirect)):?>
        <meta http-equiv="Refresh" content="0; URL=<?=$meta_redirect?>">
    <?endif;?>
</head>
<body>
    <div id="content">
        <?php include("tpl/ext/{$page}.php"); ?>
    </div>
</body>
</html>