<?php 
if(!isset($_SESSION)) {
    session_start();
}
require_once $_SERVER["DOCUMENT_ROOT"] . '/component/db/db_config.php';
$pdo = pdo_connect_mysql();

if(isset($_SESSION["logged_in"]) && $_SESSION["logged_in"] == true) {
    $user_id = $_SESSION['user_id'];

    // Fetch items in cart using the cart id
    $stmt = $pdo->prepare("SELECT * FROM item_in_cart WHERE FK_customer_id = '$user_id'");
    $stmt->execute();
    $items_in_cart = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Calculate item count
    $item_in_cart_count = 0;
    foreach ($items_in_cart as $item) {     
        $item_in_cart_count += $item['quantity'];
    }

    echo $item_in_cart_count;
}
else {
    echo '/';
}
?> 