<?php
/**
 * @var Company $company
 */
$data['units'] = [];
foreach (UnitType::$_TYPES as $type => $val) {
    $data['units'][$type] = [];
}
foreach ($company->get_units() as $unit) {
    $data['units'][$unit->type->type][] = $unit->get_info();
}