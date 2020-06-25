<?php

/**
 * Class Region
 * @property string title
 * @property int countryId
 */
class Region extends Base {
    public static $tablename = 'region';

    public static $_all = [];

    public static $_FIELDS = [
        'title', //Название региона
        'countryId'
    ];

    /**
     * @var Country $country
     */
    public $country;

    /**
     * @param $id
     * @return Region|bool
     * @throws Exception
     */
    public static function get($id)
    {
        return parent::get($id);
    }

    public function __construct($data) {
        parent::__construct($data);

        $this->country = Country::get($this->countryId);
    }

    /**
     * Вовзвращает список городов этого региона
     * @return City[]
     * @throws Exception
     */
    public function get_cities() {
        return City::get_list(['regionId' => $this->id]);
    }

    public function save() {
        $this->countryId = $this->country->id;
        parent::save();
    }
}