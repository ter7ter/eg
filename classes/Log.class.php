<?php

/**
 * Class Log
 * @property string type
 * @property int userId
 * @property string date
 * @property string message
 */
class Log extends Base
{
    public static $tablename = 'log';

    public static $_STATUS = [
        'message_send'  =>  'отправка сообщения',
        'message_delete' =>  'удаление сообщения',
        'account_change' =>     'изменил личные данные профиля',
        'forum_thread_create' => 'создал тему форума',
        'forum_message_write' => 'отправил сообщение на форуме',
        'forum_message_edit' => 'отредактировал сообщение на форуме',
        'forum_message_delete' => 'удалил сообщение на форуме',
        'forum_thread_delete' => 'удалил тему на форуме',
        'user_login'        => 'пользователь зашёл на сайт',
        'moderate'          => 'действия модератора',
        'account_change_password' => ' изменил пароль',
    ];

    public static $_all = [];

    public static $_FIELDS = [
        'type',
        'date',
        'userId',
        'message'
    ];

    /**
     * @var User
     */
    public $user;

    /**
     * @param $id
     * @return Log|bool
     * @throws Exception
     */
    public static function get($id)
    {
        return parent::get($id);
    }

    public function __construct($data)
    {
        parent::__construct($data);
        if ($this->userId) {
            $this->user = User::get($this->userId);
        }
    }

    public function save() {
        if ($this->user) {
            $this->userId = $this->user->id;
        }
        parent::save();
    }
}