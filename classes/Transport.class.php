<?php
class Transport
{
    public static $speed = 10;

    /**
     * @param Unit $unitFrom
     * @param Unit $unitTo
     * @return int
     */
    public static function transport_time($unitFrom, $unitTo) {
        if ($unitFrom->city === $unitTo->city) {
            $result = 10*60;
        } elseif ($unitFrom->city->region === $unitTo->city->region) {
            $result = 2*3600;
        } elseif ($unitFrom->city->region->country === $unitTo->city->region->country) {
            $result = 12*3600;
        } else {
            $result = 48*3600;
        }
        $result = round($result / Transport::$speed);
        return $result;
    }

    public static function add($product, $unitFrom, $unitTo) {
        $time = Transport::transport_time($unitFrom, $unitTo);
        MyDB::insert('transport',
            ['productId' => $product->id,
            'unitFrom' => $unitFrom->id,
            'unitTo' => $unitTo->id,
            'startTime' => timestamp_to_db(time()),
            'endTime' => timestamp_to_db(time() + $time)]);
        return true;
    }

    /**
     * @return array
     * @throws Exception
     */
    public static function get_finish() {
        return MyDB::query("SELECT * FROM transport WHERE endTime <= '?time' ORDER BY endTime ASC", ['time' => timestamp_to_db()]);
    }

    public static function delete($id) {
        MyDB::query("DELETE FROM transport WHERE id = ?id", ['id' => $id]);
    }
}