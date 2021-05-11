<html>
  <head>
    <title>User Center</title>
    <style>
      <?php include "user_center.css";?>
    </style>
    <script>
      <?php include "user_center.js";?>
    </script>
  </head>
    <?php include_once '../component/head_nav/head_nav.php'; ?>
    <?php 
      if(!isset($_SESSION)) {
        //start session
        session_start();
      }
      if(!isset($_SESSION["logged_in"]) || $_SESSION["logged_in"] == false) {
        echo "<script>notLoginIn();</script>";
      }
      //Get customer id
      $customerId = $_SESSION['user_id'];
      //create connection
      $conn = mysqli_connect("sql3.freesqldatabase.com:3306", "sql3402886", "gn4yJmWUfg", "sql3402886");
      //check connection
      if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
      }
    ?>
    <body>
      <div class="section-title">
        <h3>User Center</h3>
      </div>
      
      
      <div class="head_button">
        <button class="button" onclick="getHistory()">Order History</button>
        <button class="button" onclick="setAddress()">
          Set Default Address
          <div class="tooltip">
            <p class="tooltiptext">You can still select address during checkout</p>
          </div>
        </button>
        <button class="button" onclick="setPayment()">
          Set Default Payment
          <div class="tooltip">
            <p class="tooltiptext">You can still select payment during checkout</p>
          </div>
        </button>
      </div>

      <div class="flex-container">
         
        <?php
            $sql = "SELECT first_name, last_name, phone, email, FK_payment_id, FK_address_id FROM user WHERE user_id=$customerId";
            $results = mysqli_query($conn, $sql);
            if ($row=mysqli_fetch_assoc($results)){
              $firstName = $row['first_name'];
              $lastName = $row['last_name'];
              $phone = $row['phone'];
              $email = $row['email'];
            }
            else {
              echo mysqli_error($conn);
            }
            ?>
            <div class="info display-box"> 
                <span><b>Basic Information</b></span><br>
                <span>Name: <?php echo $firstName . " " . $lastName;?></span><br>
                <span>Email: <?php echo $email;?></span><br>
                <span>Phone: <?php echo $phone;?></span>
            </div>
        <?php 
            $sql = "SELECT payment_id, name_on_card, card_number, exp_month, exp_year FROM customer_payment WHERE FK_customer_id='$customerId'";
            $results = mysqli_query($conn, $sql);
            ?>
            <div class="payment display-box">
              <span><b>Payment Methods</b></span><br>

              <?php 
              while ($row = mysqli_fetch_assoc($results)) {
                $payment_id = $row['payment_id'];
                $name_on_card = $row['name_on_card'];
                $card_number = $row['card_number'];
                $exp_month = $row['exp_month'];
                $exp_year = $row['exp_year'];
                //Create payment option
                $payment= "Ending in " . substr($card_number, 15) . ", Name On Card: " . $name_on_card . ", expires: " . $exp_month . "/" . $exp_year;
              ?>
              
              <span>Ending in <?php echo substr($card_number, 15)?></span><br>
              <span>Name on card: <?php echo $name_on_card?></span><br>
              <span>Expires: <?php echo $exp_month . "/" . $exp_year?></span>
              <hr>

              <?php    
              }
              echo "<div class=\"aInP\"><a href=\"add_payment.php\">Add Payment</a></div>";
            echo "</div>";

              $sql = "SELECT address_id, street, city, state, zip_code FROM customer_address WHERE FK_customer_id='$customerId'";
              $results = mysqli_query($conn, $sql);
              ?>
            <div class="address display-box">
              <span><b>Addresses</b></span><br>
              <?php
              while ($row=mysqli_fetch_assoc($results)) {
                $address_id = $row['address_id'];
                $street = $row['street'];
                $city = $row['city'];
                $state = $row['state'];
                $zipCode = $row['zip_code'];
                $address = $street. ", ". $city. ", ". $state. ", ". $zipCode;
              ?>

              <span><?php echo $street?></span><br>
              <span><?php echo $city . ', ' . $state . ' ' . $zipCode?></span><br>
              <hr>

              <?php
              }
              echo "<div class=\"aInP\"><a href=\"add_address.php\">Add Address</a></div>";
            echo "</div>";
        ?>
      </div>
    </body>
</html>