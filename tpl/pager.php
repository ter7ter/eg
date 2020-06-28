<?php
/**
 * @var array $data
 */
$pageCount = ceil($data['allCount'] / $data['perPage']);
if ($pageCount == 0) $pageCount = 1;
$pages = [];
for ($i=1;$i<4;$i++) {
    $pages[$i] = 1;
}
for ($i = $data['currentPage']-2;$i<$data['currentPage']+2;$i++) {
    $pages[$i] = 1;
}
for ($i = $pageCount-2;$i<=$pageCount;$i++) {
    $pages[$i] = 1;
}
$pages = array_keys($pages);
?>
<div class="pager">
    <?if ($data['currentPage'] > 1):?>
        <div class="page-link" data-page="<?=($data['currentPage']-1)?>">
            <a href="<?=$data['pagerLink']?>&page=<?=($data['currentPage']-1)?>">Назад</a>
        </div>
    <?endif;
    $prevPage = 0;
    foreach ($pages as $page):
        if ($page > $pageCount) break;
        if ($page < 1) continue;?>
        <?if ($prevPage<$page-1):?>
        <div class="page-link">
            ...
        </div>
    <?endif;?>
        <div class="page-link<?=($page == $data['currentPage']) ? ' active' : ''?>" data-page="<?=$page?>">
            <?if ($page == $data['currentPage']):?>
                <?=$page?>
            <?else:?>
                <a href="<?=$data['pagerLink']?>&page=<?=$page?>"><?=$page?></a>
            <?endif;?>
        </div>
        <?  $prevPage = $page;
    endforeach;
    if ($data['currentPage'] < $pageCount):?>
        <div class="page-link">
            <a href="<?=$data['pagerLink']?>&page=<?=($data['currentPage']+1)?>">Вперёд</a>
        </div>
    <?endif;?>
</div>