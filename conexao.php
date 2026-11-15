<?php
// Dados puxados exatamente da sua tela do Railway
$host = "mysql.railway.internal"; 
$port = 3306;
$user = "root";
$pass = "jHHtFdhYsLrgOyQVZgqyxWNIRoFhypm";
$db   = "railway";

$conn = new mysqli($host, $user, $pass, $db, $port);

if ($conn->connect_error) {
    // Isso vai mostrar o erro exato se falhar
    die(json_encode([
        "ok" => false,
        "msg" => "Erro ao conectar: " . $conn->connect_error
    ]));
}

$conn->set_charset("utf8mb4");

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');
header('Content-Type: application/json; charset=utf-8');
?>