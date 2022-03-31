<?php

//VERIFICO A CARGA DO USUARIO
function cargoUsuario($USUARIO){
    $id_cargo = 0;
    require_once 'conexao.php';

    $q_cargo = "SELECT ID_CARGO FROM USUARIOS WHERE USUARIO = 'eduardo.garcia'";
    $r_cargo = mysqli_query($con,$q_cargo);
    $cargodata = mysqli_fetch_assoc($r_cargo);
    $id_cargo = $cargodata['ID_CARGO'];

    return $id_cargo;
}


?>