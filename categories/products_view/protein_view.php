<?php 
session_start();
include 'config.php';
$pdo = pdo_connect_mysql();

// Get all protein items
$stmt = $pdo->prepare("SELECT * FROM product WHERE FK_category_id = 3");
$stmt->execute();
$products = $stmt->fetchAll(PDO::FETCH_ASSOC);

include_once "header.php";

?>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-center">
        <li><a href="all_category_view.php">All</a></li>
        <li><a href="deals_view.php">Deals</a></li>
        <li><a href="best_seller_view.php">Best Sellers</a></li>
        <li><a href="fruit_view.php">Fruits</a></li>
        <li><a href="vegetable_view.php">Vegetables</a></li>
        <li class="active"><a href="protein_view.php">Protein</a></li>
        <li><a href="dairy_view.php">Dairy</a></li>
        <li><a href="baked_goods_view.php">Baked Goods</a></li>
        <li><a href="sweets_view.php">Sweets</a></li>
    </div>
  </div>
</nav>

<?php
include_once "product_grid.php";
?>