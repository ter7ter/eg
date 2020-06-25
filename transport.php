<?php
require_once("includes.php");
$data = Transport::get_finish();
foreach ($data as $row) {
    MyDB::start_transaction();
    $unit = Unit::get($row['unitTo']);
    if (!$unit) {
        print("Error: unit {$row['unitTo']} not found");
        continue;
    }
    $transportProduct = Product::get($row['productId']);
    $unitProduct = $unit->get_product_by_type($transportProduct->type);
    if ($unitProduct) {
        $unitProduct->union($transportProduct);
    } else {
        $transportProduct->unit = $unit;
        $transportProduct->save();
    }
    MyDB::end_transaction();
}