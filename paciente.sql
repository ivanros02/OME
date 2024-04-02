-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-04-2024 a las 21:41:53
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
  `dni` int(255) NOT NULL,
  `cargado` varchar(255) NOT NULL DEFAULT 'no_cargado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`cod_paci`, `nombreYapellido`, `benef`, `cod_prof`, `cod_practica`, `fecha`, `cod_diag`, `dni`, `cargado`) VALUES
(3, 'ivan', 123, 43, 520001, '2024-03-14 00:00:00', 'F02.4', 0, 'cargado'),
(4, 'ivan', 123, 43, 520001, '2024-03-17 09:00:00', 'F99', 0, 'cargado'),
(5, 'ivan', 123, 43, 520001, '2024-03-19 01:13:00', 'F02.2', 0, 'cargado'),
(6, 'ivan', 123, 43, 521001, '2024-03-19 01:14:00', 'F02', 0, 'cargado'),
(7, 'ivan', 123, 43, 520001, '2024-03-19 01:21:00', 'F02.1', 0, 'no_cargado'),
(8, 'ivan', 123, 43, 520001, '2024-03-19 01:24:00', 'F02', 0, 'no_cargado'),
(9, 'ivan', 123, 43, 520001, '2024-03-19 01:29:00', 'F02.0', 0, 'no_cargado'),
(10, 'ivan', 123, 44, 520001, '2024-03-19 01:30:00', 'F02.0', 0, 'no_cargado'),
(11, 'ivan', 123, 44, 520001, '2024-03-19 01:36:00', 'F02.0', 0, 'no_cargado'),
(12, 'ivan', 123, 44, 520001, '2024-03-19 01:46:00', 'F02.2', 0, 'no_cargado'),
(13, 'ivan', 123, 43, 520001, '2024-03-19 09:25:00', 'F02', 0, 'no_cargado'),
(14, 'ivan', 123, 43, 520001, '2024-03-19 09:56:00', 'F01.8', 0, 'cargado'),
(15, 'PILQUIMAN EVA', 15064310380500, 44, 520001, '2024-03-19 10:43:00', 'F01.9', 0, 'cargado'),
(16, 'AVOLIO ANDRES', 1003039740600, 43, 520001, '2024-04-02 12:04:00', 'F10.-', 0, 'no_cargado'),
(17, 'AVOLIO ANDRES', 1003039740600, 43, 520001, '2024-04-02 12:12:00', 'F02.0', 0, 'no_cargado'),
(18, 'AVOLIO ANDRES', 1003039740600, 43, 520001, '2024-04-02 12:15:00', 'F01.9', 0, 'no_cargado'),
(19, 'CARRILLO SERAFINA', 14000403000000, 43, 520001, '2024-04-02 15:55:00', 'F99', 12862504, 'no_cargado');

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
  MODIFY `cod_paci` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`cod_diag`) REFERENCES `diagnostico` (`cod_diag`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paciente_ibfk_2` FOREIGN KEY (`cod_prof`) REFERENCES `prof` (`cod_prof`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paciente_ibfk_3` FOREIGN KEY (`benef`) REFERENCES `padron` (`benef`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paciente_ibfk_4` FOREIGN KEY (`cod_practica`) REFERENCES `tipo_prac` (`cod_practica`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
