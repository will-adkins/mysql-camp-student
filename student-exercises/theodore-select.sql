USE RockStarDay2;
SELECT * FROM Individual
WHERE LastName = 'Jennings';


SELECT ID, LASTNAME FROM Individual
WHERE DeceasedDate IS NOT NULL;

SELECT ID, LastName, BirthDate FROM Individual
WHERE Year(BirthDate) > 1940;


SELECT * FROM Individual
WHERE ID IN (1,3,5,7,19);

SELECT * FROM Band
WHERE Genre = 'Alternative' and IsTogether = 0;

SELECT ID, Name FROM Band
WHERE ID= 4;

SELECT YearFormed, COUNT(ID) as BandCount FROM Band
Group BY YearFormed
HAVING BandCount > 1;

Select ID, Name, Genre as BandGenre
FROM Band;

SELECT ID, Name FROM Band
WHERE Name LIKE 'Th_ Band';

SELECT * FROM Band
WHERE Name LIKE '% and %';

SELECT * FROM Individual
WHERE FirstName LIKE '_im';

SELECT IB.*, I.FirstName, I.LastName
FROM IndividualBand IB
INNER JOIN Individual as I ON IB.IndividualID = I.ID
WHERE IB.BandID = 9;

USE baseball;
SELECT team.ID
, team.TeamName
, batting.TeamID
, batting.Rank
, batting.BattingAvg
FROM team
INNER JOIN batting ON team.ID = batting.TeamID;

SELECT player * , player.LastName, player.FirstName
FROM player
INNER JOIN batting ON playerID = batting.ID;

SELECT player.ID
, player.LastName
, player.FirstName
, batting.ID
, batting.playerID
, batting.BattingAvg
FROM player
INNER JOIN batting ON batting.playerID = player.ID
WHERE batting.BattingAvg = 331;

SELECT batting.playerID, batting.battingAvg, player.FirstName, player.LastName
FROM batting INNER JOIN player
ON batting.playerID = player.ID;

SELECT player.ID, player.LastName, roster.teamID, roster.Position, roster.playerID
FROM player INNER JOIN roster
On player.ID = roster.playerID INNER JOIN team
ON roster.teamID = team.ID WHERE teamName = 'Boston Red Sox';

SELECT player.ID, batting.playerID, batting.teamID
FROM batting LEFT JOIN player
ON batting.playerID = player.ID;

SELECT roster.teamID, roster.playerID, team.ID, team.teamName
FROM roster RIGHT JOIN team
ON roster.teamID = team.ID;

SELECT roster.teamID, roster.playerID, team.ID, team.teamName
FROM roster RIGHT JOIN team ON roster.teamID = team.ID
WHERE roster.playerID LIKE '__' or roster.playerID Like '___';

SELECT roster.teamID, roster.playerID, team.ID, team.teamName
FROM roster RIGHT JOIN team ON roster.teamID = team.ID
WHERE roster.playerID IS NULL;

SELECT ID, LastName, FirstName, Birthdate
FROM player ORDER BY LastName;

SELECT ID, LastName, FirstName, Birthdate
FROM player ORDER BY Birthdate;

SELECT ID, LastName, FirstName, Bats, HeightInches
FROM player ORDER BY HeightInches, LastName, FirstName;

SELECT PlayerID, PlayerName, League, DivisionName, TeamName, HeightInches
FROM vteamRoster
ORDER BY League, DivisionName, TeamName, HeightInches DESC;

SELECT batting.battingAvg, batting.ID, team.teamName
FROM team INNER JOIN batting
ON team.ID =  batting.ID;
ORDER BY batting.AVG

SELECT * FROM baseball.vbattingleaders
order by Hits;

SELECT * FROM baseball.vbattingleaders
order by Hits desc;

SELECT * FROM baseball.vbattingleaders
order by teamName, AtBats;

SELECT team.ID, team.teamName "Team Name", AVG(batting.battingAVG) "Batting Leaders Avg."
FROM team
INNER JOIN batting
ON team.ID = batting.TeamID
GROUP BY teamName
ORDER BY "Batting Leaders Avg.";

SELECT Count(team.ID) as BattingLeaderCount, team.teamName
FROM team
INNER JOIN batting ON team.ID =  batting.teamID
GROUP BY team.teamName
HAVING BattingLeaderCount > 1
ORDER BY BattingLeaderCount DESC;

/*
Query 1  Retrieve all the columns from the
vteamRoster view for only the batting leaders.
To accomplish this, create a query that joins the batting table
to the vteamRoster view using the playerID column for the join.
*/
SELECT v.*
FROM vteamRoster v
INNER JOIN batting b on b.playerID = v.playerID

/*Query 2 average weight of the batting leaders by division */
SELECT v.DivisionName as Division
, AVG(v.Weight) as 'averageWeight'
FROM vteamRoster v
INNER JOIN batting b on b.playerID = v.playerID
GROUP BY v.DivisionName


/*Query 3 -  returns all rows from the **vteamRoster** view */
SELECT *
FROM vteamRoster;



/* Query 4 - count the number of players within
the view by position*/
SELECT Position, COUNT(playerID) as positionCount
FROM vteamRoster
GROUP BY Position;
