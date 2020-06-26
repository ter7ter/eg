<?php
/**
 * @var $user User
 */
$data['currencyList'] = [];
$data['currencyList'] = Currency::get_list_info();
$data['money'] = $user->money;
$action = $_REQUEST['action'] ?? false;
switch ($action) {
    case 'create':
        $currency = Currency::get(intval($_REQUEST['currencyId']));
        if (!$currency) break;
        $amount = intval($_REQUEST['money']);
        $baseAmount = round($amount / $currency->baseRate);
        if ($baseAmount > $user->money) {
            $errors[] = 'У вас недостаточно средств на счету';
            break;
        }
        if ($baseAmount < COMPANY_MIN_START) {
            $errors[] = 'Слишком маленькая сумма для создания компании';
            break;
        }
        $company = new Company(['userId' => $user->id, 'currencyId' => $currency->id]);
        $company->set_request($_REQUEST);
        if ($company->validate($errors)) {
            $company->save();
            $user->money -= $baseAmount;
            $user->save();
            header("Location: /main?cid=".$currency->id);
            $endPage = true;
        }
        break;
}