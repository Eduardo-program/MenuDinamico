<?php
include 'conexao.php';

if(isset($_POST['submenu_submit']))
{
	$menu_id=$_POST['menu_id'];
	$submenu_name=$_POST['submenu_name'];
	$submenu_url=$_POST['submenu_url'];
	$status=$_POST['submenu_display'];

	if($submenu_name!='')
	{
		$insertqry="INSERT INTO `SUB_MENUS`( `ID_MENU`, `DESCRICAO`, `ENDERECO`, `SM_STATUS`) VALUES ('$menu_id','$submenu_name','$submenu_url','$status')";
		$insertres=mysqli_query($con,$insertqry);

		$lastid=$con->insert_id;
	
	foreach ($_POST['department_id'] as $key => $value) {
		$department_id=$_POST['department_id'][$key];

		$subdeptqry="INSERT INTO `MENU_CARGOS`( `ID_MENU`, `ID_SUB_MENU`, `ID_CARGO`, `MC_STATUS`) VALUES ('$menu_id','$lastid','$department_id','$status')";
		$subdeptres=mysqli_query($con,$subdeptqry);
	}
}
}
echo '<script>alert("Sub Menu Adicionado com sucesso.");
		window.location="adicionar_submenu.php";
</script>';
?>