<?php
include("conexion/conexion.php");
$objeto = new Conexion();
$conexion = $objeto->Conectar();

$id_servicio=$_GET['id'];

$sql="DELETE FROM especialidad WHERE id_especialidad='$id_servicio'";
$query = $conexion->prepare($sql);
$query->execute();
$result = $query->fetch(PDO::FETCH_ASSOC);

if($query){
    Header("Location: listaServicios.php");
}
