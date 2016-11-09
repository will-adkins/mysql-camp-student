USE RockStarDay2;

CREATE TABLE RockStarDay2.Ramones (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `LastName` varchar(50) NOT NULL,
  `FirstName` varchar(25) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DeceasedDate` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB;



INSERT INTO RockStarDay2.Ramones
(LastName,
FirstName,
BirthDate,
DeceasedDate)
VALUES
('Ramone','Joey','1951-05-19','2001-04-15')
, ('Burke','Clem','1955-11-24',NULL)
, ('Ramone','Johnny','1948-10-08','2004-09-15')
, ('Ramone','Dee Dee','1951-09-18',NULL);
