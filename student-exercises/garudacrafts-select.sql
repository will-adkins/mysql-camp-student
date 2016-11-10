/* Exercise 2 */

USE RockStarDay2;

SHOW COLUMNS FROM Band;

SELECT ID, Name, Genre FROM Band;

/* Exercise 3 */

SELECT * FROM Individual WHERE LastName = 'Jennings';

SELECT ID, LASTNAME FROM Individual WHERE DeceasedDate IS NOT NULL;

SELECT ID, LastName, BirthDate FROM Individual WHERE Year(BirthDate) > 1940;

SELECT * FROM Individual WHERE ID IN (1,3,5,7,19);

/* Exercise 4 */

# Create a query that provides a list of alternative bands that have broken up
SELECT * FROM Band WHERE Genre = 'Alternative' AND IsTogether = 0;

#Create a query that provides the id and name of the band with an ID of 4
SELECT ID, Name FROM Band WHERE ID = 4;

/* Exercise 5 */

# Find all bands that have an 'and' in the middle of their band name like 'Jason and the Scorchers'.
SELECT * FROM Band WHERE Name LIKE '% and %';

# Find people who have a three letter first name that is like 'Tim' or 'Kim' or 'Jim'.
SELECT * FROM Individual WHERE FirstName LIKE '___';

# Find all bands that end with 's' like 'The Beatles' or 'The Rolling Stones' or 'Pixies'.
SELECT * FROM Band WHERE Name LIKE '%s';

/* JOINS */

# Create a separate SELECT statement to retrieve all the rows and columns from each of the tables.
Select * from player;
Select * from team;
Select * from batting;
Select * from roster;

# Create a SELECT statement that joins the batting table to the team table like this:
SELECT team.ID
, team.TeamName
, batting.TeamID
, batting.Rank
, batting.BattingAvg
FROM team
INNER JOIN batting ON team.ID = batting.TeamID;

# Create a SELECT statement that joins the batting table to the player table. Which player has a batting average of 331?
# NOTE: assumes a one-to-many table relationship between player and batting
SELECT p.ID AS PlayerID, CONCAT(p.LastName, ', ', p.firstName) AS Player, AVG(b.battingAvg) AS BattingAverage
FROM player p 
RIGHT JOIN batting b ON p.ID = b.playerID 
GROUP BY PlayerID
ORDER BY Player ASC;

SELECT p.ID AS PlayerID, CONCAT(p.LastName, ', ', p.firstName) AS Player, AVG(b.battingAvg) AS BattingAverage
FROM player p 
RIGHT JOIN batting b ON p.ID = b.playerID 
GROUP BY PlayerID
HAVING BattingAverage = 331;

# Create a SELECT statement that joins the player table to the roster table.
SELECT p.ID AS PlayerID, CONCAT(p.LastName, ', ', p.firstName) AS Player, r.*
FROM roster r
LEFT JOIN player p ON r.playerID = p.ID;

# Add another join to the previous statement by joining the team table to the roster table.
SELECT p.ID AS PlayerID, CONCAT(p.LastName, ', ', p.firstName) AS Player, r.Position, r.SeasonYear, r.teamID, t.teamName AS Team, t.ABBR, t.League, t.DivisionName
FROM roster r
LEFT JOIN player p ON r.playerID = p.ID
LEFT JOIN team t ON r.teamID = t.ID;

# List the players on the Boston Red Sox roster.
SELECT p.ID AS PlayerID, CONCAT(p.LastName, ', ', p.firstName) AS Player, r.Position, r.SeasonYear, r.teamID, t.teamName AS Team, t.ABBR, t.League, t.DivisionName
FROM roster r
LEFT JOIN player p ON r.playerID = p.ID
LEFT JOIN team t ON r.teamID = t.ID
WHERE t.teamName = 'Boston Red Sox';

SELECT * FROM vteamRoster;
DESCRIBE vteamRoster;

/* MORE JOINS */

# Create a SELECT statement that joins the player table and the batting table. The query should show all the players and any matching players that exist within the batting table. You should see NULL when there are no matches in the batting table.
SELECT p.ID AS PlayerID, CONCAT(p.LastName, ', ', p.firstName) AS Player, b.*
FROM player p 
LEFT JOIN batting b ON p.ID = b.playerID;

# Create a SELECT statement that joins the roster table and the team table. The query should display all the teams and any matching players within the roster table. You should see NULL when there are no matches in the roster table.
SELECT t.*, r.*
FROM roster r
RIGHT JOIN team t ON r.teamID = t.ID;

# Create a query that shows teams that have players on a roster. If a team does not have any players on a roster, then do not display the team.
SELECT t.teamName AS Team, t.ABBR, t.League, t.DivisionName, GROUP_CONCAT(r.playerID SEPARATOR ', ') AS PlayerIDs
FROM roster r
INNER JOIN team t ON r.teamID = t.ID
GROUP BY t.ID
ORDER BY Team;

# Create a query that displays teams that do not have players on a roster.
SELECT t.teamName AS Team, t.ABBR, t.League, t.DivisionName
FROM team t
LEFT JOIN roster r ON t.ID = r.teamID
WHERE r.playerID IS NULL
ORDER BY Team;

/* ORDER BY */

# Create a SELECT statement that joins the team table to the batting table using the team's ID column. Be sure to include the batting.BattingAvg, batting.ID, team.TeamName columns. 
SELECT b.ID, b.battingAvg, t.teamname FROM team t RIGHT JOIN batting b ON t.ID = b.teamID;

# Build on the previous query that sorts the result set by batting average. The highest batting averages should be listed first.
SELECT b.ID, b.battingAvg, t.teamname FROM team t RIGHT JOIN batting b ON t.ID = b.teamID ORDER BY battingAvg DESC;

# Which players have the most hits?
SELECT FirstName, LastName, ABBR, Hits FROM baseball.vbattingleaders ORDER BY Hits DESC;

# Which players have the least hits?
SELECT FirstName, LastName, ABBR, Hits FROM baseball.vbattingleaders ORDER BY Hits ASC;

# Sort the players by team. Within each team, sort the hitters with the most AtBats.
SELECT FirstName, LastName, ABBR, Hits FROM baseball.vbattingleaders ORDER BY teamName ASC, AtBats DESC;

/* GROUP BY */

# Retrieve all the columns from the vteamRoster view for only the batting leaders.
SELECT * FROM vteamRoster v INNER JOIN batting b ON v.playerID = b.playerID;

# Determine the average weight of the batting leaders by division.
SELECT v.DivisionName, AVG(v.Weight) AS WeightAvg
FROM vteamRoster v 
INNER JOIN batting b ON v.playerID = b.playerID
GROUP BY DivisionName
ORDER BY WeightAvg;

# Create a query that returns all rows from just the vteamRoster view.
SELECT * FROM vteamRoster;

# Create a query that counts the number of players within the vteamRoster view by position.
SELECT Position, COUNT(playerID) AS PositionCount
FROM vteamRoster
GROUP BY Position
ORDER BY PositionCount DESC;
