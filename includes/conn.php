<?php
$servername = "${{ secrets.DBhost }}";
$username = "{{ secrets.DBuser }}";
$password = "${{ secrets.DBpassword }}";

$conn = new mysqli($servername, $username, $password);

if ($conn->connect_error) {
  die("DB Connection Failed: " . $conn->connect_error);
}

echo "DB Connection Successful!";
?>
