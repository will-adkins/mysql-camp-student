SELECT v.* 
FROM vteamRoster v
INNER JOIN batting ON vteamRoster.playerID = batting.playerID;

SELECT vteamRoster.DivisionName, AVG(vteamRoster.weight) 
FROM vteamRoster 
INNER JOIN batting ON vteamRoster.playerID = batting.playerID
GROUP BY DivisionName;

SELECT *
FROM vteamRoster;

SELECT Position, COUNT(playerID) 
FROM vteamRoster
GROUP BY Position, Height;

