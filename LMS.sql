-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dmql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dmql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dmql` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `dmql` ;

-- -----------------------------------------------------
-- Table `dmql`.`publisher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dmql`.`publisher` (
  `pid` INT NOT NULL,
  `pname` VARCHAR(255) NULL DEFAULT NULL,
  `pnumber` VARCHAR(255) NULL DEFAULT NULL,
  `paddress` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`pid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `dmql`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dmql`.`book` (
  `bookid` INT NOT NULL,
  `title` VARCHAR(255) NULL DEFAULT NULL,
  `pubyear` VARCHAR(255) NULL DEFAULT NULL,
  `pid` INT NULL DEFAULT NULL,
  PRIMARY KEY (`bookid`),
  INDEX `pid` (`pid` ASC) VISIBLE,
  CONSTRAINT `book_ibfk_1`
    FOREIGN KEY (`pid`)
    REFERENCES `dmql`.`publisher` (`pid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `dmql`.`card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dmql`.`card` (
  `card_no` INT NOT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `phone` VARCHAR(255) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `occupation` VARCHAR(255) NULL DEFAULT NULL,
  `age` INT NULL DEFAULT NULL,
  PRIMARY KEY (`card_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `dmql`.`librarybranch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dmql`.`librarybranch` (
  `branchid` INT NOT NULL,
  `branchname` VARCHAR(255) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`branchid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `dmql`.`issue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dmql`.`issue` (
  `bookid` INT NULL DEFAULT NULL,
  `branchid` INT NULL DEFAULT NULL,
  `card_no` INT NULL DEFAULT NULL,
  `date_out` DATE NULL DEFAULT NULL,
  `due_date` DATE NULL DEFAULT NULL,
  `return_book` VARCHAR(10) NULL DEFAULT NULL,
  INDEX `bookid` (`bookid` ASC) VISIBLE,
  INDEX `branchid` (`branchid` ASC) VISIBLE,
  INDEX `card_no` (`card_no` ASC) VISIBLE,
  CONSTRAINT `issue_ibfk_1`
    FOREIGN KEY (`bookid`)
    REFERENCES `dmql`.`book` (`bookid`),
  CONSTRAINT `issue_ibfk_2`
    FOREIGN KEY (`branchid`)
    REFERENCES `dmql`.`librarybranch` (`branchid`),
  CONSTRAINT `issue_ibfk_3`
    FOREIGN KEY (`card_no`)
    REFERENCES `dmql`.`card` (`card_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
