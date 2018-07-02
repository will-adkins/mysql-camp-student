select * from vteamRoster;

select * from vteamRoster
join batting on batting.playerID = vteamRoster.playerID;

select v.divisionName, AVG(v.Weight)  from vteamRoster v
join batting b on b.playerID = v.playerID
GROUP BY  v.divisionName;

select v.position, COUNT(v.playerID) 
from vteamRoster v
group by v.position;

select Division, MIN(teamCount) as "min team count" from (select divisionName as Division, count(ID) as teamCount
from team t group by divisionName) as minTeamCount;

select divisionName, count(ID)
from team t
where divisionName = "NL West"
group by t.divisionName;


