-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 12-06-2015 a las 13:01:38
-- Versión del servidor: 5.5.20
-- Versión de PHP: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `3rekoadministracion`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_permiso_usuario`(nuevo_usuario varchar(50))
SELECT P.*
FROM 	
		dato_login_administrador D,
        usuario_administrador U,
	    usuario_administrador_has_rol_administrador UR,
		rol_administrador R,
        rol_administrador_has_permiso_administrador RP,
        permiso_administrador P

WHERE U.dato_login_administrador_id = D.id
AND UR.usuario_administrador_id = U.id
AND UR.rol_administrador_id = R.id
AND RP.rol_administrador_id = R.id
AND RP.permiso_administrador_id = P.id

AND D.usuario=nuevo_usuario$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dato_login_administrador`
--

CREATE TABLE IF NOT EXISTS `dato_login_administrador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `pregunta_secreta` varchar(45) DEFAULT NULL,
  `respuesta_secreta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `dato_login_administrador`
--

INSERT INTO `dato_login_administrador` (`id`, `usuario`, `clave`, `pregunta_secreta`, `respuesta_secreta`) VALUES
(1, 'john', '123', NULL, NULL),
(2, 'diego', '123', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escritorio_administrador`
--

CREATE TABLE IF NOT EXISTS `escritorio_administrador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `escritorio_administrador`
--

INSERT INTO `escritorio_administrador` (`id`) VALUES
(1),
(2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escritorio_administrador_has_tema_administrador`
--

CREATE TABLE IF NOT EXISTS `escritorio_administrador_has_tema_administrador` (
  `escritorio_administrador_id` int(11) NOT NULL,
  `tema_administrador_id` int(11) NOT NULL,
  PRIMARY KEY (`escritorio_administrador_id`,`tema_administrador_id`),
  KEY `fk_escritorio_administrador_has_tema_administrador_tema_adm_idx` (`tema_administrador_id`),
  KEY `fk_escritorio_administrador_has_tema_administrador_escritor_idx` (`escritorio_administrador_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `escritorio_administrador_has_tema_administrador`
--

INSERT INTO `escritorio_administrador_has_tema_administrador` (`escritorio_administrador_id`, `tema_administrador_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso_administrador`
--

CREATE TABLE IF NOT EXISTS `permiso_administrador` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `permiso_administrador`
--

INSERT INTO `permiso_administrador` (`id`, `nombre`, `descripcion`) VALUES
(1, 'administracionusuarioadministrador', 'permiso para acceder al modulo de administrac'),
(2, 'administracionroladministrador', 'permiso para acceder al modulo de administrac'),
(3, 'administracionfruta', 'permiso para acceder al modulo de administrac');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso_administrador_has_privilegio_administrador`
--

CREATE TABLE IF NOT EXISTS `permiso_administrador_has_privilegio_administrador` (
  `permiso_administrador_id` int(11) NOT NULL,
  `privilegio_administrador_id` int(11) NOT NULL,
  PRIMARY KEY (`permiso_administrador_id`,`privilegio_administrador_id`),
  KEY `fk_permiso_administrador_has_privilegio_administrador_privi_idx` (`privilegio_administrador_id`),
  KEY `fk_permiso_administrador_has_privilegio_administrador_permi_idx` (`permiso_administrador_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `permiso_administrador_has_privilegio_administrador`
--

INSERT INTO `permiso_administrador_has_privilegio_administrador` (`permiso_administrador_id`, `privilegio_administrador_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(2, 2),
(3, 2),
(1, 3),
(2, 3),
(3, 3),
(1, 4),
(2, 4),
(3, 4),
(1, 5),
(2, 5),
(3, 5),
(1, 6),
(2, 6),
(3, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegio_administrador`
--

CREATE TABLE IF NOT EXISTS `privilegio_administrador` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `privilegio_administrador`
--

INSERT INTO `privilegio_administrador` (`id`, `nombre`, `descripcion`) VALUES
(1, 'index', 'vista principal del modulo'),
(2, 'view', 'vista para ver detalle de elementos'),
(3, 'admin', 'vista para administrar elementos'),
(4, 'create', 'vista para crear elementos'),
(5, 'update', 'vista para actualizar elementos'),
(6, 'delete', 'vista para borrar elementos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_administrador`
--

CREATE TABLE IF NOT EXISTS `rol_administrador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `rol_administrador`
--

INSERT INTO `rol_administrador` (`id`, `nombre`, `descripcion`) VALUES
(1, 'superusuario', 'rol que contendra todos los permisos'),
(2, 'administradorfruta', 'rol que manejara solo el modulo de administra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_administrador_has_permiso_administrador`
--

CREATE TABLE IF NOT EXISTS `rol_administrador_has_permiso_administrador` (
  `rol_administrador_id` int(11) NOT NULL,
  `permiso_administrador_id` int(11) NOT NULL,
  PRIMARY KEY (`rol_administrador_id`,`permiso_administrador_id`),
  KEY `fk_rol_administrador_has_permiso_administrador_permiso_admi_idx` (`permiso_administrador_id`),
  KEY `fk_rol_administrador_has_permiso_administrador_rol_administ_idx` (`rol_administrador_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rol_administrador_has_permiso_administrador`
--

INSERT INTO `rol_administrador_has_permiso_administrador` (`rol_administrador_id`, `permiso_administrador_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tema_administrador`
--

CREATE TABLE IF NOT EXISTS `tema_administrador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `tema_administrador`
--

INSERT INTO `tema_administrador` (`id`, `nombre`) VALUES
(1, 'verano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_administrador`
--

CREATE TABLE IF NOT EXISTS `usuario_administrador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `rut` int(11) DEFAULT NULL,
  `digito_verificador` int(11) DEFAULT NULL,
  `dato_login_administrador_id` int(11) NOT NULL,
  `escritorio_administrador_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_administrador_dato_login_administrador_idx` (`dato_login_administrador_id`),
  KEY `fk_usuario_administrador_escritorio_administrador1_idx` (`escritorio_administrador_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `usuario_administrador`
--

INSERT INTO `usuario_administrador` (`id`, `nombre`, `rut`, `digito_verificador`, `dato_login_administrador_id`, `escritorio_administrador_id`) VALUES
(1, 'john', 17382459, 9, 1, 1),
(2, 'diego', 18087707, 8, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_administrador_has_rol_administrador`
--

CREATE TABLE IF NOT EXISTS `usuario_administrador_has_rol_administrador` (
  `usuario_administrador_id` int(11) NOT NULL,
  `rol_administrador_id` int(11) NOT NULL,
  PRIMARY KEY (`usuario_administrador_id`,`rol_administrador_id`),
  KEY `fk_usuario_administrador_has_rol_administrador_rol_administ_idx` (`rol_administrador_id`),
  KEY `fk_usuario_administrador_has_rol_administrador_usuario_admi_idx` (`usuario_administrador_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario_administrador_has_rol_administrador`
--

INSERT INTO `usuario_administrador_has_rol_administrador` (`usuario_administrador_id`, `rol_administrador_id`) VALUES
(1, 1),
(2, 2);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `escritorio_administrador_has_tema_administrador`
--
ALTER TABLE `escritorio_administrador_has_tema_administrador`
  ADD CONSTRAINT `fk_escritorio_administrador_has_tema_administrador_escritorio1` FOREIGN KEY (`escritorio_administrador_id`) REFERENCES `escritorio_administrador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_escritorio_administrador_has_tema_administrador_tema_admin1` FOREIGN KEY (`tema_administrador_id`) REFERENCES `tema_administrador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `permiso_administrador_has_privilegio_administrador`
--
ALTER TABLE `permiso_administrador_has_privilegio_administrador`
  ADD CONSTRAINT `fk_permiso_administrador_has_privilegio_administrador_permiso1` FOREIGN KEY (`permiso_administrador_id`) REFERENCES `permiso_administrador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_permiso_administrador_has_privilegio_administrador_privile1` FOREIGN KEY (`privilegio_administrador_id`) REFERENCES `privilegio_administrador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `rol_administrador_has_permiso_administrador`
--
ALTER TABLE `rol_administrador_has_permiso_administrador`
  ADD CONSTRAINT `fk_rol_administrador_has_permiso_administrador_rol_administra1` FOREIGN KEY (`rol_administrador_id`) REFERENCES `rol_administrador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rol_administrador_has_permiso_administrador_permiso_admini1` FOREIGN KEY (`permiso_administrador_id`) REFERENCES `permiso_administrador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_administrador`
--
ALTER TABLE `usuario_administrador`
  ADD CONSTRAINT `fk_usuario_administrador_dato_login_administrador` FOREIGN KEY (`dato_login_administrador_id`) REFERENCES `dato_login_administrador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_administrador_escritorio_administrador1` FOREIGN KEY (`escritorio_administrador_id`) REFERENCES `escritorio_administrador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_administrador_has_rol_administrador`
--
ALTER TABLE `usuario_administrador_has_rol_administrador`
  ADD CONSTRAINT `fk_usuario_administrador_has_rol_administrador_usuario_admini1` FOREIGN KEY (`usuario_administrador_id`) REFERENCES `usuario_administrador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_administrador_has_rol_administrador_rol_administra1` FOREIGN KEY (`rol_administrador_id`) REFERENCES `rol_administrador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
