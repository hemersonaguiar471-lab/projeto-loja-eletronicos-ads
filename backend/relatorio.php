<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Relatório - TechStore</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <h1>TechStore 🖥️</h1>
        <nav>
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="produtos.html">Produtos</a></li>
                <li><a href="sobre.html">Sobre</a></li>
                <li><a href="cadastro.html">Cadastro</a></li>
                <li><a href="relatorio.html">Relatório</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <h2>Dashboard de Vendas</h2>
        <table id="tabelaRelatorio">
            <thead>
                <tr>
                    <th>Categoria</th>
                    <th>Produto</th>
                    <th>Qtd. Vendida</th>
                    <th>Faturamento (R$)</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>

    <script>
        async function carregarRelatorio() {
            try {
                const resposta = await fetch('https://lojahemersoninfinityfreecom.lovestoblog.com/relatorio.php');
                
                if (!resposta.ok) throw new Error("Servidor PHP offline");
                
                const dados = await resposta.json();
                const tbody = document.querySelector('#tabelaRelatorio tbody');
                tbody.innerHTML = ''; 

                dados.forEach(item => {
                    const tr = document.createElement('tr');
                    tr.innerHTML = `
                        <td>${item.categoria}</td>
                        <td>${item.produto}</td>
                        <td>${item.qtd_vendida}</td>
                        <td>R$ ${parseFloat(item.faturamento).toFixed(2).replace('.', ',')}</td>
                    `;
                    tbody.appendChild(tr);
                });
            } catch (erro) {
                const tbody = document.querySelector('#tabelaRelatorio tbody');
                tbody.innerHTML = `
                    <tr>
                        <td colspan="4" style="text-align: center; padding: 2rem; color: #ef4444;">
                            <strong>⚠️ O servidor gratuito está acordando...</strong><br>
                            Aguarde 1 minuto e atualize a página (F5).
                        </td>
                    </tr>
                `;
            }
        }
        carregarRelatorio();
    </script>
</body>
</html>