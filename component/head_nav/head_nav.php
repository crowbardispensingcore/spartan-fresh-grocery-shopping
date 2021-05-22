<?php
if(!isset($_SESSION)) {
    session_start();
}

require_once $_SERVER["DOCUMENT_ROOT"] . '/component/db/db_config.php';
$pdo = pdo_connect_mysql();

if(isset($_SESSION["logged_in"]) && $_SESSION["logged_in"] == true){
    $user_id = $_SESSION['user_id'];
}
?>

<link rel="stylesheet" href="http://localhost/component/head_nav/head_nav.css">
<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
<script src="http://localhost/component/head_nav/head_nav.js"></script>

<div id="cover">
    <img src="/resource/icon/loading-200px.svg" class="loading" id="page-loading">
    <span>&nbsp;Loading...</span>
</div>
<div class="menu-bar-container">
    <div onclick="window.location.href= location.protocol + '\/\/' + location.host + '/front_page/front_page.php';" class="menu-bar-logo-wrapper">
        <img src="http://localhost/resource/icon/logo.svg" class="menu-bar-logo">
    </div>
    <div class="menu-bar-search-wrapper">
        <form method="GET" action= "http://localhost/categories/products_view/search_view.php">
            <input type="text" name="search" placeholder="Search">
            <button type="submit" value="Search">
                <img src="../../resource/icon/search-icon.svg">
            </button>
        </form>
    </div>
    <div class="menu-bar-info-container">
        <div class="user-info-wrapper" id="username-click">
            <img src="../../resource/icon/user-icon.svg" class="menu-bar-user-icon">
            <img src="/resource/icon/loading-200px.svg" class="loading" id="username-loading">
            <span id="username-field"></span>
        </div>
        <script>
            $.ajax({
                url: update_username_url,
                type: 'POST',
                success: function(response) {
                    if (response == '/') {
                        // Hide loading
                        document.getElementById('username-loading').style.display = 'none';
                        document.getElementById('cart-loading').style.display = 'none';
                        // Change user and cart buttons click function
                        document.getElementById('username-click').onclick 
                            = function() { showLogInPrompt() };
                        document.getElementById('cart-click').onclick 
                            = function() { showLogInPrompt() };
                        // Change username to login
                        document.getElementById('username-field').innerHTML = 'Log In';
                    }
                    else {
                        // Hide loading
                        document.getElementById('username-loading').style.display = 'none';
                        document.getElementById('cart-loading').style.display = 'none';
                        // Change user and cart click function
                        document.getElementById('username-click').onclick 
                            = function() { window.location.href= location.protocol + '//' + location.host + '/user_center/user_center.php' };
                        document.getElementById('cart-click').onclick 
                            = function() { window.location.href= location.protocol + '//' + location.host + '/shopping_cart/src/cart.php' };
                        // Display username
                        document.getElementById('username-field').innerHTML = response;
                        // Show log out button
                        document.getElementById('log-out-btn').style.display = "flex";
                    }
                }
            });
        </script>
        <div class="cart-info-wrapper" id="cart-click">
            <img src="../../resource/icon/cart-icon.svg" class="menu-bar-cart-icon">
            <span>Cart:&nbsp;</span>
            <img src="/resource/icon/loading-200px.svg" class="loading" id="cart-loading">
            <span id="cart-item-count-text"></span>
        </div>
        <script>
            $.ajax({
                url: update_cart_item_count_url,
                type: 'POST',
                success: function(response) {
                    updateItemCount(response);
                },
            });
        </script>
    </div>
</div>
<div class="log-out-container" id="log-out-btn">
    Log Out
</div>



<div class="background-blur-container"></div>
<div class="login-prompt-container">
    <button class="close-login-prompt-btn" onclick="hideLogInPrompt()">&times;</button>
    <button class="login-prompt-btn login-btn" onclick="window.location.href= location.protocol + '\/\/' + location.host + '/log_in/loginpage.php';">Log In</button>
    <button class="login-prompt-btn register-btn" onclick="window.location.href= location.protocol + '\/\/' + location.host + '/registration/registration.php';">Register</button>
</div>
<script>
    document.getElementsByClassName('background-blur-container')[0].style.display = 'none';
    document.getElementsByClassName('login-prompt-container')[0].style.display = 'none';
</script>