DROP SCHEMA IF EXISTS actor;

CREATE DATABASE actor;
USE actor;

CREATE TABLE individual (
ID INT(10) UNSIGNED NOT NULL auto_increment PRIMARY KEY
, firstName VARCHAR(50) NOT NULL
, lastName VARCHAR(50) NOT NULL
, birthDate DATE NOT NULL
, deathDate DATE DEFAULT NULL
, birthPlace VARCHAR(75) NOT NULL
);

CREATE TABLE movie (
ID INT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
, name VARCHAR(50) NOT NULL
, productionCompany VARCHAR(50) NOT NULL
, genre VARCHAR(50) NOT NULL
, criticScore decimal(4,2) UNSIGNED NOT NULL
, audienceScore decimal(4,2) UNSIGNED NOT NULL
, runningTIME VARCHAR(20) NOT NULL
, budget INT UNSIGNED NOT NULL
, boxOffice INT UNSIGNED NOT NULL
, releaseDateUS DATE NOT NULL
);

CREATE TABLE `role` (
  `ID` int(10) unsigned NOT NULL,
  `actorID` int(10) unsigned NOT NULL,
  `movieID` int(10) unsigned NOT NULL,
  `roleName` varchar(50) NOT NULL,
  `pay` int(10) unsigned NOT NULL,
  `isHero/ine` tinyint(3) unsigned DEFAULT '0',
  `isVillain` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `FK_role_individual_idx` (`actorID`),
  KEY `FK_role_movie_idx` (`movieID`),
  CONSTRAINT `FK_role_individual` FOREIGN KEY (`actorID`) REFERENCES `individual` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_role_movie` FOREIGN KEY (`movieID`) REFERENCES `movie` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
