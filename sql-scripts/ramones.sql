USE rockStarDay2;

CREATE TABLE rockStarDay2.ramones (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deceasedDate` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB;


INSERT INTO rockStarDay2.ramones
(lastName,
firstName,
birthDate,
deceasedDate)
VALUES
('Ramone','Joey','1951-05-19','2001-04-15')
, ('Burke','Clem','1955-11-24',NULL)
, ('Ramone','Johnny','1948-10-08','2004-09-15')
, ('Ramone','Dee Dee','1951-09-18',NULL);
