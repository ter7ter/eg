<table class="products-table">
    <tr>
        <th style="width: 55%" colspan="2">Товар</th>
        <th style="width: 10%">Количество</th>
        <th style="width: 10%">Качество</th>
        <th style="width: 24%">&nbsp;</th>
    </tr>
    <?foreach ($data['products'] as $product):?>
        <tr>
            <td colspan="2"><?=$product['type']['title']?></td>
            <td><?=$product['amount']?></td>
            <td><?=format_quality($product['quality'])?></td>
            <td><a href="#this" class="do-add-supply" data-id="<?=$product['type']['id']?>">Добавить поставщика</a></td>
        </tr>
        <?if (count($product['transport']) > 0):?>
            <tr>
                <td style="width: 20%">
                    Текущие поставки:
                </td>
                <td colspan="4">
                    <table class="product-supply">
                        <tr>
                            <th>Поставщик</th>
                            <th>Город</th>
                            <th>Количество</th>
                            <th>Качество</th>
                            <th>Время доставки</th>
                        </tr>
                        <?foreach ($product['transport'] as $transport):?>
                            <tr>
                                <td>
                                    <?=$transport['company']['title']?>/<?=$transport['unit']['title']?>
                                </td>
                                <td>
                                    <?=$transport['city']['title']?>
                                </td>
                                <td>
                                    <?=$transport['amount']?>
                                </td>
                                <td>
                                    <?=format_quality($transport['quality'])?>
                                </td>
                                <td>
                                    <?=format_time($transport['time'])?>
                                </td>
                            </tr>
                        <?endforeach;?>
                    </table>
                </td>
            </tr>
        <?endif;?>
    <?endforeach;?>
</table>
<div id="dialog-window"></div>
<?if ($data['unit']['type']['type'] == 'shop' || $data['unit']['type']['type'] == 'storage'):?>
<a class="link-button do-add-supply-product" href="#this">Добавить поставку</a>
<?endif;?>