<table class="products-table">
    <tr>
        <th style="width: 55%">Товар</th>
        <th style="width: 10%">Количество</th>
        <th style="width: 10%">Качество</th>
        <th style="width: 24%">Выгрузить</th>
    </tr>
    <?foreach ($data['products'] as $product):?>
        <tr>
            <td><?=$product['type']['title']?></td>
            <td><?=$product['amount']?></td>
            <td><?=format_quality($product['quality'])?></td>
            <td>
                <input class="select-supply-count" type="number" value="0" min="0" max="<?=$product['amount']?>">
                <a class="do-unload" data-type-id="<?=$product['type']['id']?>" href="#this">Выгрузить</a>
            </td>
        </tr>
    <?endforeach;?>
</table>
<div id="dialog-window"></div>