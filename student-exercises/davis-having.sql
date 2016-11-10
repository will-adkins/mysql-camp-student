--Create three select statements that use the GROUP BY and HAVING clause.
--Use any table or view from any of the databases created to this point.
--Feel free to create your own database and tables with data, if you desire

SELECT COUNT(playerID), teamName
FROM vteamRoster 
WHERE Throws = 'L'
Group BY teamName
HAVING COUNT(playerID) > 1;

SELECT COUNT(playerID), teamName
FROM vbattingleaders
WHERE Runs > 75
GROUP By teamName
HAVING COUNT(playerID) >1;

SELECT COUNT(playerID) CNT, teamName
FROM vbattingleaders
WHERE Hits > 164
GROUP By teamName
HAVING CNT >1;
