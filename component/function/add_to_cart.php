<?php 
if(!isset($_SESSION)) {
    session_start();
}
if(!isset($_SESSION["logged_in"]) || !$_SESSION["logged_in"]) {
    echo "not logged-in";
    exit;
}

require_once $_SERVER["DOCUMENT_ROOT"] . '/component/function/check_if_can_add.php';
require_once $_SERVER["DOCUMENT_ROOT"] . '/component/db/db_config.php';
$pdo = pdo_connect_mysql();
$product_id = $_POST['product_id'];
$user_id = $_SESSION['user_id'];

if (inStock($product_id, $pdo)) {
    add_one_to_cart($product_id, $pdo, $user_id);
    echo 'success';
    exit;
}
else {
    echo 'out of stock';
    exit;
}


function inStock($product_id, $pdo) {
    $stmt = $pdo->prepare("SELECT stock FROM product WHERE product_id = '$product_id'");
    $stmt->execute();
    $stock = $stmt->fetchColumn();
    if ($stock < 1) {
        return false;
    }
    return true;
}

function add_one_to_cart($product_id, $pdo, $user_id) {
    // Check if item is already in cart
    $stmt = $pdo->prepare("SELECT * FROM item_in_cart WHERE FK_product_id = '$product_id' AND FK_customer_id = '$user_id'");
    $stmt->execute();
    $item_in_cart_count = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (!if_can_add($pdo, $user_id, $product_id, 1)) {
        echo 'exceeds current stock';
        exit;
    }

    // If item does not exist in cart, insert the item
    if (!$item_in_cart_count) {
        $stmt = $pdo->prepare("INSERT INTO item_in_cart (FK_customer_id, FK_product_id, quantity) VALUES ('$user_id', '$product_id', 1)");
        $stmt->execute();
    }
    // Else, increment by 1
    else {
        $new_count = $item_in_cart_count[0]['quantity'] + 1;
        $stmt = $pdo->prepare("UPDATE item_in_cart SET quantity = '$new_count' WHERE FK_product_id = '$product_id' AND FK_customer_id = '$user_id'");
        $stmt->execute();
    }
}
?>