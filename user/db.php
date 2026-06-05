<?php
mysqli_report(MYSQLI_REPORT_OFF);

$conn = new mysqli("localhost", "root", "", "WinterOlympics");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>