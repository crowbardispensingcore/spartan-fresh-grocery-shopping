<?php 
session_start();
include 'config.php';

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
        <li><a href="protein_view.php">Protein</a></li>
        <li><a href="dairy_view.php">Dairy</a></li>
        <li><a href="baked_goods_view.php">Baked Goods</a></li>
        <li><a href="sweets_view.php">Sweets</a></li>
    </div>
  </div>
</nav>

<?php
if (isset($_GET['product'])) {
    $product_name = $_GET['product'];
    $stmt = $pdo->prepare("SELECT * FROM product WHERE product_name='$product_name'");
    $stmt->execute();
    $product = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $name = $product[0]['product_name'];
    $description = $product[0]['description'];
    $price = $product[0]['price'];
    $weight = $product[0]['shipping_weight'];
    $stock = $product[0]['stock'];
    $product_id = $product[0]['product_id'];

    if(isset($_SESSION["logged_in"]) && $_SESSION["logged_in"] == true){
      $stmt = $pdo->prepare("SELECT quantity FROM item_in_cart WHERE FK_product_id=$product_id AND FK_customer_id=$user_id");
      $stmt->execute();
      $cart_quantity = $stmt->fetchColumn();
    }
    else {
      $cart_quantity = -1;
    }

    

if (isset($_GET['quantity-to-add'])) {
    $add_result = $_GET['quantity-to-add'];
    $add_result_arr = explode(" ", "$add_result ");
    $id = $add_result_arr[0];
    $quantity_to_add = $add_result_arr[1]; 
    add_to_cart($id, $user_id, $quantity_to_add);
}

// echo '<script>document.getElementById(\'addForm\').reset();</script>';
?>
<!-- <div class="container">    
  <div class="row">
    <div class="col-md-6 col-md-offset-3">
      <div class="panel panel-success">
        <div class="panel-heading"><?php echo($name)?></div>
        <div class="panel-body"><img src="../resource/banana.jpeg" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer"><?php echo($description)?></div>
        <div class="panel-footer">
            <div class="form-group">
                <div class="row">
                    <form name="add_product" action="product_view.php">
                        <div class="col-md-2 col-md-offset-4">
                            <select class="form-control" name="quantity-to-add">
                              <?php
                              for ($i = 1; $i<=99; $i++) {
                                  if ($stock - $cart_quantity - $i > 0) {
                              ?>
                              <option value="<?php echo($product_id . " " . $i)?>"><?php echo($i) ?> &emsp;&ensp;($<?php echo($i * $price)?>)</option>
                              <?php
                                  }
                              }
                              ?>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <input type="hidden" value="<?php echo($name)?>" name="product">
                            <input class="btn btn-success" type="submit" name="name" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
      </div>
    </div>
  </div>
</div><br><br> -->



<?php
  $product_stock = $product[0]['stock'];
  // Product image
  $product_image = $product[0]['image'];
  // Product name
  $product_name = $product[0]['product_name'];
  // Original price
  $original_price = $product[0]['price'];
  // Final price. If there's a discount, final price is re-calculated
  $final_price = $original_price;
  $discount = $product[0]['discount'];
  // Weight unit
  $unit = $product[0]['unit'];
  // Weight of each product
  $weight_per_item = $product[0]['weight_per_item'];
  // Price per weight unit
  $price_per_unit = $final_price;
  // Product weight info in product name 
  $product_name_weight = '';
  if ($weight_per_item != 0) {
      $price_per_unit = round(($final_price / $weight_per_item), 2);
      $product_name_weight = ', ' . $weight_per_item . ' ' . $unit;
  }
?>


<div class="detail-wrapper">
  <div class="d__product-card-container detail-card-container">
    <span class="d__out-of-stock-label" id="out-of-stock-<?=$product_id?>">Sold Out</span>
    
    <?php
    // Check if show sold out label
    if ($product_stock < 1) {
    ?>
    <script>
        document.getElementById("out-of-stock-<?=$product_id?>").style.display="block";
    </script>
    <?php
    }
    ?>

    <?php
    // Get image file
    if ($product_image != null) {
    ?>
    <img src="<?=$product_image?>" loading="lazy">
    <?php
    }
    else {
    ?>
    <img src="http://localhost/resource/img/default/product_large.png" loading="lazy">
    <?php
    }
    // Get card title
    $product_title = $product_name . $product_name_weight;
    ?>

    <div class="d__description-wrapper">
      <?php
      // Calculate final price
      if ($discount != 0) {
        $final_price = round(($final_price * (1 - $discount / 100)), 2);
      }
      ?>



      <span class="d__product-title"><?=$product_title?></span>
      <span class="d__unit-price">&#36;<?=$price_per_unit?>/<?=$unit?></span>
      <div class="d__item-price-wrapper">
          <span class="d__final-price">&#36;<?=$final_price?></span>
          <div class="d__discount" id="discount-label-<?=$product_id?>"><?=$discount?>% Off</div>
          <span class="d__before-price" id="before-price-label-<?=$product_id?>"><strike>&#36;<?=$original_price?></strike></span>
      </div>

      <?php
      // Check if display discount label and before price
      if ($discount != 0) {
      ?>
      <script>
        document.getElementById("discount-label-<?=$product_id?>").style.display="block";
        document.getElementById("before-price-label-<?=$product_id?>").style.display="block";
      </script>
      <?php
      }
      ?>

      <div class="d__product-des-wrapper">
        <h4><b>About this item</b></h4>
        <p><?php echo($description)?></p>
      </div>

      <!-- <button class="add-to-cart" data-id=<?=$product_id?>>Add</button> -->
      <div class="d__add-selected-container">
        <div class="form-group">
          <div class="row">
            <form id="addForm" name="add_product" action="product_view.php">
              <div class="col-md-5">
                <select class="form-control" name="quantity-to-add">
                  <?php
                  $available = false;
                  for ($i = 1; $i<=99; $i++) {
                    if ($cart_quantity < 0) {
                  ?>
                  <option>Please log in</option>
                  <?php
                      break;
                    }
                      elseif ($stock - $cart_quantity - $i >= 0) {
                        $available = true;
                  ?>
                  <option value="<?php echo($product_id . " " . $i)?>"><?php echo($i) ?> &emsp;&ensp;($<?php echo($i * $price)?>)</option>
                  <?php
                      }
                      else {
                        if (!$available) {
                  ?>
                  <option>Out of stock/No more available</option>
                  <?php
                        }
                        break;
                      }
                  }
                  ?>
                </select>
              </div>
              <div class="col-md-2">
                  <input type="hidden" value="<?php echo($name)?>" name="product">
                  <?php
                    if ($available) {
                  ?>
                  <input class="btn btn-success" type="submit" name="name" value="Add">
                  <?php
                     }
                    else {
                  ?>
                  <button type="button" class="btn btn-success" disabled>Add</button>
                  <?php
                    }
                  ?>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

  </div>
</div>

<?php
}
?>
