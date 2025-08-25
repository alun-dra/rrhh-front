-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-08-2025 a las 05:02:28
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
-- Base de datos: `rrhh_clean`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accidente_trabajo`
--

CREATE TABLE `accidente_trabajo` (
  `id` bigint(20) NOT NULL,
  `trabajador_id` bigint(20) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `dias_licencia` int(11) DEFAULT NULL,
  `mutual_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `afp`
--

CREATE TABLE `afp` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `codigo_suseso` varchar(20) DEFAULT NULL,
  `tasa_comision` decimal(6,4) NOT NULL DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `afp`
--

INSERT INTO `afp` (`id`, `nombre`, `codigo_suseso`, `tasa_comision`) VALUES
(1, 'AFP Capital', 'CAP', 0.0144);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_log`
--

CREATE TABLE `api_log` (
  `id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) DEFAULT NULL,
  `persona_id` bigint(20) DEFAULT NULL,
  `method` varchar(10) NOT NULL,
  `path` varchar(300) NOT NULL,
  `query_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`query_json`)),
  `params_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`params_json`)),
  `body_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`body_json`)),
  `ip` varchar(100) DEFAULT NULL,
  `user_agent` varchar(300) DEFAULT NULL,
  `status_code` int(11) NOT NULL,
  `duration_ms` int(11) NOT NULL,
  `api_key_ok` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `api_log`
--

INSERT INTO `api_log` (`id`, `usuario_id`, `persona_id`, `method`, `path`, `query_json`, `params_json`, `body_json`, `ip`, `user_agent`, `status_code`, `duration_ms`, `api_key_ok`, `created_at`) VALUES
(1, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"username\":\"admin\",\"password\":\"***\"}', '::ffff:127.0.0.1', 'Thunder Client (https://www.thunderclient.com)', 200, 108, 1, '2025-08-23 00:54:58'),
(2, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"username\":\"admin\",\"password\":\"***\"}', '::ffff:127.0.0.1', 'Thunder Client (https://www.thunderclient.com)', 200, 113, 1, '2025-08-23 02:58:11'),
(3, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"username\":\"admin\",\"password\":\"***\"}', '::ffff:127.0.0.1', 'Thunder Client (https://www.thunderclient.com)', 200, 65, 1, '2025-08-23 02:58:12'),
(4, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"admin@demo.cl\",\"password\":\"***\"}', '::ffff:127.0.0.1', 'Thunder Client (https://www.thunderclient.com)', 200, 104, 1, '2025-08-23 03:06:27'),
(5, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"admin@demo.cl\",\"password\":\"***\"}', '::ffff:127.0.0.1', 'Thunder Client (https://www.thunderclient.com)', 200, 68, 1, '2025-08-23 03:06:29'),
(6, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"admin@demo.cl\",\"password\":\"***\"}', '::ffff:127.0.0.1', 'Thunder Client (https://www.thunderclient.com)', 200, 68, 1, '2025-08-23 03:09:53'),
(7, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"admin@demo.cl\",\"password\":\"***\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 67, 1, '2025-08-23 03:22:07'),
(8, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"admin@demo.cl\",\"password\":\"***\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 67, 1, '2025-08-23 03:22:34'),
(9, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"admin@demo.cl\",\"password\":\"***\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 75, 1, '2025-08-23 03:22:56'),
(10, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"admin@demo.cl\",\"password\":\"***\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 67, 1, '2025-08-23 03:22:58'),
(11, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"admin@demo.cl\",\"password\":\"***\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 74, 1, '2025-08-23 03:23:00'),
(12, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"admin@demo.cl\",\"password\":\"***\"}', '::ffff:127.0.0.1', 'Thunder Client (https://www.thunderclient.com)', 200, 282, 0, '2025-08-23 04:01:33'),
(13, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"admin@demo.cl\",\"password\":\"***\"}', '::ffff:127.0.0.1', 'Thunder Client (https://www.thunderclient.com)', 200, 69, 0, '2025-08-23 04:01:34'),
(14, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"admin@demo.cl\",\"password\":\"***\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 129, 0, '2025-08-23 04:04:20'),
(15, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"admin@demo.cl\",\"password\":\"***\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 68, 0, '2025-08-23 04:05:17'),
(16, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"admin@demo.cl\",\"password\":\"***\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 103, 0, '2025-08-24 01:24:28'),
(17, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"admin@demo.cl\",\"password\":\"***\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 245, 0, '2025-08-24 15:48:41'),
(18, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"s@gg.cl\",\"password\":\"***\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 400, 3, 0, '2025-08-24 16:30:05'),
(19, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"alvarovillaloboshuerta1997@gmail.com\",\"password\":\"***\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 400, 0, 0, '2025-08-24 16:57:11'),
(20, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"alvarovillaloboshuerta1997@gmail.com\",\"password\":\"***\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 400, 1, 0, '2025-08-24 16:57:20'),
(21, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"alvarovillaloboshuerta1997@gmail.com\",\"password\":\"***\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 400, 1, 0, '2025-08-24 16:57:36'),
(22, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"alvarovillaloboshuerta1997@gmail.com\",\"password\":\"***\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 400, 1, 0, '2025-08-24 16:57:40'),
(23, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"alvarovillaloboshuerta1997@gmail.com\",\"password\":\"***\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 400, 1, 0, '2025-08-24 16:57:45'),
(24, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"alvarovillaloboshuerta1997@gmail.com\",\"password\":\"***\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 400, 1, 0, '2025-08-24 16:57:45'),
(25, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"alvarovillaloboshuerta1997@gmail.com\",\"password\":\"***\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 400, 2, 0, '2025-08-24 16:57:46'),
(26, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"alvarovillaloboshuerta1997@gmail.com\",\"password\":\"***\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 400, 1, 0, '2025-08-24 16:57:46'),
(27, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"alvarovillaloboshuerta1997@gmail.com\",\"password\":\"***\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 400, 1, 0, '2025-08-24 16:57:46'),
(28, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"admin@demo.cl\",\"password\":\"***\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 67, 0, '2025-08-24 17:59:04'),
(29, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 7, 0, '2025-08-24 18:14:21'),
(30, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 8, 0, '2025-08-24 18:14:30'),
(31, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 4, 0, '2025-08-24 18:15:06'),
(32, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 4, 0, '2025-08-24 18:15:08'),
(33, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 3, 0, '2025-08-24 18:15:09'),
(34, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 11, 0, '2025-08-24 18:15:10'),
(35, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 7, 0, '2025-08-24 18:15:11'),
(36, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 4, 0, '2025-08-24 18:15:13'),
(37, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 54, 0, '2025-08-24 20:42:08'),
(38, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"admin@demo.cl\",\"password\":\"***\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 72, 0, '2025-08-24 20:44:03'),
(39, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 4, 0, '2025-08-24 20:44:03'),
(40, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 3, 0, '2025-08-24 20:44:12'),
(41, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 4, 0, '2025-08-24 20:54:55'),
(42, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 49, 0, '2025-08-24 21:32:29'),
(43, 1, 1, 'GET', '/api/afps', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 404, 9, 0, '2025-08-24 21:53:08'),
(44, 1, 1, 'GET', '/api/afps', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 404, 3, 0, '2025-08-24 21:53:09'),
(45, 1, 1, 'GET', '/api/afps', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 404, 2, 0, '2025-08-24 21:53:26'),
(46, 1, 1, 'GET', '/api/afps', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 404, 9, 0, '2025-08-24 21:53:27'),
(47, 1, 1, 'GET', '/api/afps', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 404, 2, 0, '2025-08-24 21:53:49'),
(48, 1, 1, 'GET', '/api/afps', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 404, 3, 0, '2025-08-24 21:53:50'),
(49, 1, 1, 'GET', '/api/afps', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 404, 2, 0, '2025-08-24 21:58:21'),
(50, 1, 1, 'GET', '/api/afps', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 404, 3, 0, '2025-08-24 21:58:22'),
(51, 1, 1, 'GET', '/api/afps', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 404, 4, 0, '2025-08-24 23:00:45'),
(52, 1, 1, 'GET', '/api/afps', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 404, 4, 0, '2025-08-24 23:00:47'),
(53, 1, 1, 'GET', '/api/afps', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 404, 3, 0, '2025-08-24 23:01:05'),
(54, 1, 1, 'GET', '/api/afps', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 404, 2, 0, '2025-08-24 23:01:06'),
(55, 1, 1, 'GET', '/api/afps', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 404, 3, 0, '2025-08-24 23:12:16'),
(56, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 10, 0, '2025-08-24 23:12:17'),
(57, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 6, 0, '2025-08-24 23:12:39'),
(58, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 3, 0, '2025-08-24 23:16:39'),
(59, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 6, 0, '2025-08-24 23:16:47'),
(60, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 2, 0, '2025-08-24 23:16:55'),
(61, 1, 1, 'PUT', '/api/afp/undefined', '{}', '{\"id\":\"undefined\"}', '{\"nombre\":\"AFP Capital\",\"tasa\":0.07,\"vigente\":true}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 400, 7, 0, '2025-08-24 23:17:19'),
(62, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 3, 0, '2025-08-24 23:17:25'),
(63, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 3, 0, '2025-08-24 23:19:15'),
(64, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 2, 0, '2025-08-24 23:19:20'),
(65, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 5, 0, '2025-08-24 23:23:08'),
(66, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 4, 0, '2025-08-24 23:37:06'),
(67, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 7, 0, '2025-08-24 23:37:06'),
(68, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 5, 0, '2025-08-24 23:37:25'),
(69, 1, 1, 'GET', '/api/afp?q=a', '{\"q\":\"a\"}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 6, 0, '2025-08-24 23:37:36'),
(70, 1, 1, 'GET', '/api/afp?q=c', '{\"q\":\"c\"}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 2, 0, '2025-08-24 23:37:39'),
(71, 1, 1, 'GET', '/api/afp?q=cu', '{\"q\":\"cu\"}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 2, 0, '2025-08-24 23:37:39'),
(72, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 2, 0, '2025-08-24 23:38:24'),
(73, 1, 1, 'PUT', '/api/afp/3', '{}', '{\"id\":3}', '{\"nombre\":\"aa\",\"tasa_comision\":0}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 7, 0, '2025-08-24 23:40:20'),
(74, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 2, 0, '2025-08-24 23:40:20'),
(75, 1, 1, 'DELETE', '/api/afp/3', '{}', '{\"id\":3}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 5, 0, '2025-08-24 23:40:36'),
(76, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 3, 0, '2025-08-24 23:40:36'),
(77, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 3, 0, '2025-08-24 23:40:57'),
(78, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 3, 0, '2025-08-24 23:57:41'),
(79, 1, 1, 'DELETE', '/api/afp/4', '{}', '{\"id\":4}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 4, 0, '2025-08-24 23:58:12'),
(80, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 2, 0, '2025-08-24 23:58:12'),
(81, 1, 1, 'DELETE', '/api/afp/1', '{}', '{\"id\":1}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 5, 0, '2025-08-24 23:58:14'),
(82, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 3, 0, '2025-08-24 23:58:14'),
(83, 1, 1, 'DELETE', '/api/afp/6', '{}', '{\"id\":6}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 18, 0, '2025-08-24 23:58:15'),
(84, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 2, 0, '2025-08-24 23:58:15'),
(85, 1, 1, 'DELETE', '/api/afp/5', '{}', '{\"id\":5}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 5, 0, '2025-08-24 23:58:18'),
(86, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 4, 0, '2025-08-24 23:58:18'),
(87, 1, 1, 'DELETE', '/api/afp/2', '{}', '{\"id\":2}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 5, 0, '2025-08-24 23:58:19'),
(88, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 2, 0, '2025-08-24 23:58:19'),
(89, 1, 1, 'POST', '/api/afp', '{}', '{}', '{\"nombre\":\"AFP Capital\",\"codigo_suseso\":\"CAP\",\"tasa_comision\":0.0144}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 201, 6, 0, '2025-08-24 23:58:42'),
(90, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 2, 0, '2025-08-24 23:58:42'),
(91, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 4, 0, '2025-08-24 23:59:37'),
(92, 1, 1, 'POST', '/api/afp', '{}', '{}', '{\"nombre\":\"r\",\"codigo_suseso\":\"RRA\",\"tasa_comision\":\"0.0003\",\"vigente\":true}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 400, 2, 0, '2025-08-25 00:00:02'),
(93, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 2, 0, '2025-08-25 00:00:08'),
(94, 1, 1, 'POST', '/api/afp', '{}', '{}', '{\"nombre\":\"aaaa\",\"codigo_suseso\":\"AAA\",\"tasa_comision\":0.0003}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 201, 4, 0, '2025-08-25 00:00:27'),
(95, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 3, 0, '2025-08-25 00:00:27'),
(96, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 3, 0, '2025-08-25 00:00:33'),
(97, 1, 1, 'DELETE', '/api/afp/8', '{}', '{\"id\":8}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 5, 0, '2025-08-25 00:00:36'),
(98, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 3, 0, '2025-08-25 00:00:36'),
(99, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 4, 0, '2025-08-25 00:00:49'),
(100, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 6, 0, '2025-08-25 00:09:10'),
(101, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 4, 0, '2025-08-25 00:09:11'),
(102, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 3, 0, '2025-08-25 00:09:13'),
(103, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 5, 0, '2025-08-25 00:09:14'),
(104, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 5, 0, '2025-08-25 00:09:15'),
(105, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 2, 0, '2025-08-25 00:09:16'),
(106, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 3, 0, '2025-08-25 00:14:35'),
(107, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 2, 0, '2025-08-25 00:23:06'),
(108, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 2, 0, '2025-08-25 00:23:23'),
(109, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 3, 0, '2025-08-25 00:23:23'),
(110, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 3, 0, '2025-08-25 00:23:24'),
(111, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 3, 0, '2025-08-25 00:23:24'),
(112, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 4, 0, '2025-08-25 00:24:30'),
(113, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 207, 0, '2025-08-25 00:38:07'),
(114, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 5, 0, '2025-08-25 00:47:27'),
(115, NULL, NULL, 'POST', '/api/auth/login', '{}', '{}', '{\"email\":\"admin@demo.cl\",\"password\":\"***\"}', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 72, 0, '2025-08-25 00:58:06'),
(116, 1, 1, 'GET', '/api/auth/me', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 200, 4, 0, '2025-08-25 00:58:06'),
(117, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 8, 0, '2025-08-25 01:11:12'),
(118, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 3, 0, '2025-08-25 01:12:14'),
(119, 1, 1, 'GET', '/api/afp', '{}', '{}', 'null', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 304, 2, 0, '2025-08-25 02:09:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion_turno`
--

CREATE TABLE `asignacion_turno` (
  `id` bigint(20) NOT NULL,
  `trabajador_id` bigint(20) NOT NULL,
  `turno_id` bigint(20) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ausencia`
--

CREATE TABLE `ausencia` (
  `id` bigint(20) NOT NULL,
  `trabajador_id` bigint(20) NOT NULL,
  `tipo` enum('vacaciones','permiso','licencia','inasistencia','administrativo') NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `dias_habiles` int(11) DEFAULT NULL,
  `observacion` varchar(500) DEFAULT NULL,
  `documento_url` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco`
--

CREATE TABLE `banco` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `codigo_sbif` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `familia` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centro_costo`
--

CREATE TABLE `centro_costo` (
  `id` bigint(20) NOT NULL,
  `empresa_id` bigint(20) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `centro_costo`
--

INSERT INTO `centro_costo` (`id`, `empresa_id`, `codigo`, `nombre`) VALUES
(12, 6, 'ADM', 'Administración'),
(13, 6, 'COM', 'Comercial'),
(14, 6, 'TI', 'Tecnologías de la Información'),
(15, 7, 'OBR-001', 'Obras Viales Región Metropolitana'),
(16, 7, 'OBR-002', 'Obras Viales Región de Valparaíso'),
(17, 8, 'INV-001', 'Inversiones Nacionales'),
(18, 8, 'INV-002', 'Inversiones Internacionales'),
(19, 10, 'DES', 'Desarrollo de Software'),
(20, 10, 'SOP', 'Soporte Técnico'),
(21, 9, 'EXP', 'Exportaciones'),
(22, 9, 'AGR', 'Agricultura Local');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id` bigint(20) NOT NULL,
  `region_id` bigint(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `codigo_ine` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id`, `region_id`, `nombre`, `codigo_ine`) VALUES
(1, 1, 'Arica', NULL),
(2, 2, 'Iquique', NULL),
(3, 3, 'Antofagasta', NULL),
(4, 4, 'Copiapó', NULL),
(5, 5, 'La Serena', NULL),
(6, 6, 'Valparaíso', NULL),
(7, 7, 'Santiago', NULL),
(8, 8, 'Rancagua', NULL),
(9, 9, 'Talca', NULL),
(10, 10, 'Chillán', NULL),
(11, 11, 'Concepción', NULL),
(12, 12, 'Temuco', NULL),
(13, 13, 'Valdivia', NULL),
(14, 14, 'Puerto Montt', NULL),
(15, 15, 'Coyhaique', NULL),
(16, 16, 'Punta Arenas', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comuna`
--

CREATE TABLE `comuna` (
  `id` bigint(20) NOT NULL,
  `ciudad_id` bigint(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `codigo_ine` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comuna`
--

INSERT INTO `comuna` (`id`, `ciudad_id`, `nombre`, `codigo_ine`) VALUES
(1, 7, 'Santiago', '13101'),
(2, 7, 'Providencia', '13114'),
(3, 7, 'Las Condes', '13119'),
(4, 7, 'La Florida', '13110'),
(5, 7, 'Puente Alto', '13201'),
(6, 6, 'Valparaíso', '5101'),
(7, 6, 'Viña del Mar', '5109'),
(8, 6, 'Quilpué', '5105'),
(9, 6, 'Villa Alemana', '5107'),
(10, 6, 'Concón', '5102'),
(13, 1, 'San Pedro de la Paz', '8115');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concepto_liquidacion`
--

CREATE TABLE `concepto_liquidacion` (
  `id` bigint(20) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `tipo` enum('haber','descuento','aporte_empleador') NOT NULL,
  `afecta_imponible` tinyint(1) NOT NULL DEFAULT 0,
  `afecta_tributable` tinyint(1) NOT NULL DEFAULT 0,
  `afecta_prevision` tinyint(1) NOT NULL DEFAULT 0,
  `afecta_salud` tinyint(1) NOT NULL DEFAULT 0,
  `formula` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto_emergencia`
--

CREATE TABLE `contacto_emergencia` (
  `id` bigint(20) NOT NULL,
  `trabajador_id` bigint(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `parentesco` varchar(100) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `id` bigint(20) NOT NULL,
  `trabajador_id` bigint(20) NOT NULL,
  `tipo` enum('indefinido','plazo_fijo','obra_o_faena') NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_termino` date DEFAULT NULL,
  `jornada` enum('completa','parcial','por_turnos','otra') DEFAULT NULL,
  `horas_semanales` int(11) DEFAULT NULL,
  `lugar_prestacion_id` bigint(20) DEFAULT NULL,
  `unidad_id` bigint(20) DEFAULT NULL,
  `cargo_id` bigint(20) DEFAULT NULL,
  `centro_costo_id` bigint(20) DEFAULT NULL,
  `sueldo_base` decimal(14,2) NOT NULL,
  `gratificacion_legal` tinyint(1) NOT NULL DEFAULT 1,
  `colacion_fija` decimal(14,2) DEFAULT NULL,
  `movilizacion_fija` decimal(14,2) DEFAULT NULL,
  `asignacion_zona` decimal(14,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion_previsional`
--

CREATE TABLE `cotizacion_previsional` (
  `id` bigint(20) NOT NULL,
  `liquidacion_id` bigint(20) NOT NULL,
  `tipo` enum('AFP','SALUD','SIS','AFC_TRABAJADOR','AFC_EMPLEADOR','MUTUAL') NOT NULL,
  `entidad` varchar(150) DEFAULT NULL,
  `base_imponible` decimal(14,2) NOT NULL,
  `tasa` decimal(7,5) NOT NULL,
  `monto` decimal(14,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_bancarios`
--

CREATE TABLE `datos_bancarios` (
  `id` bigint(20) NOT NULL,
  `trabajador_id` bigint(20) NOT NULL,
  `banco_id` bigint(20) DEFAULT NULL,
  `tipo_cuenta` enum('vista','corriente','ahorro','rut') DEFAULT NULL,
  `numero_cuenta` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_previsionales`
--

CREATE TABLE `datos_previsionales` (
  `id` bigint(20) NOT NULL,
  `trabajador_id` bigint(20) NOT NULL,
  `afp_id` bigint(20) DEFAULT NULL,
  `tasa_adicional_afp` decimal(6,4) DEFAULT NULL,
  `isapre_id` bigint(20) DEFAULT NULL,
  `plan_isapre_uf` decimal(10,4) DEFAULT NULL,
  `tramo_fonasa` varchar(10) DEFAULT NULL,
  `pactado_salud_porcentaje` decimal(5,2) NOT NULL DEFAULT 7.00,
  `apv_monto_uf` decimal(10,4) DEFAULT NULL,
  `caja_compensacion` varchar(150) DEFAULT NULL,
  `afc_afiliado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id` bigint(20) NOT NULL,
  `comuna_id` bigint(20) NOT NULL,
  `calle` varchar(200) NOT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `depto_oficina` varchar(50) DEFAULT NULL,
  `referencia` varchar(255) DEFAULT NULL,
  `lat` decimal(9,6) DEFAULT NULL,
  `lon` decimal(9,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id`, `comuna_id`, `calle`, `numero`, `depto_oficina`, `referencia`, `lat`, `lon`) VALUES
(1, 1, 'Av. Libertador Bernardo O\'Higgins', '1234', NULL, 'Frente a la plaza', -33.437200, -70.650600),
(2, 1, 'Alameda', '500', 'Of. 1201', 'Edificio Centro', -33.441000, -70.650000),
(3, 6, 'Calle Valparaíso', '250', NULL, 'Cerca del muelle', -33.045800, -71.619700);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `id` bigint(20) NOT NULL,
  `trabajador_id` bigint(20) DEFAULT NULL,
  `tipo` enum('contrato','anexo','finiquito','liquidacion','certificado','reglamento','otros') NOT NULL,
  `periodo` date DEFAULT NULL,
  `url` varchar(500) NOT NULL,
  `firma_valida` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id` bigint(20) NOT NULL,
  `razon_social` varchar(255) NOT NULL,
  `rut` char(12) NOT NULL,
  `giro` varchar(255) DEFAULT NULL,
  `direccion_id` bigint(20) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `razon_social`, `rut`, `giro`, `direccion_id`, `telefono`, `email`) VALUES
(6, 'Empresa Uno Ltda.', '76.123.456-7', 'Servicios de consultoría', 1, '+56 2 23456789', 'contacto@empresauno.cl'),
(7, 'Constructora Andes SpA', '77.987.654-3', 'Construcción y obras civiles', 2, '+56 9 87654321', 'info@andes.cl'),
(8, 'Inversiones Pacífico S.A.', '78.456.789-0', 'Inversiones y asesorías', 3, '+56 2 29876543', 'contacto@pacifico.cl'),
(9, 'Tecnologías del Sur Ltda.', '76.654.321-5', 'Desarrollo de software', 3, '+56 2 21234567', 'soporte@tecsur.cl'),
(10, 'Agroexportadora Los Ríos', '79.111.222-9', 'Exportación de frutas', 3, '+56 63 2123456', 'ventas@losrios.cl');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `isapre`
--

CREATE TABLE `isapre` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `codigo_superintendencia` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_liquidacion`
--

CREATE TABLE `item_liquidacion` (
  `id` bigint(20) NOT NULL,
  `liquidacion_id` bigint(20) NOT NULL,
  `concepto_id` bigint(20) NOT NULL,
  `cantidad` decimal(12,4) NOT NULL DEFAULT 1.0000,
  `monto` decimal(14,2) NOT NULL,
  `orden` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liquidacion`
--

CREATE TABLE `liquidacion` (
  `id` bigint(20) NOT NULL,
  `trabajador_id` bigint(20) NOT NULL,
  `contrato_id` bigint(20) DEFAULT NULL,
  `periodo` date NOT NULL,
  `dias_trabajados` int(11) DEFAULT NULL,
  `imponible` decimal(14,2) NOT NULL DEFAULT 0.00,
  `no_imponible` decimal(14,2) NOT NULL DEFAULT 0.00,
  `tributable` decimal(14,2) NOT NULL DEFAULT 0.00,
  `descuentos` decimal(14,2) NOT NULL DEFAULT 0.00,
  `liquido` decimal(14,2) NOT NULL DEFAULT 0.00,
  `estado` enum('borrador','calculada','pagada','anulada') NOT NULL DEFAULT 'borrador',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcacion`
--

CREATE TABLE `marcacion` (
  `id` bigint(20) NOT NULL,
  `trabajador_id` bigint(20) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `tipo` enum('E','S') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mutual_seguridad`
--

CREATE TABLE `mutual_seguridad` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `codigo_suseso` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mutual_seguridad`
--

INSERT INTO `mutual_seguridad` (`id`, `nombre`, `codigo_suseso`) VALUES
(1, 'Mutual de Seguridad C.Ch.C.', 'MUT01'),
(2, 'ACHS', 'MUT02'),
(3, 'IST', 'MUT03'),
(4, 'ISL - Instituto de Seguridad Laboral', 'MUT04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_nomina`
--

CREATE TABLE `pago_nomina` (
  `id` bigint(20) NOT NULL,
  `liquidacion_id` bigint(20) NOT NULL,
  `fecha_pago` date NOT NULL,
  `banco_id` bigint(20) DEFAULT NULL,
  `medio` enum('transferencia','cheque','efectivo') DEFAULT NULL,
  `referencia` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `iso2` char(2) DEFAULT NULL,
  `iso3` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id`, `nombre`, `iso2`, `iso3`) VALUES
(1, 'Chile', 'CL', 'CHL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametro_monetario`
--

CREATE TABLE `parametro_monetario` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `valor` decimal(14,4) NOT NULL,
  `moneda` enum('CLP','UF','UTM') NOT NULL,
  `vigente_desde` date NOT NULL,
  `vigente_hasta` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` bigint(20) NOT NULL,
  `run` char(12) NOT NULL,
  `nombres` varchar(150) NOT NULL,
  `apellido_paterno` varchar(150) NOT NULL,
  `apellido_materno` varchar(150) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `nacionalidad` varchar(100) DEFAULT NULL,
  `estado_civil` varchar(50) DEFAULT NULL,
  `direccion_id` bigint(20) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `run`, `nombres`, `apellido_paterno`, `apellido_materno`, `sexo`, `fecha_nacimiento`, `nacionalidad`, `estado_civil`, `direccion_id`, `telefono`, `email`, `created_at`, `updated_at`) VALUES
(1, '11.111.111-1', 'Usuario', 'Admin', 'Root', NULL, NULL, NULL, NULL, NULL, '+56911111111', 'admin@demo.cl', '2025-08-22 16:12:38', '2025-08-22 16:12:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE `region` (
  `id` bigint(20) NOT NULL,
  `pais_id` bigint(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `codigo_ine` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`id`, `pais_id`, `nombre`, `codigo_ine`) VALUES
(1, 1, 'Arica y Parinacota', '15'),
(2, 1, 'Tarapacá', '01'),
(3, 1, 'Antofagasta', '02'),
(4, 1, 'Atacama', '03'),
(5, 1, 'Coquimbo', '04'),
(6, 1, 'Valparaíso', '05'),
(7, 1, 'Metropolitana de Santiago', '13'),
(8, 1, 'Libertador General Bernardo O\'Higgins', '06'),
(9, 1, 'Maule', '07'),
(10, 1, 'Ñuble', '16'),
(11, 1, 'Biobío', '08'),
(12, 1, 'La Araucanía', '09'),
(13, 1, 'Los Ríos', '14'),
(14, 1, 'Los Lagos', '10'),
(15, 1, 'Aysén del General Carlos Ibáñez del Campo', '11'),
(16, 1, 'Magallanes y de la Antártica Chilena', '12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasa_cotizacion`
--

CREATE TABLE `tasa_cotizacion` (
  `id` bigint(20) NOT NULL,
  `tipo` enum('AFP','SALUD','SIS','AFC_TRABAJADOR','AFC_EMPLEADOR','MUTUAL') NOT NULL,
  `entidad_id` bigint(20) DEFAULT NULL,
  `tasa` decimal(7,5) NOT NULL,
  `vigente_desde` date NOT NULL,
  `vigente_hasta` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE `trabajador` (
  `id` bigint(20) NOT NULL,
  `persona_id` bigint(20) NOT NULL,
  `empresa_id` bigint(20) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_egreso` date DEFAULT NULL,
  `tipo_trabajador` varchar(20) DEFAULT NULL,
  `mutual_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tramo_impuesto_unico`
--

CREATE TABLE `tramo_impuesto_unico` (
  `id` bigint(20) NOT NULL,
  `vigente_desde` date NOT NULL,
  `vigente_hasta` date DEFAULT NULL,
  `desde` decimal(14,2) NOT NULL,
  `hasta` decimal(14,2) DEFAULT NULL,
  `tasa` decimal(6,4) NOT NULL,
  `rebaja` decimal(14,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `descanso_minutos` int(11) NOT NULL DEFAULT 60
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_organizacional`
--

CREATE TABLE `unidad_organizacional` (
  `id` bigint(20) NOT NULL,
  `empresa_id` bigint(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `padre_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` bigint(20) NOT NULL,
  `persona_id` bigint(20) NOT NULL,
  `username` varchar(80) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `rol` enum('admin','rrhh','jefatura','trabajador') NOT NULL DEFAULT 'trabajador',
  `estado` enum('activo','inactivo','bloqueado') NOT NULL DEFAULT 'activo',
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `persona_id`, `username`, `email`, `password_hash`, `rol`, `estado`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin@demo.cl', '$2b$10$gIso17E7Q/An2Tet.GdnKuEbq3sLvd97Y5yPRSXpxcKgyn.B/sRaG', 'admin', 'activo', '2025-08-25 00:58:06', '2025-08-22 16:12:38', '2025-08-25 00:58:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacaciones_saldo`
--

CREATE TABLE `vacaciones_saldo` (
  `id` bigint(20) NOT NULL,
  `trabajador_id` bigint(20) NOT NULL,
  `dias_habiles_acumulados` decimal(6,2) NOT NULL DEFAULT 0.00,
  `dias_progresivos` decimal(6,2) NOT NULL DEFAULT 0.00,
  `ultima_actualizacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_trabajador_activo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_trabajador_activo` (
`trabajador_id` bigint(20)
,`run` char(12)
,`nombres` varchar(150)
,`apellido_paterno` varchar(150)
,`apellido_materno` varchar(150)
,`razon_social` varchar(255)
,`fecha_ingreso` date
,`fecha_egreso` date
,`contrato_id` bigint(20)
,`vigente` int(1)
,`sueldo_base` decimal(14,2)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_trabajador_activo`
--
DROP TABLE IF EXISTS `vw_trabajador_activo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_trabajador_activo`  AS SELECT `t`.`id` AS `trabajador_id`, `p`.`run` AS `run`, `p`.`nombres` AS `nombres`, `p`.`apellido_paterno` AS `apellido_paterno`, `p`.`apellido_materno` AS `apellido_materno`, `e`.`razon_social` AS `razon_social`, `t`.`fecha_ingreso` AS `fecha_ingreso`, `t`.`fecha_egreso` AS `fecha_egreso`, `c`.`id` AS `contrato_id`, CASE WHEN `c`.`fecha_termino` is null OR `c`.`fecha_termino` >= curdate() THEN 1 ELSE 0 END AS `vigente`, `c`.`sueldo_base` AS `sueldo_base` FROM (((`trabajador` `t` join `persona` `p` on(`p`.`id` = `t`.`persona_id`)) join `empresa` `e` on(`e`.`id` = `t`.`empresa_id`)) left join (select `c1`.`id` AS `id`,`c1`.`trabajador_id` AS `trabajador_id`,`c1`.`tipo` AS `tipo`,`c1`.`fecha_inicio` AS `fecha_inicio`,`c1`.`fecha_termino` AS `fecha_termino`,`c1`.`jornada` AS `jornada`,`c1`.`horas_semanales` AS `horas_semanales`,`c1`.`lugar_prestacion_id` AS `lugar_prestacion_id`,`c1`.`unidad_id` AS `unidad_id`,`c1`.`cargo_id` AS `cargo_id`,`c1`.`centro_costo_id` AS `centro_costo_id`,`c1`.`sueldo_base` AS `sueldo_base`,`c1`.`gratificacion_legal` AS `gratificacion_legal`,`c1`.`colacion_fija` AS `colacion_fija`,`c1`.`movilizacion_fija` AS `movilizacion_fija`,`c1`.`asignacion_zona` AS `asignacion_zona`,`c1`.`created_at` AS `created_at`,`c1`.`updated_at` AS `updated_at` from `contrato` `c1`) `c` on(`c`.`trabajador_id` = `t`.`id`)) WHERE `t`.`fecha_egreso` is null ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accidente_trabajo`
--
ALTER TABLE `accidente_trabajo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_at_trabajador` (`trabajador_id`),
  ADD KEY `fk_at_mutual` (`mutual_id`);

--
-- Indices de la tabla `afp`
--
ALTER TABLE `afp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `api_log`
--
ALTER TABLE `api_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_api_log_created_at` (`created_at`),
  ADD KEY `idx_api_log_usuario` (`usuario_id`),
  ADD KEY `idx_api_log_path` (`path`);

--
-- Indices de la tabla `asignacion_turno`
--
ALTER TABLE `asignacion_turno`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_turno_trabajador_fecha` (`trabajador_id`,`fecha`),
  ADD KEY `idx_asignacion_turno_turno` (`turno_id`);

--
-- Indices de la tabla `ausencia`
--
ALTER TABLE `ausencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ausencia_rango` (`trabajador_id`,`fecha_inicio`,`fecha_fin`);

--
-- Indices de la tabla `banco`
--
ALTER TABLE `banco`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `centro_costo`
--
ALTER TABLE `centro_costo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_ccosto_empresa_codigo` (`empresa_id`,`codigo`),
  ADD KEY `idx_ccosto_empresa` (`empresa_id`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_ciudad_region_nombre` (`region_id`,`nombre`),
  ADD KEY `idx_ciudad_region` (`region_id`);

--
-- Indices de la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_comuna_ciudad_nombre` (`ciudad_id`,`nombre`),
  ADD KEY `idx_comuna_ciudad` (`ciudad_id`);

--
-- Indices de la tabla `concepto_liquidacion`
--
ALTER TABLE `concepto_liquidacion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `contacto_emergencia`
--
ALTER TABLE `contacto_emergencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_contacto_trabajador` (`trabajador_id`);

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_contrato_trabajador` (`trabajador_id`),
  ADD KEY `idx_contrato_unidad` (`unidad_id`),
  ADD KEY `idx_contrato_cargo` (`cargo_id`),
  ADD KEY `idx_contrato_ccosto` (`centro_costo_id`),
  ADD KEY `idx_contrato_lugar` (`lugar_prestacion_id`);

--
-- Indices de la tabla `cotizacion_previsional`
--
ALTER TABLE `cotizacion_previsional`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cot_prev_liq` (`liquidacion_id`);

--
-- Indices de la tabla `datos_bancarios`
--
ALTER TABLE `datos_bancarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trabajador_id` (`trabajador_id`),
  ADD KEY `fk_db_banco` (`banco_id`);

--
-- Indices de la tabla `datos_previsionales`
--
ALTER TABLE `datos_previsionales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trabajador_id` (`trabajador_id`),
  ADD KEY `fk_dp_afp` (`afp_id`),
  ADD KEY `fk_dp_isapre` (`isapre_id`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_direccion_comuna` (`comuna_id`);

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_documento_trabajador` (`trabajador_id`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rut` (`rut`),
  ADD KEY `idx_empresa_direccion` (`direccion_id`);

--
-- Indices de la tabla `isapre`
--
ALTER TABLE `isapre`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `item_liquidacion`
--
ALTER TABLE `item_liquidacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_item_liq_liq` (`liquidacion_id`),
  ADD KEY `idx_item_liq_concepto` (`concepto_id`);

--
-- Indices de la tabla `liquidacion`
--
ALTER TABLE `liquidacion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_liquidacion_trabajador_periodo` (`trabajador_id`,`periodo`),
  ADD KEY `idx_liquidacion_periodo` (`periodo`),
  ADD KEY `fk_liq_contrato` (`contrato_id`);

--
-- Indices de la tabla `marcacion`
--
ALTER TABLE `marcacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_marcacion_trabajador_fecha` (`trabajador_id`,`fecha`);

--
-- Indices de la tabla `mutual_seguridad`
--
ALTER TABLE `mutual_seguridad`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD UNIQUE KEY `codigo_suseso` (`codigo_suseso`);

--
-- Indices de la tabla `pago_nomina`
--
ALTER TABLE `pago_nomina`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `liquidacion_id` (`liquidacion_id`),
  ADD KEY `fk_pago_banco` (`banco_id`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `parametro_monetario`
--
ALTER TABLE `parametro_monetario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parametro_nombre_fecha` (`nombre`,`vigente_desde`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `run` (`run`),
  ADD KEY `idx_persona_direccion` (`direccion_id`);

--
-- Indices de la tabla `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_region_pais_nombre` (`pais_id`,`nombre`),
  ADD KEY `idx_region_pais` (`pais_id`);

--
-- Indices de la tabla `tasa_cotizacion`
--
ALTER TABLE `tasa_cotizacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tasa_tipo` (`tipo`);

--
-- Indices de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `persona_id` (`persona_id`),
  ADD KEY `idx_trabajador_empresa` (`empresa_id`),
  ADD KEY `fk_trabajador_mutual` (`mutual_id`);

--
-- Indices de la tabla `tramo_impuesto_unico`
--
ALTER TABLE `tramo_impuesto_unico`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unidad_organizacional`
--
ALTER TABLE `unidad_organizacional`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_unidad_empresa_nombre` (`empresa_id`,`nombre`),
  ADD KEY `idx_unidad_empresa` (`empresa_id`),
  ADD KEY `idx_unidad_padre` (`padre_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `persona_id` (`persona_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_usuario_estado` (`estado`),
  ADD KEY `idx_usuario_rol` (`rol`);

--
-- Indices de la tabla `vacaciones_saldo`
--
ALTER TABLE `vacaciones_saldo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trabajador_id` (`trabajador_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accidente_trabajo`
--
ALTER TABLE `accidente_trabajo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `afp`
--
ALTER TABLE `afp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `api_log`
--
ALTER TABLE `api_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT de la tabla `asignacion_turno`
--
ALTER TABLE `asignacion_turno`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ausencia`
--
ALTER TABLE `ausencia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `banco`
--
ALTER TABLE `banco`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `centro_costo`
--
ALTER TABLE `centro_costo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `comuna`
--
ALTER TABLE `comuna`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `concepto_liquidacion`
--
ALTER TABLE `concepto_liquidacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contacto_emergencia`
--
ALTER TABLE `contacto_emergencia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contrato`
--
ALTER TABLE `contrato`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cotizacion_previsional`
--
ALTER TABLE `cotizacion_previsional`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `datos_bancarios`
--
ALTER TABLE `datos_bancarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `datos_previsionales`
--
ALTER TABLE `datos_previsionales`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `documento`
--
ALTER TABLE `documento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `isapre`
--
ALTER TABLE `isapre`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `item_liquidacion`
--
ALTER TABLE `item_liquidacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `liquidacion`
--
ALTER TABLE `liquidacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marcacion`
--
ALTER TABLE `marcacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mutual_seguridad`
--
ALTER TABLE `mutual_seguridad`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pago_nomina`
--
ALTER TABLE `pago_nomina`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `parametro_monetario`
--
ALTER TABLE `parametro_monetario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `region`
--
ALTER TABLE `region`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tasa_cotizacion`
--
ALTER TABLE `tasa_cotizacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tramo_impuesto_unico`
--
ALTER TABLE `tramo_impuesto_unico`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `turno`
--
ALTER TABLE `turno`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unidad_organizacional`
--
ALTER TABLE `unidad_organizacional`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `vacaciones_saldo`
--
ALTER TABLE `vacaciones_saldo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accidente_trabajo`
--
ALTER TABLE `accidente_trabajo`
  ADD CONSTRAINT `fk_at_mutual` FOREIGN KEY (`mutual_id`) REFERENCES `mutual_seguridad` (`id`),
  ADD CONSTRAINT `fk_at_trabajador` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajador` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `asignacion_turno`
--
ALTER TABLE `asignacion_turno`
  ADD CONSTRAINT `fk_asignacion_turno_trabajador` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajador` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_asignacion_turno_turno` FOREIGN KEY (`turno_id`) REFERENCES `turno` (`id`);

--
-- Filtros para la tabla `ausencia`
--
ALTER TABLE `ausencia`
  ADD CONSTRAINT `fk_ausencia_trabajador` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajador` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `centro_costo`
--
ALTER TABLE `centro_costo`
  ADD CONSTRAINT `fk_ccosto_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`);

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `fk_ciudad_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`);

--
-- Filtros para la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD CONSTRAINT `fk_comuna_ciudad` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudad` (`id`);

--
-- Filtros para la tabla `contacto_emergencia`
--
ALTER TABLE `contacto_emergencia`
  ADD CONSTRAINT `fk_contacto_trabajador` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajador` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `fk_contrato_cargo` FOREIGN KEY (`cargo_id`) REFERENCES `cargo` (`id`),
  ADD CONSTRAINT `fk_contrato_ccosto` FOREIGN KEY (`centro_costo_id`) REFERENCES `centro_costo` (`id`),
  ADD CONSTRAINT `fk_contrato_lugar` FOREIGN KEY (`lugar_prestacion_id`) REFERENCES `direccion` (`id`),
  ADD CONSTRAINT `fk_contrato_trabajador` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajador` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_contrato_unidad` FOREIGN KEY (`unidad_id`) REFERENCES `unidad_organizacional` (`id`);

--
-- Filtros para la tabla `cotizacion_previsional`
--
ALTER TABLE `cotizacion_previsional`
  ADD CONSTRAINT `fk_cot_prev_liq` FOREIGN KEY (`liquidacion_id`) REFERENCES `liquidacion` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `datos_bancarios`
--
ALTER TABLE `datos_bancarios`
  ADD CONSTRAINT `fk_db_banco` FOREIGN KEY (`banco_id`) REFERENCES `banco` (`id`),
  ADD CONSTRAINT `fk_db_trabajador` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajador` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `datos_previsionales`
--
ALTER TABLE `datos_previsionales`
  ADD CONSTRAINT `fk_dp_afp` FOREIGN KEY (`afp_id`) REFERENCES `afp` (`id`),
  ADD CONSTRAINT `fk_dp_isapre` FOREIGN KEY (`isapre_id`) REFERENCES `isapre` (`id`),
  ADD CONSTRAINT `fk_dp_trabajador` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajador` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `fk_direccion_comuna` FOREIGN KEY (`comuna_id`) REFERENCES `comuna` (`id`);

--
-- Filtros para la tabla `documento`
--
ALTER TABLE `documento`
  ADD CONSTRAINT `fk_documento_trabajador` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajador` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `fk_empresa_direccion` FOREIGN KEY (`direccion_id`) REFERENCES `direccion` (`id`);

--
-- Filtros para la tabla `item_liquidacion`
--
ALTER TABLE `item_liquidacion`
  ADD CONSTRAINT `fk_item_liq_concepto` FOREIGN KEY (`concepto_id`) REFERENCES `concepto_liquidacion` (`id`),
  ADD CONSTRAINT `fk_item_liq_liq` FOREIGN KEY (`liquidacion_id`) REFERENCES `liquidacion` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `liquidacion`
--
ALTER TABLE `liquidacion`
  ADD CONSTRAINT `fk_liq_contrato` FOREIGN KEY (`contrato_id`) REFERENCES `contrato` (`id`),
  ADD CONSTRAINT `fk_liq_trabajador` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajador` (`id`);

--
-- Filtros para la tabla `marcacion`
--
ALTER TABLE `marcacion`
  ADD CONSTRAINT `fk_marcacion_trabajador` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajador` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pago_nomina`
--
ALTER TABLE `pago_nomina`
  ADD CONSTRAINT `fk_pago_banco` FOREIGN KEY (`banco_id`) REFERENCES `banco` (`id`),
  ADD CONSTRAINT `fk_pago_liq` FOREIGN KEY (`liquidacion_id`) REFERENCES `liquidacion` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_persona_direccion` FOREIGN KEY (`direccion_id`) REFERENCES `direccion` (`id`);

--
-- Filtros para la tabla `region`
--
ALTER TABLE `region`
  ADD CONSTRAINT `fk_region_pais` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`);

--
-- Filtros para la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD CONSTRAINT `fk_trabajador_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `fk_trabajador_mutual` FOREIGN KEY (`mutual_id`) REFERENCES `mutual_seguridad` (`id`),
  ADD CONSTRAINT `fk_trabajador_persona` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `unidad_organizacional`
--
ALTER TABLE `unidad_organizacional`
  ADD CONSTRAINT `fk_unidad_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `fk_unidad_padre` FOREIGN KEY (`padre_id`) REFERENCES `unidad_organizacional` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_persona` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `vacaciones_saldo`
--
ALTER TABLE `vacaciones_saldo`
  ADD CONSTRAINT `fk_vacaciones_trabajador` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajador` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
