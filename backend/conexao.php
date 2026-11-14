<?php

$host = "sql109.infinityfree.com";
$user = "if0_43441403";
$pass = "KcIx34YpeI3AU38";
$db   = "if0_43441403_loja_eletronicos";

$conn = new mysqli($host, $user, $pass, $db);

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