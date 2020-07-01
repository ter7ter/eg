<table class="products-table">
    <tr>
        <th style="width: 39%">Производится</th>
        <th style="width: 10%">Единиц в час</th>
        <th style="width: 10%">В наличии</th>
        <th style="width: 10%">Качество</th>
        <th style="width: 10%">Эффективность производства</th>
        <th style="width: 20%">Выгрузить</th>
    </tr>
    <?foreach ($data['makes'] as $make):?>
        <tr>
            <td><?=$make['product']['type']['title']?></td>
            <td><?=$make['amount']?></td>
            <td><?=$make['product']['amount']?></td>
            <td><?=$make['product']['quality']?></td>
            <td><?=$make['eff']?></td>
            <td>
                <?if ($make['amount'] >= 1):?>
                <input class="select-supply-count" type="number" value="0" min="0" max="<?=$make['product']['amount']?>">
                <a class="do-unload" data-type-id="<?=$make['product']['type']['id']?>" href="#this">Выгрузить</a>
                <?endif;?>
            </td>
        </tr>
    <?endforeach;?>
</table>
<hr>
<?if (count($data['costs']) > 0):?>
<table class="products-table">
    <tr>
        <th style="width: 39%">Требуется</th>
        <th style="width: 10%">Единиц в час</th>
        <th style="width: 10%">В наличии</th>
        <th style="width: 10%">Качество</th>
        <th style="width: 30%">Выгрузить</th>
    </tr>
    <?foreach ($data['costs'] as $cost):?>
        <tr>
            <td><?=$cost['product']['type']['title']?></td>
            <td><?=$cost['amount']?></td>
            <td><?=$cost['product']['amount']?></td>
            <td><?=$cost['product']['quality']?></td>
            <td>
                <?if ($cost['amount'] >= 1):?>
                <input class="select-supply-count" type="number" value="0" min="0" max="<?=$cost['product']['amount']?>">
                <a class="do-unload" data-type-id="<?=$cost['product']['type']['id']?>" href="#this">Выгрузить</a>
                <?endif;?>
            </td>
        </tr>
    <?endforeach;?>
</table>
<?endif;?>
<div id="dialog-window"></div>