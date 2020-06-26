<?php
$regionId = intval(@$_REQUEST['id']);
if ($regionId) {
    $data['cities'] = City::get_list_info(['regionId' => $regionId]);
}
