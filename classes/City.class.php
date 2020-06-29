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
        $query = " unit_type.cost, product.amount, sum(unit_making.remaindCost) as amountBusy  FROM unit 
            INNER JOIN unit_type ON unit_type.id = unit.typeId
            INNER JOIN unit_construction ON unit_construction.unitId = unit.id
            INNER JOIN product ON product.unitId = unit.id
            INNER JOIN production_cost ON production_cost.unitType = unit.typeId
            LEFT JOIN unit_making ON unit_making.unitId = unit.id
            WHERE unit_type.type = 'construction' AND unit.cityId = ?city_id AND 
            (unit_construction.access = 'all' OR (unit_construction.access = 'private' AND unit.companyId = ?company_id)) AND
            product.typeId = ".CONSTRUCTION_MATERIAL." AND production_cost.productType = ".CONSTRUCTION_MATERIAL." 
            GROUP BY unit.id 
            HAVING (amountBusy + unit_type.cost <= product.amount) OR (amountBusy IS NULL AND unit_type.cost <= product.amount)";
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
            product.quality,".City::get_builder_query();
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
            ['city_id' => $this->id, 'order' => $orderField, 'company_id' => $company->id, 'direction' => $orderDirection, 'start' => $start, 'limit' => $limit]);
        $result = [];
        foreach ($rows as $row) {
            $row['company'] = Company::get($row['companyId']);
            $row['unit'] = Unit::get($row['unitId']);
            $result[] = $row;
        }
        return $result;
    }

    public function get_builder_list_count($unitType, $company) {
        $query = "SELECT ".City::get_builder_query();
        return MyDB::query($query, ['city_id' => $this->id, 'company_id' => $company->id], 'num_rows');
    }
}