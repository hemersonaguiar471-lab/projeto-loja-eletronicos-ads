<?php
$host = "mysql.railway.internal";
$user = "root";
$pass = "jHHtFdhYsLrgOyQVZgqyxWNIRoFhypm";
$db   = "railway";
$port = 3306;

// O número 3306 no final é a porta do Railway
$conn = new mysqli($host, $user, $pass, $db, $port);

if ($conn->connect_error) {
    die(json_encode([
        "ok" => false,
        "msg" => "Erro ao conectar com o banco de dados."
    ]));
}

$conn->set_charset("utf8mb4");

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');
header('Content-Type: application/json; charset=utf-8');
?>