<?php
/**
 * Class User
 * @property string login
 * @property string password
 * @property int money
 * @property string lastLogin
 * @property string lastActiv
 * @property string registerDate
 * @property string block
 */
class User extends Base {
    public static $tablename = 'user';

    public static $_all = [];

    public static $_FIELDS = [
        'login',
        'password',
        'money',
        'lastLogin',
        'lastActiv',
        'registerDate',
        'block',         //Заблокирован ли пользователь
    ];

    /**
     * @param $id
     * @return User|bool
     * @throws Exception
     */
    public static function get($id) {
        return parent::get($id);
    }

	public function __construct($data = []) {
        $this->block = null;
		parent::__construct($data);
	}
	
	public function save() {
		parent::save();
	}

    /**
     * Регистрация нового пользователя
     * @throws Exception
     */
	public function register() {
        $this->lastLogin = date('Y-m-d H:i:s');
        $this->lastActiv = $this->lastLogin;
        $this->registerDate = $this->lastLogin;
        $this->block = null;
        $this->money = USER_START_MONEY;
        return true;
    }


    /**
     * Проверка валидности данных пользователя
     * @param $errors
     * @return bool
     * @throws Exception
     */
    public function validate(&$errors) {
	    if (!$this->login) {
            $errors[] = 'Вы не ввели логин';
        }
        if (mb_strlen($this->login) < USER_MIN_LOGIN) {
            $errors[] = 'Логин должен содержать не менее '.USER_MIN_LOGIN.' символов';
        }
        if (mb_strlen($this->login) > USER_MAX_LOGIN) {
            $errors[] = 'Логин должен содержать не более '.USER_MAX_LOGIN.' символов';
        }
        if (!preg_match('/^[a-zA-Z0-9]+$/', $this->login)) {
            $errors[] = 'Логин должен содержать только латинские буквы и цифры';
        }
        if (count($errors)) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * Авторизация пользователя
     * @param string $login
     * @param string $password
     * @return bool|User
     * @throws Exception
     */
    public static function login($login, $password) {
	    $hash = md5($password.PASSWORD_SALT);
	    $userId = MyDB::query("SELECT id FROM user WHERE login = '?login' AND password = '?pass'",
            ['login' => $login, 'pass' => $hash], 'elem');
	    if ($userId) {
	        $user = User::get($userId);
	        $user->lastLogin = date('Y-m-d H:i:s');
	        $user->write_log("user_login", 'Залогинился');
	        return $user;
        } else {
	        return false;
        }
    }

    /**
     * Проверяет пароль на соотвествие требованиям необходимой сложности
     * @param string $password
     * @return bool
     */
    public static function check_password($password) {
        return true;
    }

    /**
     * Проверяет используется ли уже такой логин
     * @param string $login
     * @return bool
     * @throws Exception
     */
    public function check_free_login($login = null) {
        if (!$login) {
            $login = $this->login;
        }
        $query = "SELECT count(*) FROM user WHERE login = '?login'";
        if ($this->id) {
            $query .= " AND id != ?id";
        }
        if (MyDB::query($query, ['login' => $login, 'id' => @$this->id], 'elem')) {
            return false;
        } else {
            return true;
        }
    }


    /**
     * @param User $from
     * @param string $message
     * @return Message
     */
    public function write_message($from, $message) {
        $message = new Message([
            'fromId' => $from->id,
            'toId' => $this->id,
            'message' => mb_substr(htmlspecialchars($message), 0, 5000),
            'date' => date('Y-m-d H:i:s'),
            'unread' => 1
        ]);
        $message->save();
        $from->write_log('message_send', 'Отправлено сообщение пользователю '.$this->login);
        return $message;
    }

    /**
     * Возвращает количество непрочитанных входящих сообщений пользователя
     * @return int
     * @throws Exception
     */
    public function get_unread_messages_count() {
        return MyDB::query("SELECT count(id) FROM message WHERE toId = ?uid AND unread = 1 AND hideIn = 0", ['uid' => $this->id], 'elem');
    }

    public function get_last_message_id() {
        $result = MyDB::query("SELECT id FROM message WHERE (toId = ?id OR fromId = ?id) AND hideIn = 0 ORDER BY `date` DESC LIMIT 1", ['id' => $this->id], 'elem');
        if (!$result) {
            $result = 0;
        }
        return $result;
    }


    /**
     * Возвращает все чаты пользователя
     * @param int|bool $start
     * @param int|bool $limit
     * @return Chat[]
     * @throws Exception
     */
    public function get_chats($start = false, $limit = false) {
        $result = [];
        $query = "SELECT fromId, toId, MAX(date) as last FROM `message` 
            WHERE (toId = ?id AND hideIn = 0) OR (fromId = ?id AND hideOut = 0)  GROUP BY toId*fromId ORDER BY `last` DESC";
        if ($start || $limit) {
            $query .= ' LIMIT ?start, ?limit';
        }
        $rows = MyDB::query($query, ['id' => $this->id, 'start' => $start, 'limit' => $limit]);
        foreach ($rows as $row) {
            $result[] = new Chat(User::get($row['fromId']), User::get($row['toId']));
        }
        return $result;
    }

    public function set_password($password) {
        $this->password = md5($password.PASSWORD_SALT);
    }

    /**
     * Возвращает онлайн ли пользователь
     * @return bool
     */
    public function is_online() {
        if (strtotime($this->last_activ) + USER_ONLINE_TIME > time() ) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * Возвращает количество новых уведомлений у пользователя
     * @return int
     * @throws Exception
     */
    public function get_notify_count() {
        return MyDB::query("SELECT count(*) FROM notification WHERE unread = 1 AND userId = ?id", ['id' => $this->id], 'elem');
    }

    /**
     * @param bool|int $limit
     * @return Notification[]
     * @throws Exception
     */
    public function get_notifications($limit = false) {
        $query = "SELECT * FROM notification WHERE userId = ?id ORDER BY `date` DESC";
        if (intval($limit)) {
            $query .= ' LIMIT ?limit';
        }
        $rows = MyDB::query($query, ['id' => $this->id, 'limit' => intval($limit)]);
        MyDB::query("UPDATE notification SET unread = 0 WHERE userId = ?id", ['id' => $this->id]);
        $result = [];
        foreach ($rows as $row) {
            $result[] = new Notification($row);
        }
        return $result;
    }

    /**
     * Добавляет уведомление для пользователя
     * @param string $message
     * @param array $params
     * @param string $type
     * @return Notification
     * @throws Exception
     */
    public function add_notification($message, $params = [], $type = 'deal_message') {
        $notification = new Notification([
            'userId' => $this->id,
            'type' => $type,
            'message' => $message,
            'params' => count($params) == 0 ? null : json_encode($params),
            'date' => date('Y-m-d H:i:s')]);
        $notification->save();
        return $notification;
    }

    /**
     * Запись действия пользователя в лог
     * @param string $type
     * @param string $message
     */
    public function write_log($type, $message) {
        $log = new Log([
            'type' => $type,
            'userId' => $this->id,
            'date' => date('Y-m-d H:i:s'),
            'message' => $message
        ]);
        $log->save();
    }

    public function get_company_list() {
        return Company::get_list(['userId' => $this->id]);
    }

    public function get_info() {
        $data = $this->get_fields(['id', 'login', 'block']);
    }
}