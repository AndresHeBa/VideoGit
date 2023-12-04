-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 04-12-2023 a las 03:58:09
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
-- Base de datos: `tecnobd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Categoria`
--

CREATE TABLE `Categoria` (
  `CategoriaID` int(11) NOT NULL,
  `DesCategoria` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `Categoria`
--

INSERT INTO `Categoria` (`CategoriaID`, `DesCategoria`) VALUES
(1, 'Discos Duros'),
(2, 'Procesadores'),
(3, 'Monitores'),
(4, 'RAM'),
(5, 'Tarjetas Gráficas'),
(6, 'Teclados'),
(7, 'Mouse');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DetallesVenta`
--

CREATE TABLE `DetallesVenta` (
  `DetalleVentaID` int(11) NOT NULL,
  `VentaID` int(11) DEFAULT NULL,
  `ProductoID` int(11) DEFAULT NULL,
  `CantidadVendida` int(11) DEFAULT NULL,
  `PrecioVenta` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Preguntas`
--

CREATE TABLE `Preguntas` (
  `PreguntaID` int(11) NOT NULL,
  `Pregunta` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `Preguntas`
--

INSERT INTO `Preguntas` (`PreguntaID`, `Pregunta`) VALUES
(1, '¿Cuál es el nombre de tu primera mascota?'),
(2, '¿Cuál es tu equipo de fútbol favorito?'),
(3, '¿Cuál es el nombre de tu mejor amigo/a?'),
(4, '¿Cuál es tu color favorito?'),
(5, '¿Cuál es tu banda o artista favorito?');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Producto`
--

CREATE TABLE `Producto` (
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Proveedores`
--

CREATE TABLE `Proveedores` (
  `ProveedorID` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Dirección` varchar(150) DEFAULT NULL,
  `NúmeroContacto` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `Proveedores`
--

INSERT INTO `Proveedores` (`ProveedorID`, `Nombre`, `Dirección`, `NúmeroContacto`) VALUES
(1, 'Jose Luis Ornelas Valadez', 'Santander 127 Col. España', '+52 1 449 279 5404'),
(2, 'Adrian Alonso Arambula', 'Santander 127 Col. España', '+52 1 449 543 6109');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `ClienteID` int(11) NOT NULL,
  `IsAdmin` tinyint(1) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Dirección` varchar(150) DEFAULT NULL,
  `NúmeroContacto` varchar(20) DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Contraseña` varchar(40) DEFAULT NULL,
  `Cuenta` varchar(30) DEFAULT NULL,
  `PreguntaID` int(11) DEFAULT NULL,
  `RespuestaP` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`ClienteID`, `IsAdmin`, `Nombre`, `Dirección`, `NúmeroContacto`, `Correo`, `Contraseña`, `Cuenta`, `PreguntaID`, `RespuestaP`) VALUES
(1, 0, 'Adrian Alonso Arambula', 'Santander 127 Col. España', '(449) 543-6109', 'adrianalonso.a4@gmail.com', 'e9d1d42e658461e23c02ca01d57bf7b31d9d4f51', 'YuunoDev', 4, 'azul');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ventas`
--

CREATE TABLE `Ventas` (
  `VentaID` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `ClienteID` int(11) DEFAULT NULL,
  `PrecioVentaTotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Categoria`
--
ALTER TABLE `Categoria`
  ADD PRIMARY KEY (`CategoriaID`);

--
-- Indices de la tabla `DetallesVenta`
--
ALTER TABLE `DetallesVenta`
  ADD PRIMARY KEY (`DetalleVentaID`),
  ADD KEY `VentaID` (`VentaID`),
  ADD KEY `ProductoID` (`ProductoID`);

--
-- Indices de la tabla `Preguntas`
--
ALTER TABLE `Preguntas`
  ADD PRIMARY KEY (`PreguntaID`);

--
-- Indices de la tabla `Producto`
--
ALTER TABLE `Producto`
  ADD PRIMARY KEY (`ProductoID`),
  ADD KEY `ProveedorID` (`ProveedorID`),
  ADD KEY `fk_Producto_Categoria` (`CategoriaID`);

--
-- Indices de la tabla `Proveedores`
--
ALTER TABLE `Proveedores`
  ADD PRIMARY KEY (`ProveedorID`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`ClienteID`),
  ADD KEY `fk_Pregunta_Usuario` (`PreguntaID`);

--
-- Indices de la tabla `Ventas`
--
ALTER TABLE `Ventas`
  ADD PRIMARY KEY (`VentaID`),
  ADD KEY `ClienteID` (`ClienteID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Categoria`
--
ALTER TABLE `Categoria`
  MODIFY `CategoriaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `DetallesVenta`
--
ALTER TABLE `DetallesVenta`
  MODIFY `DetalleVentaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Preguntas`
--
ALTER TABLE `Preguntas`
  MODIFY `PreguntaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `Producto`
--
ALTER TABLE `Producto`
  MODIFY `ProductoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Proveedores`
--
ALTER TABLE `Proveedores`
  MODIFY `ProveedorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `ClienteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Ventas`
--
ALTER TABLE `Ventas`
  MODIFY `VentaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `DetallesVenta`
--
ALTER TABLE `DetallesVenta`
  ADD CONSTRAINT `DetallesVenta_ibfk_1` FOREIGN KEY (`VentaID`) REFERENCES `Ventas` (`VentaID`),
  ADD CONSTRAINT `DetallesVenta_ibfk_2` FOREIGN KEY (`ProductoID`) REFERENCES `Producto` (`ProductoID`);

--
-- Filtros para la tabla `Producto`
--
ALTER TABLE `Producto`
  ADD CONSTRAINT `Producto_ibfk_1` FOREIGN KEY (`ProveedorID`) REFERENCES `Proveedores` (`ProveedorID`),
  ADD CONSTRAINT `fk_Producto_Categoria` FOREIGN KEY (`CategoriaID`) REFERENCES `Categoria` (`CategoriaID`);

--
-- Filtros para la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD CONSTRAINT `fk_Pregunta_Usuario` FOREIGN KEY (`PreguntaID`) REFERENCES `Preguntas` (`PreguntaID`);

--
-- Filtros para la tabla `Ventas`
--
ALTER TABLE `Ventas`
  ADD CONSTRAINT `Ventas_ibfk_1` FOREIGN KEY (`ClienteID`) REFERENCES `Usuarios` (`ClienteID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
