<!DOCTYPE html>
<html>
<?php include 'cabecalho.php';?>
<body>
<?php include 'menu.php';?>

<div class="container">
	<div class="row">
		<div class="col-md-6">
			<h4>Lista de Menu</h4>
			<hr>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Descrição Menu</th>
						<th>Ícone Menu</th>
					</tr>
				</thead>
				<tbody>

						<?php
						include 'conexao.php';
						$menulistqry="SELECT * FROM MENUS WHERE ME_STATUS = 'Ativo'";
						$menulistres=mysqli_query($con,$menulistqry);
						while ($menudata=mysqli_fetch_assoc($menulistres)) {
						?>
						<tr>
							<td><?php echo $menudata['ID'];?></td>
							<td><?php echo $menudata['DESCRICAO'];?></td>
							<td><?php echo $menudata['ICONE'];?></td>
							</tr>
						<?php
						}
						?>
					
				</tbody>
			</table>
		</div>

		<div class="col-md-6">
			<h4>Adicionar Nova Opção</h4>
			<hr>

			<form method="post" action="adicionar_menu.php">
				<div class="form-group">
					<input type="text" name="descricao" placeholder="Descrição do Menu" class="form-control" />
				</div>
				<div class="form-group">
					<input type="text" name="icone" placeholder="Ícone do Menu" class="form-control" />
				</div>
				<div class="form-group">
					<input name="menu_submit" class="btn btn-primary" type="submit" value="Adicionar"/>
				</div>
			</form>
			
		</div>
	</div>
</div>
<?php include 'dependencias.php';?>
</body>
</html>