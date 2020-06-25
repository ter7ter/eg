<?php
/**
 * @var User $user
 */
$companyList = $user->get_company_list();
if (count($companyList) == 0) {
    $nextPage = 'create_company';
} else {
    $company = false;
    if (isset($_REQUEST['cid'])) {
        $company = Company::get(intval($_REQUEST['cid']));
        if ($company->user != $user) {
            $company = false;
        }
    }
    if (!$company) {
        $company = $companyList[0];
    }
    $data['company'] = $company->get_info(true);
}