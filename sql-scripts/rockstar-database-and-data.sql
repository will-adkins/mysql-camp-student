/*
use in sql-intro portion of course.

*/

DROP SCHEMA IF EXISTS rockStarDay2;

CREATE DATABASE rockStarDay2;

USE rockStarDay2;

CREATE TABLE rockStarDay2.individual (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deceasedDate` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB;


INSERT INTO rockStarDay2.individual
(lastName,
firstName,
birthDate,
deceasedDate)
VALUES
('Jagger','Mick','1943-07-26',NULL)
, ('Zimmerman','Robert','1942-05-25',NULL)
, ('Cobain','Kurt','1967-02-20',NULL)
, ('Harrison','George','1943-02-25',NULL)
, ('Buck','Peter','1956-12-06',NULL)
, ('Young','Neil','1945-11-12',NULL)
, ('Helm','Levon','1940-05-26','2012-04-19')
, ('Cash','Johnny','1932-02-26','2012-09-12')
, ('Presley','Elvis','1935-01-08','1977-08-16')
, ('Plant','Robert','1948-08-20',NULL)
, ('Townsend','Pete','1945-05-19',NULL)
, ('Hendrix','Jimi','1942-11-27','1970-09-18')
, ('Baker','Ginger','1939-08-13',NULL)
, ('Rotten','Johnny','1956-01-31',NULL)
, ('Strummer','Joe','1952-08-21','2002-12-22')
, ('Francis','Black','1965-05-06',NULL)
, ('Deal','Kim','1961-06-10','2012-04-19')
, ('Mills','Mike','1958-12-17',NULL)
, ('Bell','John','1962-04-14',NULL)
, ('Houser','Michael','1962-01-06','2002-08-10')
, ('JoJo','Hermann',NULL,NULL)
, ('Schools','David','1964-12-11',NULL)
, ('Perry','Steve','1949-01-22',NULL)
, ('Schon','Neal','1954-02-27',NULL)
, ('Clinton','George','1941-07-22',NULL)
, ('Collins','Bootsy','1951-10-26',NULL)
, ('Elliot','Joe','1959-08-01',NULL)
, ('Allen','Rick',NULL,NULL)
, ('Clark','Steve','1960-04-23','1991-01-08')
, ('Bruce','Jack','1943-05-14',NULL)
, ('Clapton','Eric','1945-03-30',NULL)
, ('Jones','George','1931-08-12',NULL)
, ('Brooks','Garth','1962-02-07',NULL)
, ('Jackson','Alan','1958-10-17',NULL)
, ('Kraus','Allison','1971-07-23',NULL)
, ('Black','Clint','1962-02-04',NULL)
, ('Haggard','Merle','1937-04-06',NULL)
, ('Williams','Hank','1923-09-17','1953-01-01')
, ('Jennings','Waylon','1937-06-15','2002-02-13')
, ('Lynn','Loretta','1932-04-14',NULL)
, ('Nelson','Willie','1933-04-30',NULL)
, ('Cline','Patsy','1932-09-08','1963-03-05')
, ('Kristofferson','Kris','1936-06-22',NULL)
, ('Campbell','Glen','1936-04-22',NULL)
, ('Seger','Bob','1945-05-06',NULL)
, ('Nugent','Ted','1948-12-13',NULL)
, ('Owens','Buck','1929-08-12','2006-03-25')
, ('Nelson','Willie','1933-04-30',NULL)
;

CREATE TABLE band (
  ID int(10) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(40) DEFAULT NULL,
  yearFormed year(4) NOT NULL,
  isTogether tinyint(1) NOT NULL DEFAULT '1',
  henre ENUM('Rock','Alternative','Country','Funk', 'Grunge', 'Bluegrass'),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB;

INSERT INTO band
(
name,
yearFormed,
isTogether,
genre
)
VALUES
('Rolling Stones', '1962', 1, 'Rock')
, ('Beatles', '1960', 0, 'Rock')
, ('Traveling Wilburys', '1988', 0, 'Rock')
, ('Nirvana', '1987', 0, 'Grunge')
, ('REM', '1980', 0, 'Alternative')
, ('Crazy Horse', '1960', 0, 'Rock')
, ('Pixies', '1960', 1, 'Alternative')
, ('Widespread Panic', '1960', 1, 'Rock')
, ('Jouney', '1960', 1, 'Rock')
, ('P Funk AllStars', '1960', 0, 'Funk')
, ('Def Leppard', '1960', 1, 'Rock')
, ('Cream', '1960', 0, 'Rock')
, ('George Jones', '1960', 0, 'Country')
, ('Garth Brooks', '1960', 0, 'Country')
, ('Alison Kraus and Union Station', '1984', 1, 'Bluegrass')
, ('Alan Jackson', '1989', 1, 'Country')
, ('Clint Black', '1983', 1, 'Country')
, ('Merle Haggard', '1960', 0, 'Country')
, ('Hank Williams', '1939', 0, 'Country')
, ('Waylon Jennings', '1958', 0, 'Country')
, ('The Highwaymen', '1985', 0, 'Country')
, ('The Buckeroos', '1963', 0, 'Country')
, ('The Band', '1964', 0, 'Country')
;

CREATE TABLE individualBand (
  ID int(10) unsigned NOT NULL AUTO_INCREMENT,
  bandID int(10) unsigned NOT NULL,
  individualID int(10) unsigned NOT NULL,
  PRIMARY KEY (ID),
  KEY bandID_IDX (BandID),
  KEY individualID_IDX (IndividualID),
  CONSTRAINT individualBand_ibfk_1 FOREIGN KEY (bandID) REFERENCES band (ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT individualBand_ibfk_2 FOREIGN KEY (individualID) REFERENCES individual (ID) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;


INSERT INTO individualBand
(
bandID,
individualID)
VALUES
( 1,1 )
, ( 3,4 )
, ( 3,2 )
, ( 4,3 )
, ( 5,5 )
, ( 6,6 )
, ( 7,16 )
, (23 ,7 )
, ( 8,19 )
, ( 8,20 )
, ( 8,21 )
, ( 8,22 )
, ( 7,17 )
, ( 9,23 )
, ( 9,24 )
;

CREATE VIEW bandMembers
AS
select B.Genre AS Genre
,B.Name AS Name
,I.LastName AS LastName
,I.FirstName AS FirstName
,I.BirthDate AS BirthDate
from band B
join individualBand IB on B.ID = IB.bandID
join individual I on I.ID = IB.individualID;
