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
-- Table `mydb`.`AG_Viagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AG_Viagens` (
  `IdAgencia` INT GENERATED ALWAYS AS () VIRTUAL,
  `Nome_AG` VARCHAR(30) NULL,
  `Telefone` VARCHAR(12) NULL,
  PRIMARY KEY (`IdAgencia`));


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `IdCliente` INT GENERATED ALWAYS AS () VIRTUAL,
  `Nome_Cliente` VARCHAR(200) NOT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  `Rua` VARCHAR(200) NOT NULL,
  `CEP` VARCHAR(8) NOT NULL,
  `UF` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`IdCliente`));


-- -----------------------------------------------------
-- Table `mydb`.`Passagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Passagem` (
  `IdPassagem` INT GENERATED ALWAYS AS () VIRTUAL,
  `Numero_Voo` VARCHAR(10) NOT NULL,
  `Origem` VARCHAR(150) NOT NULL,
  `Destino` VARCHAR(150) NOT NULL,
  `Data` DATE NOT NULL,
  `Hora` TIME NOT NULL,
  `Cliente_IdCliente` INT NOT NULL,
  PRIMARY KEY (`IdPassagem`, `Cliente_IdCliente`),
  INDEX `fk_Passagem_Cliente1_idx` (`Cliente_IdCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Passagem_Cliente1`
    FOREIGN KEY (`Cliente_IdCliente`)
    REFERENCES `mydb`.`Cliente` (`IdCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Funcionario` (
  `IdFuncinario` INT NOT NULL AUTO_INCREMENT,
  `Nome_Funcionario` VARCHAR(200) NOT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  `Cargo` VARCHAR(50) NOT NULL,
  `Rua` VARCHAR(200) NOT NULL,
  `CEP` VARCHAR(8) NOT NULL,
  `AG_Viagens_IdAgencia` INT NOT NULL,
  PRIMARY KEY (`IdFuncinario`, `AG_Viagens_IdAgencia`),
  INDEX `fk_Funcionario_AG_Viagens1_idx` (`AG_Viagens_IdAgencia` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionario_AG_Viagens1`
    FOREIGN KEY (`AG_Viagens_IdAgencia`)
    REFERENCES `mydb`.`AG_Viagens` (`IdAgencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Companhia_Aerea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Companhia_Aerea` (
  `IdCompanhia` INT GENERATED ALWAYS AS () VIRTUAL,
  `Nome_Companhia` VARCHAR(150) NOT NULL,
  `Numero_Voo` VARCHAR(10) NOT NULL,
  `Modelo_Aviao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`IdCompanhia`));


-- -----------------------------------------------------
-- Table `mydb`.`Voo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Voo` (
  `Numero_Voo` VARCHAR(10) NOT NULL,
  `Modelo_Aviao` VARCHAR(100) NOT NULL,
  `Origem` VARCHAR(150) NOT NULL,
  `Destino` VARCHAR(150) NOT NULL,
  `Data` DATE NOT NULL,
  `Hora` TIME NOT NULL,
  `Companhia_Aerea_IdCompanhia` INT NOT NULL,
  PRIMARY KEY (`Numero_Voo`, `Companhia_Aerea_IdCompanhia`),
  INDEX `fk_Voo_Companhia_Aerea1_idx` (`Companhia_Aerea_IdCompanhia` ASC) VISIBLE,
  CONSTRAINT `fk_Voo_Companhia_Aerea1`
    FOREIGN KEY (`Companhia_Aerea_IdCompanhia`)
    REFERENCES `mydb`.`Companhia_Aerea` (`IdCompanhia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Vende`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vende` (
  `Passagem_IdPassagem` INT NOT NULL,
  `AG_Viagens_IdAgencia` INT NOT NULL,
  PRIMARY KEY (`Passagem_IdPassagem`, `AG_Viagens_IdAgencia`),
  INDEX `fk_Vende_AG_Viagens1_idx` (`AG_Viagens_IdAgencia` ASC) VISIBLE,
  CONSTRAINT `fk_Vende_Passagem1`
    FOREIGN KEY (`Passagem_IdPassagem`)
    REFERENCES `mydb`.`Passagem` (`IdPassagem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vende_AG_Viagens1`
    FOREIGN KEY (`AG_Viagens_IdAgencia`)
    REFERENCES `mydb`.`AG_Viagens` (`IdAgencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Convenio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Convenio` (
  `AG_Viagens_IdAgencia` INT NOT NULL,
  `Companhia_Aerea_IdCompanhia` INT NOT NULL,
  PRIMARY KEY (`AG_Viagens_IdAgencia`, `Companhia_Aerea_IdCompanhia`),
  INDEX `fk_Convenio_Companhia_Aerea1_idx` (`Companhia_Aerea_IdCompanhia` ASC) VISIBLE,
  CONSTRAINT `fk_Convenio_AG_Viagens1`
    FOREIGN KEY (`AG_Viagens_IdAgencia`)
    REFERENCES `mydb`.`AG_Viagens` (`IdAgencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Convenio_Companhia_Aerea1`
    FOREIGN KEY (`Companhia_Aerea_IdCompanhia`)
    REFERENCES `mydb`.`Companhia_Aerea` (`IdCompanhia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

USE `mydb` ;

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `mydb`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`view1`;
USE `mydb`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
