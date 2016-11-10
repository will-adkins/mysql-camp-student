DROP SCHEMA IF EXISTS baseball;

CREATE DATABASE baseball;

USE baseball;

/* team Table */

CREATE TABLE `team` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `teamName` varchar(75) NOT NULL,
  `ABBR` char(3) NOT NULL,
  `League` enum('AL','NL') NOT NULL,
  `DivisionName` enum('AL EAST','AL CENTRAL','AL WEST','NL EAST','NL CENTRAL','NL WEST') NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `teamName_UNIQUE` (`teamName`),
  UNIQUE KEY `ABBR_UNIQUE` (`ABBR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Baltimore Orioles', 'BAL', 'AL', 'AL EAST');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Boston Red Sox', 'BOS', 'AL', 'AL EAST');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('New York Yankees', 'NYY', 'AL', 'AL EAST');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Toronto Blue Jays', 'TOR', 'AL', 'AL EAST');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Chicago White Sox', 'CHW', 'AL', 'AL CENTRAL');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Cleveland Indians', 'CLE', 'AL', 'AL CENTRAL');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Detroit Tigers', 'DET', 'AL', 'AL CENTRAL');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Kansas City Royals', 'KAN', 'AL', 'AL CENTRAL');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Minnesota Twins', 'MIN', 'AL', 'AL CENTRAL');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Houston Astros', 'HOU', 'AL', 'AL WEST');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Atlanta Braves', 'ATL', 'NL', 'NL EAST');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Miami Marlins', 'MIA', 'NL', 'NL EAST');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('New York Mets', 'NYM', 'NL', 'NL EAST');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Philadelphia Phillies', 'PHI', 'NL', 'NL EAST');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Washington Nationals', 'WAS', 'NL ', 'NL EAST');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Chicago Cubs', 'CHC', 'NL', 'NL CENTRAL');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Cincinnati Reds', 'CIN', 'NL', 'NL CENTRAL');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Milwaukee Brewers', 'MIL', 'NL', 'NL CENTRAL');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Pittsburgh Pirates', 'PIT', 'NL', 'NL CENTRAL');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('St. Louis Cardinals', 'STL', 'NL', 'NL CENTRAL');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Arizona Diamondbacks', 'ARI', 'NL', 'NL WEST');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Colorado Rockies', 'COL', 'NL', 'NL WEST');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Los Angeles Dodgers', 'LAD', 'NL', 'NL WEST');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('San Diego Padres', 'SD ', 'NL', 'NL WEST');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('San Francisco Giants', 'SF ', 'NL', 'NL WEST');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Los Angeles Angels', 'LAA', 'AL', 'AL WEST');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Oakland Athletics', 'OAK', 'AL', 'AL WEST');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Seattle Mariners', 'SEA', 'AL', 'AL WEST');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Texas Rangers', 'TEX', 'AL ', 'AL WEST');
INSERT INTO `baseball`.`team` (`teamName`, `ABBR`, `League`, `DivisionName`) VALUES ('Tampa Bay Rays', 'TAM', 'AL', 'AL EAST');

/* player Table */

CREATE TABLE baseball.player (
  ID INT NOT NULL,
  LastName VARCHAR(50) NULL,
  FirstName VARCHAR(25) NULL,
  Throws ENUM("R","L") NOT NULL,
  Bats ENUM("R","L") NOT NULL,
  Birthdate DATE NULL,
  BirthplaceCountry VARCHAR(100) NULL,
  BirthplaceCity VARCHAR(100) NULL,
  BirthplaceState CHAR(2) NULL,
  HeightInches TINYINT NULL,
  WeightLbs SMALLINT NULL,
  UNIQUE INDEX ID_UNIQUE (ID ASC),
  PRIMARY KEY (ID));

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, HeightInches, WeightLbs)
VALUES ("5", "Castro", "Starlin", "R", "R", "1990-3-24", "Dominican Republic", "Monte Cristi", "70", "190");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, BirthplaceState, HeightInches, WeightLbs)
VALUES ("10", "Schierholtz", "Nate", "R", "L", "1984-2-15", "USA", "Reno", "NV", "74", "215");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, BirthplaceState, HeightInches, WeightLbs)
VALUES ("15", "Watkins", "Logan", "R", "L", "1989-8-29", "USA", "Wichita", "KS", "71", "175");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, BirthplaceState, HeightInches, WeightLbs)
VALUES ("20", "Rizzo", "Anthony", "L", "L", "1989-8-8", "USA", "Fort Lauderdale", "FL", "75", "240");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, HeightInches, WeightLbs) VALUES ("25", "Fujikawa", "Kyuji", "R", "L", "1980-7-21", "Japan", "Kochi City", "72", "190");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, BirthplaceState, HeightInches, WeightLbs)
VALUES ("30", "Medlen", "Kris", "R", "R", "1985-10-7", "USA", "Artesia", "CA", "70", "190");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, BirthplaceState, HeightInches, WeightLbs)
VALUES ("35", "Kimbrel", "Craig", "R", "R", "1988-5-28", "USA", "Huntsville", "AL", "71", "205");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, BirthplaceState, HeightInches, WeightLbs)
VALUES ("40", "Wood", "Alex ", "L", "R", "1991-1-12", "USA", "Charlotte", "NC", "76", "215");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, BirthplaceState, HeightInches, WeightLbs)
VALUES ("45", "Minor", "Mike", "L", "R", "1987-12-26", "USA", "Chapel Hill", "TN", "76", "205");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, BirthplaceState, HeightInches, WeightLbs)
 VALUES ("50", "Gattis", "Evan", "R", "R", "1986-8-18", "USA", "Dallas", "TX", "76", "230");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, BirthplaceState, HeightInches, WeightLbs)
VALUES ("55", "Heyward", "Jason", "L", "L", "1989-8-9", "USA", "Ridgewood", "NJ", "77", "240");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, BirthplaceState, HeightInches, WeightLbs)
VALUES ("60", "Johnson", "Chris", "R", "R", "1984-10-1", "USA", "Naples", "FL", "75", "220");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, BirthplaceState, HeightInches, WeightLbs)
VALUES ("65", "Upton", "Justin", "R", "R", "1987-8-25", "USA", "Norfolk", "VA", "74", "205");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, BirthplaceState, HeightInches, WeightLbs)
VALUES ("70", "Buchholz", "Clay", "R", "L", "1984-8-14", "USA", "Nederland", "TX", "75", "190");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, BirthplaceState, HeightInches, WeightLbs)
VALUES ("75", "Lackey", "John", "R", "R", "1978-10-23", "USA", "Abiline", "TX", "78", "235");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, BirthplaceState, HeightInches, WeightLbs)
VALUES ("80", "Dempster", "Ryan", "R", "R", "1977-5-3", "Canada", "Gibsons", "", "74", "215");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, BirthplaceState, HeightInches, WeightLbs)
VALUES ("85", "Ross", "David", "R", "R", "1977-3-19", "USA", "Bainbridge", "GA", "74", "230");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, BirthplaceState, HeightInches, WeightLbs)
VALUES ("90", "Pedroia", "Dustin", "R", "R", "1983-8-17", "USA", "Woodland", "CA", "68", "165");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, HeightInches, WeightLbs)
VALUES ("95", "Ortiz", "David", "L", "L", "1975-11-18", "Dominican Republic", "Santo Domingo", "76", "230");


INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, BirthplaceState, HeightInches, WeightLbs)
VALUES ("101", "Cuddyer", "Michael ", "R", "R", "1979-3-27", "USA", "Norfolk", "VA","74", "220");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, BirthplaceState, HeightInches, WeightLbs)
VALUES ("103", "Freeman", "Freddie", "L", "R", "1989-9-12", "USA", "Fountain Valley", "CA","76", "230");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, HeightInches, WeightLbs)
VALUES ("104", "Molina", "Yadier", "R", "R", "1982-7-13", "Puerto Rico", "Bayamon", "71", "230");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, BirthplaceState, HeightInches, WeightLbs)
VALUES ("105", "Werth", "Jayson", "R", "R", "1979-5-20", "USA", "Springfield", "IL","77", "225");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, BirthplaceState, HeightInches, WeightLbs)
VALUES ("106", "Carpenter", "Matt", "L", "R", "1985-11-26", "USA", "Galveston", "TX","75", "200");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, BirthplaceState, HeightInches, WeightLbs)
VALUES ("107", "McCutchen", "Andrew", "R", "R", "1986-10-10", "USA", "Fort Meade", "FL","70", "188");

INSERT INTO baseball.player
(ID, LastName, FirstName, Throws, Bats, Birthdate, BirthplaceCountry, BirthplaceCity, BirthplaceState, HeightInches, WeightLbs)
VALUES ("108", "Craig", "Allen", "R", "R", "1984-7-18", "USA", "Mission Viejo", "CA","74", "210");


/*
batting and batting2 TABLES
*/
CREATE TABLE `batting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `playerID` int(11) NOT NULL,
  `Rank` smallint(6) NOT NULL,
  `teamID` int(11) DEFAULT NULL,
  `AtBats` smallint(6) DEFAULT NULL,
  `Runs` smallint(6) DEFAULT NULL,
  `Hits` smallint(6) DEFAULT NULL,
  `battingAvg` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `FK_player_playerID_idx` (`playerID`),
  KEY `FK_team_teamID_idx` (`teamID`),
  CONSTRAINT `FK_team_teamID` FOREIGN KEY (`teamID`) REFERENCES `team` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_player_playerID` FOREIGN KEY (`playerID`) REFERENCES `player` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;



INSERT INTO baseball.batting
(playerID, Rank, teamID, AtBats, Runs, Hits, battingAvg)
VALUES (101, 1,  22, 489, 74, 162, 331);

INSERT INTO baseball.batting
(playerID, Rank,  teamID, AtBats, Runs, Hits, battingAvg)
VALUES (60, 2, 11, 514, 54, 165, 321);

INSERT INTO baseball.batting
 (playerID, Rank, teamID, AtBats, Runs, Hits, battingAvg)
VALUES (103, 3,  11, 551, 89, 176, 319);

INSERT INTO baseball.batting
 (playerID, Rank, teamID, AtBats, Runs, Hits, battingAvg)
VALUES (104, 4,  20, 505, 68, 161,319);

INSERT INTO baseball.batting
(playerID, Rank,teamID,AtBats,Runs,Hits,battingAvg)
VALUES (105, 5,15,462,84,147,318);

INSERT INTO baseball.batting
(playerID, Rank,teamID,AtBats,Runs,Hits,battingAvg)
VALUES (106, 6,20,626,126,199,318);

INSERT INTO baseball.batting
(playerID, Rank,teamID,AtBats,Runs,Hits,battingAvg)
VALUES (107, 7,20,583,97,185,317);

INSERT INTO baseball.batting
(playerID, Rank,teamID,AtBats,Runs,Hits,battingAvg)
VALUES (108, 8,20,508,71,160,315);


/*  batting2 Table*/

CREATE TABLE `batting2` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `playerID` int(11) NOT NULL,
  `Rank` smallint(6) NOT NULL,
  `teamID` int(11) DEFAULT NULL,
  `AtBats` smallint(6) DEFAULT NULL,
  `Runs` smallint(6) DEFAULT NULL,
  `Hits` smallint(6) DEFAULT NULL,
  `battingAvg` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `FK_player2_playerID_idx` (`playerID`),
  KEY `FK_team2_teamID_idx` (`teamID`),
  CONSTRAINT `FK_team2_teamID` FOREIGN KEY (`teamID`) REFERENCES `team` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_player2_playerID` FOREIGN KEY (`playerID`) REFERENCES `player` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

INSERT INTO baseball.batting2
(playerID, Rank, teamID, AtBats, Runs, Hits, battingAvg)
VALUES (101, 1,  NULL, 489, 74, 162, 331);

INSERT INTO baseball.batting2
(playerID, Rank,  teamID, AtBats, Runs, Hits, battingAvg)
VALUES (60, 2, NULL, 514, 54, 165, 321);

INSERT INTO baseball.batting2
 (playerID, Rank, teamID, AtBats, Runs, Hits, battingAvg)
VALUES (103, 3,  NULL, 551, 89, 176, 319);

INSERT INTO baseball.batting2
 (playerID, Rank, teamID, AtBats, Runs, Hits, battingAvg)
VALUES (104, 4,  NULL, 505, 68, 161,319);

INSERT INTO baseball.batting2
(playerID, Rank,teamID,AtBats,Runs,Hits,battingAvg)
VALUES (105, 5,NULL,462,84,147,318);

INSERT INTO baseball.batting2
(playerID, Rank,teamID,AtBats,Runs,Hits,battingAvg)
VALUES (106, 6,NULL,626,126,199,318);

INSERT INTO baseball.batting2
(playerID, Rank,teamID,AtBats,Runs,Hits,battingAvg)
VALUES (107, 7,NULL,583,97,185,317);

INSERT INTO baseball.batting2
(playerID, Rank,teamID,AtBats,Runs,Hits,battingAvg)
VALUES (108, 8,NULL,508,71,160,315);


/* Roster Table */

CREATE TABLE `baseball`.`roster` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `teamID` INT NOT NULL,
  `playerID` INT NOT NULL,
  `Position` CHAR(2) NOT NULL,
  `SeasonYear` YEAR NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `FK_Roster_teamID_idx` (`teamID` ASC),
  INDEX `FK_Roster_playerID_idx` (`playerID` ASC),
  UNIQUE INDEX `UI_Roster_teamplayerYear_idx` (`teamID` ASC, `playerID` ASC, `SeasonYear` ASC),
  CONSTRAINT `FK_Roster_teamID`
    FOREIGN KEY (`teamID`)
    REFERENCES `baseball`.`team` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Roster_playerID`
    FOREIGN KEY (`playerID`)
    REFERENCES `baseball`.`player` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('16', '5', 'SS', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('16', '10', 'RF', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('16', '15', '2B', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('16', '20', '1B', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('16', '25', 'RP', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('11', '30', 'SP', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('11', '35', 'RP', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('11', '40', 'RP', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('11', '45', 'SP', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('11', '50', 'LF', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('11', '55', 'RF', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('11', '60', '3B', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('11', '65', 'CF', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('2', '70', 'SP', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('2', '75', 'SP', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('2', '80', 'SP', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('2', '85', 'C ', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('2', '90', '2B', 2103);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('2', '95', 'DH', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('22', '101', 'RF', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('11', '103', '1B', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('20', '104', 'C ', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('15', '105', 'RF', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('20', '106', '3B', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('19', '107', 'CF', 2013);
INSERT INTO `baseball`.`roster` (`teamID`, `playerID`, `Position`, `SeasonYear`) VALUES ('20', '108', '1B', 2103);


/*  Views  */

CREATE  VIEW `vbattingleaders`
AS
select
`b`.`ID` AS `battingID`
,`b`.`playerID` AS `playerID`
,`p`.`FirstName` AS `FirstName`
,`p`.`LastName` AS `LastName`
,`t`.`ABBR` AS `ABBR`
,`t`.`teamName` AS `teamName`
,`b`.`AtBats` AS `AtBats`
,`b`.`Runs` AS `Runs`
,`b`.`Hits` AS `Hits`
,`b`.`battingAvg` AS `battingAvg`
from ((`batting` `b` join `team` `t` on((`t`.`ID` = `b`.`teamID`))) join `player` `p` on((`p`.`ID` = `b`.`playerID`)));

CREATE VIEW `vteamRoster` AS
SELECT P.ID as playerID
, CONCAT(P.FirstName, " " , P.LastName) as playerName
, R.Position
,  P.Bats
, P.Throws
, CONCAT(CAST(FLOOR(P.HeightInches / 12) as CHAR(1)),"-",CAST((P.HeightInches mod 12) as CHAR(2))) as Height
, P.HeightInches
, P.WeightLbs as Weight
, T.ID as teamID
, T.teamName
, T.ABBR as teamAbbr
, T.League
, T.DivisionName
FROM baseball.roster R
INNER JOIN baseball.team T ON R.teamID = T.ID
INNER JOIN baseball.player P on R.playerID = P.ID
;
