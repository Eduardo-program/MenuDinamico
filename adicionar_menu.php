<?php
include 'conexao.php';

if(isset($_POST['menu_submit']))
{
	$descricao = $_POST['descricao'];
	$icone = $_POST['icone'];
	$status = 'Ativo';

	if( $descricao != '' )
	{
		$insertqry="INSERT INTO `MENUS`( `DESCRICAO`, `ICONE`) VALUES ('$descricao','$icone')";
		$insertres = mysqli_query($con,$insertqry);
	}
}
echo '<script>alert(" Menu Criado com Sucesso.");
		window.location="cadastrar_menu.php";
</script>';
?>