<?php
include("conexion/conexion.php");
$objeto = new Conexion();
$con = $objeto->Conectar();

$id_especialidad=$_POST['id_especialidad'];
$nombreEspecialidad=$_POST['nombreEspecialidad'];
$descripcion=$_POST['descripcion'];
$costo=$_POST['costo'];
$foto=$_POST['foto'];

$sql="UPDATE especialidad SET id_especialidad='$id_especialidad', nombreEspecialidad='$nombreEspecialidad', descripcion='$descripcion', costo='$costo', foto='$foto' WHERE id_especialidad='$id_especialidad'";
$query = $con->prepare($sql);
$query->execute();
$servicio=$query->fetchAll(PDO::FETCH_ASSOC);

if($query){
    Header("Location: listaServicios.php");
}
?>
