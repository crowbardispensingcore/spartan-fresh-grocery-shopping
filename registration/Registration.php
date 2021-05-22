<!DOCTYPE html>
<html>
    <head>
        <title>Registration</title>
        <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet'>
        <link rel="stylesheet" href="registration.css">
    </head>

    <?php
        if(!isset($_SESSION)) {
            session_start();
        }
        if(isset($_SESSION["logged_in"]) && $_SESSION["logged_in"]){
    ?>
    <script>
        alert('Please log out first to sign up a new account.');
        window.location.href = "/index.php";
    </script>
    <?php
        }
    ?>

    <!-- <body style = "background-image: -moz-linear-gradient(aliceblue, white); height:890px;">
        <h3 style ="text-align:center; padding-top:50px; font-size: 60; font-family:Verdana, Geneva, Tahoma, sans-serif; margin-bottom: 50;">
            Spartan Fresh
        </h3>
        <img src="cart.png" alt="Grocery Cart" class = "pic">
        <h3 style ="text-align:center; font-size: 40; font-family:Verdana, Geneva, Tahoma, sans-serif;">
            Sit back, we'll take it from here.
        </h3>
        <form action="AccountCreation.php" method="post" class = "input" style="margin: 50 auto;"> 
            <input type="text" onpaste="return false;" ondrop="return false;" autocomplete="off" name="first_name" placeholder="First name" required / style =" height:30; width: 200;" class ="form">         
            <input type="text" onpaste="return false;" ondrop="return false;" autocomplete="off" name="last_name" placeholder="Last name"  required /style="margin-top: 10; height:30; width: 200;"class ="form">   
            <input type="password" onpaste="return false;" ondrop="return false;" autocomplete="off" name="password_encrypted" placeholder="Password" required / style="margin-top: 10;  height:30; width: 200;"class ="form">  
            <input type="email" onpaste="return false;" ondrop="return false;" autocomplete="off" name="email" placeholder= "Email: email@domain.com"   pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required / style="margin-top: 10;  height:30; width: 200;"" class = "form">
            <input type="tel" onpaste="return false;" ondrop="return false;" autocomplete="off" name="phone" placeholder="Number: ### ### ####"  pattern="[0-9]{3} [0-9]{3} [0-9]{4}" maxlength="12" required / style="margin-top: 10;  height:30; width: 200;"class ="form">  
            <input type="submit" value ="Sign up" style="margin-top: 20; margin-bottom: 20; border-radius: 20px; height:30; width: 150;"class ="button">
            <div class="tooltip"><i>Why do I need to provide my phone number?</i>
                <span class="tooltiptext" style = "text-align: center;">
                    Providing your phone number helps us deliver to you on time if we have trouble locating your house/ apartment complex.
                </span>
            </div> 
        </form>   
    </body>  -->
    <body>
        <img src="/resource/icon/logo-registration.svg" alt="Spartan Fresh" class ="logo" onclick="window.location.href= location.protocol + '\/\/' + location.host + '/front_page/front_page.php';">
        <div class="logo-text">
            Sit back, we'll take it from here.
        </div>
        <div class="registration-wrapper">
            <span>Create an account</span>
            <form action="account_creation.php" method="post">
                <input type="text" autocomplete="off" name="first_name" placeholder="First Name" required class="registration-input input-1">       
                <input type="text" autocomplete="off" name="last_name" placeholder="Last Name"  required class="registration-input input-2">   
                <input type="password" autocomplete="off" name="password_encrypted" placeholder="Password" required class="registration-input input-3">  
                <input type="email" autocomplete="off" name="email" placeholder= "Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required class="registration-input input-4">
                <input type="tel" autocomplete="off" name="phone" placeholder="Phone Number"  pattern="[789][0-9]{9}" maxlength="10" required class="registration-input input-5">  
                <input type="submit" value ="Sign up" class ="sign-up-button">
                <div class="tooltip">
                    <i>Why do I need to provide my phone number?</i>
                    <span class="tooltiptext" style = "text-align: center;">
                        Providing your phone number helps us deliver to you on time.
                    </span>
                </div> 
            </form>
        </div>
    </body> 
</html>