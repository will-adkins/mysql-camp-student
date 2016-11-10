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


-- Joins Exercise 2 --

-- Create a SELECT statement that joins the **player** table and the **batting** table. The query should show all the players and any matching players that exist within the batting table. You should see NULL when there are no matches in the batting table.

SELECT player

LEFT JOIN player
