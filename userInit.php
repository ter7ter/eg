<?php
/**
 * Действия в начале любой странцы с авторизованным пользователем
 * Определяем текущую открытую компанию
 */
$openedCompany = false;
if (isset($_REQUEST['company'])) {
    $openedCompany = Company::get(intval($_REQUEST['company']));
    if ($openedCompany->user != $user) {
        $openedCompany = false;
    } else {
        $_SESSION['company_id'] = $openedCompany->id;
    }
}
if (!$openedCompany && isset($_SESSION['company_id'])) {
    $openedCompany = Company::get(intval($_SESSION['company_id']));
    if ($openedCompany->user != $user) {
        $openedCompany = false;
    }
}
$companyList = $user->get_company_list();
if (!$openedCompany && count($companyList)) {
    $openedCompany = $companyList[0];
}
if (!$openedCompany) {
    $nextPage = 'create_company';
}