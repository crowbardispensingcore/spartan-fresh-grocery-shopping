<?php 
function if_can_add($pdo, $user_id, $product_id, $amount_to_add) {
    $stmt = $pdo->prepare("SELECT quantity FROM item_in_cart WHERE FK_product_id=$product_id AND FK_customer_id = $user_id");
    $stmt->execute();
    $in_cart = $stmt->fetchColumn();

    $stmt = $pdo->prepare("SELECT stock FROM product WHERE product_id = $product_id");
    $stmt->execute();
    $stock = $stmt->fetchColumn();

    $available = $stock - $in_cart;
    if ($amount_to_add > $available) {
        return false;
    }
    return true;
}
?>