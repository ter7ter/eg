<?php

/**
 * Class Currency
 * @property string name
 * @property string title
 * @property float baseRate
 */
class Currency extends Base {
    public static $tablename = 'currency';

    public static $_all = [];

    public static $_FIELDS = [
        'name',
        'title',
        'baseRate'
    ];

    /**
     * @param $id
     * @return Currency|bool
     * @throws Exception
     */
    public static function get($id)
    {
        return parent::get($id);
    }

    public function __construct($data) {
        parent::__construct($data);
    }

    public function save() {
        parent::save();
    }

    public function get_info() {
        return $this->get_fields(['id',
                                'name',
                                'title',
                                'baseRate']);
    }
}