-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14/11/2026 às 17:27
-- Versão do servidor: 10.11.16-MariaDB
-- Versão do PHP: 8.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `loja_eletronicos`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`id`, `nome`) VALUES
(4, 'Acessórios'),
(1, 'Celulares'),
(3, 'Fones'),
(2, 'Notebooks');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `idade` int(11) NOT NULL CHECK (`idade` >= 18),
  `criado_em` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `email`, `cpf`, `idade`, `criado_em`) VALUES
(1, 'João Silva', 'joao@email.com', '111.111.111-11', 28, '2026-11-14 15:47:54'),
(2, 'Maria Souza', 'maria@email.com', '222.222.222-22', 34, '2026-11-14 15:47:54'),
(3, 'Pedro Lima', 'pedro@email.com', '333.333.333-33', 22, '2026-11-14 15:47:54');

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_venda`
--

CREATE TABLE `item_venda` (
  `id` int(11) NOT NULL,
  `venda_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL CHECK (`quantidade` > 0),
  `preco_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `item_venda`
--

INSERT INTO `item_venda` (`id`, `venda_id`, `produto_id`, `quantidade`, `preco_unitario`) VALUES
(1, 1, 1, 1, 5999.00),
(2, 1, 5, 2, 250.00),
(3, 2, 3, 1, 3800.00),
(4, 2, 7, 2, 120.00),
(5, 3, 2, 1, 4500.00),
(6, 3, 8, 1, 45.00),
(7, 4, 4, 1, 7500.00),
(8, 4, 6, 1, 1800.00),
(9, 5, 9, 1, 3200.00),
(10, 5, 15, 2, 350.00),
(11, 6, 10, 1, 2100.00),
(12, 6, 11, 1, 3100.00),
(13, 6, 12, 1, 2900.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `preco` decimal(10,2) NOT NULL CHECK (`preco` > 0),
  `estoque` int(11) NOT NULL CHECK (`estoque` >= 0),
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`id`, `nome`, `preco`, `estoque`, `categoria_id`) VALUES
(1, 'iPhone 15', 5999.00, 10, 1),
(2, 'Galaxy S24', 4500.00, 8, 1),
(3, 'Dell Inspiron 15', 3800.00, 5, 2),
(4, 'MacBook Air M2', 7500.00, 3, 2),
(5, 'Fone JBL Tune', 250.00, 30, 3),
(6, 'AirPods Pro', 1800.00, 15, 3),
(7, 'Carregador Turbo 65W', 120.00, 50, 4),
(8, 'Capa Anti-impacto', 45.00, 100, 4),
(9, 'Apple Watch Series 9', 3200.00, 10, 4),
(10, 'Galaxy Watch 6', 2100.00, 12, 4),
(11, 'Acer Aspire 5', 3100.00, 8, 2),
(12, 'Moto Edge 40', 2900.00, 15, 1),
(13, 'Headset Gamer HyperX', 450.00, 20, 3),
(14, 'Mouse Logitech MX', 350.00, 25, 4),
(15, 'Teclado Mecânico RGB', 400.00, 18, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda`
--

CREATE TABLE `venda` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `data_venda` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `venda`
--

INSERT INTO `venda` (`id`, `cliente_id`, `data_venda`) VALUES
(1, 1, '2026-11-01'),
(2, 2, '2026-11-05'),
(3, 3, '2026-11-10'),
(4, 1, '2026-11-12'),
(5, 2, '2026-11-13'),
(6, 3, '2026-11-14');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `item_venda`
--
ALTER TABLE `item_venda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venda_id` (`venda_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Índices de tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `item_venda`
--
ALTER TABLE `item_venda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `item_venda`
--
ALTER TABLE `item_venda`
  ADD CONSTRAINT `item_venda_ibfk_1` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`id`),
  ADD CONSTRAINT `item_venda_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`);

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`);

--
-- Restrições para tabelas `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
