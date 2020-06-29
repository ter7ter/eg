<?php
/**
 * Class Product
 * @property string typeId
 * @property float amount
 * @property float quality
 * @property int unitId
 */
class Product extends Base {
    public static $tablename = 'product';

    public static $_all = [];

    public static $_FIELDS = [
        'typeId',
        'amount',
        'quality',
        'unitId'
    ];

    /**
     * @var ProductType
     */
    public $type;
    /**
     * где сейчас лежит. null - перемещается
     * @var Unit
     */
    public $unit = null;

    public static $_REQUEST_FIELDS = [

    ];

    /**
     * @param $id
     * @return Product|bool
     * @throws Exception
     */
    public static function get($id)
    {
        return parent::get($id);
    }

    public function __construct($data) {
        $this->unitId = null;
        parent::__construct($data);
        $this->type = ProductType::get($this->typeId);
        if ($this->unitId) {
            $this->unit = Unit::get($this->unitId);
        }
    }

    public function save() {
        $this->typeId = $this->type->id;
        if ($this->unit) {
            $this->unitId = $this->unit->id;
        } else {
            $this->unitId = null;
        }
        parent::save();
    }

    public function separate($amount) {
        if ($amount >= $this->amount) {
            return false;
        }
        $product = new Product(
            ['typeId' => $this->typeId,
            'quality' => $this->quality,
            'unitId'  => $this->unitId]
        );
        $product->amount = $amount;
        $this->amount -= $amount;
        return $product;
    }

    /**
     * Объеденить с другим продуктом
     * @param Product $product
     * @return bool
     */
    public function union($product) {
        if ($product->type !== $this->type) {
            return false;
        }
        $quality = ($this->amount*$this->quality + $product->amount*$product->quality)/($this->amount + $product->amount);
        $this->quality = $quality;
        $this->amount += $product->amount;
        $this->save();
        $product->delete();
        return true;
    }

    /**
     * Добавить количество
     * @param $amount
     * @param $quality
     */
    public function add($amount, $quality) {
        $this->quality = ($this->amount*$this->quality + $amount*$quality)/($this->amount + $amount);
        $this->amount += $amount;
    }

    /**
     * Осуществить продажу в магазине
     * !!Не сохраняет баланс компании, предпологается сохранить познее
     * @param int $amount
     * @param float $price
     * @return int
     */
    public function sell($amount, $price) {
        if ($this->type->type != 'final') {
            return 0;
        }
        if (!$this->unit || $this->unit->type->type != 'shop') {
            return 0;
        }
        if ($this->amount < $amount) {
            $amount = $this->amount;
        }
        $this->amount -= $amount;
        $this->unit->company->money += $price*$amount;
        MyDB::insert("unit_sale",
            [   'type' => 'shop',
                'unitFrom' => $this->unit->id,
                'unitTo' => 'NULL',
                'productType' => $this->type->id,
                'valueFrom' => $price*$amount,
                'valueTo' => 0,
                'amount' => $amount,
                'quality' => $this->quality,
                'date' => timestamp_to_db()]);
        if ($this->amount == 0) {
            $this->delete();
        } else {
            $this->save();
        }
        return $amount;
    }

    public function get_sale_data() {
        if (!$this->unit) {
            return false;
        }
        return MyDB::query("SELECT * FROM product_sale WHERE typeId = ?type_id AND unitId = ?unit_id",
            ['type_id' => $this->type->id, 'unit_id' => $this->unit->id], 'row');
    }

    /**
     * Осуществить закупку
     * @param int $amount
     * @param Unit $unitTo
     * @return bool
     */
    public function buy($amount, $unitTo) {
        $saleData = $this->get_sale_data();
        if (!$saleData) {
            return false;
        }
        if ($saleData['access'] == 'close') {
            return false;
        }
        if ($saleData['access'] == 'private' && $this->unit->company != $unitTo->company) {
            return false;
        }
        if ($this->unit->company != $unitTo->company && $amount*$saleData['price'] < $this->unit->company->money) {
            return false;
        }
        if ($this->amount < $amount) {
            $amount = floor($this->amount);
        }
        if ($amount < 1) {
            return false;
        }
        $amountFrom = $amount*$saleData['price'];
        $amountTo = -1*$amount*$saleData['price'];
        MyDB::insert('unit_sale',
            ['type' => 'sale',
            'unitFrom' => $this->unit->id,
            'unitTo' => $unitTo->id,
            'productType' => $this->type->id,
            'valueFrom' => $amountFrom,
            'valueTo' => $amountTo,
            'amount' => $amount,
            'quality' => $this->quality,
            'date' => timestamp_to_db()]);
        $this->unit->company->money += $amountFrom;
        $unitTo->company->money += $amountTo;
        $this->unit->company->save();
        if ($this->unit->company != $unitTo->company) {
            $unitTo->company->save();
        }
        $result = $this->transport($unitTo, $amount);
        return $result;
    }

    /**
     * @param Unit $unitTo
     * @param float $amount
     * @return bool
     */
    public function transport($unitTo, $amount) {
        $unitFrom = $this->unit;
        if (!$unitFrom) {
            //Оно уже куда то едет
            return false;
        }
        if ($this->amount > $amount) {
            $product = $this->separate($amount);
            $this->save();
        } else {
            $product = $this;
        }
        $product->unit = null;
        $product->save();
        Transport::add($product, $unitFrom, $unitTo);
        return true;
    }

    public function get_info() {
        $result = $this->get_fields(['id', 'amount', 'quality']);
        $result['type'] = $this->type->get_info();
        return $result;
    }
}