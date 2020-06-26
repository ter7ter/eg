<h3>Создание нового предприятия</h3>
<?if (isset($errors) && count($errors) > 0):?>
    <div class="msg-error">
        <?foreach ($errors as $error):?>
            <?=$error?><br>
        <?endforeach;?>
    </div>
<?endif;?>
<div class="data-form" id="create-unit-form">
    <form action="/create_unit" method="post">
        <input type="hidden" name="type" value="<?=$data['type']?>">
        <input type="hidden" name="action" value="create">
        <div class="data-line">Страна<br>
            <select name="countryId" id="unit-select-country">
                <?foreach ($data['possibleCountries'] as $country):?>
                    <option value="<?=$country['id']?>" <?=($country['id']==@$data['countryId'])?'selected':''?>><?=$country['title']?></option>
                <?endforeach;?>
            </select>
        </div>

        <div class="data-line">Регион<br>
            <select name="regionId" id="unit-select-region">
                <?foreach ($data['regions'] as $region):?>
                    <option value="<?=$region['id']?>" <?=($region['id']==@$data['regionId'])?'selected':''?>><?=$region['title']?></option>
                <?endforeach;?>
            </select>
        </div>

        <div class="data-line">Город<br>
            <select name="cityId" id="unit-select-city">
                <?foreach ($data['cities'] as $city):?>
                    <option value="<?=$city['id']?>" <?=($city['id']==@$data['cityId'])?'selected':''?>><?=$city['title']?></option>
                <?endforeach;?>
            </select>
        </div>

        <div class="data-line">Тип<br>
            <select name="typeId" id="unit-select-type">
            <?foreach ($data['unitTypes'] as $unitType):?>
                <option value="<?=$unitType['id']?>" <?=($unitType['id']==@$data['typeId'])?'selected':''?>><?=$unitType['title']?></option>
            <?endforeach;?>
            </select>
        </div>
        <div class="data-line">Название<br>
            <input type="text" name="title" placeholder="Введите название предприятия" minlength="<?=UNIT_TITLE_MIN?>" maxlength="<?=UNIT_TITLE_MAX?>" pattern="[a-zA-Z0-9а-яА-ЯёЁ _-]+" value="<?=@$data['title']?>">
        </div>
        <div class="data-line"><input type="submit" value="Создать"></div>
    </form>
</div>