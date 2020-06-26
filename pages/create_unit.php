<?php
/**
 * @var Company $openedCompany
 */
$type = $_REQUEST['type'] ?? false;
if (!isset(UnitType::$_TYPES[$type])) $type = 'shop';
$action = $_REQUEST['action'] ?? false;
switch ($action) {
    case 'create':
        $city = City::get(intval(@$_REQUEST['cityId']));
        if (!$city) break;
        $data['cityId'] = $city->id;
        $unitType = UnitType::get(intval(@$_REQUEST['typeId']));
        if (!$unitType) break;
        $data['typeId'] = $unitType->id;
        $data['title'] = htmlspecialchars($_REQUEST['title']);
        $unit = new Unit(
            [   'companyId' => $openedCompany->id,
                'cityId' => $city->id,
                'typeId' => $unitType->id,
                'lastUpdate' => timestamp_to_db(time())]);
        $unit->set_request($_REQUEST);
        $errors = [];
        if ($unit->validate($errors)) {
            $unit->save();
            header("Location: /units");
        } else {
            $data['errors'] = $errors;
        }
    break;
}
$data['type'] = $type;
$data['unitTypes'] = UnitType::get_list_info(['type' => $type]);
$countryId = false;
if (isset($_REQUEST['countryId'])) {
    $countryId = intval($_REQUEST['countryId']);
}
if (!$countryId) {
    $countryId = $data['possibleCountries'][0]['id'];
}
$data['regions'] = Region::get_list_info(['countryId' => $countryId]);

$regionId = false;
if (isset($_REQUEST['regionId'])) {
    $regionId = intval($_REQUEST['regionId']);
}
if (!$regionId) {
    $regionId = $data['regions'][0]['id'];
}
$data['cities'] = City::get_list_info(['regionId' => $regionId]);
if ($countryId) {
    $data['countryId'] = $countryId;
}
if ($regionId) {
    $data['regionId'] = $regionId;
}
if (!isset($data['title'])) {
    if (isset($unitType)) {
        $data['title'] = $unitType->title;
    } else {
        $data['title'] = $data['unitTypes'][0]['title'];
    }
}