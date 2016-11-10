USE RockStarDay2;

SHOW COLUMNS FROM Band;
-- exercise 3

SELECT * FROM Individual
WHERE LastName='Jennings';

SELECT ID, LastName FROM Individual WHERE DeceasedDate IS NOT NULL;

SELECT ID, LastName, BirthDate FROM Individual WHERE YEAR(BirthDate) > 1940;

SELECT * FROM Individual WHERE ID IN (1,3,5,7,19);

-- Create a query that provides a list of alternative bands that have broken up.
SELECT * FROM Band WHERE Genre='Alternative' and IsTogether = 0;

-- Create a query that provides the id and name of the band with an ID of 4
SELECT ID, Name FROM Band WHERE ID=4;

-- HAVING and GROUP BY are friends
SELECT YearFormed, COUNT(ID) as BandCount
FROM Band GROUP BY YearFormed HAVING BandCount >1;

SELECT ID, Name, Genre as BandGenre FROM Band;
Select * FROM Individual Where FirstName LIKE '__ck';

Select * FROM Band WHERE Name Like 'The%';

SELECT * FROM Band WHERE Name LIKE '%Stones';

--Find all bands that have an ‘and’ in the middle of their band name like ‘Jason and the Scorchers’.
SELECT * FROM Band WHERE Name LIKE '% and %';
--Find people who have a three letter first name that is like ‘Tim’ or ‘Kim’ or ‘Jim’.
SELECT * FROM Individual WHERE FirstName LIKE '_im';
--Find all bands that end with ‘s’ like ‘The Beatles’ or ‘The Rolling Stones’ or ‘Pixies’.
SELECT * FROM Band Where Name LIKE '%s';

SELECT IB.*, I.firstName,I.lastName
FROM IndividualBand IB
INNER JOIN Individual as I ON IB.IndividualID = I.ID
WHERE IB.BandID =9;

SELECT IB.*, B.Name, I.firstName,I.lastName
FROM IndividualBand IB
INNER JOIN Individual as I ON IB.IndividualID = I.ID
INNER JOIN Band as B
--All columns from IndividualBand and the Individual first and last name

SELECT IB.*, B.Name as BandName, I.FirstName
FROM IndividualBand IB
INNER JOIN Band as B ON B.ID = IB.BandID
INNER JOIN Individual as I ON IB.IndividualID = I.ID
WHERE I.FirstName = 'George';

--Create a SELECT statement that joins the batting table to the player table.
--Which player has a batting average of 331?
SELECT player.ID
, player.LastName
, batting.Rank
, batting.battingAvg
FROM player
INNER JOIN batting ON player.ID = batting.playerID
WHERE batting.battingAvg = 331;
--Create a SELECT statement that joins the player table to the roster table.
--Add another join to the previous statement by joining the team table to the roster table.
SELECT player.ID
, player.LastName
, r.ID
, r.Position
, team.teamName
FROM player
INNER JOIN roster as r ON player.ID = r.playerID
INNER JOIN team ON team.ID = r.teamID
WHERE teamName ='Boston Red Sox';

--EXERCISE 2 - JOINS
--Create a SELECT statement that joins the player table and the batting table.
--The query should show all the players and any matching players that exist within the batting table.
--You should see NULL when there are no matches in the batting table.
SELECT p.ID
, p.LastName
, p.FirstName
, b.battingAvg
FROM player as p
LEFT JOIN batting as b ON p.ID = b.playerID;

--Create a SELECT statement that joins the roster table and the team table.
--The query should display all the teams and any matching players within the roster table.
--You should see NULL when there are no matches in the roster table.
SELECT r.Position
, t.teamName
, t.ID
FROM roster as r
RIGHT JOIN team as t ON t.ID = r.teamID;

--Create a query that shows teams that have players on a roster.
--If a team does not have any players on a roster, then do not display the team.
SELECT DISTINCT t.teamName
, r.teamID
FROM roster as r
INNER JOIN team as t ON t.ID = r.teamID;

--Create a query that displays teams that do not have players on a roster.

SELECT t.teamName
, r.teamID
, r.Position
FROM team as t
LEFT JOIN roster as r ON t.ID = r.teamID
WHERE r.teamID IS NULL;
