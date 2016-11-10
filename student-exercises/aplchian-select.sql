USE  RockstarDay2;

SHOW COLUMNS FROM Band;

SELECT * FROM Individual WHERE LastName='Jennings';
SELECT ID, LASTNAME FROM Individual WHERE DeceasedDate IS NOT NULL;
SELECT ID, LASTNAME, BIRTHDATE FROM Individual WHERE Year(Birthdate) > 1940;
SELECT * FROM Individual WHERE ID IN (1,3,5,7,19);
SELECT * FROM Band WHERE Genre = "Alternative" AND IsTogether = false;
SELECT ID, Name FROM Band WHERE ID = "4";
SELECT * FROM Band WHERE name LIKE '% and %';
SELECT * FROM Individual where firstname LIKE '_im';
SELECT * FROM Band WHERE name LIKE '%s';


Select player.LastName
, player.FirstName
, player.WeightLbs
, roster.playerID
, team.teamName
from  player
Inner Join roster on player.id = roster.playerID
Inner Join team on roster.teamID = team.ID
where teamName = 'Boston Red Sox'

Select *
from player
left join batting on player.ID = batting.playerID

Select *
from player
left join batting on player.ID = batting.playerID
