<?php
require_once $_SERVER["DOCUMENT_ROOT"] . '/component/db/db_config.php';

class ProductCard {
    private $pdo;
    private $product_info;

    public function __construct() {
        $this->pdo = pdo_connect_mysql();
    }

    private function getProductInfo($id) {
        // Fetch product info
        $stmt = $this->pdo->prepare("SELECT * FROM product WHERE product_id = '$id'");
        $stmt->execute();
        $this->product_info = $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function generateCard($id) {
        $this->getProductInfo($id);
        // Stock
        $product_stock = $this->product_info['stock'];
        $out_of_stock_script = '';
        if ($product_stock < 1) {
            $out_of_stock_script 
            = '<script>'
            .'document.getElementById("out-of-stock-' . $id . '").style.display="block";'
            .'</script>';
        }
        // Product image html tag
        $product_image = $this->product_info['image'];
        if ($product_image != null) {
            $product_image_html = '<img src="' . $product_image . '" height="185">';
        } 
        else {
            $product_image_html = '<img src="http://localhost/resource/img/default/product_large.png" height="185px">';
        }
        // Product name
        $product_name = $this->product_info['product_name'];
        // Original price
        $original_price = $this->product_info['price'];
        // Final price. If there's a discount, final price is re-calculated
        $final_price = $original_price;
        $discount = $this->product_info['discount'];
        // Javascript for showing discount if there's one
        $discount_script = '';
        if ($discount != 0) {
            $final_price = round(($final_price * (1 - $discount / 100)), 2);
            $discount_script 
            = '<script>'
            .'document.getElementById("discount-label-' . $id . '").style.display="block";'
            .'document.getElementById("before-price-label-' . $id . '").style.display="block";'
            .'</script>';
        }
        // Weight unit
        $unit = $this->product_info['unit'];
        // Weight of each product
        $weight_per_item = $this->product_info['weight_per_item'];
        // Price per weight unit
        $price_per_unit = $final_price;
        // Product weight info in product name 
        $product_name_weight = '';
        if ($weight_per_item != 0) {
            $price_per_unit = round(($final_price / $weight_per_item), 2);
            $product_name_weight = ', ' . $weight_per_item . ' ' . $unit;
        }
        
        echo <<<HTML
        <div class="product-card-container">
            <span class="out-of-stock-label" id="out-of-stock-{$id}">Sold Out</span>
            {$out_of_stock_script}

            {$product_image_html}

            <form method="GET" action="http://localhost/categories/products_view/product_view.php">
                <input type="hidden" value="{$product_name}" name="product">
            </form>


            <span class="product-title">{$product_name}{$product_name_weight}</span>
            <span class="unit-price">&#36;{$price_per_unit}/{$unit}</span>
            <div class="item-price-wrapper">
                <span class="final-price">&#36;{$final_price}</span>
                <div class="discount" id="discount-label-{$id}">{$discount}% Off</div>
                <span class="before-price" id="before-price-label-{$id}"><strike>&#36;{$original_price}</strike></span>
                {$discount_script}
            </div>
            <button class="add-to-cart" data-id={$id}>Add</button>
        </div>
        <div class="add-message-container">
            <div class="add-message" id="add-message-{$id}">
                {$product_name} has been added to your cart.
            </div>
        </div>
        HTML;
        echo $discount_script;
    }
}
?>
