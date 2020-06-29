<div class="select-builder-form" data-city-id="<?=$data['city']['id']?>" data-unit-type-id="<?=$data['unitType']['id']?>">
    <table class="supplier-items">
        <tr>
            <th style="width: 45%">Название</th>
            <th style="width: 16%">Стоимость строительства</th>
            <th style="width: 16%">Время строительства</th>
            <th style="width: 16%">Время ожидания в очереди</th>
            <th></th>
        </tr>
    <?foreach ($data['builders'] as $builder):?>
        <tr>
            <td><?=$builder['company']['title']?>/<?=$builder['unit']['title']?></td>
            <td><?=$builder['price']?></td>
            <td><?=format_time($builder['buildTime'])?></td>
            <td><?=format_time($builder['waitTime'])?></td>
            <td>
                <input type="radio" name="builder_unit" value="<?=$builder['unit']['id']?>">
            </td>
        </tr>
    <?endforeach;?>
    </table>
</div>