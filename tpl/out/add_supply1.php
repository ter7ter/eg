<div class="add-supply-form">
    <div class="add-supply-title">Категория товара</div>
    <?foreach ($data['categories'] as $category):?>
    <div class="supply-item category-item" data-id="<?=$category['id']?>"><?=$category['title']?></div>
    <?endforeach;?>
</div>