<?php
$unit = false;
$id = intval(@$_REQUEST['id']);
$tab = $_REQUEST['tab'] ?? 'info';
if ($id) {
    $unit = Unit::get($id);
    if ($unit->company->user !== $user) {
        $unit = false;
    }
}
$action = $_REQUEST['action'] ?? false;
if ($unit) {
    if ($unit->status != 'work') {
        $action = false;
        $tab = 'info';
    }
    if ($unit->status == 'build') {
        $makingId = MyDB::query("SELECT id, unitId FROM unit_making WHERE makeId = ?id", ['id' => $unit->id], 'row');
        $data['buildTime'] = MyDB::query("SELECT sum(remaindCost) FROM unit_making WHERE unitId = ?unit_id AND id <= ?id",
            ['unit_id' => $makingId['unitId'], 'id' => $makingId['id']], 'elem');
    }
    switch ($action) {
        case 'update_sell':
            if (!is_array($_REQUEST['price'])) break;
            if (!is_array($_REQUEST['access'])) break;
            foreach ($_REQUEST['price'] as $typeId => $price) {
                $unit->update_sell_price($typeId, $price, $_REQUEST['access'][$typeId]);
            }
        break;
        case 'update_shop':
            if (!is_array($_REQUEST['price'])) break;
            foreach ($_REQUEST['price'] as $typeId => $price) {
                $unit->update_shop_price($typeId, $price);
            }
            $unit->calculateShopFactor();
        break;
        case 'update_construction':
            if ($unit->type->type != 'construction') break;
            $unit->makePrice = floatval($_REQUEST['price']);
            $access = @$_REQUEST['access'];
            if (!in_array($access, ['all', 'private', 'list', 'close'])) {
                $access = 'close';
            }
            $unit->makeAccess = $access;
            $unit->save();
        break;
        case 'add_people':
            $peopleCount = intval($_REQUEST['count']);
            if ($peopleCount < 1) break;
            $peopleType = $_REQUEST['people_type'];
            if ($peopleType != 'office') {
                $peopleType = $unit->type->peopleType;
            }
            $peoplePay = floatval($_REQUEST['pay']);
            $populationData = $unit->city->get_population_data($peopleType);
            if ($populationData['amount'] < $peopleCount) {
                $error = "?? ???????????? ???????????????????????? ?????????????????? ????????????????????";
                break;
            }
            if ($unit->company->money < $peoplePay*$peopleCount) {
                $error = "?? ?????????? ???????????????? ???????????????????????? ??????????";
                break;
            }
            if (!$unit->employ_people($peopleType, $peopleCount, $peoplePay)) {
                $error = "???? ?????????????? ???????????? ????????????????????";
            }
        break;
        case 'remove_people':
            $peopleCount = intval($_REQUEST['count']);
            if ($peopleCount < 1) break;
            $peopleType = $_REQUEST['people_type'];
            if (!$unit->kick_people($peopleType, $peopleCount)) {
                $error = "???? ?????????????? ?????????????? ????????????????????";
            }
        break;
    }
    if (!in_array($tab, UnitType::$_UNIT_TABS[$unit->type->type])) {
        $tab = 'info';
    }

    $data['unit'] = $unit->get_info(true);
    $data['city'] = $unit->city->get_info();

    switch ($tab) {
        case 'info':
            $data['unit']['statistic'] = $unit->get_statistic();
        break;
        case 'people':
            $data['unit']['peopleData'] = $unit->city->get_population_data($unit->type->peopleType);
            $data['unit']['officeData'] = $unit->city->get_population_data('office');
        break;
        case 'storage':
            $products = $unit->get_products();
            $data['products'] = [];
            foreach ($products as $product) {
                $data['products'][$product->type->id] = $product->get_info();
            }
        break;
        case 'production':
            $list['makes'] = $unit->type->get_product_making();
            $list['costs'] = $unit->type->get_product_cost();
            foreach (['makes', 'costs'] as $listName) {
                $data[$listName] = [];
                foreach ($list[$listName] as $item) {
                    $product = $unit->get_product_by_type(ProductType::get($item['productType']));
                    if ($product) {
                        $item['product'] = $product->get_info();
                    } else {
                        $item['product'] = [
                            'amount' => 0,
                            'quality' => 0,
                            'type' => ProductType::get($item['productType'])->get_info()
                        ];
                    }
                    if ($listName == 'makes') $item['eff'] = '100%';
                    $data[$listName][] = $item;
                }
            }
        break;
        case 'shop':
            $data['goods'] = [];
            $products = $unit->get_products();
            foreach ($products as $product) {
                if ($product->type->type != 'final') continue;
                $data['goods'][$product->type->id] = $product->get_info();
                $data['goods'][$product->type->id]['price'] = 0;
            }
            $goods = $unit->get_product_shop();
            foreach ($goods as $good) {
                if (isset($data['goods'][$good['typeId']])) {
                    $data['goods'][$good['typeId']]['price'] = $good['price'];
                }
            }
        break;
        case 'supply':
            $data['products'] = [];
            $products = $unit->get_product_supply();
            foreach ($products as $product) {
                $data['products'][$product->type->id] = $product->get_info();
                $data['products'][$product->type->id]['transport'] = [];
            }
            $transport = $unit->get_transport_to();
        break;
        case 'sale':
            $data['products'] = [];
            $products = $unit->get_product_sale();
            foreach ($products as $product) {
                $data['products'][$product->type->id] = $product->get_info();
                $data['products'][$product->type->id]['transport'] = [];
            }
            $sells = $unit->get_product_sells();
            foreach ($sells as $item) {
                $typeId = $item['typeId'];
                if (isset($data['products'][$typeId])) {
                    $data['products'][$typeId]['sell'] = $item;
                }
            }
            if ($unit->type->type == 'shop') {
                foreach ($data['products'] as $key => $product) {
                    if (!isset($product['sell'])) {
                        $data['products'][$key]['sell'] = ['price' => 0, 'access' => 'close'];
                    }
                }
            }
            $transport = $unit->get_transport_from();
        break;
        case 'construction':
            $constructionPower = $unit->type->get_product_cost()[0];
            $material = $unit->get_product_by_type(ProductType::get(CONSTRUCTION_MATERIAL));
            if (!$material) {
                $material = new Product(['typeId' => CONSTRUCTION_MATERIAL]);
                $material->unit = $unit;
                $material->amount = 0;
            }
            $constructionQueue = $unit->get_construction_queue();
            $constructionQueueAmount = 0;
            $data['construction']['queue'] = [];
            foreach ($constructionQueue as $item) {
                $constructionQueueAmount += $item['remaindCost'];
                $data['construction']['queue'][] = [
                    'id' => $item['id'],
                    'unit' => $item['makeUnit']->get_info(),
                    'company' => $item['makeUnit']->company->get_info(),
                    'makeCost' => $item['makeUnit']->type->cost,
                    'makingPrice' => $item['makingPrice'],
                    'remaindCost' => $item['remaindCost'],
                    'quality' => $item['quality'],
                    'complete'  => ($item['makeUnit']->type->cost - $item['remaindCost'])/$item['makeUnit']->type->cost,
                    'time'      => $item['remaindCost']*3600/$constructionPower['amount']
                ];
            }
            $data['construction']['make'] = $constructionPower['amount'];
            $data['construction']['amount'] = $material->amount;
            $data['construction']['queueAmount'] = $constructionQueueAmount;
        break;
    }
    if ($tab == 'supply' || $tab == 'sale') {
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
} else {
    header("Location: /units");
    $endPage = true;
}