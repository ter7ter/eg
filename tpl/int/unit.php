<script type="text/javascript">
    var unit_id = <?=$data['unit']['id']?>;
</script>
<div class="data-form" id="unit-form">
    <h3><?=$data['unit']['title']?></h3>
    <div class="form-tabs">
        <div class="tab<?=($tab=='info')?' active':''?>">
            <a href="/unit&id=<?=$data['unit']['id']?>&tab=info">Информация</a>
        </div>
        <div class="tab<?=($tab=='supply')?' active':''?>">
            <a href="/unit&id=<?=$data['unit']['id']?>&tab=supply">Снабжение</a>
        </div>
        <?if ($data['unit']['type']['type'] != 'shop'):?>
        <div class="tab<?=($tab=='sale')?' active':''?>">
            <a href="/unit&id=<?=$data['unit']['id']?>&tab=sale">Сбыт</a>
        </div>
        <?endif;?>
        <?if ($data['unit']['type']['type'] == 'shop'):?>
        <div class="tab<?=($tab=='storage')?' active':''?>">
            <a href="/unit&id=<?=$data['unit']['id']?>&tab=storage">Склад</a>
        </div>
        <div class="tab<?=($tab=='shop')?' active':''?>">
            <a href="/unit&id=<?=$data['unit']['id']?>&tab=shop">Торговый зал</a>
        </div>
        <?endif;?>
    </div>
    <tr class="unit-tab">
    <?include("tpl/inc/unit_{$tab}.php");?>
    </div>
</div>