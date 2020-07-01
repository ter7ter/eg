<?php
/**
 * Class ProductCategory
 * @property string title
 * @property string type
 */
class ProductCategory extends Base {
    public static $tablename = 'product_category';

    public static $_all = [];

    public static $_FIELDS = [
        'title',
        'type'
    ];

    public static $_REQUEST_FIELDS = [
        'title' => [
            'name' => 'название',
            'required' => 1
        ],
    ];

    /**
     * @param $id
     * @return ProductCategory|bool
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
        $result = $this->get_fields(['id', 'type', 'title']);
        return $result;
    }
}