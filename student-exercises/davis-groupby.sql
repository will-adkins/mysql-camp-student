-- EXERCISES on Group-by
--1.Retrieve all the columns from the vteamRoster view for only the batting leaders.
--To accomplish this, create a query that joins the batting table to the vteamRoster view using the playerID column for the join.

SELECT v.*
FROM vteamRoster v
INNER JOIN batting ON batting.playerID = vteamRoster.playerID;

--2. Make a copy of the first query and place it below the first query.
--Modify the new query to determine the average weight of the batting leaders by division.
SELECT v.DivisionName, AVG(v.Weight)
FROM vteamRoster v
INNER JOIN batting ON batting.playerID = v.playerID
GROUP By v.DivisionName;

--4. Create a query that counts the number of players
--within the vteamRoster view by position.

SELECT Position, COUNT(playerID) FROM vteamRoster GROUP BY Position;
