-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2020 a las 01:26:14
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lastopitas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idcompras` int(11) NOT NULL,
  `precioCostoProducto` int(5) DEFAULT NULL,
  `fechaCompra` date DEFAULT NULL,
  `cantidad` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idcompras`, `precioCostoProducto`, `fechaCompra`, `cantidad`) VALUES
(1, 989, '2020-05-12', 73),
(3, 522, '2020-05-28', 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controlmerma`
--

CREATE TABLE `controlmerma` (
  `idcontrolMerma` int(11) NOT NULL,
  `fechaMerma` date NOT NULL,
  `cTotalMerma` double NOT NULL,
  `totalPerdida` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `controlmerma`
--

INSERT INTO `controlmerma` (`idcontrolMerma`, `fechaMerma`, `cTotalMerma`, `totalPerdida`) VALUES
(1, '2020-01-01', 29, 245);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecompra`
--

CREATE TABLE `detallecompra` (
  `Producto_idProducto` int(11) NOT NULL,
  `compras_idcompras` int(11) NOT NULL,
  `cantidadProducto` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detallecompra`
--

INSERT INTO `detallecompra` (`Producto_idProducto`, `compras_idcompras`, `cantidadProducto`, `subtotal`) VALUES
(1, 1, 10, 50),
(3, 1, 5, 55),
(3, 3, 32, 352),
(4, 1, 38, 684),
(6, 1, 20, 200),
(6, 3, 17, 170);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecontrolmerma`
--

CREATE TABLE `detallecontrolmerma` (
  `iddetallecontrolmerma` int(10) UNSIGNED NOT NULL,
  `Producto_idProducto` int(10) UNSIGNED NOT NULL,
  `controlmerma_idcontrolMerma` int(11) NOT NULL,
  `motivoMerma` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cantidadMerma` int(11) NOT NULL,
  `subTotalMerma` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detallecontrolmerma`
--

INSERT INTO `detallecontrolmerma` (`iddetallecontrolmerma`, `Producto_idProducto`, `controlmerma_idcontrolMerma`, `motivoMerma`, `cantidadMerma`, `subTotalMerma`) VALUES
(1, 1, 1, 'El producto se perdió porque no se vendió en la fecha requerida', 15, 75),
(2, 3, 1, 'El producto se perdió porque no se vendió en la fecha requerida', 10, 110),
(4, 7, 1, 'El producto se perdió porque no se vendió en la fecha requerida', 4, 60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `Producto_idProducto` int(11) NOT NULL,
  `Ventas_idVentas` int(11) NOT NULL,
  `cantidadProducto` int(5) DEFAULT NULL,
  `subtotal` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalleventa`
--

INSERT INTO `detalleventa` (`Producto_idProducto`, `Ventas_idVentas`, `cantidadProducto`, `subtotal`) VALUES
(1, 1, 2, 30),
(1, 2, 10, 100),
(1, 3, 50, 500),
(1, 4, 10, 100),
(2, 4, 10, 100),
(2, 5, 11, 110),
(2, 6, 7, 70),
(3, 5, 3, 45),
(4, 1, 4, 100),
(4, 2, 30, 750),
(4, 4, 10, 250),
(6, 5, 1, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `ideventos` int(10) UNSIGNED NOT NULL,
  `nombreEvento` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombreCliente` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `telefonoCliente` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `correoCliente` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `direccionEvento` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fechaEvento` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`ideventos`, `nombreEvento`, `nombreCliente`, `telefonoCliente`, `correoCliente`, `direccionEvento`, `fechaEvento`) VALUES
(1, 'Cumpleaños', 'Maria Pere', '9851000001', 'm@gmail.co', 'c. 10', '2020-12-31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `idPerfil` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `apellidos` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`idPerfil`, `nombre`, `apellidos`, `email`, `telefono`, `idusuario`) VALUES
(11, NULL, NULL, NULL, NULL, 11),
(12, NULL, NULL, NULL, NULL, 12),
(13, 'Ingrid Lisset', 'Xooc', 'ingridxooc@gmail.com', '9851000000', 13),
(14, 'Lili Mercedes', 'Díaz Cupul', 'lili.diazcupul@itsva.edu.mx', '9851234567', 14),
(15, 'Marcos', 'Calvario López', 'marcos.calvario@itsva.edu.mx', '9851234567', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `precioVenta` int(5) DEFAULT NULL,
  `costoCompra` int(4) DEFAULT NULL,
  `stockActual` int(4) DEFAULT NULL,
  `stockMinimo` int(4) DEFAULT NULL,
  `stockMaximo` int(4) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombre`, `precioVenta`, `costoCompra`, `stockActual`, `stockMinimo`, `stockMaximo`, `descripcion`, `estado`) VALUES
(1, 'Paleta de mango chico', 10, 5, 15, 5, 30, 'Paleta de mango temporal', 'Nuevo'),
(2, 'Paleta de piña', 10, 7, 15, 5, 25, 'Paleta de piña temporal', 'Nuevo'),
(3, 'Paleta de mango grande', 15, 11, 8, 10, 30, 'Paleta de mango limitado chico ', 'Nuevo'),
(4, 'Paleta de fresa', 25, 18, 10, 5, 25, 'paleta de fresa bañado de chocolate', 'nuevo'),
(6, 'Paletas de sandía', 20, 10, 8, 5, 15, 'Paletas de sandía en promoción', 'Nuevo'),
(7, 'Paleta de sandía con chile', 20, 15, 8, 5, 15, 'Producto en promoción', 'Nuevo'),
(8, 'Paleta de kiwi', 25, 15, 10, 5, 15, 'Producto por tiempo limitado', 'Nuevo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idRol` int(11) NOT NULL,
  `rol` varchar(45) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idRol`, `rol`) VALUES
(1, 'administrador'),
(2, 'empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `usuario` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `idrol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `usuario`, `password`, `idrol`) VALUES
(11, 'Abraham', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 1),
(12, 'luciae', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 1),
(13, 'ingridl', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 1),
(14, 'lili', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 1),
(15, 'marcos', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idVentas` int(11) NOT NULL,
  `totalProductoVendido` int(5) DEFAULT NULL,
  `fechaVenta` date DEFAULT NULL,
  `importeTotal` int(5) DEFAULT NULL,
  `descuento` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`idVentas`, `totalProductoVendido`, `fechaVenta`, `importeTotal`, `descuento`) VALUES
(1, 10, '2020-05-12', 150, 15),
(2, 48, '2020-05-13', 884, 5),
(3, 50, '2020-05-22', 375, 25),
(4, 30, '2020-05-27', 360, 20),
(5, 15, '2020-12-31', 175, 0),
(6, 7, '2020-12-31', 69, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idcompras`);

--
-- Indices de la tabla `controlmerma`
--
ALTER TABLE `controlmerma`
  ADD PRIMARY KEY (`idcontrolMerma`);

--
-- Indices de la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD PRIMARY KEY (`Producto_idProducto`,`compras_idcompras`),
  ADD KEY `fk_Producto_has_compras_compras1_idx` (`compras_idcompras`),
  ADD KEY `fk_Producto_has_compras_Producto_idx` (`Producto_idProducto`);

--
-- Indices de la tabla `detallecontrolmerma`
--
ALTER TABLE `detallecontrolmerma`
  ADD PRIMARY KEY (`iddetallecontrolmerma`),
  ADD UNIQUE KEY `Producto_idProducto_2` (`Producto_idProducto`),
  ADD UNIQUE KEY `Producto_idProducto_3` (`Producto_idProducto`),
  ADD KEY `Producto_idProducto` (`Producto_idProducto`),
  ADD KEY `controlmerma_idcontrolMerma` (`controlmerma_idcontrolMerma`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`Producto_idProducto`,`Ventas_idVentas`),
  ADD KEY `fk_Producto_has_Ventas_Ventas1_idx` (`Ventas_idVentas`),
  ADD KEY `fk_Producto_has_Ventas_Producto1_idx` (`Producto_idProducto`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`ideventos`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`idPerfil`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idrol` (`idrol`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idVentas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idcompras` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `controlmerma`
--
ALTER TABLE `controlmerma`
  MODIFY `idcontrolMerma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  MODIFY `Producto_idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `detallecontrolmerma`
--
ALTER TABLE `detallecontrolmerma`
  MODIFY `iddetallecontrolmerma` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  MODIFY `Producto_idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `ideventos` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `idPerfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idVentas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD CONSTRAINT `fk_Producto_has_compras_Producto` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Producto_has_compras_compras1` FOREIGN KEY (`compras_idcompras`) REFERENCES `compras` (`idcompras`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `fk_Producto_has_Ventas_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Producto_has_Ventas_Ventas1` FOREIGN KEY (`Ventas_idVentas`) REFERENCES `ventas` (`idVentas`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD CONSTRAINT `fk_usuario_perfil` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idUsuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_roles` FOREIGN KEY (`idrol`) REFERENCES `roles` (`idRol`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
