-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-05-2024 a las 16:19:08
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ome`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `cod_paci` int(11) NOT NULL,
  `nombreYapellido` varchar(255) NOT NULL,
  `benef` bigint(255) NOT NULL,
  `cod_prof` int(255) NOT NULL,
  `cod_practica` int(255) NOT NULL,
  `fecha` datetime NOT NULL,
  `cod_diag` varchar(255) NOT NULL,
  `cargado` varchar(255) NOT NULL DEFAULT 'no_cargado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`cod_paci`),
  ADD KEY `cod_prof` (`cod_prof`,`cod_practica`),
  ADD KEY `cod_practica` (`cod_practica`),
  ADD KEY `benef` (`benef`),
  ADD KEY `cod_diag` (`cod_diag`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `cod_paci` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`cod_diag`) REFERENCES `diagnostico` (`cod_diag`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paciente_ibfk_2` FOREIGN KEY (`cod_prof`) REFERENCES `prof` (`cod_prof`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paciente_ibfk_4` FOREIGN KEY (`cod_practica`) REFERENCES `tipo_prac` (`cod_practica`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
