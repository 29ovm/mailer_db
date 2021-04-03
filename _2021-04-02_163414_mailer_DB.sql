/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ mailer_DB /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE mailer_DB;

DROP TABLE IF EXISTS email_enviado;
CREATE TABLE `email_enviado` (
  `id_email_enviado` int NOT NULL AUTO_INCREMENT,
  `id_email_login` int DEFAULT NULL,
  `id_estatus` int DEFAULT NULL,
  `email_destinatario` varchar(30) DEFAULT NULL,
  `asunto` varchar(250) DEFAULT NULL,
  `cuerpo_email` varchar(500) DEFAULT NULL,
  `fecha_enviado` datetime DEFAULT NULL,
  PRIMARY KEY (`id_email_enviado`),
  KEY `id_email_login` (`id_email_login`),
  KEY `id_estatus` (`id_estatus`),
  CONSTRAINT `email_enviado_ibfk_1` FOREIGN KEY (`id_email_login`) REFERENCES `email_login` (`id_email_login`),
  CONSTRAINT `email_enviado_ibfk_2` FOREIGN KEY (`id_estatus`) REFERENCES `estatus_email` (`id_estatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS email_login;
CREATE TABLE `email_login` (
  `id_email_login` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_proveedor` int DEFAULT NULL,
  `name_email` varchar(30) DEFAULT NULL,
  `pass_email` varchar(30) DEFAULT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `es_activo` tinyint(1) DEFAULT '0',
  `es_admin` tinyint(1) DEFAULT '0',
  `fecha_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`id_email_login`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `email_login_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `perfil_usuario` (`id_usuario`),
  CONSTRAINT `email_login_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor_email` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS email_recibido;
CREATE TABLE `email_recibido` (
  `id_email_recibido` int NOT NULL AUTO_INCREMENT,
  `id_email_login` int DEFAULT NULL,
  `id_estatus` int DEFAULT NULL,
  `email_remitente` varchar(30) DEFAULT NULL,
  `nombre_usuario` varchar(30) DEFAULT NULL,
  `asunto` varchar(250) DEFAULT NULL,
  `cuerpo_email` varchar(500) DEFAULT NULL,
  `fecha_recepcion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_email_recibido`),
  KEY `id_email_login` (`id_email_login`),
  KEY `id_estatus` (`id_estatus`),
  CONSTRAINT `email_recibido_ibfk_1` FOREIGN KEY (`id_email_login`) REFERENCES `email_login` (`id_email_login`),
  CONSTRAINT `email_recibido_ibfk_2` FOREIGN KEY (`id_estatus`) REFERENCES `estatus_email` (`id_estatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS estatus_email;
CREATE TABLE `estatus_email` (
  `id_estatus` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_estatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS notificacion;
CREATE TABLE `notificacion` (
  `id_notificacion` int NOT NULL AUTO_INCREMENT,
  `Id_email_login` int DEFAULT NULL,
  `id_estatus` int DEFAULT NULL,
  `asunto` varchar(30) DEFAULT NULL,
  `mensaje` varchar(250) DEFAULT NULL,
  `fecha_recepcion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_notificacion`),
  KEY `Id_email_login` (`Id_email_login`),
  KEY `id_estatus` (`id_estatus`),
  CONSTRAINT `notificacion_ibfk_1` FOREIGN KEY (`Id_email_login`) REFERENCES `email_login` (`id_email_login`),
  CONSTRAINT `notificacion_ibfk_2` FOREIGN KEY (`id_estatus`) REFERENCES `estatus_email` (`id_estatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS perfil_usuario;
CREATE TABLE `perfil_usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nom_usuario` varchar(30) DEFAULT NULL,
  `ape_usuario` varchar(30) DEFAULT NULL,
  `name_email` varchar(30) DEFAULT NULL,
  `pass_email` varchar(30) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `es_activo` tinyint(1) DEFAULT '0',
  `es_admin` tinyint(1) DEFAULT '0',
  `fecha_creacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS proveedor_email;
CREATE TABLE `proveedor_email` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(30) DEFAULT NULL,
  `dominio_email` varchar(30) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `nit` int NOT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS recuperar_pass;
CREATE TABLE `recuperar_pass` (
  `id_recuperacion` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `codigo_activo` tinyint(1) DEFAULT '0',
  `fecha_recuperacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_recuperacion`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `recuperar_pass_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `perfil_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

















/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
