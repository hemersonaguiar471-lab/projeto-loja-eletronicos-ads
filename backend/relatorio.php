<?php
require 'conexao.php';

$sql = "
SELECT c.nome AS categoria, p.nome AS produto,
       SUM(iv.quantidade) AS qtd_vendida,
       SUM(iv.quantidade * iv.preco_unitario) AS faturamento
FROM produto p
JOIN categoria c   ON c.id  = p.categoria_id
JOIN item_venda iv ON iv.produto_id = p.id
JOIN venda v       ON v.id  = iv.venda_id
GROUP BY p.id, p.nome, c.nome
ORDER BY faturamento DESC
";

$res = $conn->query($sql);
$dados = [];
while ($r = $res->fetch_assoc()) {
    $dados[] = $r;
}

echo json_encode($dados);
?>