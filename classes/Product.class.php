<?php
/**
 * Class Product
 * @property string typeId
 * @property float amount
 * @property float quality
 * @property int unitId
 */
class Product extends Base {
    public static $tablename = 'unit';

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
            $this->unit = UnitType::get($this->unitId);
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
    }

    /**
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

    public function add($amount, $quality) {
        $this->quality = ($this->amount*$this->quality + $amount*$quality)/($this->amount + $amount);
        $this->amount += $amount;
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
        } else {
            $product = $this;
        }
        $product->unitId = null;
        $product->save();
        Transport::add($product, $unitFrom, $unitTo);
        return true;
    }
}