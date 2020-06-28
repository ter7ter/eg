<?php
class Base
{
    /**
     * id в БД
     * @var int
     */
    public $id;

    /**
     * @param $id
     * @return bool | Base
     * @throws Exception
     */
    public static function get($id) {
        $classname = get_called_class();
        if (isset($classname::$_all[$id])) {
            return $classname::$_all[$id];
        } else {
            $data = MyDB::query("SELECT * FROM ?tablename WHERE id = '?id'",
                ['tablename' => $classname::$tablename,'id' => $id], 'row');
            if (!$data) {
                return false;
            }
            $object = new $classname($data);
            if ($object) {
                $classname::$_all[$id] = $object;
                return $object;
            } else {
                return false;
            }
        }
    }


    public function __construct($data) {
        $classname = get_called_class();
        foreach ($classname::$_FIELDS as $field) {
            if (isset($data[$field])) {
                $this->$field = $data[$field];
            }
        }

        if (isset($data['id'])) {
            $this->id = $data['id'];
            if (isset($data['id'])) {
                $this->id = $data['id'];
                $classname::$_all[$this->id] = $this;
            }
        }
    }

    /**
     * Сохраняет объект в БД
     */
    public function save() {
        $classname = get_called_class();

        foreach ($classname::$_FIELDS as $field) {
            $values[$field] = $this->$field;
        }

        if ($this->id) {
            MyDB::update($classname::$tablename, $values, $this->id);
        } else {
            $this->id = MyDB::insert($classname::$tablename, $values);
            $classname::$_all[$this->id] = $this;
        }

    }

    public function delete() {
        $classname = get_called_class();
        MyDB::query("DELETE FROM ?tablename WHERE id = '?id'", ['tablename' => $classname::$tablename, 'id' => $this->id]);
        unset($classname::$_all[$this->id]);
    }

    /**
     * Возвращает все объекты этого типа из БД
     * @return array
     * @throws Exception
     */
    public static function get_all() {
        $classname = get_called_class();
        $rows = MyDB::query("SELECT * FROM ?tablename", ['tablename' => $classname::$tablename]);
        $result = [];
        foreach ($rows as $data) {
            $result[] = new $classname($data);
        }
        return $result;
    }

    private static function list_query(array $filter = [], &$vars, $join = '') {
        $classname = get_called_class();
        $query = " FROM ?tablename".$join;
        $vars['tablename'] = $classname::$tablename;
        if (count($filter) > 0) {
            $query .= ' WHERE ';
            $parts = [];
            foreach ($filter as $field => $value) {
                if (is_array($value)) {
                    if (count($value) == 2 && in_array($value[0], ['>', '>=', '<', '<=', '<>'])) {
                        //Сравнение не с =
                        $parts[] = "`{$field}` {$value[0]} '?{$field}'";
                        $vars[$field] = $value[1];
                    } else {
                        //Перечисление из нескольких значений
                        $db = MyDB::get();
                        $ins = [];
                        foreach ($value as $in) {
                            $ins[] = $db->real_escape_string($in);
                        }
                        $parts[] = "{$field} IN ('".join("','", $ins) ."')";
                    }
                } else {
                    $parts[] = "{$field} = '?{$field}'";
                    $vars[$field] = $value;
                }
            }
            $query .= join(' AND ', $parts);
        }
        return $query;
    }

    public static function get_list_count(array $filter = [], $join = '')
    {
        $classname = get_called_class();
        $vars = [];
        $query = "SELECT count(*) ".$classname::list_query($filter, $vars, $join);
        return MyDB::query($query, $vars, 'elem');
    }

    public static function get_list(array $filter = [], array $order = [], $start = false, $limit =  false, $join = '')
    {
        $classname = get_called_class();
        $vars = [];
        $query = "SELECT {$classname::$tablename}.id ".$classname::list_query($filter, $vars, $join);
        if (count($order) > 0) {
            $parts = [];
            foreach ($order as $field => $value) {
                $parts[] = "`{$field}` $value";
            }
            $query .= 'ORDER BY '.join(', ', $parts);
        }
        if (is_integer($start) || is_integer($limit)) {
            $query .= ' LIMIT '.intval($start).', '.intval($limit);
        }
        $result = [];
        $rows = MyDB::query($query, $vars);
        foreach ($rows as $row) {
            $result[] = $classname::get($row['id']);
        }
        return $result;
    }

    public static function get_list_info(array $filter = [], array $order = [], $start = false, $limit =  false, $join = '')
    {
        $classname = get_called_class();
        $list = $classname::get_list($filter, $order, $start, $limit, $join);
        $result = [];
        foreach ($list as $row) {
            $result[] = $row->get_info();
        }
        return $result;
    }

    public function get_fields($fields) {
        $result = [];
        foreach ($fields as $field) {
            if (isset($this->$field)) {
                $result[$field] = $this->$field;
            }
        }
        return $result;
    }

    public function set_request($REQUEST) {
        $classname = get_called_class();
        foreach ($classname::$_REQUEST_FIELDS as $field => $data) {
            if (isset($REQUEST[$field])) {
                $this->$field = htmlspecialchars($REQUEST[$field]);
            }
        }
    }

    public function validate(array &$errors) {
        $classname = get_called_class();
        foreach ($classname::$_REQUEST_FIELDS as $field => $data) {
            $fieldName = $data['name'];
            if (@$data['required'] && (!isset($this->$field) || !$this->$field)) {
                $errors[] = 'Вы не ввели '.$fieldName;
                continue;
            }
            if (@$data['minLength'] && mb_strlen($this->$field) < $data['minLength']) {
                $errors[] =  "Значение '{$fieldName}' должно быть не короче {$data['minLength']} символов'";
                continue;
            }
            if (@$data['maxLength'] && mb_strlen($this->$field) > $data['maxLength']) {
                $errors[] =  "Значение '{$fieldName}' должно быть не длинее {$data['maxLength']} символов'";
                continue;
            }
            if (@$data['pattern'] && !preg_match($data['pattern'], $this->$field)) {
                $errors[] =  "Недопустимое значение '{$fieldName}'";
                continue;
            }
        }
        if (count($errors) == 0) {
            return true;
        } else {
            return false;
        }
    }

}