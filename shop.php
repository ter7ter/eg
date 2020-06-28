<?php
require_once("includes.php");
MyDB::start_transaction();
$productDemand = MyDB::query("SELECT * FROM product_demand");
foreach ($productDemand as $demand) {
    $time = strtotime($demand['lastUpdate']);
    $needSellCount = ($demand['baseCount']*$time)/3600 + $demand['remCount']; //Сколько хотели купить за прошедшее время
    $mPrice = $demand['amount']/$demand['baseCount'];
    if ($needSellCount < 1) continue;
    $remCount = $needSellCount - floor($needSellCount);
    $needSellCount = floor($needSellCount); //Будем продавать только целое количество, остаток запишем на следующий раз
    $sellBudget = $needSellCount*$mPrice; //Бюджет на эти покупки у жителей
    $sells = MyDB::query("SELECT product.id, product_shop.unitId, product_shop.shopFactor, product_shop.price FROM product_shop
            INNER JOIN product ON product.typeId = product_shop.typeId AND product.unitId = product_shop.unitId
            WHERE product_shop.typeId = ?type_id AND product_shop.cityId = ?city_id AND price > 0 AND product.amount >= 1
            ORDER BY RAND()",
            ['type_id' => $demand['productType'], 'city_id' => $demand['cityId']]);
    if (count($sells) == 0) continue;
    $factorSum = 0;
    $minPrice = $sells[0]['price'];
    foreach ($sells as $sell) {
        $factorSum += $sell['shopFactor'];
        if ($minPrice > $sell['price']) $minPrice = $sell['price'];
    }
    foreach ($sells as $sell) {
        $shopPart = $sell['shopFactor']/$factorSum; //Доля этого магазина
        $shopCount = $needSellCount*$shopPart*(mt_rand(80, 120)/100);
        $shopSell = floor($shopCount);
        if (mt_rand(0, 100)/100 < $shopCount - $shopSell) {
            $shopSell++;
        }
        if ($needSellCount < $shopSell) { //Если объём продажи заканчивается
            $shopSell = $needSellCount;
        }
        if ($sellBudget < $shopSell*$sell['price']) { //Если бюджет на продажу заканчивается
            $shopSell = floor($sellBudget/$sell['price']);
        }
        if ($shopSell > 0) {
            $product = Product::get($sell['id']);
            $shopSell = $product->sell($shopSell, $sell['price']);
            print("Sell {$shopSell} for price = {$sell['price']} unitId = {$product->unit->id} \n");
            $needSellCount -= $shopSell;
            $sellBudget -= $shopSell*$sell['price'];
        }
        if ($needSellCount == 0) break; //Весь объём закончился
        if ($sellBudget < $minPrice) break; //Бюджет закончился
    }
    $remCount += $needSellCount;
    MyDB::query("UPDATE product_demand SET remCount = '?remCount', lastUpdate = NOW() WHERE cityId = ?cid AND productType = ?type",
        ['remCount' => $remCount, 'cid' => $demand['cityId'], 'type' => $demand['productType']]);
}
foreach (Company::$_all as $company) {
    $company->save();
}
MyDB::end_transaction();