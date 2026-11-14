<?php
$host = "localhost";
$user = "root";
$pass = ""; 
$db   = "loja_eletronicos";

$conn = new mysqli($host, $user, $pass, $db);
$conn->set_charset("utf8mb4");

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS');
header('Content-Type: application/json; charset=utf-8');
?>