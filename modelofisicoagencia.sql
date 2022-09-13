CREATE SCHEMA  `Agencia` DEFAULT CHARACTER SET utf8 ;
USE `Agencia` ;


CREATE TABLE  `Agencia`.`AG_Viagens` (
  `IdAgencia` INT NOT NULL AUTO_INCREMENT,
  `Nome_AG` VARCHAR(30) NULL,
  `Telefone` VARCHAR(12) NULL,
  PRIMARY KEY (`IdAgencia`));


CREATE TABLE  `Agencia`.`Cliente` (
  `IdCliente` INT NOT NULL AUTO_INCREMENT,
  `Nome_Cliente` VARCHAR(200) NOT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  `Rua` VARCHAR(200) NOT NULL,
  `CEP` VARCHAR(8) NOT NULL,
  `UF` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`IdCliente`));


CREATE TABLE `Agencia`.`Passagem` (
  `IdPassagem` INT NOT NULL AUTO_INCREMENT,
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
    REFERENCES `Agencia`.`Cliente` (`IdCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



CREATE TABLE  `Agencia`.`Funcionario` (
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
    REFERENCES `Agencia`.`AG_Viagens` (`IdAgencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `Agencia`.`Companhia_Aerea` (
  `IdCompanhia` INT NOT NULL AUTO_INCREMENT,
  `Nome_Companhia` VARCHAR(150) NOT NULL,
  `Numero_Voo` VARCHAR(10) NOT NULL,
  `Modelo_Aviao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`IdCompanhia`));


CREATE TABLE `Agencia`.`Voo` (
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
    REFERENCES `Agencia`.`Companhia_Aerea` (`IdCompanhia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `Agencia`.`Vende` (
  `Passagem_IdPassagem` INT NOT NULL,
  `AG_Viagens_IdAgencia` INT NOT NULL,
  PRIMARY KEY (`Passagem_IdPassagem`, `AG_Viagens_IdAgencia`),
  INDEX `fk_Vende_AG_Viagens1_idx` (`AG_Viagens_IdAgencia` ASC) VISIBLE,
  CONSTRAINT `fk_Vende_Passagem1`
    FOREIGN KEY (`Passagem_IdPassagem`)
    REFERENCES `Agencia`.`Passagem` (`IdPassagem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vende_AG_Viagens1`
    FOREIGN KEY (`AG_Viagens_IdAgencia`)
    REFERENCES `Agencia`.`AG_Viagens` (`IdAgencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `Agencia`.`Convenio` (
  `AG_Viagens_IdAgencia` INT NOT NULL,
  `Companhia_Aerea_IdCompanhia` INT NOT NULL,
  PRIMARY KEY (`AG_Viagens_IdAgencia`, `Companhia_Aerea_IdCompanhia`),
  INDEX `fk_Convenio_Companhia_Aerea1_idx` (`Companhia_Aerea_IdCompanhia` ASC) VISIBLE,
  CONSTRAINT `fk_Convenio_AG_Viagens1`
    FOREIGN KEY (`AG_Viagens_IdAgencia`)
    REFERENCES `Agencia`.`AG_Viagens` (`IdAgencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Convenio_Companhia_Aerea1`
    FOREIGN KEY (`Companhia_Aerea_IdCompanhia`)
    REFERENCES `Agencia`.`Companhia_Aerea` (`IdCompanhia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

USE `Agencia` ;

CREATE TABLE IF NOT EXISTS `Agencia`.`view1` (`id` INT);

DROP TABLE IF EXISTS `Agencia`.`view1`;
USE `Agencia`;
