<?php

/**
 * Class Country
 * @property string title
 * @property int currencyId
 */
class Country extends Base {
    public static $tablename = 'country';

    public static $_all = [];

    public static $_FIELDS = [
        'title',
        'currencyId'
    ];

    /**
     * @var Currency
     */
    public $currency;

    /**
     * @param $id
     * @return Country
     * @throws Exception
     */
    public static function get($id)
    {
        return parent::get($id);
    }

    public function __construct($data)
    {
        parent::__construct($data);
        $this->currency = Currency::get($this->currencyId);
    }

    /**
     * Вовзвращает список регионов этой страны
     * @return Region[]
     * @throws Exception
     */
    public function get_regions() {
        return Region::get_list(['countryId' => $this->id]);
    }

    public function get_info() {
        $result = $this->get_fields(['id', 'title']);
        $result['currency'] = $this->currency->get_info();
        return $result;
    }
}