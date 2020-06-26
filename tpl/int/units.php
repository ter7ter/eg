<?php
$unitTypes = [
    ['title1' => 'магазины',
        'title2' => 'магазинов',
        'type' => 'shop'],
    ['title1' => 'склады',
        'title2' => 'складов',
        'type' => 'storage'],
    ['title1' => 'производства',
        'title2' => 'производств',
        'type' => 'factory'],
    ['title1' => 'фермы',
        'title2' => 'ферм',
        'type' => 'farm'],
    ['title1' => 'добывающие предприятия',
        'title2' => 'добывающих предприятий',
        'type' => 'mine'],
];
?>
<?foreach ($unitTypes as $unitType):
    $type = $unitType['type'];?>
<div class="units-block">
    <h3>Ваши <?=$unitType['title1']?></h3>
    <?if (count($data['units'][$type])):?>
        <?foreach ($data['units'][$type] as $unit):?>
        <div class="unit-item">
            <a href="/unit&id=<?=$unit['id']?>"><?=$unit['title']?></a>
        </div>
        <?endforeach;?>
    <?else:?>
    У вас пока нет <?=$unitType['title2']?>
    <?endif;?>
    <a class="link-button" href="/create_unit?type=<?=$type?>">Создать</a>
</div>
<?endforeach;?>