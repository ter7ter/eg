<?if ($data['unit']['status'] == 'build'):?>
<div class="data-line">Это предприятие сейчас строится</div>
<div class="data-line">осталось <b><?=format_time($data['buildTime'])?></b></div>
<?else:?>
<?$statistic = $data['unit']['statistic'];?>
<div class="data-line">Доход с продаж за час <?=$statistic['hour']['valueFrom']?></div>
<div class="data-line">Расходы за час <?=$statistic['hour']['valueTo']?></div>
<div class="data-line">Прибыль за час <?=($statistic['hour']['valueFrom'] + $statistic['hour']['valueTo'])?></div>
<hr>
<div class="data-line">Доход с продаж за сутки <?=$statistic['day']['valueFrom']?></div>
<div class="data-line">Расходы за сутки <?=$statistic['day']['valueTo']?></div>
<div class="data-line">Прибыль за сутки <?=($statistic['day']['valueFrom'] + $statistic['day']['valueTo'])?></div>
<?endif;?>