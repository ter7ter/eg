<?php
/**
 * Class UnitType
 * @property string title
 * @property string type
 * @property int cost
 * @property int peopleNeed
 * @property string peopleType
 * @property int officeNeed
 */
class UnitType extends Base {
    public static $tablename = 'unit_type';

    public static $_all = [];

    public static $_FIELDS = [
        'title',
        'type',
        'cost',
        'peopleNeed',
        'peopleType',
        'officeNeed'
    ];

    public static $_TYPES = [
        'shop'      => 'Магазин',
        'factory'   => 'Производство',
        'farm'      => 'Ферма',
        'storage'   => 'Склад',
        'mine'      => 'Добывающее предприятие',
        'construction' => 'Строительное предпрятие'
    ];

    public static $_PEOPLE_TYPES = [
        'worker'    => ['рабочий', 'рабочие', 'рабочих'],
        'salesman'  => ['продавец', 'продавцы', 'продавцов'],
        'farmworker'=> ['крестьянин', 'крестьяне', 'крестьян'],
        'office'    => ['офисный работник', 'офисные работники', 'офисных работников'],
    ];

    public static $_UNIT_TABS = [
        'shop'      => ['info', 'people', 'supply', 'storage', 'shop'],
        'factory'   => ['info', 'people', 'supply', 'sale', 'production'],
        'farm'      => ['info', 'people', 'supply', 'sale', 'production'],
        'storage'   => ['info', 'people', 'supply', 'sale'],
        'mine'      => ['info', 'people', 'sale', 'production'],
        'construction' => ['info', 'people', 'supply', 'construction']
    ];


    public static $_REQUEST_FIELDS = [
        'title' => [
            'name' => 'название',
            'required' => 1
        ],
    ];

    /**
     * @var float|null
     */
    public $buildPerformance = null;

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
        if ($this->type == 'construction') {
            $this->buildPerformance = MyDB::query("SELECT amount FROM production_cost WHERE unitType = ?id", ['id' => $this->id], 'elem');
            $this->buildPerformance = $this->buildPerformance/3600;
        }
    }

    public function save() {
        parent::save();
    }

    public function get_info() {
        $result = $this->get_fields(['id', 'title', 'type', 'cost', 'peopleNeed', 'peopleType', 'officeNeed']);
        return $result;
    }

    /**
     * Список того, что требуется для производства
     * @return array
     * @throws Exception
     */
    public function get_product_cost() {
        return MyDB::query("SELECT * FROM production_cost WHERE unitType = ?unit_type_id", ['unit_type_id' => $this->id]);
    }

    /**
     * Список что тут производится
     * @return array
     * @throws Exception
     */
    public function get_product_making() {
        return MyDB::query("SELECT * FROM production_making WHERE unitType = ?unit_type_id", ['unit_type_id' => $this->id]);
    }
}