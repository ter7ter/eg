<?php
$page = 'message_error';
$step = $_REQUEST['step'] ?? 1;
$unit = Unit::get(intval(@$_REQUEST['unit_id']));
if (!$unit) {
    $error = 'Предприятие не найдено';
    $step = 0;
}
if ($step == 3 || $step == 4) {
    $productType = ProductType::get(intval(@$_REQUEST['type_id']));
    if (!$productType) {
        $error = 'Такой тип товара не найден';
        $step = 0;
    }
}
if ($unit && $unit->type->type == 'construction') {
    //Сюда завозим только стройматериалы
    $productType = ProductType::get(CONSTRUCTION_MATERIAL);
    if ($step < 4) $step = 3;
}
switch ($step) {
    case 1:
        $page = 'add_supply1';
        if ($unit->type->type == 'storage') {
            $data['categories'] = ProductCategory::get_list_info();
        } elseif ($unit->type->type == 'shop') {
            $data['categories'] = ProductCategory::get_list_info(['type' => 'final']);
        } else {
            $page = 'message_error';
            $error = "Неверный запрос";
        }
    break;
    case 2:
        $category = ProductCategory::get(intval($_REQUEST['category_id']));
        if (!$category) {
            $error = 'Категория не найдена';
        }
        if ($unit->type->type == 'storage') {
            $data['productTypes'] = ProductType::get_list_info(['categoryId' => $category->id]);
            $page = 'add_supply2';
        } elseif ($unit->type->type == 'shop') {
            if ($category->type == 'final') {
                $data['productTypes'] = ProductType::get_list_info(['categoryId' => $category->id, 'type' => 'final']);
                $page = 'add_supply2';
            } else {
                $error = 'Категория не найдена';
            }
        } else {
            $error = "Неверный запрос";
        }
    break;
    case 3:
        $data['productType'] = $productType->get_info();
        $data['allCount'] = $unit->get_supply_list_count($productType);
        $data['perPage'] = UNIT_SUPPLY_PAGE;
        $data['currentPage'] = intval($_REQUEST['page'] ?? 1);
        $data['pagerLink'] = '#this';
        $start = ($data['currentPage'] - 1)*$data['perPage'];
        $suppliers = $unit->get_supply_list($productType, [], $start, $data['perPage']);
        $data['suppliers'] = [];
        foreach ($suppliers as $supplier) {
            $supplierUnit = Unit::get($supplier['unitId']);
            $supplier['unit'] = $supplierUnit->get_info();
            $supplier['company'] = $supplierUnit->company->get_info();
            $supplier['city'] = $supplierUnit->city->get_info();
            $supplier['time'] = Transport::transport_time($unit, $supplierUnit);
            $data['suppliers'][] = $supplier;
        }
        $page = 'add_supply3';
    break;
    case 4:
        $supplierUnit = Unit::get(intval(@$_REQUEST['supplier_unit']));
        if (!$supplierUnit) {
            $error = 'Поставщик не найден';
            break;
        }
        $product = $supplierUnit->get_product_by_type($productType);
        if (!$product) {
            $error = 'Поставщик не найден';
            break;
        }
        $amount = intval(@$_REQUEST['amount']);
        $result = $product->buy($amount, $unit);
        if ($result) {
            $data['message'] = 'Поставка успешно заказана';
            $page = 'message_ok';
        } else {
            $error = 'Не удалось заказать поставку';
        }
    break;
}
$outPage = true;