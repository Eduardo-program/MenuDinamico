<!DOCTYPE html>
<html>
<?php include 'cabecalho.php';?>
<body>
<?php include 'menu.php';?>
<?php include 'conexao.php';?>
<div class="container">
<div class="row">
<div class="col-md-6">
<h4>Lista de SubMenus</h4>
<hr>
<div class="table-responsive">
<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Menu</th>
						<th>Sub Menu Desc</th>
						<th>Sub Menu Endereço</th>
					</tr>
				</thead>
				<tbody>
						<?php
						include 'conexao.php';
						$menulistqry="SELECT SUB_MENUS.*, MENUS.DESCRICAO AS MENU_DESC FROM SUB_MENUS INNER JOIN MENUS ON MENUS.ID = SUB_MENUS.ID_MENU 
						WHERE SM_STATUS = 'Ativo'";
						$menulistres=mysqli_query($con,$menulistqry);
						while ($menudata=mysqli_fetch_assoc($menulistres)) {
						?>
						<tr>
							<td><?php echo $menudata['ID'];?></td>
							<td><?php echo $menudata['MENU_DESC'];?></td>
							<td><?php echo $menudata['DESCRICAO'];?></td>
							<td><?php echo $menudata['ENDERECO'];?></td>
						</tr>
						<?php
						}
						?>
					
				</tbody>
			</table>
</div>
</div>

<div class="col-md-6">
<h4>Sub Menu Add</h4>
<hr>
	<form method="post" action="submenu_adddb.php">
	<div class="form-group">
	<select class="form-control" name="menu_id">
		<option value="">Selecionar Menu</option>
		<?php
		$menulistqry="SELECT * FROM MENUS WHERE ME_STATUS = 'Ativo'";
		$menulistres=mysqli_query($con,$menulistqry);
		while ($menudata=mysqli_fetch_assoc($menulistres)) {
		?>
		<option value="<?php echo $menudata['ID'];?>"><?php echo $menudata['DESCRICAO'];?></option>
	<?php } ?>
	</select>
	</div>

	<div class="form-group">
	<input type="text" name="submenu_name" placeholder="Descrição SubMenu" class="form-control" />
	</div>

	<div class="form-group">
	<input type="text" name="submenu_url" placeholder="Endereço/Nome do Fonte" class="form-control" />
	</div>

	<div class="form-group">
	<select class="form-control" name="submenu_display">
		<option value="Yes">Selecione se Está Ativo</option>
		<option value="Ativo">Ativo</option>
		<option value="Desativo">Desativado</option>
	</select>
	</div>

	<div class="form-group">
		<a>Grupos de Usuário:</a>
	<select class="form-control" name="department_id[]" multiple>
		<?php
		$deptlistqry="SELECT * FROM CARGOS";
		$deptlistres=mysqli_query($con,$deptlistqry);
		while ($deptdata=mysqli_fetch_assoc($deptlistres)) {
		?>
		<option value="<?php echo $deptdata['ID'];?>"><?php echo $deptdata['DESCRICAO'];?></option>
	<?php } ?>
	</select>
	</div>
	
	<div class="form-group">
	<input name="submenu_submit" class="btn btn-primary" type="submit" value="Adicionar"/>
	</div>
	</form>
</div>
</div>
</div>
<?php include 'dependencias.php';?>
</body>
</html>