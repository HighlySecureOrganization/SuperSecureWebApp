<?php
$servername = "db.0daygod.xyz";
$username = "root";
$password = "highlysecurepassword";

$conn = new mysqli($servername, $username, $password);

if ($conn->connect_error) {
  die("DB Connection Failed: " . $conn->connect_error);
}

echo "DB Connection Successful!";
?>
