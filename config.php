<?php
$servername = "localhost";
$username = "root";
$password = ""; // Default XAMPP password is empty
$database = "vehicle_service"; // Update this to match your database name

$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
