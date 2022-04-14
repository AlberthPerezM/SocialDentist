-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-04-2022 a las 04:13:22
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `consultorio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `id_cargo` int(11) NOT NULL,
  `nombreCargo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id_cargo`, `nombreCargo`) VALUES
(1, 'Dentista'),
(2, 'Asistente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `id_cita` int(11) NOT NULL,
  `fechaCita` date NOT NULL,
  `horaCita` time NOT NULL,
  `comentario` varchar(500) NOT NULL DEFAULT 'Sin comentarios',
  `id_especialidad` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`id_cita`, `fechaCita`, `horaCita`, `comentario`, `id_especialidad`, `id_cliente`, `id_usuario`) VALUES
(1, '2022-04-13', '19:02:49', 'Ninguno', 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombreCliente` varchar(55) NOT NULL,
  `apellidoP` varchar(45) NOT NULL,
  `apellidoM` varchar(45) NOT NULL,
  `dni` char(8) NOT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombreCliente`, `apellidoP`, `apellidoM`, `dni`, `celular`, `correo`) VALUES
(1, 'Pachacutec Americo', 'Barrantes', 'Arias', '71324893', '993781915', 'paba15@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contulta`
--

CREATE TABLE `contulta` (
  `id_contulta` int(11) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `nombre` varchar(55) NOT NULL,
  `mensaje` varchar(500) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id_especialidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id_especialidad` int(11) NOT NULL,
  `nombreEspecialidad` varchar(60) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `costo` float NOT NULL,
  `foto` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`id_especialidad`, `nombreEspecialidad`, `descripcion`, `costo`, `foto`) VALUES
(1, 'Extracciones', 'Es un procedimiento que consiste en extraer el diente enfermo que no puede ser tratado a través de otros métodos conservativos, para evitar posibles infecciones graves.\nLa extracción del diente puede ser simple o quirúrgica, el procedimiento más común utilizado para la extracción de los dientes es la extracción simple. Si para extraer el diente es necesaria una fuerza excesiva para obtener la extracción del diente, o si falta una parte sustancial de la corona del diente y el acceso a la raíz se vuelve difícil, entonces se recomienda la extracción quirúrgica del diente.\n', 50, 'https://fundacionbest.org.mx/assets/images/images_notas/extraccion-dental.jpg'),
(2, 'Curaciones con resina', 'Son el tratamiento para curar las caries en los dientes primero se retira el material afectado (cariado), se limpia el área afectada, luego se rellena la cavidad con un material de restauración en este caso resina.', 75, 'https://dentistasperu.org/sites/default/files/inline-images/Curacion%20dental%20Lima.jpg'),
(3, 'Prótesis removibles en base metálica', 'Las prótesis parciales removibles metálicas son diseñadas y estructuradas de tal modo que el paciente pueda instalarlas y retirarlas de la boca, facilitando, de este modo, la limpieza y el mantenimiento de la higiene bucal. Constan de una estructura o base compuesta por un material plástico o una aleación metálica que soporta los dientes artificiales.', 130, 'https://dentalrio.files.wordpress.com/2017/06/img-04.jpg?w=750'),
(4, 'Prótesis totales', 'La base de una prótesis dental está diseñada para imitar el tejido de las encías naturales y está hecha de acrílico cuidadosamente pigmentado conocido como polimetacrilato de metilo o PMMA. Las superficies visibles de PMMA están pulidas para lucir lo más natural posible y también ayudan a evitar el desarrollo de bacterias en las prótesis dentales, para que se mantengan frescas y limpias.  \r\nLas prótesis dentales superiores tienden a cubrir el techo de la boca, mientras que las inferiores tienen forma de U, para garantizar que haya suficiente espacio para la lengua.', 700, 'https://bqdentalcenters.es/wp-content/uploads/protesis-dentadura-postiza.jpg'),
(5, 'Puentes y coronas de porcelana', 'Son conocidos como fundas dentales y también son soluciones funcionales que, además, en muchos casos recuperan la estética de los dientes.', 130, 'https://www.dentaltix.com/es/sites/default/files/puente-dental-protesis-fija.jpg'),
(6, 'Destartraje dental con ultrasonido', 'El Destartraje que es la limpieza dental, puede realizarse con equipo de ultrasonido para eliminar el sarro adherido a los dientes. Limpieza manual con pasta dental profiláctica y cepillo para las manchas en los dientes. Limpieza dental manual con instrumentos para llegar a zonas de difícil acceso.', 90, 'https://www.odontologia33.com/upload/20210121155207mxes253_cro10.jpg'),
(7, 'Profilaxis', 'Es el procedimiento de higiene dental cuyo objetivo es limpiar las superficies dentarias, retirando el sarro dental o placa calcificada que se encuentra adherido y acumulado en aquellas zonas de los dientes que no son accesibles con el cepillado dental.', 80, 'https://bqdentalcenters.es/wp-content/uploads/limpieza-dental-profilaxis-825x465.jpg'),
(8, 'Endodoncia', 'La endodoncia es un procedimiento que tiene como finalidad preservar las piezas dentales dañadas, evitando así su pérdida. Para ello, se extrae la pulpa dental y la cavidad resultante, se rellena y sella con material inerte y biocompatible.', 80, 'https://clinicastoma.com/wp-content/uploads/2014/11/2254-clinica-dental-stoma-alcorcon-y-mostoles-endodoncia-1.jpg'),
(9, 'Ortodoncia', 'La Ortodoncia es la especialidad odontológica encargada de corregir los dientes y huesos que se encuentran en posición incorrecta.\r\nAdemás, la malposición dentaria puede generar otras molestias en el resto del cuerpo, como tensión en los músculos de la masticación, síndrome de ATM y dolores en el cuello, hombros y espalda, entre otros.', 90, 'https://www.higienistasvitis.com/wp-content/uploads/2017/11/Portada-medidas.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombreUsuario` varchar(55) NOT NULL,
  `apellidoPusuario` varchar(45) NOT NULL,
  `apellidoMusuario` varchar(45) NOT NULL,
  `foto` varchar(300) DEFAULT NULL,
  `id_cargo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombreUsuario`, `apellidoPusuario`, `apellidoMusuario`, `foto`, `id_cargo`) VALUES
(1, 'Efrain', 'Tito', 'Camones', 'https://img.icons8.com/external-konkapp-outline-color-konkapp/200/external-dentist-profession-avatar-konkapp-outline-color-konkapp.png', 1),
(2, 'Karolina', 'Hernandez', 'Zapata', 'https://img.icons8.com/external-konkapp-outline-color-konkapp/200/external-nurse-emergency-services-konkapp-outline-color-konkapp.png', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `id_especialidad` (`id_especialidad`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `contulta`
--
ALTER TABLE `contulta`
  ADD PRIMARY KEY (`id_contulta`),
  ADD KEY `id_especialidad` (`id_especialidad`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id_especialidad`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_cargo` (`id_cargo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `contulta`
--
ALTER TABLE `contulta`
  MODIFY `id_contulta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id_especialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id_especialidad`),
  ADD CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `cita_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `contulta`
--
ALTER TABLE `contulta`
  ADD CONSTRAINT `contulta_ibfk_1` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id_especialidad`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
