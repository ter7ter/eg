<?php

/**
 * Class City
 * @property string title
 * @property int regionId
 */
class City extends Base {
    public static $tablename = 'city';

    public static $_all = [];

    public static $_FIELDS = [
        'title', //Название региона
        'regionId' //Ссылка на регион
    ];

    /**
     * @var Region
     */
    public $region;

    /**
     * @param $id
     * @return City|bool
     * @throws Exception
     */
    public static function get($id)
    {
        return parent::get($id);
    }

    public function __construct($data) {
        parent::__construct($data);

        $this->region = Region::get($this->regionId);
    }

    public function save() {
        $this->regionId = $this->region->id;
        parent::save();
    }

    public function get_info() {
        $result = $this->get_fields(['id', 'title']);
        return $result;
    }
}