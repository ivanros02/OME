-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 26-03-2024 a las 15:21:38
-- Versión del servidor: 10.5.20-MariaDB
-- Versión de PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `id21978577_ome`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prof`
--

CREATE TABLE `prof` (
  `cod_prof` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `especialidad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prof`
--

INSERT INTO `prof` (`cod_prof`, `nombre`, `apellido`, `especialidad`) VALUES
(54, 'Doris ', 'Isidori', 'psicologia'),
(55, 'Maria Veronica', 'Hernalz ', 'psiquiatria'),
(56, 'Mylton ', 'Mercado', 'psiquiatria'),
(57, 'Adriana ', 'Salamanca ', 'psicologia'),
(58, 'Maria ', 'Valenzuela', 'psicologia'),
(59, 'Cintia', 'Apezetche', 'psicologia'),
(60, 'Veronica ', 'Nuñez', 'psicologia'),
(61, 'Cecilia', 'Oriol', 'psicologia'),
(62, 'Alejo ', 'Fowler', 'psiquiatria'),
(63, 'Azul Luna', 'Genovessi Stoffel ', 'psicologia'),
(64, 'Mercedes Jael', 'Ramirez', 'psicologia'),
(65, 'Maria', 'Rodriguez ', 'psicologia'),
(66, 'Belén', 'Ponce', 'psicologia'),
(67, 'Fátima', 'Gomez ', 'psicologia'),
(68, 'Adrian ', 'Volta ', 'psicologia'),
(69, 'Romina ', 'Riccó ', 'psicologia'),
(70, 'Fátima', 'Gomez ', 'psicologia'),
(71, 'Manuel ', 'Romero', 'psicologia'),
(72, 'Axel Oscar ', 'Ganza Perez', 'psiquiatria'),
(73, 'Laura', 'Bortolin ', 'psiquiatria'),
(74, 'Mariana', 'Patelepen ', 'psiquiatria'),
(75, 'Alejandro ', 'Izaguirre', 'psicologia'),
(76, 'Alejandra ', 'Martinez ', 'psicologia'),
(77, 'Marcela ', 'Celano', 'psicologia'),
(78, 'Liliana Mabel', 'Saracca ', 'psicologia'),
(79, 'Virginia', 'Scarpelli ', 'psicologia'),
(80, 'Valeria ', 'Acevedo', 'psicologia'),
(81, 'Manuel', 'Montero', 'psiquiatria'),
(82, 'Patricia', 'Garcia', 'psicologia'),
(83, 'Jesica Laura ', 'Vecino', 'psicologia'),
(84, 'Brenda ', 'Velozo ', 'psicologia'),
(85, 'Maria ', 'Vesprini', 'psicologia');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `prof`
--
ALTER TABLE `prof`
  ADD PRIMARY KEY (`cod_prof`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `prof`
--
ALTER TABLE `prof`
  MODIFY `cod_prof` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
