<?php
$page = 'message_error';
$step = $_REQUEST['step'] ?? 1;
$unit = Unit::get(intval(@$_REQUEST['unit_id']));
if (!$unit) {
    $error = 'Предприятие не найдено';
    $step = 0;
}
$productType = ProductType::get(intval(@$_REQUEST['type_id']));
if (!$productType) {
    $error = 'Такой тип товара не найден';
    $step = 0;
}
$data['amount'] = intval($_REQUEST['amount']);
if ($data['amount'] < 1) {
    $error = 'Введите количество';
    $step = 0;
}
switch ($step) {
    case 1:
        $page = 'select_unit';
        $join = " INNER JOIN unit_type ON unit_type.id = unit.typeId ";
        $filter = ['companyId' => $unit->company->id, 'unit_type.type' => 'storage'];
        $data['allCount'] = Unit::get_list_count($filter, $join);
        $data['perPage'] = UNIT_SUPPLY_PAGE;
        $data['currentPage'] = intval($_REQUEST['page'] ?? 1);
        $data['pagerLink'] = '#this';
        $start = ($data['currentPage'] - 1)*$data['perPage'];
        $units = Unit::get_list($filter, [], $start, $data['perPage'], $join);
        $data['units'] = [];
        foreach ($units as $targetUnit) {
            $info = $targetUnit->get_info(true);
            $info['city'] = $targetUnit->city->get_info();
            $info['transportTime'] = Transport::transport_time($unit, $targetUnit);
            $data['units'][] = $info;
        }
        $data['productType'] = $productType->get_info();
    break;
    case 2:
        $product = $unit->get_product_by_type($productType);
        if (!$product || $product->amount < 1) {
            $error = 'Товар не найден';
            break;
        }
        if ($data['amount'] > $product->amount) {
            $data['amount'] = floor($product->amount);
        }
        $targetUnit = Unit::get(intval($_REQUEST['storage_unit']));
        if (!$targetUnit) {
            $error = 'Склад не найден';
            break;
        }
        $product->transport($targetUnit, $data['amount']);
        $data['message'] = 'Товар успешно отправлен';
        $page = 'message_ok';
    break;
}
$outPage = true;