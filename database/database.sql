-- MySQL Script generated by MySQL Workbench
-- Tue Sep 14 11:12:02 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE =
        'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema teambuilder
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `teambuilder`;

-- -----------------------------------------------------
-- Schema teambuilder
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `teambuilder` DEFAULT CHARACTER SET utf8mb3;
USE `teambuilder`;

-- -----------------------------------------------------
-- Table `teambuilder`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teambuilder`.`roles`;

CREATE TABLE IF NOT EXISTS `teambuilder`.`roles`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `slug` VARCHAR(10) NOT NULL,
    `name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
    UNIQUE INDEX `slug_UNIQUE` (`slug` ASC) VISIBLE
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `teambuilder`.`members`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teambuilder`.`members`;

CREATE TABLE IF NOT EXISTS `teambuilder`.`members`
(
    `id`       INT          NOT NULL AUTO_INCREMENT,
    `name`     VARCHAR(45)  NOT NULL,
    `password` VARCHAR(500) NOT NULL,
    `role_id`  INT          NOT NULL,
    `status_id`  INT          NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
    INDEX `fk_members_roles_idx` (`role_id` ASC) VISIBLE,
    CONSTRAINT `fk_members_roles`
        FOREIGN KEY (`role_id`)
            REFERENCES `teambuilder`.`roles` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
        FOREIGN KEY (`status_id`)
            REFERENCES `teambuilder`.`status` (`id`)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `teambuilder`.`states`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teambuilder`.`states`;

CREATE TABLE IF NOT EXISTS `teambuilder`.`states`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `slug` VARCHAR(10) NOT NULL,
    `name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
    UNIQUE INDEX `slug_UNIQUE` (`slug` ASC) VISIBLE
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `teambuilder`.`teams`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teambuilder`.`teams`;

CREATE TABLE IF NOT EXISTS `teambuilder`.`teams`
(
    `id`       INT         NOT NULL AUTO_INCREMENT,
    `name`     VARCHAR(45) NOT NULL,
    `state_id` INT         NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
    INDEX `fk_teams_states1_idx` (`state_id` ASC) VISIBLE,
    CONSTRAINT `fk_teams_states1`
        FOREIGN KEY (`state_id`)
            REFERENCES `teambuilder`.`states` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `teambuilder`.`team_member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teambuilder`.`team_member`;

CREATE TABLE IF NOT EXISTS `teambuilder`.`team_member`
(
    `id`              INT     NOT NULL AUTO_INCREMENT,
    `member_id`       INT     NOT NULL,
    `team_id`         INT     NOT NULL,
    `membership_type` TINYINT NOT NULL COMMENT '0 = inactive\n1 = active\n2 = invitation\n3 = request',
    `is_captain`      TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `unique_membership` (`member_id` ASC, `team_id` ASC) VISIBLE,
    INDEX `fk_team_member_members1_idx` (`member_id` ASC) VISIBLE,
    INDEX `fk_team_member_teams1_idx` (`team_id` ASC) VISIBLE,
    CONSTRAINT `fk_team_member_members1`
        FOREIGN KEY (`member_id`)
            REFERENCES `teambuilder`.`members` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_team_member_teams1`
        FOREIGN KEY (`team_id`)
            REFERENCES `teambuilder`.`teams` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb3;

    -- -----------------------------------------------------
-- Table `teambuilder`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teambuilder`.`status`;

CREATE TABLE IF NOT EXISTS `teambuilder`.`status`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `slug` VARCHAR(10) NOT NULL,
    `name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
    UNIQUE INDEX `slug_UNIQUE` (`slug` ASC) VISIBLE
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb3;



SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;
-- -----------------------------------------------------
-- Table `roles` - Data
-- -----------------------------------------------------
INSERT INTO roles(roles.slug, roles.name)
VALUES ("MEM", "Member"),
       ("MOD", "Moderator");

-- -----------------------------------------------------
-- Table `states` - Data
-- -----------------------------------------------------
INSERT INTO `states` (`id`, `slug`, `name`)
VALUES (1, 'WAIT_CHANG', 'Attente de chagement'),
       (2, 'WAIT_VAL', 'Attente de validation'),
       (3, 'VALIDATED', 'Validé'),
       (4, 'COMMITTED', 'Engagée'),
       (5, 'RECRUTING', 'Recrutement');

-- -----------------------------------------------------
-- Table `teams` - Data
-- -----------------------------------------------------

INSERT INTO teambuilder.teams (name, state_id)
VALUES ("Suicide Squad", 1),
       ("Les Fâchés", 1),
       ("Les Semi-Croustillants", 1),
       ("Les Pécors", 1),
       ("Les Bouffons de Défi", 1),
       ("Les Mugiwaras", 1),
       ("La DreamTeam", 1),
       ("Les StormTrooper", 1),
       ("Les PoufSoufle", 1),
       ("Les X-Files", 1),
       ("Les Demi-Dieux", 1),
       ("Les Squeezos", 1),
       ("Les Chevaliers du Zodiaque", 1),
       ("No Name", 1),
       ("Black Lagoon", 1);

-- -----------------------------------------------------
-- Table `members` - Data
-- -----------------------------------------------------

insert into teambuilder.members (name, password, role_id,status_id)
values ('Anthony', 'Anthony''s_Pa$$w0rd', 1,1),
       ('Armand', 'Armand''s_Pa$$w0rd', 1,1),
       ('Cyril', 'Cyril''s_Pa$$w0rd', 1,1),
       ('Filipe', 'Filipe''s_Pa$$w0rd', 1,1),
       ('Helene', 'Helene''s_Pa$$w0rd', 1,1),
       ('Mario', 'Mario''s_Pa$$w0rd', 1,1),
       ('Mathieu', 'Mathieu''s_Pa$$w0rd', 1,1),
       ('Mauro', 'Mauro''s_Pa$$w0rd', 1,1),
       ('Melodie', 'Melodie''s_Pa$$w0rd', 1,1),
       ('Noah', 'Noah''s_Pa$$w0rd', 1,1),
       ('Robiel', 'Robiel''s_Pa$$w0rd', 1,1),
       ('Sou', 'Sou''s_Pa$$w0rd', 1,1),
       ('Theo', 'Theo''s_Pa$$w0rd', 1,1),
       ('Yannick', 'Yannick''s_Pa$$w0rd', 1,1),
       ('Xavier', 'Xavier''s_Pa$$w0rd', 2,1),
       ('Pascal', 'Pascal''s_Pa$$w0rd', 2,1),
       ('Nicolas', 'Nicolas''s_Pa$$w0rd', 2,1),
       ('Lèi', 'Lèi''s_Pa$$w0rd', 1,1),
       ('Marie-josée', 'Marie-josée''s_Pa$$w0rd', 1,1),
       ('Håkan', 'Håkan''s_Pa$$w0rd', 1,1),
       ('Cécile', 'Cécile''s_Pa$$w0rd', 1,1),
       ('Dà', 'Dà''s_Pa$$w0rd', 1,2),
       ('Néhémie', 'Néhémie''s_Pa$$w0rd', 1,2),
       ('Sòng', 'Sòng''s_Pa$$w0rd', 1,2),
       ('Audréanne', 'Audréanne''s_Pa$$w0rd', 1,2),
       ('Lucrèce', 'Lucrèce''s_Pa$$w0rd', 2,2),
       ('Göran', 'Göran''s_Pa$$w0rd', 1,2),
       ('Hélèna', 'Hélèna''s_Pa$$w0rd', 1,2),
       ('Åslög', 'Åslög''s_Pa$$w0rd', 1,2),
       ('Inès', 'Inès''s_Pa$$w0rd', 1,2),
       ('Agnès', 'Agnès''s_Pa$$w0rd', 1,2),
       ('Táng', 'Táng''s_Pa$$w0rd', 1,2),
       ('Yáo', 'Yáo''s_Pa$$w0rd', 1,2),
       ('Marlène', 'Marlène''s_Pa$$w0rd', 1,3),
       ('Eléa', 'Eléa''s_Pa$$w0rd', 1,3),
       ('Thérèse', 'Thérèse''s_Pa$$w0rd', 1,3),
       ('Pélagie', 'Pélagie''s_Pa$$w0rd', 1,3),
       ('Clélia', 'Clélia''s_Pa$$w0rd', 2,3),
       ('Anaé', 'Anaé''s_Pa$$w0rd', 1,3),
       ('Marie-noël', 'Marie-noël''s_Pa$$w0rd', 1,3),
       ('Andréanne', 'Andréanne''s_Pa$$w0rd', 1,3),
       ('Gérald', 'Gérald''s_Pa$$w0rd', 1,3),
       ('Bérénice', 'Bérénice''s_Pa$$w0rd', 1,3),
       ('Anaël', 'Anaël''s_Pa$$w0rd', 1,3),
       ('Mélissandre', 'Mélissandre''s_Pa$$w0rd', 1,3),
       ('Marie-hélène', 'Marie-hélène''s_Pa$$w0rd', 1,3),
       ('Desirée', 'Desirée''s_Pa$$w0rd', 1,3),
       ('Zhì', 'Zhì''s_Pa$$w0rd', 1,3),
       ('Lén', 'Lén''s_Pa$$w0rd', 1,3),
       ('Cinéma', 'Cinéma''s_Pa$$w0rd', 1,3),
       ('Marylène', 'Marylène''s_Pa$$w0rd', 1,3);

-- -----------------------------------------------------
-- Table `teambuilder` - Data
-- -----------------------------------------------------

INSERT INTO `teambuilder`.`team_member` (`member_id`, `team_id`, `membership_type`, `is_captain`)
VALUES ('27', '1', '1', '1'),
       ('2', '1', '2', '0'),
       ('22', '1', '1', '0'),
       ('4', '1', '1', '0'),
       ('1', '2', '1', '1'),
       ('20', '2', '3', '0'),
       ('37', '2', '1', '0'),
       ('31', '3', '1', '1'),
       ('2', '3', '2', '0'),
       ('3', '3', '2', '0'),
       ('32', '3', '1', '0'),
       ('5', '3', '1', '0'),
       ('6', '3', '2', '0'),
       ('4', '4', '1', '1'),
       ('33', '4', '1', '0'),
       ('20', '4', '3', '0'),
       ('7', '4', '3', '0'),
       ('5', '5', '1', '1'),
       ('6', '5', '1', '0'),
       ('7', '5', '2', '0'),
       ('28', '6', '1', '1'),
       ('36', '6', '1', '0'),
       ('34', '6', '2', '0'),
       ('10', '6', '1', '0'),
       ('21', '7', '1', '1'),
       ('38', '7', '3', '0'),
       ('10', '7', '1', '0'),
       ('8', '8', '1', '1'),
       ('25', '8', '3', '0'),
       ('10', '8', '1', '0'),
       ('11', '8', '2', '0'),
       ('12', '8', '1', '0'),
       ('13', '8', '1', '0'),
       ('39', '9', '1', '1'),
       ('12', '9', '1', '0'),
       ('13', '9', '0', '0'),
       ('21', '9', '1', '0'),
       ('40', '10', '1', '1'),
       ('14', '11', '1', '1'),
       ('14', '12', '1', '1'),
       ('35', '13', '1', '1'),
       ('18', '14', '1', '1'),
       ('19', '15', '1', '1');
INSERT INTO `teambuilder`.`team_member` (`member_id`, `team_id`, `membership_type`)
VALUES ('25', '10', '0'),
       ('13', '10', '1'),
       ('15', '11', '1'),
       ('16', '11', '2'),
       ('29', '11', '3'),
       ('15', '12', '1'),
       ('16', '12', '0'),
       ('26', '12', '1'),
       ('18', '12', '2'),
       ('16', '13', '1'),
       ('17', '13', '3'),
       ('23', '13', '1'),
       ('19', '13', '2'),
       ('20', '13', '1'),
       ('27', '14', '0'),
       ('30', '14', '1'),
       ('20', '15', '2'),
       ('21', '15', '1'),
       ('24', '15', '3');


