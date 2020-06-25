<?php
require_once("includes.php");
$data = MyDB::query("SELECT id FROM unit WHERE lastUpdate < NOW() - INTERVAL 1 MINUTE");
foreach ($data as $row) {
    MyDB::start_transaction();
    $unit = Unit::get($row['id']);
    $unit->calculate();
    MyDB::end_transaction();
}