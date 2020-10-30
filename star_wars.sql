SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `star_wars` ;
USE `star_wars` ;

-- -----------------------------------------------------
-- Table `star_wars`.`e_fraction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `star_wars`.`e_fraction` (
  `fraction_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`fraction_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `star_wars`.`e_species`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `star_wars`.`e_species` (
  `species_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`species_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `star_wars`.`e_professions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `star_wars`.`e_professions` (
  `profession` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`profession`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `star_wars`.`characters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `star_wars`.`characters` (
  `character_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `fraction_name` VARCHAR(50) NOT NULL,
  `species_name` VARCHAR(50) NOT NULL,
  `profession` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`character_id`, `fraction_name`, `species_name`, `profession`),
  INDEX `fk_characters_e_fraction_idx` (`fraction_name` ASC) VISIBLE,
  INDEX `fk_characters_e_species1_idx` (`species_name` ASC) VISIBLE,
  INDEX `fk_characters_e_professions1_idx` (`profession` ASC) VISIBLE,
  CONSTRAINT `fk_characters_e_fraction`
    FOREIGN KEY (`fraction_name`)
    REFERENCES `star_wars`.`e_fraction` (`fraction_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_characters_e_species1`
    FOREIGN KEY (`species_name`)
    REFERENCES `star_wars`.`e_species` (`species_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_characters_e_professions1`
    FOREIGN KEY (`profession`)
    REFERENCES `star_wars`.`e_professions` (`profession`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `star_wars`.`weapons_bt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `star_wars`.`weapons_bt` (
  `weapon_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`weapon_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `star_wars`.`e_lightsaber_color`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `star_wars`.`e_lightsaber_color` (
  `color` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`color`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `star_wars`.`lightsabers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `star_wars`.`lightsabers` (
  `weapon_id` INT NOT NULL,
  `color` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`weapon_id`, `color`),
  INDEX `fk_lightsabers_e_lightsaber_color1_idx` (`color` ASC) VISIBLE,
  CONSTRAINT `fk_lightsaber_weapons_bt1`
    FOREIGN KEY (`weapon_id`)
    REFERENCES `star_wars`.`weapons_bt` (`weapon_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lightsabers_e_lightsaber_color1`
    FOREIGN KEY (`color`)
    REFERENCES `star_wars`.`e_lightsaber_color` (`color`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `star_wars`.`e_blaster_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `star_wars`.`e_blaster_type` (
  `type` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`type`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `star_wars`.`blasters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `star_wars`.`blasters` (
  `weapon_id` INT NOT NULL,
  `mag_size` INT NOT NULL,
  `type` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`weapon_id`, `type`),
  INDEX `fk_blasters_e_blaster_type1_idx` (`type` ASC) VISIBLE,
  CONSTRAINT `fk_blasters_weapons_bt1`
    FOREIGN KEY (`weapon_id`)
    REFERENCES `star_wars`.`weapons_bt` (`weapon_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_blasters_e_blaster_type1`
    FOREIGN KEY (`type`)
    REFERENCES `star_wars`.`e_blaster_type` (`type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `star_wars`.`weapons_bt_has_characters_jt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `star_wars`.`weapons_bt_has_characters_jt` (
  `weapons_bt_weapon_id` INT NOT NULL,
  `characters_character_id` INT NOT NULL,
  `characters_fraction_name` VARCHAR(50) NOT NULL,
  `characters_species_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`weapons_bt_weapon_id`, `characters_character_id`, `characters_fraction_name`, `characters_species_name`),
  INDEX `fk_weapons_bt_has_characters_characters1_idx` (`characters_character_id` ASC, `characters_fraction_name` ASC, `characters_species_name` ASC) VISIBLE,
  INDEX `fk_weapons_bt_has_characters_weapons_bt1_idx` (`weapons_bt_weapon_id` ASC) VISIBLE,
  CONSTRAINT `fk_weapons_bt_has_characters_weapons_bt1`
    FOREIGN KEY (`weapons_bt_weapon_id`)
    REFERENCES `star_wars`.`weapons_bt` (`weapon_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_weapons_bt_has_characters_characters1`
    FOREIGN KEY (`characters_character_id` , `characters_fraction_name` , `characters_species_name`)
    REFERENCES `star_wars`.`characters` (`character_id` , `fraction_name` , `species_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `star_wars`.`kills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `star_wars`.`kills` (
  `killer_character_id` INT NOT NULL,
  `victim_character_id` INT NOT NULL,
  PRIMARY KEY (`killer_character_id`, `victim_character_id`),
  INDEX `fk_characters_has_characters_characters2_idx` (`victim_character_id` ASC) VISIBLE,
  INDEX `fk_characters_has_characters_characters1_idx` (`killer_character_id` ASC) VISIBLE,
  CONSTRAINT `fk_characters_has_characters_characters1`
    FOREIGN KEY (`killer_character_id`)
    REFERENCES `star_wars`.`characters` (`character_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_characters_has_characters_characters2`
    FOREIGN KEY (`victim_character_id`)
    REFERENCES `star_wars`.`characters` (`character_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `star_wars`.`e_droid_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `star_wars`.`e_droid_type` (
  `type` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`type`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `star_wars`.`droids`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `star_wars`.`droids` (
  `droid_id` INT NOT NULL AUTO_INCREMENT,
  `droid_name` VARCHAR(45) NOT NULL,
  `type` VARCHAR(25) NOT NULL,
  `profession` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`droid_id`, `type`, `profession`),
  INDEX `fk_droids_e_droid_type1_idx` (`type` ASC) VISIBLE,
  INDEX `fk_droids_e_professions1_idx` (`profession` ASC) VISIBLE,
  CONSTRAINT `fk_droids_e_droid_type1`
    FOREIGN KEY (`type`)
    REFERENCES `star_wars`.`e_droid_type` (`type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_droids_e_professions1`
    FOREIGN KEY (`profession`)
    REFERENCES `star_wars`.`e_professions` (`profession`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `star_wars`.`weapons_bt_has_droids_jt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `star_wars`.`weapons_bt_has_droids_jt` (
  `weapons_bt_weapon_id` INT NOT NULL,
  `droids_droid_id` INT NOT NULL,
  `droids_type` VARCHAR(25) NOT NULL,
  `droids_profession` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`weapons_bt_weapon_id`, `droids_droid_id`, `droids_type`, `droids_profession`),
  INDEX `fk_weapons_bt_has_droids_droids1_idx` (`droids_droid_id` ASC, `droids_type` ASC, `droids_profession` ASC) VISIBLE,
  INDEX `fk_weapons_bt_has_droids_weapons_bt1_idx` (`weapons_bt_weapon_id` ASC) VISIBLE,
  CONSTRAINT `fk_weapons_bt_has_droids_weapons_bt1`
    FOREIGN KEY (`weapons_bt_weapon_id`)
    REFERENCES `star_wars`.`weapons_bt` (`weapon_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_weapons_bt_has_droids_droids1`
    FOREIGN KEY (`droids_droid_id` , `droids_type` , `droids_profession`)
    REFERENCES `star_wars`.`droids` (`droid_id` , `type` , `profession`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `star_wars`.`aliases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `star_wars`.`aliases` (
  `characters_character_id` INT NOT NULL,
  `characters_fraction_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`characters_character_id`, `characters_fraction_name`),
  CONSTRAINT `fk_aliases_characters1`
    FOREIGN KEY (`characters_character_id` , `characters_fraction_name`)
    REFERENCES `star_wars`.`characters` (`character_id` , `fraction_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `star_wars`.`e_rank`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `star_wars`.`e_rank` (
  `rank` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`rank`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `star_wars`.`clones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `star_wars`.`clones` (
  `character_id` INT NOT NULL,
  `code` VARCHAR(45) NOT NULL,
  `rank` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`character_id`, `rank`),
  INDEX `fk_clones_e_rank1_idx` (`rank` ASC) VISIBLE,
  CONSTRAINT `fk_clones_characters1`
    FOREIGN KEY (`character_id`)
    REFERENCES `star_wars`.`characters` (`character_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clones_e_rank1`
    FOREIGN KEY (`rank`)
    REFERENCES `star_wars`.`e_rank` (`rank`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
