<?php
require_once("includes.php");
$data = MyDB::query("SELECT id FROM unit WHERE lastUpdate < NOW() - INTERVAL 1 MINUTE");
$nowTime = time();
foreach ($data as $row) {
    MyDB::start_transaction();
    $unit = Unit::get($row['id']);
    $unit->calculate($nowTime);
    MyDB::end_transaction();
}