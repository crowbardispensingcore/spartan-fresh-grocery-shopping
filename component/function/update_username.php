<?php 
if(!isset($_SESSION)) {
    session_start();
}
require_once $_SERVER["DOCUMENT_ROOT"] . '/component/db/db_config.php';
$pdo = pdo_connect_mysql();

if(isset($_SESSION["logged_in"]) && $_SESSION["logged_in"] == true) {
    $user_id = $_SESSION['user_id'];

    // Fetch customer's first name
    $stmt = $pdo->prepare("SELECT first_name FROM user WHERE user_id = '$user_id'");
    $stmt->execute();
    $first_name = $stmt->fetchColumn();

    echo $first_name;
}
else {
    echo '/';
}
?>