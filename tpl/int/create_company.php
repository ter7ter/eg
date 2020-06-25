<script type="text/javascript">
    var minAmount = <?=COMPANY_MIN_START?>
</script>
<div class="data-form" id="create-company-form">
    <h2>Создание новой компании</h2>
    <?if (isset($errors) && count($errors) > 0):?>
        <div class="msg-error">
            <?foreach ($errors as $error):?>
                <?=$error?><br>
            <?endforeach;?>
        </div>
    <?endif;?>
    <h3>Баланс вашего счёта: <span id="user-money"><?=$data['money']?></span> $</h3>
    <?if ($data['money'] > COMPANY_MIN_START):?>
        <form action="/create_company" method="post">
            <input type="hidden" name="action" value="create">
            <div class="data-line">Название компании<br>
                <input type="text" name="title" placeholder="Введите название компании" minlength="<?=COMPANY_TITLE_MIN?>" maxlength="<?=COMPANY_TITLE_MAX?>" pattern="[a-zA-Z0-9а-яА-Я _-]+">
            </div>
            <div class="data-line">Валюта компании<br>
                <select class="show-tooltip" name="currencyId" title="От выбранной валюты будет зависеть в каких странах вы можете открывать предприятия">
                    <?foreach ($data['currencyList'] as $currency):?>
                    <option value="<?=$currency['id']?>" data-rate="<?=$currency['baseRate']?>" data-name="<?=$currency['name']?>">
                        [<?=$currency['name']?>] <?=$currency['title']?>
                    </option>
                    <?endforeach;?>
                </select>
            </div>
            <div class="data-line">1 USD = <span class="currency-rate"></span></div>
            <div class="data-line">Ваш баланс <?=$data['money']?> USD = <span class="currency-sum"></span></div>
            <div class="data-line">Стартовый капитал<br>
                <input type="number" name="money" placeholder="Начальный капитал вашей компании" required>
            </div>
            <div class="data-line">
                <input type="submit" value="Создать">
            </div>
        </form>
    <?else:?>
    <h3>У вас недостаточно средств для создания компании</h3>
    <?endif;?>
</div>