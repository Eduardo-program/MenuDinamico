-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Abr-2022 às 16:34
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `menu`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargos`
--

CREATE TABLE `cargos` (
  `ID` int(11) NOT NULL,
  `DESCRICAO` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargos`
--

INSERT INTO `cargos` (`ID`, `DESCRICAO`) VALUES
(1, 'Administrador'),
(2, 'Usuário');

-- --------------------------------------------------------

--
-- Estrutura da tabela `menus`
--

CREATE TABLE `menus` (
  `ID` int(11) NOT NULL,
  `DESCRICAO` varchar(50) NOT NULL,
  `ICONE` varchar(50) NOT NULL,
  `ME_STATUS` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `menus`
--

INSERT INTO `menus` (`ID`, `DESCRICAO`, `ICONE`, `ME_STATUS`) VALUES
(1, 'Cadastros', '#', 'Ativo'),
(2, 'Produtos', '#', 'Ativo'),
(3, 'Relatórios', '#', 'Ativo'),
(4, 'Estoque', '#', 'Ativo'),
(8, 'Opção de Teste', '#', 'Ativo'),
(9, 'Eduardo', '#', 'Ativo'),
(10, 'Teste', '#', 'Ativo'),
(11, 'Henrique', '', 'Ativo'),
(12, 'Eduardo', '', 'Ativo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu_cargos`
--

CREATE TABLE `menu_cargos` (
  `ID` int(11) NOT NULL,
  `ID_MENU` int(11) NOT NULL,
  `ID_SUB_MENU` int(11) NOT NULL,
  `ID_CARGO` int(11) NOT NULL,
  `MC_STATUS` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `menu_cargos`
--

INSERT INTO `menu_cargos` (`ID`, `ID_MENU`, `ID_SUB_MENU`, `ID_CARGO`, `MC_STATUS`) VALUES
(1, 1, 1, 1, 'Ativo'),
(2, 1, 2, 1, 'Ativo'),
(3, 2, 3, 1, 'Ativo'),
(4, 2, 4, 1, 'Ativo'),
(5, 3, 5, 1, 'Ativo'),
(6, 3, 6, 1, 'Ativo'),
(7, 3, 7, 1, 'Ativo'),
(8, 4, 8, 1, 'Ativo'),
(17, 1, 15, 1, 'Ativo'),
(18, 3, 16, 1, 'Ativo'),
(19, 4, 17, 2, 'Ativo'),
(20, 11, 18, 1, 'Ativo'),
(21, 11, 18, 2, 'Ativo'),
(22, 12, 19, 1, 'Ativo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu_usuarios`
--

CREATE TABLE `menu_usuarios` (
  `ID` int(11) NOT NULL,
  `ID_MENU` int(11) NOT NULL,
  `ID_SUB_MENU` int(11) NOT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  `PERMISSAO` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `menu_usuarios`
--

INSERT INTO `menu_usuarios` (`ID`, `ID_MENU`, `ID_SUB_MENU`, `ID_USUARIO`, `PERMISSAO`) VALUES
(1, 1, 1, 1, 'False'),
(2, 1, 2, 1, 'False'),
(3, 2, 3, 1, 'True'),
(4, 2, 4, 1, 'True'),
(5, 3, 5, 1, 'True'),
(6, 3, 6, 1, 'True'),
(7, 3, 7, 1, 'True'),
(8, 4, 8, 1, 'True'),
(11, 1, 15, 1, 'False'),
(12, 3, 16, 1, 'True'),
(13, 4, 17, 2, 'True'),
(15, 11, 18, 2, 'True'),
(16, 12, 19, 1, 'True');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sub_menus`
--

CREATE TABLE `sub_menus` (
  `ID` int(11) NOT NULL,
  `ID_MENU` int(11) NOT NULL,
  `DESCRICAO` varchar(50) NOT NULL,
  `ENDERECO` varchar(50) NOT NULL,
  `SM_STATUS` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `sub_menus`
--

INSERT INTO `sub_menus` (`ID`, `ID_MENU`, `DESCRICAO`, `ENDERECO`, `SM_STATUS`) VALUES
(1, 1, 'Novo Produto', '#', 'Ativo'),
(2, 1, 'Editar Produto', '#', 'Ativo'),
(3, 2, 'Emitir Venda', '#', 'Ativo'),
(4, 2, 'Devolução', '#', 'Ativo'),
(5, 3, 'Vendas Mês', '#', 'Ativo'),
(6, 3, 'Vendas Semestre', '#', 'Ativo'),
(7, 3, 'Venda por Código', '#', 'Ativo'),
(8, 4, 'Lançar Nota Fiscal', '#', 'Ativo'),
(15, 1, 'Novo Código', '#', 'Ativo'),
(16, 3, 'Compras', 'http://localhost/phpmyadmin/index.php?route=/sql&s', 'Ativo'),
(17, 4, 'Acerto', '#', 'Ativo'),
(18, 11, 'Henrique 2', '#', 'Ativo'),
(19, 12, 'Eduardo 2', '', 'Ativo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(11) NOT NULL,
  `USUARIO` varchar(50) NOT NULL,
  `SENHA` varchar(50) NOT NULL,
  `ID_CARGO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`ID`, `USUARIO`, `SENHA`, `ID_CARGO`) VALUES
(1, 'eduardo.garcia', 'eduardo', 1),
(2, 'henrique.follmann', 'henrique', 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `menu_cargos`
--
ALTER TABLE `menu_cargos`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `menu_usuarios`
--
ALTER TABLE `menu_usuarios`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `sub_menus`
--
ALTER TABLE `sub_menus`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cargos`
--
ALTER TABLE `cargos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `menus`
--
ALTER TABLE `menus`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `menu_cargos`
--
ALTER TABLE `menu_cargos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `menu_usuarios`
--
ALTER TABLE `menu_usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `sub_menus`
--
ALTER TABLE `sub_menus`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
