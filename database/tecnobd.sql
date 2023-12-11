-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 11-12-2023 a las 03:28:45
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tecnobdp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `CarritoID` int(11) NOT NULL,
  `ClienteID` int(11) DEFAULT NULL,
  `ProductoID` int(11) DEFAULT NULL,
  `CantidadVendida` int(11) DEFAULT NULL,
  `PrecioVenta` decimal(10,2) DEFAULT NULL,
  `CuponID` int(11) DEFAULT NULL,
  `Estado` varchar(20) DEFAULT 'En carrito',
  `Activo` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `CategoriaID` int(11) NOT NULL,
  `DesCategoria` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`CategoriaID`, `DesCategoria`) VALUES
(1, 'Discos Duros'),
(2, 'Procesadores'),
(3, 'Monitores'),
(4, 'RAM'),
(5, 'Tarjetas Gráficas'),
(6, 'Teclados'),
(7, 'Mouse');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cupon`
--

CREATE TABLE `cupon` (
  `CuponID` int(11) NOT NULL,
  `Codecup` varchar(10) DEFAULT NULL,
  `DesCupon` varchar(150) DEFAULT NULL,
  `Descuento` int(11) NOT NULL,
  `Mensaje` varchar(100) NOT NULL,
  `CategoriaID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `cupon`
--

INSERT INTO `cupon` (`CuponID`, `Codecup`, `DesCupon`, `Descuento`, `Mensaje`, `CategoriaID`) VALUES
(1, 'PR0C354D0R', 'hace un 10% de descuento en productos de  procesadores', 10, 'cupon promocional canjeaeo', 2),
(2, 'F4N4V1D4D', 'hace un 50% de descuento en discos duros', 50, 'cupon festivo canjeado', 1),
(3, 'M45T3CN0', 'hace un 15% de descuento en toda la tienda', 15, 'cupon de amor canjeado', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `PagosID` int(11) NOT NULL,
  `Tarjeta` varchar(30) DEFAULT NULL,
  `NumTar` int(11) DEFAULT NULL,
  `Vencimiento` varchar(10) DEFAULT NULL,
  `CVV` int(11) DEFAULT NULL,
  `Envio` varchar(150) DEFAULT NULL,
  `Descr` varchar(150) DEFAULT NULL,
  `ClienteID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`PagosID`, `Tarjeta`, `NumTar`, `Vencimiento`, `CVV`, `Envio`, `Descr`, `ClienteID`) VALUES
(1, 'Pepe Botella', 1234567890, '25/24', 864, '', '', 1),
(2, 'Patricio Estrella', 2147483647, '02/25', 953, 'Av. Convención Estrada', '', 2),
(3, 'Boeponja', 2147483647, '23/27', 125, 'Mural Literario #123', 'Una casa con puertas y ventanas', 2),
(4, 'Macareno', 4737, '30/27', 906, 'Ciudad Costera', 'Vivo por el puerto', 1),
(5, 'Macareno', 4737, '30/27', 906, 'Ciudad Costera', 'Vivo por el puerto', 1),
(6, 'Salala', 2147483647, '09/38', 369, 'Ciudad Costera', 'Mi casa', 1),
(7, 'Salala', 2147483647, '09/38', 369, 'Ciudad Costera', 'Mi casa', 2),
(8, 'andres', 23456789, '23/25', 562, 'hidalgo buena vista', 'casa con porton amarillo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `PreguntaID` int(11) NOT NULL,
  `Pregunta` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`PreguntaID`, `Pregunta`) VALUES
(1, '¿Cuál es el nombre de tu primera mascota?'),
(2, '¿Cuál es tu equipo de fútbol favorito?'),
(3, '¿Cuál es el nombre de tu mejor amigo/a?'),
(4, '¿Cuál es tu color favorito?'),
(5, '¿Cuál es tu banda o artista favorito?');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `ProductoID` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Descripción` varchar(250) NOT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  `NúmeroSerie` varchar(30) DEFAULT NULL,
  `ProveedorID` int(11) DEFAULT NULL,
  `PrecioCompra` decimal(10,2) DEFAULT NULL,
  `PrecioVenta` decimal(10,2) DEFAULT NULL,
  `CantidadStock` int(11) DEFAULT NULL,
  `Imagen` varchar(30) DEFAULT NULL,
  `CategoriaID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ProductoID`, `Nombre`, `Descripción`, `Modelo`, `NúmeroSerie`, `ProveedorID`, `PrecioCompra`, `PrecioVenta`, `CantidadStock`, `Imagen`, `CategoriaID`) VALUES
(123, 'Seagate Skyhawk 1Tb', '1Tb, 3.5 Pulgadas, Sata Iii, 5400 Rpm, 256mb Cache', 'barracuda', '765678', 2, 700.00, 1600.00, 15, 'img/barracuda_1tb.webp', 1),
(125, 'Western Digital 18tb', '18tb, Sata, 7200 Rpm, Cache 512 Mb, 3.5\"', 'wd', '89641', 2, 6000.00, 8200.00, 5, 'img/wd_18tb.webp', 1),
(146, 'Seagate Barracuda 4tb', '4tb, 3.5 Pulgadas, Sata Iii, 5400 Rpm, 256mb', 'barracuda', '87654', 2, NULL, 1600.00, 20, 'img/barracuda_4tb.webp', 1),
(174, 'Intel Core i5', 'Cache 24 Mb, Nucleos 14, Hilos 20, 5.1 Ghz', 'core', '42888', 1, NULL, 5900.00, 4, 'img/core_i5.webp', 2),
(193, 'Seagate Skyhawk 20tb', '20 Tb, Serial Ata Iii, Cache 256 Mb, 3.5\"', 'skyhawk', '45782', 2, NULL, 8900.00, 5, 'img/skyhawk_20tb.webp', 1),
(525, 'AMD Ryzen 7', 'Skt Am5, 5nm, 4.2 Ghz, 8 Core', 'ryzen', '24743', 1, 0.00, 7500.00, 13, 'img/ryzen_7.webp', 2),
(567, 'Western Digital 8tb', '8tb, Sata 6gb/s, 5640rpm, 128mb', 'barracuda', '78902', 2, 3000.00, 4150.00, 10, 'img/wd_8tb.webp', 1),
(689, 'Seagate Ironwolf 18tb', '18tb, 7200 Rpm, Cache 256 Mb, 3.5\"', 'ironwolf', '34572', 2, 5500.00, 7100.00, 7, 'img/ironwolf_18tb.webp', 1),
(746, 'Intel Core i3', 'Cache 12 Mb, Nucleos 4, Hilos 8, 4.5 Ghz', 'core', '42887', 1, NULL, 2000.00, 11, 'img/core_i3.webp', 2),
(782, 'Intel Celeron', 'kt 1200, 3.5ghz, 4mb Cache', 'celeron', '42572', 1, 400.00, 900.00, 4, 'img/celeron.webp', 2),
(789, 'Intel Core i7', 'Cache 30 Mb, 16 Nucleos, 24 Hilos, 5.2 Ghz', 'core', '42882', 1, NULL, 7600.00, 9, 'img/core_i7.webp', 2),
(913, 'Seagate Ironwolf 6tb', '18tb, 7200 Rpm, Cache 256 Mb, 3.5\"', 'ironwolf', '93157', 2, 3000.00, 4200.00, 10, 'img/ironwolf_6tb.webp', 1),
(78124, 'Seagate Barracuda 2tb', '2tb, 3.5 Pulgadas, Sata Iii, 5400 Rpm, 256mb', 'barracuda', '87654', 2, NULL, 1000.00, 20, 'img/hard_drive.webp', 1),
(78125, 'AMD Ryzen 5', 'Socket Am5, 4.7ghz, 5.3ghz, 38mb Cache', 'ryzen', '24743', 1, 0.00, 4000.00, 17, 'img/ryzen_5.jpg', 2),
(78126, 'Intel Core i9', 'Cache 36mb, Nucleos 24, Hilos 32, 5.8 Ghz', 'core', '42882', 1, NULL, 10600.00, 9, 'img/core_i9.webp', 2),
(78127, 'AMD Athlon', '3.5 Ghz 4mb 35w Am4 Vega Graphics', 'amd', NULL, 1, NULL, 900.00, 2, 'img/amd.png', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `ProveedorID` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Dirección` varchar(150) DEFAULT NULL,
  `NúmeroContacto` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`ProveedorID`, `Nombre`, `Dirección`, `NúmeroContacto`) VALUES
(1, 'Jose Luis Ornelas Valadez', 'Santander 127 Col. España', '+52 1 449 279 5404'),
(2, 'Adrian Alonso Arambula', 'Santander 127 Col. España', '+52 1 449 543 6109');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ClienteID` int(11) NOT NULL,
  `IsAdmin` tinyint(1) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Dirección` varchar(150) DEFAULT NULL,
  `NúmeroContacto` varchar(20) DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Contraseña` varchar(40) DEFAULT NULL,
  `Cuenta` varchar(30) DEFAULT NULL,
  `PreguntaID` int(11) DEFAULT NULL,
  `RespuestaP` varchar(50) DEFAULT NULL,
  `Estado` varchar(10) NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ClienteID`, `IsAdmin`, `Nombre`, `Dirección`, `NúmeroContacto`, `Correo`, `Contraseña`, `Cuenta`, `PreguntaID`, `RespuestaP`, `Estado`) VALUES
(1, 0, 'Adrian Alonso Arambula', 'Santander 127 Col. España', '(449) 543-6109', 'adrianalonso.a4@gmail.com', 'e9d1d42e658461e23c02ca01d57bf7b31d9d4f51', 'YuunoDev', 4, 'azul', 'activo'),
(2, 0, 'Erik', 'Lomas Turbias', '4495451413', 'erikalbadavila@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'ErikUni', 1, 'chicharo', 'activo'),
(3, 0, 'Erik', 'Lomas Turbias', '4495451413', 'erikalbadavila@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'ErikUni', 1, 'chicharo', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `VentaID` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `CarritoID` int(11) DEFAULT NULL,
  `PrecioVentaTotal` decimal(10,2) DEFAULT NULL,
  `PagosID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`CarritoID`),
  ADD KEY `ClienteID` (`ClienteID`),
  ADD KEY `ProductoID` (`ProductoID`),
  ADD KEY `CuponID` (`CuponID`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`CategoriaID`);

--
-- Indices de la tabla `cupon`
--
ALTER TABLE `cupon`
  ADD PRIMARY KEY (`CuponID`),
  ADD KEY `fk_cupon_categoria` (`CategoriaID`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`PagosID`),
  ADD KEY `ClienteID` (`ClienteID`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`PreguntaID`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ProductoID`),
  ADD KEY `ProveedorID` (`ProveedorID`),
  ADD KEY `CategoriaID` (`CategoriaID`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`ProveedorID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ClienteID`),
  ADD KEY `PreguntaID` (`PreguntaID`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`VentaID`),
  ADD KEY `PagosID` (`PagosID`),
  ADD KEY `fk_carrito_ventas` (`CarritoID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `CarritoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `CategoriaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `cupon`
--
ALTER TABLE `cupon`
  MODIFY `CuponID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `PagosID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `PreguntaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `ProductoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78128;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `ProveedorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ClienteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `VentaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`ClienteID`) REFERENCES `usuarios` (`ClienteID`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`ProductoID`) REFERENCES `producto` (`ProductoID`),
  ADD CONSTRAINT `carrito_ibfk_3` FOREIGN KEY (`CuponID`) REFERENCES `cupon` (`CuponID`);

--
-- Filtros para la tabla `cupon`
--
ALTER TABLE `cupon`
  ADD CONSTRAINT `fk_cupon_categoria` FOREIGN KEY (`CategoriaID`) REFERENCES `categoria` (`CategoriaID`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`ClienteID`) REFERENCES `usuarios` (`ClienteID`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`ProveedorID`) REFERENCES `proveedores` (`ProveedorID`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`CategoriaID`) REFERENCES `categoria` (`CategoriaID`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`PreguntaID`) REFERENCES `preguntas` (`PreguntaID`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_carrito_ventas` FOREIGN KEY (`CarritoID`) REFERENCES `carrito` (`CarritoID`),
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`PagosID`) REFERENCES `pagos` (`PagosID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
