<script type="text/javascript">
    var peopleData = {
        <?foreach (['people', 'office'] as $field):?>
        '<?=$field?>': {
            'count': <?=$data['unit'][$field.'Count']?>,
            'need': <?=$data['unit']['type'][$field.'Need']?>,
            'pay': <?=$data['unit'][$field.'Pay']?>,
            'cityPay': <?=$data['unit'][$field.'Data']['pay']?>,
            'dispersionPay': <?=$data['unit'][$field.'Data']['dispersionPay']?>,
            'cityQuality':  <?=$data['unit'][$field.'Data']['quality']?>,
            'dispersionQuality':  <?=$data['unit'][$field.'Data']['dispersionQuality']?>
        },
        <?endforeach;?>
    }
</script>
<div class="unit-people-info">
    <div class="data-line">
        Требуется <?=UnitType::$_PEOPLE_TYPES[$data['unit']['type']['peopleType']][2]?>: <b><?=$data['unit']['type']['peopleNeed']?></b>
    </div>
    <div class="data-line">
        Сейчас работает : <b><?=$data['unit']['peopleCount']?></b> с квалификацией <b><?=format_quality($data['unit']['peopleQuality'])?></b>
    </div>
    <div class="data-line">
        Зарплата в час : <b><?=$data['unit']['peoplePay']?></b>. Общая зарплата <b><?=$data['unit']['peoplePay']*$data['unit']['peopleCount']?></b>
    </div>
    <div class="data-line">
        <?if ($data['unit']['type']['peopleNeed'] > $data['unit']['peopleCount']):?>
        <input type="number" id="add-people-count" value="0" min="0" max="<?=($data['unit']['type']['peopleNeed']-$data['unit']['peopleCount'])?>">
        <input type="button" id="unit-add-people" value="Нанять">
        <?endif;?>
        <?if ($data['unit']['peopleCount'] > 0):?>
            <input type="number" id="remove-people-count" value="0" min="0" max="<?=$data['unit']['peopleCount']?>">
            <input type="button" id="unit-remove-people" value="Уволить">
        <?endif;?>
    </div>
</div>

<div class="unit-people-info">
    <div class="data-line">
        Требуется офисных работников: <b><?=$data['unit']['type']['officeNeed']?></b>
    </div>
    <div class="data-line">
        Сейчас работает : <b><?=$data['unit']['officeCount']?></b> с квалификацией <b><?=format_quality($data['unit']['officeQuality'])?></b>
    </div>
    <div class="data-line">
        Зарплата в час : <b><?=$data['unit']['officePay']?></b>. Общая зарплата <b><?=$data['unit']['officePay']*$data['unit']['officeCount']?></b>
    </div>
    <div class="data-line">
        <?if ($data['unit']['type']['officeNeed'] > $data['unit']['officeCount']):?>
            <input type="number" id="add-office-count" value="0" min="0" max="<?=($data['unit']['type']['officeNeed']-$data['unit']['officeCount'])?>">
            <input type="button" id="unit-add-office" value="Нанять">
        <?endif;?>
        <?if ($data['unit']['officeCount'] > 0):?>
            <input type="number" id="remove-office-count" value="0" min="0" max="<?=$data['unit']['officeCount']?>">
            <input type="button" id="unit-remove-office" value="Уволить">
        <?endif;?>
    </div>
</div>
<div class="unit-people-window" id="add-people-window">
    <form action="/unit?id=<?=$data['unit']['id']?>&tab=people" method="post">
        <input type="hidden" name="action" value="add_people">
        <input type="hidden" name="people_type" value="">
        <div class="data-line">
            Нанять <input type="number" class="people-count" name="count" value="0" min="0" max="0"> человек
            с зарплатой <input type="text" name="pay"> <?=$data['openedCompany']['currency']['name']?>
        </div>
        <div class="data-line">
            Квалификация работников <span id="people-quality">0</span><br>
            Общая зарплата <span id="people-pay-sum">0</span> <?=$data['openedCompany']['currency']['name']?><br>
            Затраты на найм <span id="people-cost">0</span> <?=$data['openedCompany']['currency']['name']?>
        </div>
        <div class="data-line">
            <input type="submit" value="Нанять">
        </div>
    </form>
</div>

<div class="unit-people-window" id="remove-people-window">
    <form action="/unit?id=<?=$data['unit']['id']?>&tab=people" method="post">
        <input type="hidden" name="action" value="remove_people">
        <input type="hidden" name="people_type" value="">
        <div class="data-line">
            Уволить <input type="number" class="people-count" name="count" value="0" min="0" max="0"> человек
        </div>
        <div class="data-line">
            Выходное пособие <span id="people-cost">0</span> <?=$data['openedCompany']['currency']['name']?>
        </div>
        <div class="data-line">
            <input type="submit" value="Уволить">
        </div>
    </form>
</div>