USE RockStarDay2;
SHOW COLUMNS FROM Band;
SELECT * FROM Band;

SELECT * FROM Individual WHERE LastName = 'Jennings';

SELECT ID, LASTNAME FROM Individual WHERE DeceasedDate IS NOT NULL;

SELECT ID, LastName, BirthDate FROM Individual WHERE Year(BirthDate) > 1940;

SELECT * FROM Individual WHERE ID IN (1,3,5,7,19);

SELECT * FROM Band WHERE Genre = 'Alternative' and IsTogether = 0;

SELECT ID, Name FROM Band WHERE ID = 4;

SELECT * FROM Band WHERE Name LIKE '% and %';

SELECT * FROM Individual WHERE FirstName Like '___';

SELECT * FROM Band WHERE Name LIKE '%_s';

/* BASEBALL */
SELECT * FROM player;
SELECT * FROM batting;
SELECT * FROM team;
SELECT * FROM roster;

SELECT team.ID, team.teamName, batting.teamID, batting.Rank, batting.battingAvg FROM team INNER JOIN batting ON team.ID = batting.teamID;
SELECT batting.playerID, player.FirstName, player.LastName FROM batting INNER JOIN player ON batting.playerID = player.ID;
SELECT player.ID, player.LastName, roster.teamID, roster.Position, roster.playerID FROM player INNER JOIN roster On player.ID = roster.playerID;
