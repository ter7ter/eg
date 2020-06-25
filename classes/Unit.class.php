<?php
/**
 * Class Unit
 * @property string title
 * @property int companyId
 * @property int cityId
 * @property string typeId
 */
class Unit extends Base {
    public static $tablename = 'unit';

    public static $_FIELDS = [
        'title',
        'companyId',
        'cityId',
        'typeId'
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
        return UnitType::get_list(['unitId' => $this->id]);
    }
}