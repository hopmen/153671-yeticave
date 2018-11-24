<?php

/**
 * Шаблонизатор
 *
 * @param string $name      название поключаемого файла
 * @param array $data       массив с данными для поключаемого файла
 * @return false|string     верстка шаблона
 */
function include_template($name, $data) {
    $name = 'templates/' . $name;
    /** @var false|string $result результат выполнения вукции */
    $result = '';

    if (!file_exists($name)) {
        return $result;
    }

    ob_start();
    extract($data);
    require $name;


    $result = ob_get_clean();

    return $result;
}

/**
 * получить форматированую цену с знаком рубля
 *
 * @param integer $number       число для преобразования
 * @return string               форматирваная цена с знаком рубля(b.rub)
 */
function get_format_price($number){
    $number = ceil($number);
    return number_format($number,0,null, ' ') . ' <b class="rub">р</b>';
}

/**
 * получить время отсавшее время до 00:00
 * @return string  время в формате часы:минуты
 */
function get_time_before_midnight() {
    $midnight = strtotime('tomorrow midnight');
    $before_midnight_hours = strval(floor(($midnight - time()) / 3600));
    $before_midnight_minutes = strval(floor((($midnight - time()) % 3600) / 60));
    return $before_midnight_hours . ':' . $before_midnight_minutes;
}