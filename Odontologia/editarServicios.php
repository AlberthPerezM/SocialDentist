<?php
include_once 'conexion/conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();

$id_servicio = $_GET['id'];

$consulta = "SELECT * FROM especialidad WHERE id_especialidad='$id_servicio'";
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
    <title>Editar servicio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>
    <div class="container-fluid p-5">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <h2>Editar servicio</h2>
                <?php foreach ($servicio as $servicios) { ?>
                    <form action="actualizar.php" method="post">
                        <p>
                            <label>ID</label>
                            <input type="text" name="id_especialidad" required="required" readonly="readonly" value="<?php echo $servicios['id_especialidad'] ?>" class="form-control">
                        </p>
                        <p>
                            <label>Especialidad</label>
                            <input type="text" name="nombreEspecialidad" required="required" value="<?php echo $servicios['nombreEspecialidad'] ?>" class="form-control">
                        </p>
                        <p>
                            <label>Descripcion</label>
                            <textarea type="text" name="descripcion" required="required" class="form-control"><?php echo $servicios['descripcion'] ?></textarea>
                        </p>
                        <p>
                            <label>Costo</label>
                            <input type="text" name="costo" required="required" value="<?php echo $servicios['costo'] ?>" class="form-control">
                        </p>
                        <p>
                            <label>Foto</label>
                            <textarea type="text" name="foto" class="form-control"><?php echo $servicios['foto'] ?></textarea>
                        </p>
                        <p>
                            <input type="submit" class="btn btn-info" value="Actualizar">
                            <a href="listaServicios.php" class="btn btn-primary">Volver a servicios</a>
                        </p>
                    </form>
                <?php } ?>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
</body>

</html>