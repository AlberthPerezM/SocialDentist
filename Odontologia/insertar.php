<?php
include("conexion/conexion.php");
$objeto = new Conexion();
$con = $objeto->Conectar();

$nombreEspecialidad=$_POST['nombreEspecialidad'];
$descripcion=$_POST['descripcion'];
$costo=$_POST['costo'];
$foto=$_POST['foto'];

$sql="INSERT INTO especialidad VALUES('$id_especialidad','$nombreEspecialidad','$descripcion','$costo','$foto')";
$query = $con->prepare($sql);
$query->execute();
$servicio=$query->fetchAll(PDO::FETCH_ASSOC);

if($query){
    Header("Location: listaServicios.php");   
}
?>