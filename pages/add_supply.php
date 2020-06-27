<?php
$step = $_REQUEST['step'] ?? 1;
switch ($step) {
    case 1:
        $page = 'add_supply1';
        $data['categories'] = ProductCategory::get_list_info();
    break;
    case 2:
        $page = 'add_supply2';
        $categoryId = intval($_REQUEST['categoryId']);
        $data['productTypes'] = ProductType::get_list_info(['categoryId' => $categoryId]);
    break;
}
$outPage = true;