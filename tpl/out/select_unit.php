<div class="add-supply-form" data-type-id="<?=$data['productType']['id']?>" data-amount="<?=$data['amount']?>">
    <table class="supplier-items">
        <tr>
            <th style="width: 61%">Название</th>
            <th style="width: 15%">Город</th>
            <th style="width: 12%">Время доставки</th>
            <th style="width: 12%"></th>
        </tr>
    <?foreach ($data['units'] as $unit):?>
        <tr>
            <td><?=$unit['title']?></td>
            <td><?=$unit['city']['title']?></td>
            <td><?=format_time($unit['transportTime'])?></td>
            <td><div class="select-unit" data-id="<?=$unit['id']?>">Выбрать</div></td>
        </tr>
    <?endforeach;?>
    </table>
</div>