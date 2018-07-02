DROP SCHEMA IF EXISTS actorWill;

CREATE DATABASE actorWill;
USE actorWill;

CREATE TABLE `individual` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'F',
  `birthDate` date NOT NULL,
  `deathDate` date DEFAULT NULL,
  `birthPlace` varchar(75) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;


CREATE TABLE `movie` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `productionCompany` varchar(50) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `criticScore` tinyint(3) unsigned NOT NULL,
  `audienceScore` tinyint(3) unsigned NOT NULL,
  `runTime` varchar(20) NOT NULL,
  `budget` int(10) unsigned NOT NULL,
  `boxOffice` int(10) unsigned NOT NULL,
  `releaseDateUS` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `role` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `actorID` int(10) unsigned NOT NULL,
  `movieID` int(10) unsigned NOT NULL,
  `roleName` varchar(50) NOT NULL,
  `isHero/ine` tinyint(3) unsigned DEFAULT '0',
  `isVillain` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `FK_role_individual_idx` (`actorID`),
  KEY `FK_role_movie_idx` (`movieID`),
  CONSTRAINT `FK_role_individual` FOREIGN KEY (`actorID`) REFERENCES `individual` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_role_movie` FOREIGN KEY (`movieID`) REFERENCES `movie` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `movie` (`ID`, `name`, `productionCompany`, `genre`, `criticScore`, `audienceScore`, `runTime`, `budget`, `boxOffice`, `releaseDateUS`)
VALUES
	(1, 'Avatar', 'Dune Entertainment', 'Fantasy', 83, 82, '161', 237000000, 2788000000, '2009-12-18'),
	(2, 'Titanic (1997)', 'Paramount Pictures', 'Drama', 88, 69, '195', 200000000, 2187000000, '1997-12-19'),
	(3, 'Star Wars: The Force Awakens', 'Lucasfilm Ltd.', 'Action', 93, 87, '135', 306000000, 2068000000, '2015-12-18'),
	(4, 'Avengers: Infinity War', 'Marvel Studios', 'Action', 83, 91, '149', 400000000, 2032000000, '2018-04-27'),
	(5, 'Jurassic World', 'Amblin Entertainment', 'Action', 71, 78, '124', 150000000, 1672000000, '2015-06-12'),
	(6, 'Marvel\'s The Avengers', 'Marvel Studios', 'Action', 92, 91, '143', 220000000, 1519000000, '2012-05-04');


INSERT INTO `individual` (`ID`, `firstName`, `lastName`, `gender`, `birthDate`, `deathDate`, `birthPlace`)
VALUES
	(1, 'Sam', 'Worthington', 'M', '1976-08-02', NULL, 'Godalming, Surrey, England'),
	(2, 'Zoe', 'Saldana', 'F', '1978-06-19', NULL, 'Passaic, New Jersey, U.S.'),
	(3, 'Stephen', 'Lang', 'M', '1952-07-11', NULL, 'New York City, New York, U.S.'),
	(4, 'Leonardo', 'DiCaprio', 'M', '1974-11-11', NULL, 'Los Angeles, California, U.S.'),
	(5, 'Kate', 'Winslet', 'F', '1975-10-05', NULL, 'Reading, Berkshire, England'),
	(6, 'Billy', 'Zane', 'M', '1966-02-24', NULL, 'Chicago, Illinois, U.S.'),
	(7, 'Harrison', 'Ford', 'M', '1942-07-13', NULL, 'Chicago, Illinois, U.S.'),
	(8, 'Carrie', 'Fisher', 'F', '1956-10-21', '2016-12-27', 'Burbank, California, U.S.'),
	(9, 'Adam', 'Driver', 'M', '1983-11-19', NULL, 'San Diego, California, U.S.'),
	(10, 'Daisy', 'Ridley', 'F', '1992-04-10', NULL, 'Westminster, London, England'),
	(11, 'John', 'Boyega', 'M', '1992-03-17', NULL, 'London, England'),
	(12, 'Robert', 'Downey Jr.', 'M', '1965-04-04', NULL, 'New York City, New York, U.S.'),
	(13, 'Chris', 'Hemsworth', 'M', '1983-08-11', NULL, 'Melbourne, Victoria, Australia'),
	(14, 'Mark', 'Ruffalo', 'M', '1967-11-22', NULL, 'New York City, New York, U.S.'),
	(15, 'Chris', 'Evans', 'M', '1981-06-13', NULL, 'Boston, Massachusetts, U.S.'),
	(16, 'Josh', 'Brolin', 'M', '1968-02-12', NULL, 'Santa Monica, California, U.S.'),
	(17, 'Scarlett', 'Johansson', 'F', '1984-11-22', NULL, 'New York City, New York, U.S.'),
	(18, 'Chris', 'Pratt', 'M', '1979-06-21', NULL, 'Virginia, Minnesota, U.S.'),
	(19, 'Bryce', 'Howard', 'F', '1981-03-02', NULL, 'Dallas, Texas, U.S.');


INSERT INTO `role` (`ID`, `actorID`, `movieID`, `roleName`, `isHero/ine`, `isVillain`)
VALUES
	(1, 1, 1, 'Jake Sully', 1, 0),
	(2, 2, 1, 'Neytiri', 1, 0),
	(3, 3, 1, 'Cln. Miles Quatritch', 0, 1),
	(4, 4, 2, 'Jack Dawson', 1, 0),
	(5, 5, 2, 'Rose Dewitt Bukater', 1, 0),
	(6, 6, 2, 'Cal Hockley', 0, 0),
	(7, 7, 3, 'Han Solo', 1, 0),
	(8, 8, 3, 'Princess Leia', 1, 0),
	(9, 9, 3, 'Kylo Ren', 0, 1),
	(10, 10, 3, 'Rey', 1, 0),
	(11, 11, 3, 'Finn', 1, 0),
	(12, 12, 4, 'Tony Stark / Iron Man', 1, 0),
	(13, 13, 4, 'Thor', 1, 0),
	(14, 14, 4, 'Bruce Banner / Hulk', 1, 0),
	(15, 15, 4, 'Steve Rogers / Cpt. America', 1, 0),
	(16, 16, 4, 'Thanos', 0, 1),
	(17, 17, 4, 'Natasha Romanoff / Black Widow', 1, 0),
	(18, 18, 4, 'Star-Lord / Peter Quill', 1, 0),
	(19, 18, 5, 'Owen', 1, 0),
	(20, 19, 5, 'Claire', 1, 0);


