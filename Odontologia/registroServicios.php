<?php
include_once 'conexion/conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();

$consulta = "SELECT * FROM especialidad";
$resultado = $conexion->prepare($consulta);
$resultado->execute();
$servicio = $resultado->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro servicios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>
    <div class="container-fluid p-5">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <h2>Nuevo servicio</h2>
                <form action="insertar.php" method="POST">
                    <p>
                        <label>Especialidad</label>
                        <input type="text" name="nombreEspecialidad" class="form-control">
                    </p>
                    <p>
                        <label>Descripcion</label>
                        <textarea type="text" name="descripcion" class="form-control"></textarea>
                    </p>
                    <p>
                        <label>Costo</label>
                        <input type="text" name="costo" class="form-control">
                    </p>
                    <p>
                        <label>Foto</label>
                        <textarea type="text" name="foto" class="form-control"></textarea>
                    </p>
                    <input type="submit" class="btn btn-success" value="Registrar">
                    <a href="listaServicios.php" class="btn btn-primary">Volver a servicios</a>
                </form>
            </div>
            <div class="col-md-4"></div>
        </div>
</body>

</html>