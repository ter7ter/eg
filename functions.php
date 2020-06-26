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
function timestamp_to_db($time) {
    return date('Y-m-d H:i:s', $time);
}
function format_date($date, $time = false) {
    $date = strtotime($date);
    return format_timestamp($date, $time);
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