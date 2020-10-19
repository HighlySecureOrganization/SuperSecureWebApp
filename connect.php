<?php
$servername = "db.0daygod.xyz";
$username = "webappuser";
$password = "w3b4ppus3r_p4$$w0rd";

$conn = new mysqli($servername, $username, $password);

if ($conn->connect_error) {
  die("DB Connection Failed: " . $conn->connect_error);
}

echo "DB Connection Successful!";
?>
