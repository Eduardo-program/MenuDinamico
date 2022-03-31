<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="index.php">Menu Dinâmico</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
<?php

require 'procedimentos.php';

// CHUNBADO USUARIO --------
$USUARIO = 'eduardo.garcia';
// -------------------------


//VERIFICO o CARGO DO USUARIO
$id_cargo = cargoUsuario($USUARIO);



$q_menu = "SELECT * FROM MENUS WHERE STATUS = 'Ativo'";
$r_menu=mysqli_query($con,$q_menu);
while($menudata = mysqli_fetch_assoc($r_menu)){

$menu_id = $menudata['ID'];


$submenulistqry = "SELECT * FROM SUB_MENUS
WHERE SM_STATUS = 'Ativo'  
INNER JOIN submenu_department on submenu_department.sub_menu_id=sub_menu.submenu_id
where submenu_status='Enable' 
AND sub_menu.menu_id='$menu_id' 
AND sub_menu.submenu_id IN (SELECT sub_menu_id FROM menu_useraccess
							where user_id = '$userdepartment'
							and user_permission = 'True'
                            and menu_id = '$menu_id')
AND submenu_display='Yes' 
AND submenu_department.department_id='$userdepartment' 
order by submenu_order asc";
$submenulistres=mysqli_query($con,$submenulistqry);
$submenutotal=mysqli_num_rows($submenulistres);
if($submenutotal>0)
{
?>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <span><i class="<?php echo $menulistdata['menu_icon'];?>"></i></span>  <?php echo $menulistdata['menu_name'];?>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <?php

while($submenulistdata=mysqli_fetch_assoc($submenulistres))
{?>
          <a class="dropdown-item" href="<?php echo $submenulistdata['submenu_url'];?>"><?php echo $submenulistdata['submenu_name'];?></a>
        <?php }?>
        </div>
      </li>
<?php }} ?>

      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Setting
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="menu_add.php">Add Menu</a>
          <a class="dropdown-item" href="submenu_add.php">Add Sub Menu</a>
          <a class="dropdown-item" href="user_permission.php">Permission</a>
        </div>
      </li>
    </ul>
  </div>
</nav>