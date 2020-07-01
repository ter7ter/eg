<?php
/**
 * Class Unit
 * @property string title
 * @property string status
 * @property int companyId
 * @property int cityId
 * @property string typeId
 * @property int peopleCount
 * @property float peopleQuality
 * @property float peoplePay
 * @property int officeCount
 * @property float officeQuality
 * @property float officePay
 * @property string lastUpdate
 */
class Unit extends Base {
    public static $tablename = 'unit';

    public static $_all = [];

    public static $_FIELDS = [
        'title',
        'status',
        'companyId',
        'cityId',
        'typeId',
        'peopleCount',
        'peopleQuality',
        'peoplePay',
        'officeCount',
        'officeQuality',
        'officePay',
        'lastUpdate'
    ];

    public static $_STATUS = [
        'build'     => 'строится',
        'work'      => 'работает',
        'update'    => 'модернизируется',
        'close'     => 'закрыто',
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

    public $makePrice = 0;
    public $makeAccess = 'close';

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
        foreach (['office', 'people'] as $type) {
            foreach (['Count', 'Pay', 'Quality'] as $field) {
                $filedName = $type.$field;
                $this->$filedName = 0;
            }
        }
        parent::__construct($data);
        $this->company = Company::get($this->companyId);
        $this->city = City::get($this->cityId);
        $this->type = UnitType::get($this->typeId);
        if ($this->type->type == 'construction') {
            $data = MyDB::query("SELECT * FROM unit_construction WHERE unitId = ?id", ['id' => $this->id], 'row');
            if ($data) {
                $this->makePrice = $data['price'];
                $this->makeAccess = $data['access'];
            }
        }
    }

    public function save() {
        $this->companyId = $this->company->id;
        $this->cityId = $this->city->id;
        $this->typeId = $this->type->id;
        parent::save();
        if ($this->type->type == 'construction') {
            MyDB::query("INSERT INTO unit_construction SET unitId = ?id, price = ?price, access = '?access'
                ON DUPLICATE KEY UPDATE price = ?price, access = '?access'",
                ['id' => $this->id, 'price' => $this->makePrice, 'access' => $this->makeAccess]);
        }
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

    /**
     * Список товаров вкладки "Снабжение"
     * @return Product[]
     * @throws Exception
     */
    public function get_product_supply() {
        if (in_array($this->type, ['shop', 'storage'])) {
            return $this->get_products();
        } else {
            $result = [];
            $needProducts = $this->type->get_product_cost();
            foreach ($needProducts as $need) {
                $product = $this->get_product_by_type(ProductType::get($need['productType']));
                if (!$product) {
                    $product = new Product([
                        'typeId' => $need['productType'],
                        'amount' => 0,
                        'quality' => 0,
                        'unitId' => $this->id
                    ]);
                    $product->save();
                }
                $result[] = $product;
            }
            return $result;
        }
    }

    /**
     * Список товаров вкладки "Сбыт"
     * @return Product[]
     * @throws Exception
     */
    public function get_product_sale() {
        if (in_array($this->type, ['shop', 'storage'])) {
            return $this->get_products();
        } else {
            $result = [];
            $needProducts = $this->type->get_product_making();
            foreach ($needProducts as $need) {
                $product = $this->get_product_by_type(ProductType::get($need['productType']));
                if ($product) {
                    $result[] = $product;
                }
            }
            return $result;
        }
    }

    /**
     * Список товаров, у которых установлены цены на сбыт
     * @return array
     * @throws Exception
     */
    public function get_product_sells() {
        return MyDB::query("SELECT product_sale.typeId, product_sale.price, product_sale.access FROM product_sale 
            INNER JOIN product ON product.typeId = product_sale.typeId AND product.unitId = product_sale.unitId
            WHERE product_sale.unitId = ?id", ['id' => $this->id]);
    }

    /**
     * Список товаров на витрине в магазине
     * @return array
     * @throws Exception
     */
    public function get_product_shop() {
        return MyDB::query("SELECT typeId, price FROM product_shop WHERE unitId = ?unit_id", ['unit_id' => $this->id]);
    }


    /**
     * @param ProductType $type
     * @return Product|bool
     * @throws Exception
     */
    public function get_product_by_type($type) {
        $id = MyDB::query("SELECT id FROM product WHERE typeId = ?type_id AND unitId = ?unit_id",
            ['type_id' => $type->id, 'unit_id' => $this->id], 'elem');
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
        $transport = MyDB::query("SELECT transport.id, transport.unitFrom as unitId, transport.startTime, transport.endTime, 
            product.amount, product.quality, product.typeId FROM transport 
            INNER JOIN product ON product.id = transport.productId
            WHERE unitTo = ?id", ['id' => $this->id]);
        return $transport;
    }

    /**
     * @return array
     * @throws Exception
     */
    public function get_transport_from() {
        $transport = MyDB::query("SELECT transport.id, transport.unitFrom as unitId, transport.startTime, transport.endTime, 
            product.amount, product.quality, product.typeId FROM transport 
            INNER JOIN product ON product.id = transport.productId
            WHERE unitFrom = ?id", ['id' => $this->id]);
        return $transport;
    }

    /**
     * Просчёт производства и строительства
     * @param int $nowTime
     * @throws Exception
     */
    public function calculate($nowTime) {
        if (in_array($this->type->type, ['factory', 'farm', 'mine'])) {
            $production = 1;
            $qualities = [];
            $products = $this->get_products();
            $time = ($nowTime - strtotime($this->lastUpdate)) / 3600;
            $costs = MyDB::query("SELECT * FROM production_cost WHERE unitType = ?type", ['type' => $this->type->id]);
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
            if (count($qualities) == 0) {
                $qualities = [1];
            }
            if ($production > 0) {
                $quality = array_avg($qualities);
                $making = MyDB::query("SELECT * FROM production_making WHERE unitType = ?type", ['type' => $this->type->id]);
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
                    foreach ($costs as $cost) {
                        $products[$cost['productType']]->amount -= $cost['amount'] * $time * $production;
                        $products[$cost['productType']]->save();
                    }
                }
            }
            $this->lastUpdate = timestamp_to_db($nowTime);
            $this->save();
        } elseif ($this->type->type == 'construction') {
            $time = $nowTime - strtotime($this->lastUpdate);
            while ($time > 0) {
                $nextUnit = MyDB::query("SELECT * FROM unit_making WHERE unitId = ?unit_id ORDER BY id ASC LIMIT 1",
                    ['unit_id' => $this->id], 'row');
                if (!$nextUnit) break;
                $needTime = $nextUnit['remaindCost']/$this->type->buildPerformance;
                if ($needTime < $time) {
                    $time -= $needTime;
                    $buildUnit = Unit::get($nextUnit['makeId']);
                    $buildUnit->status = 'work';
                    $buildUnit->lastUpdate = timestamp_to_db($nowTime);
                    $buildUnit->save();
                    MyDB::query("DELETE FROM unit_making WHERE id = ?id", ['id' => $nextUnit['id']]);
                } else {
                    $buildCost = $time*$this->type->buildPerformance;
                    MyDB::update('unit_making', ['remaindCost' => $nextUnit['remaindCost'] - $buildCost], $nextUnit['id']);
                    $time = 0;
                }
            }
            $this->lastUpdate = timestamp_to_db($nowTime);
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
            $factor = 100*($sell['quality']/$sell['price']);
            MyDB::update('product_shop', ['shopFactor' => $factor], " unitId = {$this->id} AND typeId = {$sell['typeId']}");
        }
    }

    public function get_info($owner = false) {
        $result = $this->get_fields(['id', 'title', 'status',
            'peopleCount', 'peopleQuality', 'peoplePay',
            'officeCount', 'officeQuality', 'officePay']);
        $result['type'] = $this->type->get_info();
        if ($this->type->type == 'construction') {
            $result['makePrice'] = $this->makePrice;
            $result['makeAccess'] = $this->makeAccess;
        }
        return $result;
    }

    /**
     * @param int $typeId
     * @param float $price
     * @param string $access
     * @throws Exception
     */
    public function update_sell_price($typeId, $price, $access) {
        $price = floatval($price);
        if (!in_array($access, ['all', 'private', 'list', 'close'])) {
            $access = 'close';
        }
        if ($price <= 0) {
            $price = 0;
            $access = 'close';
        }
        MyDB::query("INSERT INTO product_sale 
            SET unitId = ?unit_id, typeId = ?type_id, price = '?price', access = '?access', currencyId = ?currency_id
            ON DUPLICATE KEY UPDATE price = '?price', access = '?access', currencyId = ?currency_id",
            ['unit_id' => $this->id, 'type_id' => $typeId, 'currency_id' => $this->company->currency->id, 'price' => $price, 'access' => $access]);
    }

    /**
     * @param int $typeId
     * @param float $price
     * @throws Exception
     */
    public function update_shop_price($typeId, $price) {
        $price = floatval($price);
        if ($price < 0) {
            $price = 0;
        }
        MyDB::query("INSERT INTO product_shop 
            SET unitId = ?unit_id, typeId = ?type_id, price = '?price', cityId = ?city_id, shopFactor = 0
            ON DUPLICATE KEY UPDATE price = '?price'",
            ['unit_id' => $this->id, 'type_id' => $typeId, 'price' => $price, 'city_id' => $this->city->id]);
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
            $orderDirection = 'ASC';
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

    /**
     * Возвращает очередь строительства для строительного предприятия
     * @return array
     * @throws Exception
     */
    public function get_construction_queue() {
        if ($this->type->type != 'construction') {
            return [];
        }
        $result = [];
        $list = MyDB::query("SELECT * FROM unit_making WHERE unitId = ?unit_id ORDER BY id", ['unit_id' => $this->id]);
        foreach ($list as $item) {
            $makeUnit = Unit::get($item['makeId']);
            $item['makeUnit'] = $makeUnit;
            $result[] = $item;
        }
        return $result;
    }

    /**
     * @param Unit $unit
     * @return bool
     * @throws Exception
     */
    public function add_construction_queue($unit) {
        $material = $this->get_product_by_type(ProductType::get(CONSTRUCTION_MATERIAL));
        if ($material->amount < $unit->type->cost) {
            return false;
        }
        $this->calculate(time());
        $price = $unit->type->cost*$this->makePrice;
        MyDB::insert('unit_making', [ 'unitId' => $this->id,
                                            'makeId' => $unit->id,
                                            'makingPrice' => $price,
                                            'remaindCost' => $unit->type->cost,
                                            'quality' => $material->quality]);
        $material->amount -= $unit->type->cost;
        $material->save();
        MyDB::insert('unit_sale',
            [   'type' => 'build',
                'unitFrom' => $this->id,
                'unitTo' => $unit->id,
                'productType' => CONSTRUCTION_MATERIAL,
                'valueFrom' => $price,
                'valueTo' => -1*$price,
                'amount' => $unit->type->cost,
                'quality' => $material->quality,
                'date' => timestamp_to_db()]);
        if ($this->company != $unit->company) {
            $this->company += $price;
            $this->company->save();
            $unit->company -= $price;
            $unit->company->save();
        }
        return true;
    }

    public function employ_people($peopleType, $peopleCount, $peoplePay) {
        if ($peopleType == 'office') {
            $needPeople = $this->type->officeNeed - $this->officeCount;
        } else {
            $peopleType = $this->type->peopleType;
            $needPeople = $this->type->peopleNeed - $this->peopleCount;
        }
        if ($needPeople < 1) {
            return false;
        };
        if ($peopleCount > $needPeople) {
            $peopleCount = $needPeople;
        }
        if ($peopleCount < 1) {
            return false;
        }
        $peopleQuality = $this->city->calculate_people_quality($peopleType, $peoplePay);
        if (!$peopleQuality) {
            return false;
        }
        $this->company->money -= ($peoplePay*$peopleCount) / 2;
        $this->company->save();
        if ($peopleType == 'office') {
            $unionQuality = ($this->officeCount*$this->officeQuality + $peopleCount*$peopleQuality) / ($this->officeCount + $peopleCount);
            $this->officePay += ($this->officePay*$this->officeCount + $peoplePay*$peopleCount) / ($this->officeCount + $peopleCount);
            $this->officeQuality = $unionQuality;
            $this->officeCount += $peopleCount;
        } else {
            $unionQuality = ($this->peopleCount*$this->peopleQuality + $peopleCount*$peopleQuality) / ($this->peopleCount + $peopleCount);
            $this->peoplePay += ($this->peoplePay*$this->peopleCount + $peoplePay*$peopleCount) / ($this->peopleCount + $peopleCount);
            $this->peopleQuality = $unionQuality;
            $this->peopleCount += $peopleCount;
        }
        $this->save();
        MyDB::insert('unit_sale', [
            'type' => 'pay',
            'unitTo' => $this->id,
            'valueFrom' => 0,
            'valueTo' => (-1*$peoplePay*$peopleCount) / 2,
            'amount' => $peopleCount,
            'quality' => $peopleQuality,
            'date' => timestamp_to_db()
        ]);
        $this->city->add_population($peopleType, -1*$peopleCount, $peopleQuality);
        return true;
    }

    public function kick_people($peopleType, $peopleCount) {
        if ($peopleType == 'office') {
            if ($peopleCount > $this->officeCount) $peopleCount = $this->officeCount;
            $peoplePay = $this->officePay;
            $peopleQuality = $this->officeQuality;
        } else {
            if ($peopleCount > $this->peopleCount) $peopleCount = $this->peopleCount;
            $peoplePay = $this->peoplePay;
            $peopleQuality = $this->peopleQuality;
            $peopleType = $this->type->peopleType;
        }
        if ($peopleCount < 1) {
            return false;
        };
        $this->company->money -= ($peoplePay*$peopleCount) * 2;
        $this->company->save();
        if ($peopleType == 'office') {
            $this->officeCount -= $peopleCount;
        } else {
            $this->peopleCount -= $peopleCount;
        }
        $this->save();
        MyDB::insert('unit_sale', [
            'type' => 'pay',
            'unitTo' => $this->id,
            'valueFrom' => 0,
            'valueTo' => (-1*$peoplePay*$peopleCount) * 2,
            'amount' => $peopleCount,
            'quality' => $peopleQuality,
            'date' => timestamp_to_db()
        ]);
        $this->city->add_population($peopleType, $peopleCount, $peopleQuality);
        return true;
    }

    public function get_statistic() {
        $queryTo = "SELECT sum(valueTo) FROM unit_sale WHERE unitTo = ?unit_id AND `date` BETWEEN '?date1' AND '?date2'";
        $queryFrom = "SELECT sum(valueFrom) FROM unit_sale WHERE unitFrom = ?unit_id AND `date` BETWEEN '?date1' AND '?date2'";
        $result = [];
        $date2 = timestamp_to_db();
        $result['hour']['valueTo'] = MyDB::query($queryTo,
            ['unit_id' => $this->id, 'date1' => timestamp_to_db(time() - 3600), 'date2' => $date2], 'elem');
        $result['day']['valueTo'] = MyDB::query($queryTo,
            ['unit_id' => $this->id, 'date1' => timestamp_to_db(time() - 24*3600), 'date2' => $date2], 'elem');
        $result['hour']['valueFrom'] = MyDB::query($queryFrom,
            ['unit_id' => $this->id, 'date1' => timestamp_to_db(time() - 3600), 'date2' => $date2], 'elem');
        $result['day']['valueFrom'] = MyDB::query($queryFrom,
            ['unit_id' => $this->id, 'date1' => timestamp_to_db(time() - 24*3600), 'date2' => $date2], 'elem');
        foreach (['day', 'hour'] as $interval) {
            foreach (['valueTo', 'valueFrom'] as $direction) {
                if  (!$result[$interval][$direction]) {
                    $result[$interval][$direction] = 0;
                }
            }
        }
        return $result;
    }
}