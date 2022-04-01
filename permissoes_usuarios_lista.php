<!DOCTYPE html>
<html>
<?php include 'cabecalho.php';
include 'conexao.php';

$user_id = $_POST['user_id'];

?>
<body>
<?php include 'menu.php';?>

<div class="container">
<div class="row">
<div class="col-md-12">
<h4>User Regras</h4>

<form method="post" action="altera_permissoes.php">
<input type="hidden" name="user_id" value="<?php echo $user_id;?>">
<table class="table">
<thead>
<tr>
<th>Menu</th>
<th>Sub Menu</th>
<th>Permissão</th>
</tr>
</thead>
<tbody>
<?php
$menuqry="SELECT MENU_USUARIOS.*, SUB_MENUS.DESCRICAO AS SM_DE, MENUS.DESCRICAO AS M_DE
		 FROM MENU_USUARIOS
		 INNER JOIN MENUS ON MENUS.ID = MENU_USUARIOS.ID_MENU
		 INNER JOIN SUB_MENUS ON SUB_MENUS.ID = MENU_USUARIOS.ID_SUB_MENU  
		 WHERE ID_USUARIO = '$user_id'";
$menures=mysqli_query($con,$menuqry);
while ($menudata=mysqli_fetch_assoc($menures)) {
?>
<input type="hidden" name="menu_id[]" value="<?php echo $menudata['ID_MENU'];?>">
<input type="hidden" name="submenu_id[]" value="<?php echo $submenuid=$menudata['ID_SUB_MENU'];?>">
<tr>
	<td><?php echo $menudata['M_DE'];?></td>
	<td><?php echo $menudata['SM_DE'];?></td>
	<td>
		<select name="user_permission[]" class="form-control">
			<option value="<?php echo $menudata['PERMISSAO'];?>"><?php echo $menudata['PERMISSAO'] == 'True' ? "Liberado" : "Bloqueado";?></option>
			<?php if($menudata['PERMISSAO'] == 'True'){ ?>
			<option value="False">Bloquear</option>
			<?php }else{ ?>
			<option value="True">Liberar</option>
			<?php } ?>
		</select>
	</td>
</tr>
<?php
}
?>
</tbody>
</table>
<input type="submit" name="permissionsubmit" class="btn btn-primary" value="Alterar Permissões">
</form>
</div>
</div>
</div>
<?php include 'dependencias.php';?>
</body>
</html>