<?php 

// Connect to database function

// Get first name, given the user id
function get_first_name($user_id) {
    $pdo = pdo_connect_mysql();
    $stmt = $pdo->prepare("SELECT first_name FROM user WHERE user_id = '$user_id'");
    $stmt->execute();
    $first_name = $stmt->fetchColumn(); 
    return $first_name;
}

// Get cart quantity, given the user id
function get_cart_quantity($user_id)
{
    $pdo = pdo_connect_mysql();
    $stmt = $pdo->prepare("SELECT * FROM item_in_cart WHERE FK_customer_id = '$user_id'");
    $stmt->execute();
    $items_in_cart = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $item_in_cart_count = count($items_in_cart);
    return $item_in_cart_count;
}


// Set up required variables

require_once $_SERVER["DOCUMENT_ROOT"] . '/component/db/db_config.php';

$pdo = pdo_connect_mysql();
// $user_id = $_SESSION['user_id'];

// // Fetch customer's first name
// $first_name = get_first_name($user_id);

// // Fetch item in cart count
// $stmt = $pdo->prepare("SELECT * FROM item_in_cart WHERE FK_customer_id = '$user_id'");
// $stmt->execute();
// $items_in_cart = $stmt->fetchAll(PDO::FETCH_ASSOC);
// $item_in_cart_count = get_cart_quantity($user_id);

include "modify_cart.php";
?>