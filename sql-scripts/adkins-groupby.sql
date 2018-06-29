select * from vteamRoster;

select * from vteamRoster
join batting on batting.playerID = vteamRoster.playerID;

select v.divisionName, AVG(v.Weight)  from vteamRoster v
join batting b on b.playerID = v.playerID
GROUP BY  v.divisionName;

select v.position, COUNT(v.playerID) 
from vteamRoster v
group by v.position;

