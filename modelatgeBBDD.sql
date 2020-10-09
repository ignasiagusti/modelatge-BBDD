-- MySQL Script generated by MySQL Workbench
-- Fri Oct  9 21:40:49 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema modelatgeBBDD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema modelatgeBBDD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `modelatgeBBDD` DEFAULT CHARACTER SET utf8 ;
USE `modelatgeBBDD` ;

-- -----------------------------------------------------
-- Table `modelatgeBBDD`.`Planes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelatgeBBDD`.`Planes` (
  `idPlanes` INT NOT NULL,
  `capacity` INT NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPlanes`),
  UNIQUE INDEX `idAvions_UNIQUE` (`idPlanes` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelatgeBBDD`.`Seats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelatgeBBDD`.`Seats` (
  `idSeients` INT NOT NULL,
  `Avions_idAvions` INT NOT NULL,
  PRIMARY KEY (`idSeients`),
  INDEX `fk_Seients_Avions_idx` (`Avions_idAvions` ASC) VISIBLE,
  CONSTRAINT `fk_Seients_Avions`
    FOREIGN KEY (`Avions_idAvions`)
    REFERENCES `modelatgeBBDD`.`Planes` (`idPlanes`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelatgeBBDD`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelatgeBBDD`.`Clients` (
  `idClients` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `surname` VARCHAR(45) NULL,
  `dni` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`idClients`),
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelatgeBBDD`.`Paintings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelatgeBBDD`.`Paintings` (
  `idPaintings` INT NOT NULL,
  `price` DECIMAL(15,2) NOT NULL,
  `author` VARCHAR(45) NULL,
  `Clients_idClients` INT NOT NULL,
  PRIMARY KEY (`idPaintings`),
  UNIQUE INDEX `idPaintings_UNIQUE` (`idPaintings` ASC) VISIBLE,
  INDEX `fk_Paintings_Clients1_idx` (`Clients_idClients` ASC) VISIBLE,
  CONSTRAINT `fk_Paintings_Clients1`
    FOREIGN KEY (`Clients_idClients`)
    REFERENCES `modelatgeBBDD`.`Clients` (`idClients`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelatgeBBDD`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelatgeBBDD`.`Users` (
  `idUsers` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsers`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelatgeBBDD`.`Videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelatgeBBDD`.`Videos` (
  `idVideos` VARCHAR(30) NOT NULL COMMENT 'part final enllaç',
  `title` VARCHAR(60) NULL,
  `description` TEXT(1500) NULL,
  `url` VARCHAR(60) NOT NULL,
  `Users_idUsers` INT NOT NULL,
  PRIMARY KEY (`idVideos`),
  INDEX `fk_Videos_Users1_idx` (`Users_idUsers` ASC) VISIBLE,
  CONSTRAINT `fk_Videos_Users1`
    FOREIGN KEY (`Users_idUsers`)
    REFERENCES `modelatgeBBDD`.`Users` (`idUsers`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelatgeBBDD`.`Authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelatgeBBDD`.`Authors` (
  `idAuthors` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(60) NULL,
  `one_or_more` TINYINT NULL COMMENT '0 = Només un llibre\n1= Més d\'un llibre\n',
  PRIMARY KEY (`idAuthors`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelatgeBBDD`.`Books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelatgeBBDD`.`Books` (
  `idBooks` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(60) NOT NULL,
  `units` INT(10) NULL,
  `price` DECIMAL(4,2) NULL,
  `Authors_idAuthors` INT NOT NULL,
  PRIMARY KEY (`idBooks`, `Authors_idAuthors`),
  INDEX `fk_Books_Authors1_idx` (`Authors_idAuthors` ASC) VISIBLE,
  CONSTRAINT `fk_Books_Authors1`
    FOREIGN KEY (`Authors_idAuthors`)
    REFERENCES `modelatgeBBDD`.`Authors` (`idAuthors`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelatgeBBDD`.`Users4`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelatgeBBDD`.`Users4` (
  `idUsers4` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsers4`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelatgeBBDD`.`Bills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelatgeBBDD`.`Bills` (
  `idBills` INT NOT NULL AUTO_INCREMENT,
  `Users4_idUsers4` INT NOT NULL,
  `Books_idBooks` INT NOT NULL,
  `Books_Authors_idAuthors` INT NOT NULL,
  PRIMARY KEY (`idBills`, `Users4_idUsers4`, `Books_idBooks`, `Books_Authors_idAuthors`),
  INDEX `fk_Bills_Users41_idx` (`Users4_idUsers4` ASC) VISIBLE,
  INDEX `fk_Bills_Books1_idx` (`Books_idBooks` ASC, `Books_Authors_idAuthors` ASC) VISIBLE,
  CONSTRAINT `fk_Bills_Users41`
    FOREIGN KEY (`Users4_idUsers4`)
    REFERENCES `modelatgeBBDD`.`Users4` (`idUsers4`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Bills_Books1`
    FOREIGN KEY (`Books_idBooks` , `Books_Authors_idAuthors`)
    REFERENCES `modelatgeBBDD`.`Books` (`idBooks` , `Authors_idAuthors`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelatgeBBDD`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelatgeBBDD`.`Users` (
  `idUsers` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsers`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelatgeBBDD`.`Friends`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelatgeBBDD`.`Friends` (
  `idFriends` INT NOT NULL,
  `description` VARCHAR(1000) NULL COMMENT 'Description of how did they met',
  `Users_idUser` INT NOT NULL,
  `Users_idFriend` INT NOT NULL COMMENT 'Amic',
  PRIMARY KEY (`idFriends`),
  INDEX `fk_Friends_Users1_idx` (`Users_idUser` ASC) VISIBLE,
  INDEX `fk_Friends_Users2_idx` (`Users_idFriend` ASC) VISIBLE,
  CONSTRAINT `fk_Friends_Users1`
    FOREIGN KEY (`Users_idUser`)
    REFERENCES `modelatgeBBDD`.`Users` (`idUsers`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Friends_Users2`
    FOREIGN KEY (`Users_idFriend`)
    REFERENCES `modelatgeBBDD`.`Users` (`idUsers`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelatgeBBDD`.`Photos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelatgeBBDD`.`Photos` (
  `idPhotos` INT NOT NULL AUTO_INCREMENT,
  `place` VARCHAR(45) NULL,
  `url` VARCHAR(60) NOT NULL,
  `Users_idUsers` INT NOT NULL,
  PRIMARY KEY (`idPhotos`, `Users_idUsers`),
  INDEX `fk_Photos_Users1_idx` (`Users_idUsers` ASC) VISIBLE,
  CONSTRAINT `fk_Photos_Users1`
    FOREIGN KEY (`Users_idUsers`)
    REFERENCES `modelatgeBBDD`.`Users` (`idUsers`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelatgeBBDD`.`Suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelatgeBBDD`.`Suppliers` (
  `idSuppliers` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `address` VARCHAR(60) NULL COMMENT 'name of the street, number of door.',
  `city` VARCHAR(20) NULL,
  `postal code` INT(10) NULL,
  `country` VARCHAR(45) NULL,
  `telephone` INT(12) NULL,
  `fax` INT(12) NULL,
  `NIF` INT(20) NULL,
  PRIMARY KEY (`idSuppliers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelatgeBBDD`.`Clients6`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelatgeBBDD`.`Clients6` (
  `idClients` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `telephone` INT(12) NULL,
  `email` VARCHAR(45) NULL,
  `register data` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `Clients6_idRecom` INT NULL COMMENT 'Client Recomanat',
  PRIMARY KEY (`idClients`),
  INDEX `fk_Clients_Clients1_idx` (`Clients6_idRecom` ASC) VISIBLE,
  CONSTRAINT `fk_Clients_Clients1`
    FOREIGN KEY (`Clients6_idRecom`)
    REFERENCES `modelatgeBBDD`.`Clients6` (`idClients`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelatgeBBDD`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelatgeBBDD`.`Employees` (
  `idEmployees` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `surname` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `position` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmployees`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelatgeBBDD`.`Glasses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelatgeBBDD`.`Glasses` (
  `idGlasses` INT NOT NULL AUTO_INCREMENT,
  `brand` VARCHAR(45) NULL,
  `grade` INT(10) NULL,
  `frame_type` VARCHAR(10) NULL,
  `frame_color` VARCHAR(10) NULL,
  `glass_color` VARCHAR(10) NULL,
  `price` INT(6) NULL,
  `Suppliers_idSuppliers` INT NOT NULL,
  `Clients6_idComprador` INT NOT NULL COMMENT 'Comprador',
  `Employees_idEmployees` INT NOT NULL,
  PRIMARY KEY (`idGlasses`),
  INDEX `fk_Glasses_Suppliers1_idx` (`Suppliers_idSuppliers` ASC) VISIBLE,
  INDEX `fk_Glasses_Clients1_idx` (`Clients6_idComprador` ASC) VISIBLE,
  INDEX `fk_Glasses_Employees1_idx` (`Employees_idEmployees` ASC) VISIBLE,
  CONSTRAINT `fk_Glasses_Suppliers1`
    FOREIGN KEY (`Suppliers_idSuppliers`)
    REFERENCES `modelatgeBBDD`.`Suppliers` (`idSuppliers`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Glasses_Clients1`
    FOREIGN KEY (`Clients6_idComprador`)
    REFERENCES `modelatgeBBDD`.`Clients6` (`idClients`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Glasses_Employees1`
    FOREIGN KEY (`Employees_idEmployees`)
    REFERENCES `modelatgeBBDD`.`Employees` (`idEmployees`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
