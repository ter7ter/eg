<div class="data-line">Производительность в час <?=$data['construction']['make']?></div>
<div class="data-line">В наличии стройматериалов <?=$data['construction']['amount']?></div>
<div class="data-line">Свободно стройматериалов <?=$data['construction']['freeAmount']?>
<?if ($data['construction']['freeAmount'] >=1):?>
    <input style="margin-left: 10px;" class="select-supply-count" type="number" value="0" min="0" max="<?=$data['construction']['freeAmount']?>">
    <a class="do-unload" data-type-id="<?=CONSTRUCTION_MATERIAL?>" href="#this">Выгрузить</a>
<?endif;?>
</div>
<div class="data-line">
<form action="/unit&id=<?=$data['unit']['id']?>&tab=construction" method="post">
    <input type="hidden" name="action" value="update_construction">
    Цена одной единицы работ <input type="text" value="<?=$data['unit']['makePrice']?>" name="price" style="width: 10em">
    Строить <select name="access" style="width: 10em;">
        <option value="all" <?=($data['unit']['makeAccess']=='all')?'selected':''?>>всем</option>
        <option value="private" <?=($data['unit']['makeAccess']=='private')?'selected':''?>>своей компании</option>
        <option value="close" <?=($data['unit']['makeAccess']=='close')?'selected':''?>>никому</option>
    </select>
    <input type="submit" value="Изменить">
</form>
</div>
<hr>
Очередь строительства
<table class="products-table">
    <tr>
        <th style="width: 19%">Компания</th>
        <th style="width: 31%">Предприятие</th>
        <th style="width: 8%">Стройматериал</th>
        <th style="width: 8%">Качество</th>
        <th style="width: 10%">Цена заказа</th>
        <th style="width: 8%">Завершённость</th>
        <th style="width: 15%">Время до завершения</th>
    </tr>
    <?$time = 0;
    foreach ($data['construction']['queue'] as $make):
        $time += $make['time']?>
        <tr>
            <td><?=$make['company']['title']?></td>
            <td><?=$make['unit']['title']?>(<?=$make['unit']['type']['title']?>)</td>
            <td><?=$make['unit']['type']['cost']?></td>
            <td><?=$make['quality']?></td>
            <td><?=$make['makingPrice']?></td>
            <td><?=round($make['complete']*100)?>%</td>
            <td><?=format_time(round($time))?></td>
        </tr>
    <?endforeach;?>
</table>
<div id="dialog-window"></div>