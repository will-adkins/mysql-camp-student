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
SELECT Position, COUNT(playerID) as positonCount FROM vteamRoster GROUP BY Position;

--HAVING
--Create three select statements that use the GROUP BY and HAVING clause.
--Use any table or view from any of the databases created to this point.
--Feel free to create your own database and tables with data, if you desire.

SELECT vteamRoster.DivisionName, AVG(vteamRoster.Weight) FROM vteamRoster INNER JOIN batting ON vteamRoster.playerID = batting.playerID GROUP BY DivisionName HAVING DivisionName = 'NL EAST';
SELECT COUNT(team.ID) as BattingLeaderCount, team.teamName FROM team INNER JOIN batting ON team.ID = batting.teamID GROUP BY team.teamName HAVING BattingLeaderCount > 1 ORDER BY BattingLeaderCount DESC;
SELECT vteamRoster.playerName, COUNT(batting.Hits) FROM vteamRoster INNER JOIN batting on vteamRoster.playerID = batting.playerID GROUP BY vteamRoster.playerName HAVING playerName = 'Chris Johnson';
