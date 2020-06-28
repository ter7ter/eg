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

    public static $_all = [];

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

    /**
     * @return Product[]
     */
    public function get_products() {
        $list = Product::get_list(['unitId' => $this->id]);
        $result = [];
        foreach ($list as $item) {
            $result[$item->type->id] = $item;
        }
        return $result;
    }

    public function get_product_sells() {
        return MyDB::query("SELECT product_sale.typeId, product_sale.price, product_sale.access FROM product_sale 
            INNER JOIN product ON product.typeId = product_sale.typeId AND product.unitId = product_sale.unitId
            WHERE product_sale.unitId = ?id", ['id' => $this->id]);
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

    /**
     * @return array
     * @throws Exception
     */
    public function get_transport_to() {
        $trasport = MyDB::query("SELECT transport.id, transport.unitFrom as unitId, transport.startTime, transport.endTime, 
            product.amount, product.quality, product.typeId FROM transport 
            INNER JOIN product ON product.id = transport.productId
            WHERE unitTo = ?id", ['id' => $this->id]);
        return $trasport;
    }

    /**
     * @return array
     * @throws Exception
     */
    public function get_transport_from() {
        $trasport = MyDB::query("SELECT transport.id, transport.unitFrom as unitId, transport.startTime, transport.endTime, 
            product.amount, product.quality, product.typeId FROM transport 
            INNER JOIN product ON product.id = transport.productId
            WHERE unitFrom = ?id", ['id' => $this->id]);
        return $trasport;
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
        }
    }

    public function calculateShopFactor() {
        if ($this->type->type != 'shop') {
            return false;
        }
        $sells = MyDB::query("SELECT product.id, product.quality, 
            product_shop.typeId, product_shop.shopFactor, product_shop.price FROM product_shop
            INNER JOIN product ON product.typeId = product_shop.typeId AND product.unitId = product_shop.unitId
            WHERE product_shop.unitId = ?id AND price > 0 AND product.amount >= 1", ['id' => $this->id]);
        foreach ($sells as $sell) {
            $factor = $sell['quality']/$sell['price'];
            MyDB::update('product_shop', ['shopFactor' => $factor], " unitId = {$this->id} AND typeId = {$sell['typeId']}");
        }
    }

    public function get_info($owner = false) {
        $result = $this->get_fields(['id', 'title']);
        $result['type'] = $this->type->get_info();
        return $result;
    }

    public function update_sell_price($typeId, $price, $access) {
        $price = floatval($price);
        if (!in_array($access, ['all', 'private', 'list', 'close'])) {
            $access = 'close';
        }
        MyDB::query("INSERT INTO product_sale 
            SET unitId = ?unit_id, typeId = ?type_id, price = '?price', access = '?access', currencyId = ?currency_id
            ON DUPLICATE KEY UPDATE price = '?price', access = '?access', currencyId = ?currency_id",
            ['unit_id' => $this->id, 'type_id' => $typeId, 'currency_id' => $this->company->currency->id, 'price' => $price, 'access' => $access]);
    }

    private static function supply_query() {
        $query = "FROM product_sale
            INNER JOIN product on product.typeId = product_sale.typeId AND product.unitId = product_sale.unitId
            INNER JOIN unit ON unit.id = product_sale.unitId
            WHERE (product_sale.access = 'all' OR (product_sale.access = 'private' AND unit.companyId = ?company_id))
            AND product_sale.typeId = ?type_id AND product.amount >=1 AND product_sale.currencyId = ?currency_id
            AND product_sale.unitId != ?unit_id";
        return $query;
    }

    /**
     * @param ProductType $productType
     * @param array $order
     * @param int $start
     * @param bool|int $limit
     * @return array
     * @throws Exception
     */
    public function get_supply_list($productType, $order = [], $start = 0, $limit = false) {
        $query = "SELECT product_sale.price, product_sale.access, product_sale.unitId, product.amount, product.quality ".Unit::supply_query();
        if (count($order)) {
            $orderField = array_key_first($order);
            $orderDirection = $order[$orderField];
        } else {
            $orderField = 'price';
            $orderDirection = 'DESC';
        }

        $query .= " ORDER BY ?order ?direction";
        if ($limit) {
            $query .= " LIMIT ?start, ?limit";
        }
        $list = MyDB::query($query,
            ['company_id' => $this->company->id, 'type_id' => $productType->id, 'currency_id' => $this->company->currency->id,
            'unit_id' => $this->id, 'order' => $orderField, 'direction' => $orderDirection, 'start' => $start, 'limit' => $limit]);
        return $list;
    }

    /**
     * @param ProductType $productType
     * @return int
     * @throws Exception
     */
    public function get_supply_list_count($productType) {
        $query = "SELECT count(*) ".Unit::supply_query();
        return MyDB::query($query, ['company_id' => $this->company->id, 'type_id' => $productType->id, 'currency_id' => $this->company->currency->id, 'unit_id' => $this->id], 'elem');
    }
}