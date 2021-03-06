-- MySQL Script generated by MySQL Workbench
-- Fri Mar  3 20:16:29 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema logsys_remuneraciones
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema logsys_remuneraciones
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `logsys_remuneraciones` DEFAULT CHARACTER SET utf8 ;
USE `logsys_remuneraciones` ;

-- -----------------------------------------------------
-- Table `logsys_remuneraciones`.`REGIONES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `logsys_remuneraciones`.`REGIONES` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logsys_remuneraciones`.`PROVINCIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `logsys_remuneraciones`.`PROVINCIA` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(60) NOT NULL,
  `REGIONES_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_PROVINCIA_REGIONES1_idx` (`REGIONES_id` ASC),
  CONSTRAINT `fk_PROVINCIA_REGIONES1`
    FOREIGN KEY (`REGIONES_id`)
    REFERENCES `logsys_remuneraciones`.`REGIONES` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logsys_remuneraciones`.`CIUDADES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `logsys_remuneraciones`.`CIUDADES` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `PROVINCIA_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_CIUDADES_PROVINCIA_idx` (`PROVINCIA_id` ASC),
  CONSTRAINT `fk_CIUDADES_PROVINCIA`
    FOREIGN KEY (`PROVINCIA_id`)
    REFERENCES `logsys_remuneraciones`.`PROVINCIA` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logsys_remuneraciones`.`USUARIOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `logsys_remuneraciones`.`USUARIOS` (
  `rut` INT NOT NULL,
  `dv` VARCHAR(1) NOT NULL,
  `nombres` VARCHAR(45) NOT NULL,
  `paterno` VARCHAR(45) NOT NULL,
  `materno` VARCHAR(45) NOT NULL,
  `telefono` INT(9) NULL,
  `celular` INT(9) NULL,
  `email` VARCHAR(60) NOT NULL,
  `password` VARCHAR(64) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `CIUDADES_id` INT NOT NULL,
  PRIMARY KEY (`rut`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `fk_USUARIOS_CIUDADES1_idx` (`CIUDADES_id` ASC),
  CONSTRAINT `fk_USUARIOS_CIUDADES1`
    FOREIGN KEY (`CIUDADES_id`)
    REFERENCES `logsys_remuneraciones`.`CIUDADES` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logsys_remuneraciones`.`INSTITUCIONES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `logsys_remuneraciones`.`INSTITUCIONES` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rut` INT(9) NOT NULL,
  `dv` VARCHAR(1) NOT NULL,
  `razon_social` VARCHAR(100) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `rbd` VARCHAR(45) NOT NULL,
  `telefono` INT(9) NOT NULL,
  `decreto` VARCHAR(45) NOT NULL,
  `CIUDADES_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_INSTITUCIONES_CIUDADES1_idx` (`CIUDADES_id` ASC),
  CONSTRAINT `fk_INSTITUCIONES_CIUDADES1`
    FOREIGN KEY (`CIUDADES_id`)
    REFERENCES `logsys_remuneraciones`.`CIUDADES` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logsys_remuneraciones`.`CARGOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `logsys_remuneraciones`.`CARGOS` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logsys_remuneraciones`.`ESTADO_CIVIL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `logsys_remuneraciones`.`ESTADO_CIVIL` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logsys_remuneraciones`.`SEXO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `logsys_remuneraciones`.`SEXO` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logsys_remuneraciones`.`PERSONAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `logsys_remuneraciones`.`PERSONAL` (
  `rut` INT NOT NULL,
  `dv` VARCHAR(1) NOT NULL,
  `nombres` VARCHAR(45) NOT NULL,
  `paterno` VARCHAR(45) NOT NULL,
  `materno` VARCHAR(45) NOT NULL,
  `f_nac` DATE NOT NULL,
  `telefono` INT(9) NULL,
  `celular` INT(9) NULL,
  `email` VARCHAR(60) NOT NULL,
  `password` VARCHAR(64) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `CIUDADES_id` INT NOT NULL,
  `CARGOS_id` INT NOT NULL,
  `estado` TINYINT NOT NULL,
  `ESTADO_CIVIL_id` INT NOT NULL,
  `SEXO_id` INT NOT NULL,
  `INSTITUCIONES_id` INT NOT NULL,
  PRIMARY KEY (`rut`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `fk_USUARIOS_CIUDADES1_idx` (`CIUDADES_id` ASC),
  INDEX `fk_PERSONAL_CARGOS1_idx` (`CARGOS_id` ASC),
  INDEX `fk_PERSONAL_ESTADO_CIVIL1_idx` (`ESTADO_CIVIL_id` ASC),
  INDEX `fk_PERSONAL_SEXO1_idx` (`SEXO_id` ASC),
  INDEX `fk_PERSONAL_INSTITUCIONES1_idx` (`INSTITUCIONES_id` ASC),
  CONSTRAINT `fk_USUARIOS_CIUDADES10`
    FOREIGN KEY (`CIUDADES_id`)
    REFERENCES `logsys_remuneraciones`.`CIUDADES` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PERSONAL_CARGOS1`
    FOREIGN KEY (`CARGOS_id`)
    REFERENCES `logsys_remuneraciones`.`CARGOS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PERSONAL_ESTADO_CIVIL1`
    FOREIGN KEY (`ESTADO_CIVIL_id`)
    REFERENCES `logsys_remuneraciones`.`ESTADO_CIVIL` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PERSONAL_SEXO1`
    FOREIGN KEY (`SEXO_id`)
    REFERENCES `logsys_remuneraciones`.`SEXO` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PERSONAL_INSTITUCIONES1`
    FOREIGN KEY (`INSTITUCIONES_id`)
    REFERENCES `logsys_remuneraciones`.`INSTITUCIONES` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logsys_remuneraciones`.`MODULOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `logsys_remuneraciones`.`MODULOS` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logsys_remuneraciones`.`CATEGORIAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `logsys_remuneraciones`.`CATEGORIAS` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(250) NOT NULL,
  `MODULOS_id` INT NOT NULL,
  PRIMARY KEY (`id`, `MODULOS_id`),
  INDEX `fk_CATEGORIAS_MODULOS1_idx` (`MODULOS_id` ASC),
  CONSTRAINT `fk_CATEGORIAS_MODULOS1`
    FOREIGN KEY (`MODULOS_id`)
    REFERENCES `logsys_remuneraciones`.`MODULOS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logsys_remuneraciones`.`PERSONAS_has_CARGOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `logsys_remuneraciones`.`PERSONAS_has_CARGOS` (
  `PERSONAS_rut` INT NOT NULL,
  `CARGOS_id` INT NOT NULL,
  `CARGOS_MODULOS_id` INT NOT NULL,
  PRIMARY KEY (`PERSONAS_rut`, `CARGOS_id`, `CARGOS_MODULOS_id`),
  INDEX `fk_PERSONAS_has_CARGOS_CARGOS1_idx` (`CARGOS_id` ASC, `CARGOS_MODULOS_id` ASC),
  INDEX `fk_PERSONAS_has_CARGOS_PERSONAS1_idx` (`PERSONAS_rut` ASC),
  CONSTRAINT `fk_PERSONAS_has_CARGOS_PERSONAS1`
    FOREIGN KEY (`PERSONAS_rut`)
    REFERENCES `logsys_remuneraciones`.`PERSONAL` (`rut`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PERSONAS_has_CARGOS_CARGOS1`
    FOREIGN KEY (`CARGOS_id`)
    REFERENCES `logsys_remuneraciones`.`CATEGORIAS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logsys_remuneraciones`.`PERSONAS_has_CATEGORIAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `logsys_remuneraciones`.`PERSONAS_has_CATEGORIAS` (
  `PERSONAS_rut` INT NOT NULL,
  `CATEGORIAS_id` INT NOT NULL,
  `CATEGORIAS_MODULOS_id` INT NOT NULL,
  PRIMARY KEY (`PERSONAS_rut`, `CATEGORIAS_id`, `CATEGORIAS_MODULOS_id`),
  INDEX `fk_PERSONAS_CATEGORIAS_idx` (`CATEGORIAS_id` ASC, `CATEGORIAS_MODULOS_id` ASC),
  INDEX `fk_PERSONAS_CATEGORIAS_idx` (`PERSONAS_rut` ASC),
  CONSTRAINT `fk_PERSONAS_CATEGORIAS`
    FOREIGN KEY (`PERSONAS_rut`)
    REFERENCES `logsys_remuneraciones`.`PERSONAL` (`rut`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PERSONAS_has_CATEGORIAS_CATEGORIAS1`
    FOREIGN KEY (`CATEGORIAS_id`)
    REFERENCES `logsys_remuneraciones`.`CATEGORIAS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `logsys_remuneraciones`.`PERSONAL_has_CATEGORIAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `logsys_remuneraciones`.`PERSONAL_has_CATEGORIAS` (
  `PERSONAL_rut` INT NOT NULL,
  `CATEGORIAS_id` INT NOT NULL,
  `CATEGORIAS_MODULOS_id` INT NOT NULL,
  PRIMARY KEY (`PERSONAL_rut`, `CATEGORIAS_id`, `CATEGORIAS_MODULOS_id`),
  INDEX `fk_PERSONAL_has_CATEGORIAS_CATEGORIAS1_idx` (`CATEGORIAS_id` ASC, `CATEGORIAS_MODULOS_id` ASC),
  INDEX `fk_PERSONAL_has_CATEGORIAS_PERSONAL1_idx` (`PERSONAL_rut` ASC),
  CONSTRAINT `fk_PERSONAL_has_CATEGORIAS_PERSONAL1`
    FOREIGN KEY (`PERSONAL_rut`)
    REFERENCES `logsys_remuneraciones`.`PERSONAL` (`rut`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PERSONAL_has_CATEGORIAS_CATEGORIAS1`
    FOREIGN KEY (`CATEGORIAS_id` , `CATEGORIAS_MODULOS_id`)
    REFERENCES `logsys_remuneraciones`.`CATEGORIAS` (`id` , `MODULOS_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
