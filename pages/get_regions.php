<?php
$countryId = intval(@$_REQUEST['id']);
if ($countryId) {
    $data['regions'] = Region::get_list_info(['countryId' => $countryId]);
}
