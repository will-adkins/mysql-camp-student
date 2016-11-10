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

Select distinct
team.id,
team.teamname,
team.ABBR
from team
left join roster on team.ID = roster.teamid
where roster.playerid is not null order by abbr


select batting.battingavg
, batting.id
, team.teamname
from batting
inner join team on batting.teamid = team.id
order by battingavg desc


SELECT * FROM baseball.vbattingleaders
order by teamName, atBats asc

select Count(team.id) as BattingLeaderCount, team.teamname
from team
inner join batting on team.id = batting.teamid
group by team.teamname
having BattingLeaderCount > 1
order by BattingLeaderCount DESC

select Count(team.id) as BattingLeaderCount, team.teamname
from team
inner join batting on team.id = batting.teamid
group by team.teamname
having BattingLeaderCount > 1
order by BattingLeaderCount DESC

select count(*) as teamCount, teamid, team.teamname
from batting inner join
team on batting.teamid = team.id
group by teamID
order by teamCount desc

-- restricts to only show 'L'
select playerid, playername, bats, teamname
from vteamRoster
where Bats = "L"

select COUNT(PLAYERID), teamname
from vteamRoster
Where Bats = "L"
group by teamname

select count(playerID) as playercount, teamname
from vteamRoster
WHERE Bats = "L"
GROUP BY TeamName
HAVING playercount > 2
