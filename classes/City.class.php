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

    public static function get_builder_query() {
        $query = " FROM unit 
            INNER JOIN unit_type ON unit_type.id = unit.typeId
            INNER JOIN unit_construction ON unit_construction.unitId = unit.id
            INNER JOIN product ON product.unitId = unit.id
            INNER JOIN production_cost ON production_cost.unitType = unit.typeId
            LEFT JOIN unit_making ON unit_making.unitId = unit.id
            WHERE unit_type.type = 'construction' AND unit.cityId = ?city_id AND 
            (unit_construction.access = 'all' OR (unit_construction.access = 'private' AND unit.companyId = ?company_id)) AND
            product.typeId = ".CONSTRUCTION_MATERIAL." AND production_cost.productType = ".CONSTRUCTION_MATERIAL." AND
            ?cost <= product.amount GROUP BY unit.id";
        return $query;
    }

    /**
     * @param UnitType $unitType
     * @param Company $company
     * @param array $order
     * @param int $start
     * @param bool|int $limit
     * @return array
     * @throws Exception
     */
    public function get_builder_list($unitType, $company, $order = [], $start = 0, $limit = false) {
        $query = "SELECT unit.id as unitId, unit.companyId,
            unit_construction.price, unit_construction.access, production_cost.amount as performance,
            product.quality, product.amount, sum(unit_making.remaindCost) as amountBusy ".City::get_builder_query();
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
        $rows = MyDB::query($query,
            ['city_id' => $this->id, 'order' => $orderField, 'cost' => $unitType->cost, 'company_id' => $company->id, 'direction' => $orderDirection, 'start' => $start, 'limit' => $limit]);
        $result = [];
        foreach ($rows as $row) {
            $row['company'] = Company::get($row['companyId']);
            $row['unit'] = Unit::get($row['unitId']);
            $result[] = $row;
        }
        return $result;
    }

    public function get_builder_list_count($unitType, $company) {
        $query = "SELECT count(*) ".City::get_builder_query();
        return MyDB::query($query, ['city_id' => $this->id, 'company_id' => $company->id, 'cost' => $unitType->cost], 'elem');
    }

    /**
     * @param string $type
     * @return array
     * @throws Exception
     */
    public function get_population_data($type) {
        return MyDB::query("SELECT amount, quality, pay, dispersionQuality, dispersionPay FROM population 
            WHERE cityId = ?city_id AND type = '?type'", ['city_id' => $this->id, 'type' => $type], 'row');
    }

    /**
     * @param string $peopleType
     * @param float $pay
     * @return bool|float
     * @throws Exception
     */
    public function calculate_people_quality($peopleType, $pay) {
        $populationData = $this->get_population_data($peopleType);
        if ($pay < $populationData['pay'] / $populationData['dispersionPay'])  {
            return false;
        }
        $payFactor =  $pay / $populationData['pay'];
        if ($payFactor > $populationData['dispersionPay']) {
            $payFactor = $populationData['dispersionPay'];
        }
        $payFactor = ($payFactor-1)/($populationData['dispersionPay'] - 1);
        $peopleQuality = $populationData['quality']*($payFactor * ($populationData['dispersionQuality']-1) + 1);
        return $peopleQuality;
    }

    public function update_population($peopleType, $peopleCount, $peopleQuality) {
        MyDB::query("UPDATE population SET amount = ?amount, quality = '?quality' WHERE cityId = ?city_id AND type = '?type'",
            ['amount' => $peopleCount, 'quality' => $peopleQuality, 'city_id' => $this->id, 'type' => $peopleType]);
    }

    /**
     * Добавить к свободной рабочей силе города
     * @param string $peopleType
     * @param int $peopleCount
     * @param float $peopleQuality
     * @throws Exception
     */
    public function add_population($peopleType, $peopleCount, $peopleQuality) {
        $populationData = $this->get_population_data($peopleType);
        $sumQuality = $populationData['amount']*$populationData['quality'];
        $sumQuality += $peopleCount*$peopleQuality;
        $populationData['amount'] += $peopleCount;
        $populationData['quality'] = $sumQuality / $populationData['amount'];
        $this->update_population($peopleType, $populationData['amount'], $populationData['quality']);
    }
}