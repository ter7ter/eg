<div class="add-supply-form" data-type-id="<?=$data['productType']?>">
    <div class="add-supply-title">Доступные поставщики</div>
    <table class="supplier-items">
        <tr>
            <th>Поставщик</th>
            <th>Город</th>
            <th>В наличии</th>
            <th>Цена за ед.</th>
            <th>Качество</th>
            <th>Время доставки</th>
            <th></th>
        </tr>
        <?foreach ($data['suppliers'] as $supplier):
            $max = floor($data['openedCompany']['money'] / $supplier['price']);
            if ($max > $supplier['amount']) $max = floor($supplier['amount']); ?>
        <tr data-id="<?=$supplier['unit']['id']?>">
            <td>
            <?=$supplier['company']['title']?>/<?=$supplier['unit']['title']?>
            </td>
            <td>
            <?=$supplier['city']['title']?>
            </td>
            <td>
            <?=$supplier['amount']?>
            </td>
            <td>
            <?=$supplier['price']?>
            </td>
            <td>
            <?=$supplier['quality']?>
            </td>
            <td>
            <?=format_time($supplier['time'])?>
            </td>
            <td>
                <input type="number" class="select-supply-count" min="0" max="<?=$max?>" value="0">
                <div class="select-supplier">Заказать</div>
            </td>
        </tr>
        <?endforeach;?>
    </table>
</div>