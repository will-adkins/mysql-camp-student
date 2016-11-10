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
SELECT batting.playerID, batting.battingAvg, player.FirstName, player.LastName FROM batting INNER JOIN player ON batting.playerID = player.ID;
SELECT player.ID, player.LastName, roster.teamID, roster.Position, roster.playerID FROM player INNER JOIN roster On player.ID = roster.playerID INNER JOIN team ON roster.teamID = team.ID WHERE teamName = 'Boston Red Sox';

/* Exercise: More fun with joins */
SELECT player.ID, batting.playerID, batting.teamID FROM player LEFT JOIN batting ON player.ID = batting.playerID;
SELECT roster.teamID, roster.playerID, team.ID, team.teamName FROM roster RIGHT JOIN team ON roster.teamID = team.ID;
SELECT roster.teamID, roster.playerID, team.ID, team.teamName FROM roster RIGHT JOIN team ON roster.teamID = team.ID WHERE roster.playerID LIKE '__' or roster.playerID Like '___';
SELECT roster.teamID, roster.playerID, team.ID, team.teamName FROM roster RIGHT JOIN team ON roster.teamID = team.ID WHERE roster.playerID IS NULL;

/* OR */
SELECT team.ID, team.teamName, roster.teamID, roster.playerID FROM team LEFT JOIN roster ON team.ID = roster.teamID WHERE roster.ID IS NULL;

/* ORDER BY */
SELECT batting.battingAvg, batting.ID, team.teamName FROM batting INNER JOIN team ON batting.ID = team.ID;
SELECT playerID, FirstName, LastName, ABBR, Hits FROM vbattingleaders ORDER BY Hits DESC;
SELECT playerID, FirstName, LastName, ABBR, Hits FROM vbattingleaders ORDER BY Hits ASC;
SELECT playerID, FirstName, LastName, ABBR, Hits, AtBats FROM vbattingleaders ORDER BY ABBR, AtBats DESC;

SELECT COUNT(team.ID) as BattingLeaderCount, team.teamName FROM team INNER JOIN batting ON team.ID = batting.teamID GROUP BY team.teamName HAVING BattingLeaderCount > 1 ORDER BY BattingLeaderCount DESC;

SELECT FROM batting INNER JOIN team ON

/* GROUP BY */
-- Retrieve all the columns from the vteamRoster view for only the batting leaders.
-- To accomplish this, create a query that joins the batting table to the vteamRoster view
-- using the playerID column for the join.
SELECT vteamRoster.*, batting.* FROM vteamRoster INNER JOIN batting ON vteamRoster.playerID = batting.playerID;

-- Add weight AVG
SELECT vteamRoster.DivisionName, AVG(vteamRoster.Weight) FROM vteamRoster INNER JOIN batting ON vteamRoster.playerID = batting.playerID GROUP BY DivisionName;

-- 3
SELECT * FROM vteamRoster

--4
