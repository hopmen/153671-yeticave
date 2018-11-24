<?php
/**
 *
 */

require_once('functions.php');
require_once('data.php');

$content = include_template('index.php', [
    'category_list' => $category_list,
    'list_lots' => $list_lots
]);
$layout_page = include_template('layout.php', [
    'title_page' => 'Главная',
    'is_auth' => $is_auth,
    'user_avatar' => $user_avatar,
    'user_name' => $user_name,
    'content' => $content,
    'category_list' => $category_list
]);

print($layout_page);
