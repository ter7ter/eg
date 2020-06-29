<?php
/**
 * @var Company $openedCompany
 */
$city = City::get(@$_REQUEST['city_id']);
if (!$city) {
    $error = 'Город не найден';
}
$unitType = UnitType::get(@$_REQUEST['unit_type']);
if (!$unitType) {
    $error = 'Тип предприятия не найден';
}
if (!$error) {
    $data['city'] = $city->get_info();
    $data['unitType'] = $unitType->get_info();
    $data['allCount'] = $city->get_builder_list_count($unitType, $openedCompany);
    $data['perPage'] = UNIT_SUPPLY_PAGE;
    $data['currentPage'] = intval($_REQUEST['page'] ?? 1);
    $data['pagerLink'] = '#this';
    $start = ($data['currentPage'] - 1) * $data['perPage'];
    $list = $city->get_builder_list($unitType, $openedCompany, [], $start, $data['perPage']);
    $data['builders'] = [];
    foreach ($list as $item) {
        $data['builders'][] = [
            'unit' => $item['unit']->get_info(),
            'company' => $item['unit']->company->get_info(),
            'city' => $item['unit']->city->get_info(),
            'price' => $item['price'] * $item['cost'],
            'buildTime' => round($item['cost'] * 3600 / $item['performance']),
            'waitTime' => round($item['amountBusy'] * 3600 / $item['performance']),
            'amount' => $item['amount'] - $item['amountBusy'],
            'cost' => $item['cost']
        ];
    }
} else {
    $page = 'message_error';
}
$outPage = true;