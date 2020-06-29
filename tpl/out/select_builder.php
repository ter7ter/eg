<div class="select-builder-form" data-city-id="<?=$data['city']['id']?>" data-unit-type-id="<?=$data['unitType']['id']?>">
    <table class="supplier-items">
        <tr>
            <th style="width: 28%">Название</th>
            <th style="width: 15%">Город</th>
            <th style="width: 12%">Цена строительства</th>
            <th style="width: 15%">Время строительства</th>
            <th style="width: 15%">Время ожидания в очереди</th>
            <th style="width: 15%">Стройматериалы/необходимо</th>
            <th></th>
        </tr>
    <?foreach ($data['builders'] as $builder):?>
        <tr>
            <td><?=$builder['company']['title']?>/<?=$builder['unit']['title']?></td>
            <td><?=$builder['city']['title']?></td>
            <td><?=$builder['price']?></td>
            <td><?=format_time($builder['buildTime'])?></td>
            <td><?=format_time($builder['waitTime'])?></td>
            <td><?=$builder['amount']?>/<?=$builder['cost']?></td>
            <td>
                <div class="select-unit" data-id="<?=$builder['unit']['id']?>">Выбрать</div>
            </td>
        </tr>
    <?endforeach;?>
    </table>
</div>