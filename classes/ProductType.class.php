<?php
/**
 * Class ProductType
 * @property string title
 * @property string type
 * @property int categoryId
 * @property float weight
 * @property float elasticity
 */
class ProductType extends Base {
    public static $tablename = 'product_type';

    public static $_all = [];

    public static $_FIELDS = [
        'title',
        'type',
        'weight',
        'categoryId'
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
     * @var ProductType
     */
    public $category;

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
        $this->category = ProductCategory::get($this->categoryId);
    }

    public function save() {
        $this->categoryId = $this->category->id;
        parent::save();
    }

    public function get_info() {
        $result = $this->get_fields(['id', 'title', 'type', 'weight']);
        return $result;
    }
}