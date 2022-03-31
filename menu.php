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

// CHUNBADO USUARIO --------
$USUARIO = 'eduardo.garcia';
// -------------------------


//VERIFICO o CARGO DO USUARIO
$q_cargo = "SELECT ID_CARGO, ID FROM USUARIOS WHERE USUARIO = '$USUARIO'";
$r_cargo = mysqli_query($con,$q_cargo);
$cargodata = mysqli_fetch_assoc($r_cargo);
$id_cargo = $cargodata['ID_CARGO'];
$id_usuario = $cargodata['ID'];



$q_menu = "SELECT * FROM MENUS WHERE ME_STATUS = 'Ativo'";
$r_menu=mysqli_query($con,$q_menu);
while($menudata = mysqli_fetch_assoc($r_menu)){

$menu_id = $menudata['ID'];

$submenulistqry = "SELECT * FROM SUB_MENUS
INNER JOIN MENU_CARGOS ON MENU_CARGOS.ID_SUB_MENU = SUB_MENUS.ID
WHERE MC_STATUS = 'Ativo' 
AND SUB_MENUS.ID_MENU = '$menu_id' 
AND SUB_MENUS.ID IN (SELECT ID_SUB_MENU FROM MENU_USUARIOS
							WHERE ID_USUARIO = '$id_usuario'
							AND PERMISSAO = 'True'
              AND ID_MENU = '$menu_id')
AND MENU_CARGOS.ID_CARGO = '$id_cargo' 
ORDER BY ID_SUB_MENU ASC";

$submenulistres=mysqli_query($con,$submenulistqry);
$submenutotal=mysqli_num_rows($submenulistres);

if($submenutotal>0){ ?>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <span><i class="<?php echo $menudata['ICONE'];?>"></i></span>  <?php echo $menudata['DESCRICAO'];?>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <?php

while($submenulistdata=mysqli_fetch_assoc($submenulistres))
{?>
          <a class="dropdown-item" href="<?php echo $submenulistdata['ENDERECO'];?>"><?php echo $submenulistdata['DESCRICAO'];?></a>
        <?php }?>
        </div>
      </li>
<?php }} ?>

      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Configurações
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="cadastrar_menu.php">Adicionar Menu</a>
          <a class="dropdown-item" href="cadastrar_submenu.php">Adicionar SubMenu</a>
          <a class="dropdown-item" href="permissoes_usuarios.php">Permissões</a>
        </div>
      </li>
    </ul>
  </div>
</nav>