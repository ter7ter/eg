<form action="/unit&id=<?=$data['unit']['id']?>&tab=shop" method="post">
    <input type="hidden" name="action" value="update_shop">
    <table class="products-table">
        <tr>
            <th style="width: 60%">Товар</th>
            <th style="width: 12%">Количество</th>
            <th style="width: 12%">Качество</th>
            <th style="width: 15%">Цена продажи</th>
        </tr>
        <?foreach ($data['goods'] as $product):?>
            <tr>
                <td><?=$product['type']['title']?></td>
                <td><?=$product['amount']?></td>
                <td><?=$product['quality']?></td>
                <td><input type="text" name="price[<?=$product['type']['id']?>]" value="<?=$product['price']?>"></td>
            </tr>
        <?endforeach;?>
    </table>
    <?if (count($data['goods']) > 0):?>
        <input type="submit" value="Сохранить" style="float: right">
    <?endif;?>
</form>