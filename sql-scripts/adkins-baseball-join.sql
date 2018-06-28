select * from player;
select * from roster;
select * from batting;
select * from team;


select team.ID, team.teamName, batting.teamID, batting.rank, batting.battingAvg
from team
left join batting on team.ID = batting.teamID
join roster on roster.teamID = team.ID;

select concat(player.firstName, ' ', player.lastName)
from team
left join batting on team.ID = batting.teamID
join roster on roster.teamID = team.ID
join player on player.ID = roster.playerID
where team.teamName = 'Boston Red Sox';

select * from vteamRoster;

describe vteamRoster;

show create view vteamRoster;


