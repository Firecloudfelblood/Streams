CREATE DATABASE `tecgurus_basico`;
USE `tecgurus_basico`;
CREATE TABLE `banco` (
  `idBanco` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idBanco`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
INSERT INTO `tecgurus_basico`.`banco` VALUES (1,'Banamex');

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apaterno` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `amaterno` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `edad` int(11) NOT NULL,
  `idBanco` int(11) NOT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `fk_cliente_banco1_idx` (`idBanco`),
  CONSTRAINT `idBanco` FOREIGN KEY (`idBanco`) REFERENCES `banco` (`idBanco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `tecgurus_basico`.`cliente` VALUES (1,'JC','Villegas','Montiel',33,1),(2,'José','Lopez','Gutierrez',54,1),(3,'JC','VILLEGAS','MONTIEL',33,1),(4,'jc2','v2','mon2',33,1),(5,'luis','perex','lopex',34,1);

CREATE TABLE `perfil` (
  `idPerfil` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idPerfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `tipomovimiento` (
  `idTipoMovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idTipoMovimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `tipocuenta` (
  `idTipoCuenta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idTipoCuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `cuenta` (
  `idCuenta` int(11) NOT NULL AUTO_INCREMENT,
  `numeroCuenta` int(11) NOT NULL,
  `idTipoCuenta` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idCuenta`),
  KEY `fk_cuenta_tipocuenta1_idx` (`idTipoCuenta`),
  KEY `fk_cuenta_cliente1_idx` (`idCliente`),
  CONSTRAINT `idCliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idTipoCuenta` FOREIGN KEY (`idTipoCuenta`) REFERENCES `tipocuenta` (`idTipoCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `login` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `apaterno` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `amaterno` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `idPerfil` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `RefPerfil12` (`idPerfil`),
  CONSTRAINT `RefPerfil12` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idPerfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `movimiento` (
  `idMovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `monto` decimal(9,2) NOT NULL,
  `idTipoMovimiento` int(11) NOT NULL,
  `idCuenta` int(11) NOT NULL,
  PRIMARY KEY (`idMovimiento`),
  KEY `fk_movimiento_tipomovimiento1_idx` (`idTipoMovimiento`),
  KEY `fk_movimiento_cuenta1_idx` (`idCuenta`),
  CONSTRAINT `idCuenta` FOREIGN KEY (`idCuenta`) REFERENCES `cuenta` (`idCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idTipoMovimiento` FOREIGN KEY (`idTipoMovimiento`) REFERENCES `tipomovimiento` (`idTipoMovimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;




