-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-04-2021 a las 18:30:12
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `my_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurants`
--

CREATE TABLE `restaurants` (
  `id_restaurant` int(11) NOT NULL,
  `name` varchar(75) NOT NULL,
  `address` varchar(75) NOT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `kind_food` set('Fast-Food','Medterranéo','Hindú','Turco','Oriental') NOT NULL,
  `photo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `restaurants`
--

INSERT INTO `restaurants` (`id_restaurant`, `name`, `address`, `lat`, `lng`, `kind_food`, `photo`) VALUES
(1, 'Daler Döner Kebad', 'Pg Fabra i Puig, 81, 08030 Barcelona', 41.42995, 2.1817513, 'Hindú', 'daler.jpg'),
(2, 'All i Oli', 'Carrer d\'Alella, 3, 08016 Barcelona', 41.4317636, 2.1809383, 'Medterranéo', 'allioli.png'),
(3, 'Tasca i Vins', 'Carrer del Cardenal Tedeschini, 32, 08027 Barcelona', 41.4262063, 2.1830277, 'Medterranéo', 'tascaivins.png'),
(4, 'Sanabria Montaditos', 'Carrer de Lorena, 18 08042 Barcelona', 41.4376198, 2.1720243, 'Medterranéo', 'sanabria.png'),
(5, 'McDonald\'s', 'Av Rio de Janeiro, 42, 08016 Barcelona', 41.4355208, 2.1783, 'Fast-Food', 'mcdonals.png'),
(6, 'La Gran Familia Mediterranéa', 'Carrer de Bilbao, 19, 08018 Barcelona', 41.4100565, 2.1918098, 'Medterranéo', 'familia.png'),
(7, 'Ming Sushi', 'Carrer de Palomar, 4, 08030 Barcelona', 41.4415315, 2.1914976, 'Oriental', 'ming.png'),
(8, 'Goiko', 'Av Rio de Janeiro, 42, 08016 Barcelona', 41.4355168, 2.1783, 'Fast-Food', 'goiko.png'),
(9, 'Raja Döner Kebab Pizzería', 'Pg Valldaura, 241, 08016 Barcelona', 41.4390902, 2.1788467, 'Turco', 'raja.png'),
(10, 'Cervecería Conde Drácula', 'Via Júlia, 68, 08016 Barcelona', 41.4407774, 2.17762, 'Medterranéo', 'condedracula.jpg'),
(11, 'Hiper Bocata', 'Via Júlia, 48, 08016 Barcelona', 41.4405731, 2.1766466, 'Medterranéo', 'hiperbocata.jpg'),
(12, 'El Abuelo', 'Via Júlia, 4, 08016 Barcelona', 41.4388123, 2.1762481, 'Medterranéo', 'elabuelo.jpg'),
(13, 'La Esquinica', 'Pg Fabra i Puig, 296, 08031 Barcelona', 41.4300083, 2.1710469, 'Medterranéo', 'laesquinica.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id_restaurant`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id_restaurant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
