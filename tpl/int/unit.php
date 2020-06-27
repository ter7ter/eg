<div class="data-form" id="unit-form">
    <h3><?=$data['unit']['title']?></h3>
    <div class="form-tabs">
        <div class="tab<?=($tab=='info')?' active':''?>">
            <a href="/unit&id=<?=$data['unit']['id']?>&tab=info">Информация</a>
        </div>
        <div class="tab<?=($tab=='supply')?' active':''?>">
            <a href="/unit&id=<?=$data['unit']['id']?>&tab=supply">Снабжение</a>
        </div>
        <div class="tab<?=($tab=='sale')?' active':''?>">
            <a href="/unit&id=<?=$data['unit']['id']?>&tab=sale">Сбыт</a>
        </div>
    </div>
    <tr class="unit-tab">
    <?if ($tab == 'supply'):?>
    <table class="products-table">
        <tr>
            <th style="width: 55%">Товар</th>
            <th style="width: 10%">Количество</th>
            <th style="width: 10%">Качество</th>
            <th style="width: 24%">&nbsp;</th>
        </tr>
        <?foreach ($data['products'] as $product):?>
        <tr>
            <td><?=$product['type']['title']?></td>
            <td><?=$product['amount']?></td>
            <td><?=$product['quality']?></td>
            <td><a href="#this" class="do-add-supply">Добавить поставщика</a></td>
        </tr>
        <?endforeach;?>
    </table>
    <?endif;?>
    <?if ($tab == 'sale'):?>
    <form action="/unit&id=<?=$data['unit']['id']?>&tab=sale" method="post">
        <input type="hidden" name="action" value="update_sell">
        <table class="products-table">
            <tr>
                <th style="width: 55%">Товар</th>
                <th style="width: 10%">Количество</th>
                <th style="width: 10%">Качество</th>
                <th style="width: 12%">Цена</th>
                <th style="width: 12%">Продавать</th>
            </tr>
            <?foreach ($data['products'] as $product):?>
            <tr>
                <td><?=$product['type']['title']?></td>
                <td><?=$product['amount']?></td>
                <td><?=$product['quality']?></td>
                <td><input type="text" name="price[<?=$product['type']['id']?>]" value="<?=$product['sell']['price']?>"></td>
                <td>
                    <select name="access[<?=$product['type']['id']?>]">
                        <option value="all" <?=($product['sell']['access']=='all')?'selected':''?>>всем</option>
                        <option value="private" <?=($product['sell']['access']=='private')?'selected':''?>>своей компании</option>
                        <option value="close" <?=($product['sell']['access']=='close')?'selected':''?>>никому</option>
                    </select>
                </td>
            </tr>
            <?endforeach;?>
        </table>
        <input type="submit" value="Сохранить" style="float: right">
    </form>
    <?endif;?>
    </div>
</div>