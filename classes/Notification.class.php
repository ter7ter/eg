<?php

/**
 * Класс оповещений пользователя
 * Class Notification
 * @property int userId
 * @property string type
 * @property string message
 * @property string params
 * @property int unread
 * @property string date
 */
class Notification extends Base {
    public static $tablename = 'notification';

    public static $_all = [];

    public static $_FIELDS = [
        'userId',
        'type',
        'params',
        'message',
        'unread',
        'date'
    ];

    public static $_TYPES = [
    ];

    /**
     * @var User $user
     */
    public $user;

    /**
     * @param $id
     * @return Notification|bool
     * @throws Exception
     */
    public static function get($id)
    {
        return parent::get($id);
    }

    public function __construct($data) {
        $this->unread = 1;
        parent::__construct($data);
        $this->user = User::get($this->userId);
    }


    public function save() {
        $this->userId = $this->user->id;
        parent::save();
    }
}