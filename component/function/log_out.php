<?php 
if(!isset($_SESSION)) {
    session_start();
}
$_SESSION = array();
session_destroy();
echo 'log out success';
?>