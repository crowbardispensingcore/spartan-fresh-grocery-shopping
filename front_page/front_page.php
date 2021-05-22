<?php 
if(!isset($_SESSION)) {
    session_start();
}
require_once $_SERVER["DOCUMENT_ROOT"] . '/component/db/db_config.php';
require_once $_SERVER["DOCUMENT_ROOT"] . '/component/product_card/product_card.php';

$pdo = pdo_connect_mysql();

// Get products in sorted stock
$stmt = $pdo->prepare("SELECT * FROM product WHERE stock > 0");
$stmt->execute();
$best_seller_products = $stmt->fetchAll(PDO::FETCH_ASSOC);
usort($best_seller_products, function ($item1, $item2) {
    // return ($item1['price'] - ($item1['price'] * $item1['discount'] / 100))  <=> ($item2['price'] - ($item2['price'] * $item2['discount'] / 100));
    return ($item1['stock'] <=> $item2['stock']);
});

// Get discounted products
$stmt = $pdo->prepare("SELECT * FROM product WHERE discount > 0");
$stmt->execute();
$discounted_products = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Spartan Fresh</title>
    <link rel="stylesheet" href="./css/layout.css">
    <link rel="stylesheet" href="./css/promo_slideshow.css">
    <link rel="stylesheet" href="../component/product_card/product_card.css">
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet'>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="./js/promo_slide.js" defer></script>
    <script src="../component/product_card/product_card.js"></script>
</head>
<?php 
require_once $_SERVER["DOCUMENT_ROOT"] . '/component/head_nav/head_nav.php';
?>
<body>
    <div class="category-container">
        <div class="category-card" onclick="window.location.href='../categories/products_view/all_category_view.php';">
            <img id="all-icon" src="../resource/icon/category/all.png">
            <span>All</span>
        </div>
        <div class="category-card" onclick="window.location.href='../categories/products_view/fruit_view.php';">
            <img src="../resource/icon/category/grapes.png">
            <span>Fruits</span>
        </div>
        <div class="category-card" onclick="window.location.href='../categories/products_view/vegetable_view.php';">
            <img src="../resource/icon/category/cabbage.png">
            <span>Vegetables</span>
        </div>
        <div class="category-card" onclick="window.location.href='../categories/products_view/protein_view.php';">
            <img src="../resource/icon/category/meat.png">
            <span>Protein</span>
        </div>
        <div class="category-card" onclick="window.location.href='../categories/products_view/dairy_view.php';">
            <img src="../resource/icon/category/dairy.png">
            <span>Dairy</span>
        </div>
        <div class="category-card" onclick="window.location.href='../categories/products_view/baked_goods_view.php';">
            <img src="../resource/icon/category/bread.png">
            <span>Baked Goods</span>
        </div>
        <div class="category-card" onclick="window.location.href='../categories/products_view/sweets_view.php';">
            <img src="../resource/icon/category/chips.png">
            <span>Sweets</span>
        </div>
    </div>

    <div class="promo-slide-container">
        <div class="promo-slide">
            <img src="../resource/img/promotion/promo_1.png">
        </div>
        <div class="promo-slide">
            <img src="../resource/img/promotion/promo_2.png">
        </div>
        <div class="promo-slide">
            <img src="../resource/img/promotion/promo_3.png">
        </div>

        <button class="prev-slide" onclick="switchSlide(-1)">&#10094;</button>
        <button class="next-slide" onclick="switchSlide(1)">&#10095;</button>
    </div>


    <div class="featued-container">
        <div class="featued-info">
            <div class="featued-title">
                Deals
            </div>
            <button onclick="window.location.href= location.protocol + '\/\/' + location.host + '/categories/products_view/deals_view.php';">
                See All &#10095;
            </button>
        </div>
        <div class="featured-card-container">
        <?php 
            $card = new ProductCard();

            $discounted_product_num = sizeof($discounted_products);
            if ($discounted_product_num > 6) {
                $discounted_product_num = 6;
            }
            for ($x = 0; $x < $discounted_product_num; $x++) {
                $card->generateCard($discounted_products[$x]['product_id']);
            }
            ?>
        </div>
    </div>

    <div class="featued-container">
        <div class="featued-info">
            <div class="featued-title">
                Best Sellers
            </div>
            <button onclick="window.location.href= location.protocol + '\/\/' + location.host + '/categories/products_view/best_seller_view.php';">
                See All &#10095;
            </button>
        </div>
        <div class="featured-card-container">
            <?php 
            $card = new ProductCard();

            $best_seller_num = sizeof($best_seller_products);
            if ($best_seller_num > 6) {
                $best_seller_num = 6;
            }
            for ($x = 0; $x < $best_seller_num; $x++) {
                $card->generateCard($best_seller_products[$x]['product_id']);
            }
            ?>
        </div>
    </div>
</body>
</html>