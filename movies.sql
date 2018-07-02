DROP DATABASE  IF EXISTS `movies`;

CREATE DATABASE `movies`; 
USE movies;


CREATE TABLE `actor` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `lastName` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `birthPlaceCity` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `gender` enum('M','F') COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

INSERT INTO `actor` (`ID`, `lastName`, `firstName`, `birthPlaceCity`, `gender`)
VALUES
	(1, 'Nicholson', 'Jack', 'Atlantic City', 'M'),
	(2, 'Hamm', 'John', 'St. Louis', 'M'),
	(3, 'Del Toro', 'Benicio', 'San Germán', 'M'),
	(4, 'Oldman', 'Gary', 'London', 'M'),
	(5, 'Lewis', 'Daniel Day', 'London', 'M'),
	(6, 'Winger', 'Debra', 'Cleveland', 'F'),
	(7, 'Spacek', 'Sissy', 'Quitman', 'F'),
	(8, 'Spacey', 'Kevin', 'Nuptune, NJ', 'M'),
	(9, 'Freeman', 'Morgan', 'Memphis', 'M'),
	(10, 'Hackman', 'Gene', 'San Bernardino', 'M'),
	(11, 'Freeman', 'Morgan', 'Memphis', 'M'),
	(12, 'Damon', 'Matt', 'Cambridge', 'M'),
	(13, 'Wahlberg', 'Mark', ' Dorchester', 'M'),
	(14, 'DiCaprio', 'Leonardo', ' Los Angeles', 'M'),
	(15, 'Hanks', 'Tom', 'Concord', 'M'),
	(16, 'Shelley', 'Duvall', 'Houston', 'F'),
	(17, 'Field', 'Sally', 'Pasadena', 'F'),
	(18, 'Murray', 'Bill', 'Chicago', 'M'),
	(19, 'Schwartzman', 'Jason', 'Los Angeles', 'M'),
	(20, 'Jones', 'Tommy Lee', 'San Saba', 'M'),
	(21, 'Hardy', 'Tom', 'Hammersmith', 'M'),
	(22, 'Baldwin', 'Stephen', 'Massapequa', 'M'),
	(23, 'Byrne', 'Gabriel', 'Dublin', 'M'),
	(24, 'Duvall', 'Shelley', 'Texas', 'F'),
	(25, 'Radcliffe', 'Daniel', 'Fulham', 'M'),
	(26, 'Watson', 'Emma', 'Paris', 'F');

CREATE TABLE `director` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `born` year(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;


INSERT INTO `director` (`ID`, `name`, `born`)
VALUES
	(1, 'Steven Spielberg', '1946'),
	(2, 'Clint Eastwood', '1930'),
	(3, 'Martin Scorsese', '1942'),
	(4, 'Wes Anderson', '1969'),
	(5, 'Michael Apted', '1941'),
	(6, 'Alejandro Iñárritu', '1963'),
	(7, 'Bryan Singer', '1965'),
	(8, 'Stanley Kubrick', '1928'),
	(9, 'Robert Zemeckis', '1952'),
	(10, 'David Yates', '1963');


CREATE TABLE `movie` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `year` year(4) NOT NULL,
  `rottenTomatoes` decimal(4,2) unsigned NOT NULL,
  `genre` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `runningTimeMinutes` smallint(10) NOT NULL,
  `boxOffice` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `directorID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_movie_director_idx` (`directorID`),
  CONSTRAINT `FK_movie_director` FOREIGN KEY (`directorID`) REFERENCES `director` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;


INSERT INTO `movie` (`ID`, `title`, `year`, `rottenTomatoes`, `genre`, `runningTimeMinutes`, `boxOffice`, `directorID`)
VALUES
	(1, 'Unforgiven', '1992', 96.00, 'Western', 131, 120.00, 2),
	(2, 'Royal Tennenbaums', '2002', 80.00, 'Comedy', 108, 52.30, 4),
	(3, 'Rushmore', '1998', 89.00, 'Comedy', 93, 100.00, 4),
	(4, 'The Departed', '2006', 90.00, 'Drama', 152, 132.30, 3),
	(5, 'Catch Me if you Can', '2002', 96.00, 'Drama', 140, 164.40, 1),
	(6, 'Lincoln', '2012', 90.00, 'Drama', 149, 129.40, 1),
	(7, 'Coal Miners Daughter', '1980', 88.00, 'Drama', 125, 100.00, 5),
	(8, 'The Revenant', '2015', 80.00, 'Action', 156, 80.00, 6),
	(9, 'The Usual Suspects', '1995', 89.00, 'Mystery', 105, 100.00, 7),
	(10, 'The Shining', '1980', 86.00, 'Horror', 145, 100.00, 8),
	(11, 'Forrest Gump', '1994', 72.00, 'Comedy', 142, 330.00, 9),
	(12, 'Harry Potter and the Deathly Hallows - Part 2', '2011', 96.00, 'Action', 131, 381.00, 10);



CREATE TABLE `role` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `actorID` int(10) unsigned NOT NULL,
  `movieID` int(10) unsigned NOT NULL,
  roleName varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_role_actor_idx` (`actorID`),
  KEY `FK_role_movie_idx` (`movieID`),
  CONSTRAINT `FK_role_actor` FOREIGN KEY (`actorID`) REFERENCES `actor` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_role_movie` FOREIGN KEY (`movieID`) REFERENCES `movie` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ;

INSERT INTO `role` (`ID`, `actorID`, `movieID`, `roleName`)
VALUES
	(1, 10, 1, 'Little Bill Daggett'),
	(2, 9, 1, 'Ned Logan'),
	(3, 10, 2, 'Royal Tenenbaum'),
	(4, 18, 2, 'Raleigh St. Clair'),
	(5, 18, 3, 'Herman Blume'),
	(6, 19, 3, 'Max Fischer'),
	(7, 14, 4, 'Billy'),
	(8, 12, 4, 'Colin Sullivan'),
	(9, 14, 5, 'Frank Abagnale Jr.'),
	(10, 15, 5, 'Carl Hanratty'),
	(11, 5, 6, 'Abraham Lincoln'),
	(12, 17, 6, 'Mary Todd Lincoln'),
	(13, 7, 7, 'Loretta Lynn'),
	(14, 20, 7, 'Doolittle Lynn'),
	(15, 14, 8, 'Hugh Glass'),
	(16, 21, 8, 'John Fitzgerald'),
	(17, 22, 9, 'McManus'),
	(18, 23, 9, 'Keaton'),
	(19, 1, 10, 'Jack Torrance'),
	(20, 24, 10, 'Wendy Torrance'),
	(21, 15, 11, 'Forrest Gump'),
	(22, 17, 11, 'Mrs. Gump'),
	(23, 25, 12, 'Harry Potter'),
	(24, 26, 12, 'Hermione Granger');