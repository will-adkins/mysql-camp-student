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
