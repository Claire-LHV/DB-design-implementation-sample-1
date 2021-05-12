-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ShineDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ShineDB` DEFAULT CHARACTER SET utf8 ;
USE `ShineDB` ;

-- -----------------------------------------------------
-- Table `ShineDB`.`Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ShineDB`.`Staff` ;

CREATE TABLE IF NOT EXISTS `ShineDB`.`Staff` (
  `StaffID` VARCHAR(10) NOT NULL,
  `StaffName` VARCHAR(45) NULL,
  `Gender` VARCHAR(5) NULL,
  `DOB` DATE NULL,
  `StaffEmailAddress` VARCHAR(45) NULL,
  `StaffPhoneNo` VARCHAR(10) NULL,
  `Position` VARCHAR(20) NULL,
  `SupervisorStaffID` VARCHAR(10) NULL,
  PRIMARY KEY (`StaffID`),
  INDEX `fk_Staff_Staff1_idx` (`SupervisorStaffID` ASC) VISIBLE,
  CONSTRAINT `fk_Staff_Staff1`
    FOREIGN KEY (`SupervisorStaffID`)
    REFERENCES `ShineDB`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ShineDB`.`FulltimeStaff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ShineDB`.`FulltimeStaff` ;

CREATE TABLE IF NOT EXISTS `ShineDB`.`FulltimeStaff` (
  `StaffID` VARCHAR(10) NOT NULL,
  `OfficeLocation` VARCHAR(45) NULL,
  INDEX `fk_FulltimeStaff_Staff_idx` (`StaffID` ASC) VISIBLE,
  PRIMARY KEY (`StaffID`),
  CONSTRAINT `fk_FulltimeStaff_Staff`
    FOREIGN KEY (`StaffID`)
    REFERENCES `ShineDB`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ShineDB`.`DirAccManager`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ShineDB`.`DirAccManager` ;

CREATE TABLE IF NOT EXISTS `ShineDB`.`DirAccManager` (
  `StaffID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`StaffID`),
  CONSTRAINT `fk_DirAccManager_FulltimeStaff1`
    FOREIGN KEY (`StaffID`)
    REFERENCES `ShineDB`.`FulltimeStaff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ShineDB`.`Client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ShineDB`.`Client` ;

CREATE TABLE IF NOT EXISTS `ShineDB`.`Client` (
  `ClientID` VARCHAR(8) NOT NULL,
  `CompanyName` VARCHAR(45) NULL,
  `CompanyAddress` VARCHAR(45) NULL,
  `ContactPersonName` VARCHAR(45) NULL,
  `ContactPhoneNo` VARCHAR(10) NULL,
  `ContactEmailAddress` VARCHAR(45) NULL,
  `ShineRepresentativeID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ClientID`),
  INDEX `fk_Client_DirAccManager1_idx` (`ShineRepresentativeID` ASC) VISIBLE,
  CONSTRAINT `fk_Client_DirAccManager1`
    FOREIGN KEY (`ShineRepresentativeID`)
    REFERENCES `ShineDB`.`DirAccManager` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ShineDB`.`Campaign`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ShineDB`.`Campaign` ;

CREATE TABLE IF NOT EXISTS `ShineDB`.`Campaign` (
  `CampaignID` VARCHAR(10) NOT NULL,
  `Theme` VARCHAR(45) NULL,
  `Title` VARCHAR(45) NULL,
  `StartDate` DATE NULL,
  `CampaignDescription` VARCHAR(45) NULL,
  `EstimatedCost` DECIMAL(8) NULL,
  `EstimatedCompletionDate` DATE NULL,
  `CostOfConsumable` DECIMAL(8) NULL,
  `ActualCompletionDate` DATE NULL,
  `ClientID` VARCHAR(8) NOT NULL,
  `CampaignManagerStaffID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`CampaignID`),
  INDEX `fk_Campaign_Client1_idx` (`ClientID` ASC) VISIBLE,
  INDEX `fk_Campaign_DirAccManager1_idx` (`CampaignManagerStaffID` ASC) VISIBLE,
  CONSTRAINT `fk_Campaign_Client1`
    FOREIGN KEY (`ClientID`)
    REFERENCES `ShineDB`.`Client` (`ClientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Campaign_DirAccManager1`
    FOREIGN KEY (`CampaignManagerStaffID`)
    REFERENCES `ShineDB`.`DirAccManager` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ShineDB`.`Invoice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ShineDB`.`Invoice` ;

CREATE TABLE IF NOT EXISTS `ShineDB`.`Invoice` (
  `InvoiceNo` VARCHAR(10) NOT NULL,
  `IssueDate` DATE NULL,
  `PaymentStatus` VARCHAR(10) NULL,
  `PaidDate` DATE NULL,
  `CampaignID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`InvoiceNo`),
  INDEX `fk_Invoice_Campaign1_idx` (`CampaignID` ASC) VISIBLE,
  CONSTRAINT `fk_Invoice_Campaign1`
    FOREIGN KEY (`CampaignID`)
    REFERENCES `ShineDB`.`Campaign` (`CampaignID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ShineDB`.`CasualStaff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ShineDB`.`CasualStaff` ;

CREATE TABLE IF NOT EXISTS `ShineDB`.`CasualStaff` (
  `StaffID` VARCHAR(10) NOT NULL,
  `SpecializedSkill` VARCHAR(45) NULL,
  INDEX `fk_CasualStaff_Staff1_idx` (`StaffID` ASC) VISIBLE,
  PRIMARY KEY (`StaffID`),
  CONSTRAINT `fk_CasualStaff_Staff1`
    FOREIGN KEY (`StaffID`)
    REFERENCES `ShineDB`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ShineDB`.`Advert`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ShineDB`.`Advert` ;

CREATE TABLE IF NOT EXISTS `ShineDB`.`Advert` (
  `AdvertID` VARCHAR(10) NOT NULL,
  `AdvertDescription` VARCHAR(45) NULL,
  `AdvertType` VARCHAR(15) NULL,
  `Cost` DECIMAL(8) NULL,
  `CampaignID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`AdvertID`),
  INDEX `fk_Advert_Campaign1_idx` (`CampaignID` ASC) VISIBLE,
  CONSTRAINT `fk_Advert_Campaign1`
    FOREIGN KEY (`CampaignID`)
    REFERENCES `ShineDB`.`Campaign` (`CampaignID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ShineDB`.`Studio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ShineDB`.`Studio` ;

CREATE TABLE IF NOT EXISTS `ShineDB`.`Studio` (
  `StudioID` VARCHAR(5) NOT NULL,
  `StudioName` VARCHAR(45) NULL,
  `StudioPhoneNo` VARCHAR(10) NULL,
  `HourlyBookingPrice` DECIMAL(8) NULL,
  `StudioAddress` VARCHAR(45) NULL,
  PRIMARY KEY (`StudioID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ShineDB`.`Timesheet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ShineDB`.`Timesheet` ;

CREATE TABLE IF NOT EXISTS `ShineDB`.`Timesheet` (
  `TimesheetID` VARCHAR(10) NOT NULL,
  `StartDate` DATE NULL,
  `EndDate` DATE NULL,
  `WorkedHour` INT NULL,
  `Staff_StaffID` VARCHAR(10) NOT NULL,
  `Campaign_CampaignID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`TimesheetID`),
  INDEX `fk_Timesheet_Staff1_idx` (`Staff_StaffID` ASC) VISIBLE,
  INDEX `fk_Timesheet_Campaign1_idx` (`Campaign_CampaignID` ASC) VISIBLE,
  CONSTRAINT `fk_Timesheet_Staff1`
    FOREIGN KEY (`Staff_StaffID`)
    REFERENCES `ShineDB`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Timesheet_Campaign1`
    FOREIGN KEY (`Campaign_CampaignID`)
    REFERENCES `ShineDB`.`Campaign` (`CampaignID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ShineDB`.`SalaryGrade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ShineDB`.`SalaryGrade` ;

CREATE TABLE IF NOT EXISTS `ShineDB`.`SalaryGrade` (
  `SalaryGradeNo` INT NOT NULL,
  `HourlyRate` DECIMAL(8) NULL,
  `AnnualRate` DECIMAL(8) NULL,
  PRIMARY KEY (`SalaryGradeNo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ShineDB`.`Holds`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ShineDB`.`Holds` ;

CREATE TABLE IF NOT EXISTS `ShineDB`.`Holds` (
  `SalaryGradeNo` INT NOT NULL,
  `StaffID` VARCHAR(10) NOT NULL,
  `StartDate` DATE NULL,
  `Status` VARCHAR(10) NULL,
  PRIMARY KEY (`SalaryGradeNo`, `StaffID`),
  INDEX `fk_Staff_has_SalaryGrade_SalaryGrade1_idx` (`SalaryGradeNo` ASC) VISIBLE,
  INDEX `fk_Staff_has_SalaryGrade_Staff1_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `fk_Staff_has_SalaryGrade_Staff1`
    FOREIGN KEY (`StaffID`)
    REFERENCES `ShineDB`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Staff_has_SalaryGrade_SalaryGrade1`
    FOREIGN KEY (`SalaryGradeNo`)
    REFERENCES `ShineDB`.`SalaryGrade` (`SalaryGradeNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ShineDB`.`RequiresBookingAt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ShineDB`.`RequiresBookingAt` ;

CREATE TABLE IF NOT EXISTS `ShineDB`.`RequiresBookingAt` (
  `AdvertID` VARCHAR(10) NOT NULL,
  `StudioID` VARCHAR(5) NOT NULL,
  `DateandTime` DATETIME NULL,
  `Duration` INT NULL,
  INDEX `fk_Advert_has_Studio_Studio1_idx` (`StudioID` ASC) VISIBLE,
  INDEX `fk_Advert_has_Studio_Advert1_idx` (`AdvertID` ASC) VISIBLE,
  PRIMARY KEY (`AdvertID`, `StudioID`),
  CONSTRAINT `fk_Advert_has_Studio_Advert1`
    FOREIGN KEY (`AdvertID`)
    REFERENCES `ShineDB`.`Advert` (`AdvertID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Advert_has_Studio_Studio1`
    FOREIGN KEY (`StudioID`)
    REFERENCES `ShineDB`.`Studio` (`StudioID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ShineDB`.`WorksOn`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ShineDB`.`WorksOn` ;

CREATE TABLE IF NOT EXISTS `ShineDB`.`WorksOn` (
  `StaffID` VARCHAR(10) NOT NULL,
  `CampaignID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`StaffID`, `CampaignID`),
  INDEX `fk_Campaign_has_Staff_Staff1_idx` (`StaffID` ASC) VISIBLE,
  INDEX `fk_Campaign_has_Staff_Campaign1_idx` (`CampaignID` ASC) VISIBLE,
  CONSTRAINT `fk_Campaign_has_Staff_Campaign1`
    FOREIGN KEY (`CampaignID`)
    REFERENCES `ShineDB`.`Campaign` (`CampaignID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Campaign_has_Staff_Staff1`
    FOREIGN KEY (`StaffID`)
    REFERENCES `ShineDB`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
