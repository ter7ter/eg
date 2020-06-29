<?php
function inc_value(array &$array, $key, $inc) {
    if (isset($array[$key])) {
        $array[$key] += $inc;
    } else {
        $array[$key] = $inc;
    }
}
function array_avg(array $array) {
    return array_sum($array)/count($array);
}
function mb_ucfirst(string $string) {
    return mb_strtoupper(mb_substr($string, 0, 1)).mb_substr($string, 1);
}
function trim_text(string $text, int $length) {
    if (mb_strlen($text) <= $length) {
        return $text;
    } else {
        return mb_substr($text, 0, $length).'...';
    }
}
function format_timestamp($date, $time = false) {
    $day = date('d.m.Y', $date);
    if ($day == date('d.m.Y')) {
        $day = 'Сегодня';
    } elseif ($day == date('d.m.Y', time() - 24*60*60)) {
        $day = 'Вчера';
    }
    if ($time) {
        return $day.date(' H:i', $date);
    } else {
        return $day;
    }
}
function timestamp_to_db($time = false) {
    if (!$time) {
        $time = time();
    }
    return date('Y-m-d H:i:s', $time);
}
function format_date($date, $time = false) {
    $date = strtotime($date);
    return format_timestamp($date, $time);
}
function format_time($time) {
    if (!$time) {
        return 'нет';
    }
    $days = floor($time / 86400);
    $time -= $days*86400;
    $hours = floor($time / 3600);
    $time -= $hours*3600;
    $minutes = floor($time / 60);
    $time -= $minutes*60;
    $result = '';
    if ($days > 0) {
        $result .= $days;
        if ($days % 10 == 1 && $days != 11) {
            $result .= ' день ';
        } elseif ($days % 10 > 1 && $days % 10 < 5 && floor($days / 10) != 1) {
            $result .= ' дня ';
        } else {
            $result .= ' дней ';
        }
    }
    if ($hours > 0) {
        $result .= $hours;
        if ($hours % 10 == 1 && $hours != 11) {
            $result .= ' час ';
        } elseif ($hours % 10 > 1 && $hours % 10 < 5 && floor($hours / 10) != 1) {
            $result .= ' часа ';
        } else {
            $result .= ' часов ';
        }
    }
    if ($minutes > 0) {
        $result .= $minutes;
        if ($minutes % 10 == 1 && $minutes != 11) {
            $result .= ' минута ';
        } elseif ($minutes % 10 > 1 && $minutes % 10 < 5 && floor($minutes / 10) != 1) {
            $result .= ' минуты ';
        } else {
            $result .= ' минут ';
        }
    }
    if ($time > 0) {
        $result .= $time;
        if ($time % 10 == 1 && $time != 11) {
            $result .= ' секунда ';
        } elseif ($time % 10 > 1 && $time % 10 < 5 && floor($time / 10) != 1) {
            $result .= ' секунды ';
        } else {
            $result .= ' секунд ';
        }
    }
    return $result;
}
function format_quality($quality) {
    return round($quality, 2);
}
function check_captha($val) {
    return true;
    $text = $_SESSION['captha_text'] ?? false;
    $val = strtolower($val);
    $val = str_replace('o', '0', $val);
    $time = $_SESSION['captha_time'] ?? false;
    $_SESSION['captha_text'] = null;
    $_SESSION['captha_time'] = null;
    if (!$text || !$time) {
        return false;
    } else {
        if (time() < $time + 3) {
            return false;
        } else {
            if (!$val || $val != $text) {
                return false;
            }
        }
    }
    return true;
}