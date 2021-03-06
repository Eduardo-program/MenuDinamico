-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Abr-2022 às 22:04
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
-- Estrutura da tabela `fontes`
--

CREATE TABLE `fontes` (
  `ID` int(11) NOT NULL,
  `ID_MENU` int(11) NOT NULL,
  `DESCRICAO` varchar(50) NOT NULL,
  `ENDERECO` varchar(50) NOT NULL,
  `FO_STATUS` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `fontes`
--

INSERT INTO `fontes` (`ID`, `ID_MENU`, `DESCRICAO`, `ENDERECO`, `FO_STATUS`) VALUES
(1, 8, 'Vendas por Dia', '#', 'Ativo'),
(2, 2, 'Novo Código', '#', 'Ativo'),
(3, 10, 'Nova Venda', '#', 'Ativo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fonte_cargos`
--

CREATE TABLE `fonte_cargos` (
  `ID` int(11) NOT NULL,
  `ID_FONTE` int(11) NOT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  `FC_STATUS` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `fonte_cargos`
--

INSERT INTO `fonte_cargos` (`ID`, `ID_FONTE`, `ID_USUARIO`, `FC_STATUS`) VALUES
(1, 1, 1, 'Ativo'),
(2, 2, 1, 'Ativo'),
(3, 3, 1, 'Ativo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fonte_usuarios`
--

CREATE TABLE `fonte_usuarios` (
  `ID` int(11) NOT NULL,
  `ID_FONTE` int(11) NOT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  `PERMISSAO` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `fonte_usuarios`
--

INSERT INTO `fonte_usuarios` (`ID`, `ID_FONTE`, `ID_USUARIO`, `PERMISSAO`) VALUES
(4, 1, 1, 'True'),
(5, 2, 1, 'True'),
(6, 3, 1, 'True');

-- --------------------------------------------------------

--
-- Estrutura da tabela `menus`
--

CREATE TABLE `menus` (
  `ID` int(11) NOT NULL,
  `ID_PAI` int(11) NOT NULL,
  `DESCRICAO` varchar(50) NOT NULL,
  `ME_STATUS` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `menus`
--

INSERT INTO `menus` (`ID`, `ID_PAI`, `DESCRICAO`, `ME_STATUS`) VALUES
(1, 0, 'Cadastros', 'Ativo'),
(2, 1, 'Produtos', 'Ativo'),
(3, 0, 'Relatórios', 'Ativo'),
(4, 3, 'Estoque', 'Ativo'),
(8, 3, 'Vendas', 'Ativo'),
(9, 1, 'Código', 'Ativo'),
(10, 0, 'Devoluções', 'Ativo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu_cargos`
--

CREATE TABLE `menu_cargos` (
  `ID` int(11) NOT NULL,
  `ID_MENU` int(11) NOT NULL,
  `ID_CARGO` int(11) NOT NULL,
  `MC_STATUS` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `menu_cargos`
--

INSERT INTO `menu_cargos` (`ID`, `ID_MENU`, `ID_CARGO`, `MC_STATUS`) VALUES
(24, 1, 1, 'Ativo'),
(25, 2, 1, 'Ativo'),
(26, 3, 1, 'Ativo'),
(27, 4, 1, 'Ativo'),
(28, 5, 1, 'Ativo'),
(29, 6, 1, 'Ativo'),
(30, 7, 1, 'Ativo'),
(31, 8, 1, 'Ativo'),
(32, 9, 1, 'Ativo'),
(33, 10, 1, 'Ativo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu_usuarios`
--

CREATE TABLE `menu_usuarios` (
  `ID` int(11) NOT NULL,
  `ID_MENU` int(11) NOT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  `PERMISSAO` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `menu_usuarios`
--

INSERT INTO `menu_usuarios` (`ID`, `ID_MENU`, `ID_USUARIO`, `PERMISSAO`) VALUES
(18, 1, 1, 'True'),
(19, 2, 1, 'True'),
(20, 3, 1, 'True'),
(21, 4, 1, 'True'),
(22, 5, 1, 'True'),
(23, 6, 1, 'True'),
(24, 7, 1, 'True'),
(25, 8, 1, 'True'),
(26, 9, 1, 'True'),
(27, 10, 1, 'True');

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
-- Índices para tabela `fontes`
--
ALTER TABLE `fontes`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `fonte_cargos`
--
ALTER TABLE `fonte_cargos`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `fonte_usuarios`
--
ALTER TABLE `fonte_usuarios`
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
-- AUTO_INCREMENT de tabela `fontes`
--
ALTER TABLE `fontes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `fonte_cargos`
--
ALTER TABLE `fonte_cargos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `fonte_usuarios`
--
ALTER TABLE `fonte_usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `menus`
--
ALTER TABLE `menus`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `menu_cargos`
--
ALTER TABLE `menu_cargos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `menu_usuarios`
--
ALTER TABLE `menu_usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
