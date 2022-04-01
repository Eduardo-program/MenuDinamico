<?php
include 'conexao.php';

if(isset($_POST['submenu_submit']))
{
	$menu_id=$_POST['menu_id'];
	$submenu_name=$_POST['submenu_name'];
	$status=$_POST['submenu_display'];

	if($submenu_name!='')
	{
		$insertqry="INSERT INTO `SUB_MENUS`( `ID_MENU`, `DESCRICAO`, `SM_STATUS`) VALUES ('$menu_id','$submenu_name','$status')";
		$insertres=mysqli_query($con,$insertqry);

		$lastid=$con->insert_id;
	
	foreach ($_POST['department_id'] as $key => $value) {
		$department_id=$_POST['department_id'][$key];

		$subdeptqry="INSERT INTO `MENU_CARGOS`( `ID_MENU`, `ID_SUB_MENU`, `ID_CARGO`, `MC_STATUS`) VALUES ('$menu_id','$lastid','$department_id','$status')";
		$subdeptres=mysqli_query($con,$subdeptqry);

		$menulistqry="SELECT ID FROM USUARIOS WHERE ID_CARGO = '$department_id'";
		$menulistres=mysqli_query($con,$menulistqry);
		while ($id_usuario=mysqli_fetch_assoc($menulistres)) {
			$id_usuario = $id_usuario['ID'];
			$abc="INSERT INTO `MENU_USUARIOS`( `ID_MENU`, `ID_SUB_MENU`, `ID_USUARIO`, `PERMISSAO`) VALUES ('$menu_id','$lastid',$id_usuario,'True')";
			$abcd=mysqli_query($con,$abc);
		}
	}
}
}
echo '<script>alert("Sub Menu Adicionado com sucesso.");
		window.location="cadastrar_submenu.php";
</script>';
?>