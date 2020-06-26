<?php
/**
 * Class ProductType
 * @property string title
 * @property string type
 * @property float weight
 * @property float elasticity
 */
class ProductType extends Base {
    public static $tablename = 'product_type';

    public static $_FIELDS = [
        'title',
        'type',
        'weight'
    ];

    public static $_TYPES = [
        'final'      => 'Конечный продукт',
        'material'   => 'Материал',
        'equipment'  => 'Оборудование',
    ];


    public static $_REQUEST_FIELDS = [
        'title' => [
            'name' => 'название',
            'required' => 1
        ],
    ];

    /**
     * @param $id
     * @return ProductType|bool
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
}