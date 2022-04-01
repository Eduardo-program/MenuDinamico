<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="index.php">Menu Dinâmico</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">

<?php

require 'procedimentos.php';
require 'conexao.php';


//VERIFICO O CARGO DO USUARIO
$q_cargo = "SELECT ID_CARGO, ID FROM USUARIOS WHERE USUARIO = '$USUARIO'";
$r_cargo = mysqli_query($con,$q_cargo);
$cargodata = mysqli_fetch_assoc($r_cargo);

$id_cargo   = $cargodata['ID_CARGO'];
$id_usuario = $cargodata['ID'];

?>


      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Configurações</a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="cadastrar_menu.php">Adicionar Menu</a>
          <a class="dropdown-item" href="cadastrar_submenu.php">Adicionar SubMenu</a>
          <a class="dropdown-item" href="permissoes_usuarios.php">Permissões</a>
          <a class="dropdown-item" href="cadastrar_fonte.php">Fontes</a>
        </div>
      </li>
    </ul>
  </div>
</nav>