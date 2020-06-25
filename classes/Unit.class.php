<?php
/**
 * Class Unit
 * @property string title
 * @property int companyId
 * @property int cityId
 * @property string typeId
 * @property string lastUpdate
 */
class Unit extends Base {
    public static $tablename = 'unit';

    public static $_FIELDS = [
        'title',
        'companyId',
        'cityId',
        'typeId',
        'lastUpdate'
    ];

    /**
     * @var Company
     */
    public $company;
    /**
     * @var City
     */
    public $city;
    /**
     * @var UnitType
     */
    public $type;

    public static $_REQUEST_FIELDS = [
        'title' => [
            'name' => 'название',
            'pattern' => '/^[a-zA-ZйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ][a-zA-Z0-9йцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ _-]+$/',
            'minLength' => UNIT_TITLE_MIN,
            'maxLength' => UNIT_TITLE_MAX,
        ],
    ];

    /**
     * @param $id
     * @return Unit|bool
     * @throws Exception
     */
    public static function get($id)
    {
        return parent::get($id);
    }

    public function __construct($data) {
        parent::__construct($data);
        $this->company = Company::get($this->companyId);
        $this->city = City::get($this->cityId);
        $this->type = UnitType::get($this->typeId);
    }

    public function save() {
        $this->companyId = $this->company->id;
        $this->cityId = $this->city->id;
        $this->typeId = $this->type->id;
        parent::save();
    }

    public function get_products() {
        $list = Product::get_list(['unitId' => $this->id]);
        $result = [];
        foreach ($list as $item) {
            $result[$item->type->id] = $item;
        }
        return $result;
    }

    /**
     * @param ProductType $type
     * @return Product|bool
     * @throws Exception
     */
    public function get_product_by_type($type) {
        $id = MyDB::query("SELECT id FROM product WHERE typeId = ?tid", ['tid' => $type->id], 'elem');
        if ($id) {
            return Product::get($id);
        } else {
            return false;
        }
    }

    public function calculate() {
        if (in_array($this->type, ['factory', 'farm', 'mine'])) {
            $production = 1;
            $qualities = [];
            $products = $this->get_products();
            $time = (time() - strtotime($this->lastUpdate)) / 3600;
            $costs = MyDB::query("SELECT * FROM production_cost WHERE unitType = ?type", ['type' => $this->type]);
            foreach ($costs as $cost) {
                if (!isset($products[$cost['productType']])) {
                    $production = 0;
                    break;
                } else {
                    $amount = $products[$cost['productType']]->amount;
                    $qualities[] = $products[$cost['productType']]->quality;
                    if ($amount < $time * $production * $cost['amount']) {
                        $production = $amount / ($time * $cost['amount']);
                    }
                }
            }
            if ($production > 0) {
                $quality = array_avg($qualities);
                $making = MyDB::query("SELECT * FROM production_making WHERE unitType = ?type", ['type' => $this->type]);
                foreach ($making as $make) {
                    if (isset($products[$make['productType']])) {
                        $products[$make['productType']]->add($make['amount'] * $time * $production, $quality * $make['quality']);
                        $products[$make['productType']]->save();
                    } else {
                        $product = new Product(
                            ['typeId' => $make['productType'],
                                'amount' => $make['amount'] * $time * $production,
                                'quality' => $quality * $make['quality'],
                                'unitId' => $this->id]);
                        $product->save();
                    }
                }
            }
            $this->lastUpdate = timestamp_to_db(time());
            $this->save();
        } elseif ($this->type->type == 'shop') {

        }
    }
}