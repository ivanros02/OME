-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-03-2024 a las 05:40:38
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
  `fecha` date NOT NULL,
  `cargado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`cod_paci`, `nombreYapellido`, `benef`, `cod_prof`, `cod_practica`, `fecha`, `cargado`) VALUES
(26, 'PEREZ MURGA CARLOS ISMAEL', 15088626340100, 28, 521001, '2024-03-13', '');

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
  ADD KEY `benef` (`benef`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `cod_paci` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`cod_prof`) REFERENCES `prof` (`cod_prof`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paciente_ibfk_2` FOREIGN KEY (`cod_practica`) REFERENCES `tipo_prac` (`cod_practica`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paciente_ibfk_3` FOREIGN KEY (`benef`) REFERENCES `padron` (`benef`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
