<?php
/**
 * Class Company
 * @property string title
 * @property int userId
 * @property int currencyId
 * @property float money
 */
class Company extends Base {
    public static $tablename = 'company';

    public static $_all = [];

    public static $_FIELDS = [
        'title',
        'userId',
        'money',
        'currencyId'
    ];

    public static $_REQUEST_FIELDS = [
        'title' => [
            'name' => 'название компании',
            'pattern' => '/^[a-zA-ZйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ][a-zA-Z0-9йцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ _-]+$/',
            'minLength' => COMPANY_TITLE_MIN,
            'maxLength' => COMPANY_TITLE_MAX,
        ],
        'money' => [
            'name' => 'стартовый капитал',
            'required' => true,
        ],
    ];


    /**
     * @var Currency
     */
    public $currency;

    /**
     * @var User
     */
    public $user;

    /**
     * @param $id
     * @return Company|bool
     * @throws Exception
     */
    public static function get($id)
    {
        return parent::get($id);
    }

    public function __construct($data) {
        parent::__construct($data);

        $this->user = User::get($this->userId);
        $this->currency = User::get($this->currencyId);
    }

    public function save() {
        $this->userId = $this->user->id;
        $this->currencyId = $this->currency->id;
        parent::save();
    }

    public function validate(&$errors) {
        parent::validate($errors);
        if (count($errors) == 0) {
            return true;
        } else {
            return false;
        }
    }

    public function get_info($owner = false) {
        if ($owner) {
            $data = $this->get_fields(['title', 'money']);
        } else {
            $data = $this->get_fields(['title']);
        }
        $data['currency'] = $this->currency->get_info();
        $data['user'] = $this->user->get_info();
    }
}