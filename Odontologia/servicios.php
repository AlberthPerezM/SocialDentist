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
    <link rel="stylesheet" href="estilo.css">
    <link rel="stylesheet" href="css/fontello.css">
    <title>Pagina prueba</title>
</head>

<body>
    <header>
        <h2 class="logo">SocialDenstist</h2>
        <input type="checkbox" id="check">
        <label for="check" class="mostrar-menu">
            &#8801
        </label>

        <nav class="menu">
            <a href="index.html">Inicio</a>
            <a href="nosotros.html">Nosotros</a>
            <a href="servicios.php">Servicios</a>
            <a href="listaServicios.php">Intranet</a>
            <label for="check" class="esconder-menu">
                &#215
            </label>
        </nav>
    </header>
    <section id="banner">
        <div class="contenido-banner">

        </div>
    </section>
    <div class="albums">
        <!--Card -->
        <?php foreach ($servicio as $servicios) { ?>
            <div class="album">
                <img class="album__imagenes" src="<?php echo $servicios['foto'] ?>">
                <div class="album__detalles">
                    <h2 class="nombre_esp"><?php echo $servicios['nombreEspecialidad'] ?> </h2>

                    <p class="album__desc line-clamp"><?php echo $servicios['descripcion'] ?></p>
                    <button class="button">Click aqui</button>
                </div>
            </div>
        <?php } ?>
        <!---->
    </div>

    <footer class="footer-basic-centered">

        <p class="footer-company-motto">SocialDenstist</p>

        <p class="footer-links">
            <a href="index.html">Inicio</a>
            <a href="nosotros.html">Nosotros</a>
            <a href="servicios.html">Servicios</a>
        </p>

        <p class="footer-company-name">SocialDenstist &copy; 2022</p>

    </footer>
</body>
</html>