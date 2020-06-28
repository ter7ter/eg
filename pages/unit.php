<?php
$unit = false;
$id = intval(@$_REQUEST['id']);
$tab = $_REQUEST['tab'] ?? 'info';
if (!in_array($tab, ['info', 'supply', 'sale'])) {
    $tab = 'info';
}
if ($id) {
    $unit = Unit::get($id);
    if ($unit->company->user !== $user) {
        $unit = false;
    }
}
$action = $_REQUEST['action'] ?? false;
if ($unit) {
    switch ($action) {
        case 'update_sell':
            if (!is_array($_REQUEST['price'])) break;
            if (!is_array($_REQUEST['access'])) break;
            foreach ($_REQUEST['price'] as $typeId => $price) {
                $unit->update_sell_price($typeId, $price, $_REQUEST['access'][$typeId]);
            }
        break;
    }

    $data['unit'] = $unit->get_info(true);
    if ($tab == 'supply') {
        $transport = $unit->get_transport_to();
    } elseif ($tab == 'sale') {
        $transport = $unit->get_transport_from();
    }

    if ($tab == in_array($tab, ['supply', 'sale'])) {
        $data['products'] = [];
        $products = $unit->get_products();
        foreach ($products as $product) {
            $data['products'][$product->type->id] = $product->get_info();
            $data['products'][$product->type->id]['transport'] = [];
        }
        foreach ($transport as $item) {
            $typeId = $item['typeId'];
            $unitFrom = Unit::get($item['unitId']);
            $item['unit'] = $unitFrom->get_info();
            $item['company'] = $unitFrom->company->get_info();
            $item['city'] = $unitFrom->city->get_info();
            $item['time'] = strtotime($item['endTime']) - time();
            if ($item['time'] < 1) {
                $item['time'] = 1;
            }
            if (isset($data['products'][$typeId])) {
                $data['products'][$typeId]['transport'][] = $item;
            } else {
                $data['products'][$typeId] = [
                    'amount'    => 0,
                    'quality'   => 0,
                    'type'      => ProductType::get($item['typeId'])->get_info(),
                    'transport' => [$item]
                ];
            }
        }
    }
    switch ($tab) {
        case 'supply':

        break;
        case 'sale':
            $sells = $unit->get_product_sells();
            foreach ($sells as $item) {
                $typeId = $item['typeId'];
                if (isset($data['products'][$typeId])) {
                    $data['products'][$typeId]['sell'] = $item;
                }
            }
            foreach ($data['products'] as $key => $product) {
                if (!isset($product['sell'])) {
                    $data['products'][$key]['sell'] = ['price' => 0, 'access' => 'close'];
                }
            }
        break;
    }
} else {
    header("Location: /units");
    $endPage = true;
}