-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-10-2024 a las 18:24:52
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tiendavirtual`
--
CREATE DATABASE IF NOT EXISTS `tiendavirtual` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tiendavirtual`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--
-- Creación: 03-10-2024 a las 21:30:26
-- Última actualización: 06-10-2024 a las 16:00:43
--

CREATE TABLE `carrito` (
  `id_carrito` int(11) NOT NULL,
  `fechaCreacion` date NOT NULL,
  `id_usuarios` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id_carrito`, `fechaCreacion`, `id_usuarios`, `id_producto`) VALUES
(1, '2024-10-01', 3, 1),
(2, '2024-07-07', 5, 2),
(4, '2024-04-09', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--
-- Creación: 05-10-2024 a las 04:20:38
-- Última actualización: 06-10-2024 a las 15:35:30
--

CREATE TABLE `orden` (
  `id_orden` int(11) NOT NULL,
  `id_carrito` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `cotosEnvio` decimal(7,3) NOT NULL,
  `direccionEnvio` text NOT NULL,
  `nombreDestinatario` varchar(30) NOT NULL,
  `telefonoDestinatario` varchar(15) NOT NULL,
  `valorTotalCompra` decimal(7,3) NOT NULL,
  `fechaEnvio` date NOT NULL,
  `estadoOrden` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`id_orden`, `id_carrito`, `id_vendedor`, `cotosEnvio`, `direccionEnvio`, `nombreDestinatario`, `telefonoDestinatario`, `valorTotalCompra`, `fechaEnvio`, `estadoOrden`) VALUES
(2, 1, 3, '20.000', 'Apartamentos terra armenia/Quindio apot 503 torre 2', 'Laura corrales ', '3125789643', '97.000', '2024-06-09', 'Por cancelar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--
-- Creación: 05-10-2024 a las 04:05:18
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `codigoPago` varchar(10) NOT NULL,
  `estadoPago` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--
-- Creación: 05-10-2024 a las 04:18:52
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `talla` varchar(10) NOT NULL,
  `precio` decimal(7,3) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `talla`, `precio`, `imagen`) VALUES
(1, 'chaqueta de jean hombre', 'talla M', '77.000', ''),
(2, 'Jean Skinny hombre', 'talla L', '85.000', ''),
(3, 'sueter con capota mujer', 'talla S', '70.500', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--
-- Creación: 05-10-2024 a las 04:07:58
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombres` varchar(20) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `documento` varchar(15) NOT NULL,
  `genero` varchar(10) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(25) NOT NULL,
  `contraseña` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombres`, `apellidos`, `documento`, `genero`, `fecha_nacimiento`, `telefono`, `correo`, `contraseña`) VALUES
(1, 'Juan David', 'Osorio Alvarez', '', 'Masculino', '2024-10-09', '3148480543', 'juan99980103@gmail.com', 'juand998'),
(2, 'Monica VIviana', 'Suarez', '', 'Femenino', '2024-10-08', '3208774511', 'Monica34@hotmail.com', 'monica123'),
(3, 'Jose Eugenio', 'Monsalve', '', 'Masculino', '2024-02-19', '3009873466', 'jose-999@yahoo.com', 'josejose'),
(4, 'Sara ', 'Arboleda Marin', '', 'Femenino', '2000-01-08', '3124569654', 'SaraL45@mail.com', 'sara123'),
(5, 'Cristian ', 'Muñoz', '19845323', 'Masculino', '2005-01-07', '3125576787', 'Cristian1233@gmail.com', 'cristian12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--
-- Creación: 05-10-2024 a las 04:17:18
--

CREATE TABLE `vendedor` (
  `id_vendedor` int(11) NOT NULL,
  `NombreVendedor` varchar(20) NOT NULL,
  `CorreoVendedor` varchar(30) NOT NULL,
  `documentoVendedor` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vendedor`
--

INSERT INTO `vendedor` (`id_vendedor`, `NombreVendedor`, `CorreoVendedor`, `documentoVendedor`) VALUES
(1, 'Maria Camila Lopez', 'Maria-lop@gmail.com', ''),
(2, 'Carlos Andres Ramire', 'CarlosRam@gmail.com', ''),
(3, 'Carlos Sanabria ', 'carlossa@hotmail.com', '1097543964');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_carrito`),
  ADD KEY `FK_carrito_usuarios` (`id_usuarios`),
  ADD KEY `FK_carrito_producto` (`id_producto`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `FK_orden_carrito` (`id_carrito`),
  ADD KEY `FK_orden_vendedor` (`id_vendedor`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `FK_pago_orden` (`id_orden`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`id_vendedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id_carrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `id_vendedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `FK_carrito_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `FK_carrito_usuarios` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `FK_orden_carrito` FOREIGN KEY (`id_carrito`) REFERENCES `carrito` (`id_carrito`),
  ADD CONSTRAINT `FK_orden_vendedor` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`id_vendedor`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `FK_pago_orden` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
