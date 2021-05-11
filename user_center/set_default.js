function setPaymentSuccess() {
  alert("Your Payment Has Been Update!");
  window.location = "user_center.php";
}

function setAddressSuccess() {
  alert("Your Address Has Been Update!");
  window.location = "user_center.php";
}

function notLoginIn() {
  alert("Uh-oh, you are not logged in");
  window.location = "/index.php";
}