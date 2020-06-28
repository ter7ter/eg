<div class="add-supply-form">
    <div class="add-supply-title">Тип товара</div>
    <?foreach ($data['productTypes'] as $type):?>
    <div class="supply-item product-type-item" data-id="<?=$type['id']?>"><?=$type['title']?></div>
    <?endforeach;?>
</div>