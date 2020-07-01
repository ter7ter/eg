<script type="text/javascript">
    var unit_id = <?=$data['unit']['id']?>;
</script>
<div class="data-form" id="unit-form">
    <h3><?=$data['unit']['title']?></h3>
    <div class="form-tabs">
        <?if (in_array('info', UnitType::$_UNIT_TABS[$data['unit']['type']['type']])):?>
        <div class="tab<?=($tab=='info')?' active':''?>">
            <a href="/uni?&id=<?=$data['unit']['id']?>&tab=info">Информация</a>
        </div>
        <?endif;?>
    <?if ($data['unit']['status'] == 'work'):?>
        <?if (in_array('supply', UnitType::$_UNIT_TABS[$data['unit']['type']['type']])):?>
        <div class="tab<?=($tab=='supply')?' active':''?>">
            <a href="/unit?id=<?=$data['unit']['id']?>&tab=supply">Снабжение</a>
        </div>
        <?endif;?>
        <?if (in_array('production', UnitType::$_UNIT_TABS[$data['unit']['type']['type']])):?>
        <div class="tab<?=($tab=='production')?' active':''?>">
            <a href="/unit?id=<?=$data['unit']['id']?>&tab=production">Производство</a>
        </div>
        <?endif;?>
        <?if (in_array('sale', UnitType::$_UNIT_TABS[$data['unit']['type']['type']])):?>
        <div class="tab<?=($tab=='sale')?' active':''?>">
            <a href="/unit?id=<?=$data['unit']['id']?>&tab=sale">Сбыт</a>
        </div>
        <?endif;?>
        <?if (in_array('storage', UnitType::$_UNIT_TABS[$data['unit']['type']['type']])):?>
        <div class="tab<?=($tab=='storage')?' active':''?>">
            <a href="/unit?id=<?=$data['unit']['id']?>&tab=storage">Склад</a>
        </div>
        <?endif;?>
        <?if (in_array('shop', UnitType::$_UNIT_TABS[$data['unit']['type']['type']])):?>
        <div class="tab<?=($tab=='shop')?' active':''?>">
            <a href="/unit?id=<?=$data['unit']['id']?>&tab=shop">Торговый зал</a>
        </div>
        <?endif;?>
        <?if (in_array('construction', UnitType::$_UNIT_TABS[$data['unit']['type']['type']])):?>
            <div class="tab<?=($tab=='construction')?' active':''?>">
                <a href="/unit?id=<?=$data['unit']['id']?>&tab=construction">Строительство</a>
            </div>
        <?endif;?>
    <?endif;?>
    </div>
    <tr class="unit-tab">
    <?include("tpl/inc/unit_{$tab}.php");?>
    </div>
</div>