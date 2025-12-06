-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`animadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`animadores` (
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(14) NOT NULL,
  `entrega_cena` DATE NOT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `mydb`.`diretor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`diretor` (
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(14) NOT NULL,
  `entrega_projeto` DATE NOT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`design_personagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`desing_personagens` (
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(14) NOT NULL,
  `entrega_desenhos` DATE NOT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`design_som`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`desing_som` (
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(14) NOT NULL,
  `entrega_projeto` DATE NOT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`roterista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`roterista` (
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(14) NOT NULL,
  `entrega_roteiro` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`animadores_diretor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`animadores_diretor` (
  `animadores_cpf` VARCHAR(14) NOT NULL,
  `diretor_cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`animadores_cpf`, `diretor_cpf`),
  INDEX `fk_animadores_has_diretor_diretor1_idx` (`diretor_cpf` ASC),
  INDEX `fk_animadores_has_diretor_animadores_idx` (`animadores_cpf` ASC))
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `mydb`.`diretor_design_som`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`diretor_desing_som` (
  `diretor_cpf` VARCHAR(14) NOT NULL,
  `desing_som_cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`diretor_cpf`, `desing_som_cpf`),
  INDEX `fk_diretor_has_desing_som_desing_som1_idx` (`desing_som_cpf` ASC),
  INDEX `fk_diretor_has_desing_som_diretor1_idx` (`diretor_cpf` ASC),
  CONSTRAINT `fk_diretor_has_desing_som_diretor1`
    FOREIGN KEY (`diretor_cpf`)
    REFERENCES `mydb`.`diretor` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_diretor_has_desing_som_desing_som1`
    FOREIGN KEY (`desing_som_cpf`)
    REFERENCES `mydb`.`desing_som` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`diretor_design_personagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`diretor_desing_personagens` (
  `diretor_cpf` VARCHAR(14) NOT NULL,
  `desing_personagens_cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`diretor_cpf`, `desing_personagens_cpf`),
  INDEX `fk_diretor_has_desing_personagens1_desing_personagens1_idx` (`desing_personagens_cpf` ASC),
  INDEX `fk_diretor_has_desing_personagens1_diretor1_idx` (`diretor_cpf` ASC),
  CONSTRAINT `fk_diretor_has_desing_personagens1_diretor1`
    FOREIGN KEY (`diretor_cpf`)
    REFERENCES `mydb`.`diretor` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_diretor_has_desing_personagens1_desing_personagens1`
    FOREIGN KEY (`desing_personagens_cpf`)
    REFERENCES `mydb`.`desing_personagens` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`diretor_roterista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`diretor_roterista` (
  `diretor_cpf` VARCHAR(14) NOT NULL,
  `roterista_cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`diretor_cpf`, `roterista_cpf`),
  INDEX `fk_diretor_has_roterista_roterista1_idx` (`roterista_cpf` ASC),
  INDEX `fk_diretor_has_roterista_diretor1_idx` (`diretor_cpf` ASC),
  CONSTRAINT `fk_diretor_has_roterista_diretor1`
    FOREIGN KEY (`diretor_cpf`)
    REFERENCES `mydb`.`diretor` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_diretor_has_roterista_roterista1`
    FOREIGN KEY (`roterista_cpf`)
    REFERENCES `mydb`.`roterista` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`timestamps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`timestamps` (
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
