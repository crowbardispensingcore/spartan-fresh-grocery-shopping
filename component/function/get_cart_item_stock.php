<?php 
if(!isset($_SESSION)) {
    session_start();
}

require_once $_SERVER["DOCUMENT_ROOT"] . '/component/db/db_config.php';

$pdo = pdo_connect_mysql();
$item_id = $_POST['item_id'];

$stmt = $pdo->prepare("SELECT FK_product_id FROM item_in_cart WHERE item_id = $item_id");
$stmt->execute();
$product_id = $stmt->fetchColumn();

$stmt = $pdo->prepare("SELECT stock FROM product WHERE product_id = $product_id");
$stmt->execute();
$stock = $stmt->fetchColumn();

echo $stock;
?>