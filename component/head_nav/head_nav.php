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

<div id="cover">Loading...</div>

<header>
    <div class="menu-bar-container">
        <div onclick="window.location.href= location.protocol + '\/\/' + location.host + '/front_page/front_page.php';" class="menu-bar-logo-wrapper">
            <div class="menu-bar-logo">
                <img src="http://localhost/resource/icon/logo.svg">
            </div>
        </div>
        <div class="menu-bar-search-wrapper">
            <form method="GET" action= "http://localhost/categories/products_view/search_view.php">
                <input type="text" name="search" placeholder="Search">
                <button type="submit" value="Search">
                    <img src="../../resource/icon/search-icon.svg">
                </button>
            </form>
        </div>
        <div class="menu-bar-user-wrapper" id="username-click">
            <div class="user-info-wrapper">
                <div class="menu-bar-user-icon">
                    <img src="../../resource/icon/user-icon.svg">
                </div>
                <div class="user-name">
                    <span id="username-logged-in"></span>
                    <span id="username-not-logged-in">Log in</span>
                </div>
            </div>
        </div>
        <div class="menu-bar-cart-wrapper" id="cart-click">
            <div class="cart-info-wrapper">
                <div class="menu-bar-cart-icon">
                    <img src="../../resource/icon/cart-icon.svg">
                </div>
                <span>Cart:&nbsp;</span>
                <span id="cart-item-count-text">0</span>
            </div>
        </div>
    </div>

    <div class="log-out-container" id="log-out-btn">
        Log Out
    </div>
</header>

<div class="background-blur-container"></div>
<div class="login-prompt-container">
    <button class="close-login-prompt-btn" onclick="hideLogInPrompt()">&times;</button>
    <button class="login-prompt-btn login-btn" onclick="window.location.href= location.protocol + '\/\/' + location.host + '/log_in/loginpage.php';">Log In</button>
    <button class="login-prompt-btn register-btn" onclick="window.location.href= location.protocol + '\/\/' + location.host + '/registration/Registration.php';">Register</button>
</div>