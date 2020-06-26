<?php
/**
 * Class UnitType
 * @property string title
 * @property string type
 */
class UnitType extends Base {
    public static $tablename = 'unit_type';

    public static $_all = [];

    public static $_FIELDS = [
        'title',
        'type',
    ];

    public static $_TYPES = [
        'shop'      => 'Магазин',
        'factory'   => 'Производство',
        'farm'      => 'Ферма',
        'storage'   => 'Склад',
        'mine'      => 'Добывающее предприятие',
    ];


    public static $_REQUEST_FIELDS = [
        'title' => [
            'name' => 'название',
            'required' => 1
        ],
    ];

    /**
     * @param $id
     * @return UnitType|bool
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
        $result = $this->get_fields(['id', 'title', 'type']);
        return $result;
    }
}