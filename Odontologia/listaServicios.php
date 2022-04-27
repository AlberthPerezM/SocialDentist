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
    <title>Servicios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>
    <div class="container-fluid p-4">
        <h2>Registro de servicios</h2>
        <a href="registroServicios.php" class="btn btn-warning">Agregar servicio</a> <a href="index.html" class="btn btn-primary">Inicio</a><br><br>

        <table class="table table-striped table-hover table-bordered">
            <thead>
                <tr>
                    <td>ID</td>
                    <td>Especialidad</td>
                    <td>Descripcion</td>
                    <td>Precio</td>
                    <td>Foto</td>
                    <td>Acciones</td>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($servicio as $servicios) { ?>
                    <tr>
                        <td><?php echo $servicios['id_especialidad'] ?></td>
                        <td><?php echo $servicios['nombreEspecialidad'] ?></td>
                        <td style="text-align:justify"><?php echo $servicios['descripcion'] ?></td>
                        <td>S/. <?php echo $servicios['costo'] ?></td>
                        <td>
                            <center><img src="<?php echo $servicios['foto'] ?>" width="60%"></center>
                        </td>
                        <td>
                            <center>
                            <a href="editarServicios.php?id=<?php echo $servicios['id_especialidad'] ?>" class="btn btn-outline-primary"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                </svg></a>
                            <p> </p>
                            <a href="eliminarServicios.php?id=<?php echo $servicios['id_especialidad'] ?>" class="btn btn-outline-danger"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                    <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z" />
                                </svg></a>
                            </center>
                        </td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    </div>
</body>

</html>