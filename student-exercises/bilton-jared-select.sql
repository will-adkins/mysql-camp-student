-- Exercise 2 --

USE RockStarDay2;

SHOW COLUMNS FROM Band;

-- Excercise 3 --

SELECT * FROM Individual
WHERE LastName = 'Jennings';

SELECT ID, LastName
FROM Individual
WHERE DeceasedDate IS NOT NULL;


SELECT ID, LastName, BirthDate
FROM Individual
WHERE Year(BirthDate) > 1940;


SELECT * FROM Individual
WHERE ID IN (1,3,5,7,19);


-- Exercise 4 --

SELECT * FROM Band
WHERE Genre = 'Alternative' and isTogether = 0;

SELECT ID, Name FROM Band
WHERE ID = 4;

-- Exercise 5 --
SELECT *
FROM Band
WHERE Name LIKE '%and%';

SELECT *
FROM Individual
WHERE FirstName LIKE '_im';

SELECT *
FROM Band
WHERE Name LIKE '%s';


-- Exercise 10-joins/1 --
Select * from player;
Select * from team;
Select * from batting;
Select * from roster;

SELECT team.ID
, team.TeamName
, batting.TeamID
, batting.Rank
, batting.BattingAvg
FROM team
INNER JOIN batting ON team.ID = batting.TeamID;

SELECT player.ID
 , player.LastName
 , batting.Rank
 , batting.BattingAvg
 FROM player
 INNER JOIN batting ON player.ID = batting.PlayerID;

 SELECT player.ID
 , player.LastName
 , batting.Rank
 , batting.BattingAvg
 FROM player
 INNER JOIN batting ON player.ID = batting.PlayerID
 WHERE batting.BattingAvg = 331;

 SELECT roster.*
, player.LastName
, player.ID
FROM roster
INNER JOIN player ON roster.playerID = player.ID;



SELECT * FROM vteamRoster;

DESCRIBE vteamRoster;

SHOW CREATE VIEW vteamRoster;


-- Joins Exercise 10-joins/2 --

-- Create a SELECT statement that joins the **player** table and the **batting** table. The query should show all the players and any matching players that exist within the batting table. You should see NULL when there are no matches in the batting table.

SELECT player.ID
, player.LastName
, player.FirstName
, batting.TeamID
, batting.BattingAvg
, batting.Rank
FROM player
LEFT JOIN batting ON batting.playerID = player.ID;


-- Create a SELECT statement that joins the roster table and the team table. The query should display all the teams and any matching players within the roster table. You should see NULL when there are no matches in the roster table.


SELECT roster.ID
, roster.playerID
, roster.Position
, roster.SeasonYear
, team.teamName
, team.league
, team.DivisionName
FROM roster
RIGHT JOIN team ON roster.teamID = team.ID;


-- Create a query that shows teams that have players on a roster. If a team does not have any players on a roster, then do not display the team.

SELECT roster.ID
, roster.playerID
, roster.Position
, roster.SeasonYear
, team.teamName
, team.league
, team.DivisionName
FROM roster
LEFT JOIN team ON roster.teamID = team.ID;

-- Create a query that displays teams that do not have players on a roster.

SELECT team.ID
, team.teamName
, team.League
, roster.ID
, roster.SeasonYear
FROM team
RIGHT JOIN roster ON team.ID = roster.teamID
WHERE roster.playerID IS NULL;


-- order by last name
SELECT ID
, LastName
, FirstName
, BirthDate
FROM  player
ORDER BY LastName;

-- order by first Name

SELECT ID
, LastName
, FirstName
, BirthDate
FROM player
ORDER BY FirstName;

-- Random examples from class
SELECT ID
, LastName
, FirstName
, BirthDate
FROM  player
ORDER BY LastName, FirstName;

SELECT ID
, LastName
, FirstName
, BirthDate
FROM  player
ORDER BY BirthDate DESC;

SELECT ID
, LastName
, FirstName
, BirthDate
FROM  player
ORDER BY BirthDate ASC;

SELECT playerID
, playerName
, teamName
, HeightInches
, League
, DivisionName
FROM vteamRoster
ORDER BY League, DivisionName, TeamName, HeightInches DESC;

-- Exercise Order By

-- BA, ID, TeamName
SELECT batting
, batting.ID
, batting.BattingAvg
, team.TeamName
FROM team
INNER JOIN batting ON team.ID = batting.ID
ORDER BY BattingAvg DESC;



SELECT FirstName
, LastName
, teamName
, ABBR
, Hits
, AtBats
FROM baseball.vbattingleaders
ORDER BY


-- GROUP BY CLause

-- want to list all teams with BA from batting Table

SELECT batting.ID
, team.TeamName
, batting.battingAvg
FROM batting
INNER JOIN team ON batting.teamID = team.ID;

-- determine which teams had the most players on the list

SELECT COUNT(batting.ID),
, team.teamName
FROM batting
INNER JOIN team ON batting.TeamName = team.ID
GROUP BY Team.teamName;



-- Group BY Excercise 12-group-by/1

-- Query 1
-- Retrieve all the columns from the vteamRoster view for only the batting leaders. To accomplish this, create a query that joins the batting table to the vteamRoster view using the playerID column for the join.

SELECT batting.Rank
, batting.ID
, vteamRoster.playerName
, vteamRoster.Position
, vteamRoster.teamName
, batting.battingAvg
FROM vteamRoster
INNER JOIN batting ON batting.playerID = vteamRoster.playerID;

-- Another way
SELECT v.*
FROM vteamRoster v
INNER JOIN batting b on b.playerID = v.playerID;


-- Query 2
-- Make a copy of the first query and place it below the first query. Modify the new query to determine the average weight of the batting leaders by division.

SELECT v.DivisionName
, AVG(Weight)
FROM vteamRoster v
INNER JOIN batting b ON b.playerID = v.playerID
GROUP BY v.DivisionName;


-- Another way
SELECT v.DivisionName as Division
, AVG(v.Weight) as 'averageWeight'
FROM vteamRoster
INNER JOIN batting b on b.playerID = v.playerID
GROUP BY v.DivisionName;

-- Query 3
-- query that returns all rows from just the vteamRoster view
SELECT *
FROM vteamRoster;

-- Query 4
-- query that counts the number of players within the vteamRoster view by position

SELECT Position, COUNT(playerID)
FROM vteamRoster
GROUP BY Position;


-- Another way

SELECT Position, COUNT (playerID) as PositionCount
from vteamRoster
GROUP BY Position;
