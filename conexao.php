<?php

// CHUMBADO USUARIO --------
$USUARIO = 'eduardo.garcia';
// -------------------------

$con = mysqli_connect('localhost',
                    'root',
                    '',
                    'menu');

if(mysqli_connect_errno())
{
	echo 'Erro ao conectar '.mysqli_connect_error();
}

?>