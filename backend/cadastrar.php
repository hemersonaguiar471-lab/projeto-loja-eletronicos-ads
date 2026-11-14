<?php
require 'conexao.php';

$nome  = trim($_POST['nome']  ?? '');
$email = trim($_POST['email'] ?? '');
$cpf   = trim($_POST['cpf']   ?? '');
$idade = (int)($_POST['idade'] ?? 0);

if ($nome === '' || $email === '' || $cpf === '' || $idade <= 0) {
    echo json_encode(['ok'=>false, 'msg'=>'Preencha todos os campos corretamente.']);
    exit;
}

$stmt = $conn->prepare("INSERT INTO cliente (nome,email,cpf,idade) VALUES (?,?,?,?)");
$stmt->bind_param("sssi", $nome, $email, $cpf, $idade);

if ($stmt->execute()) {
    echo json_encode(['ok'=>true, 'msg'=>'Cliente cadastrado com sucesso!']);
} else {
    echo json_encode(['ok'=>false, 'msg'=>'Erro: Email ou CPF já cadastrado.']);
}
?>