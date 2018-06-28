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

select * from player
left join batting on player.ID = batting.playerID;

select * from roster
right join team on roster.teamID = team.ID;

select *
from roster
right join team on roster.teamID = team.ID;

select *
from roster
right join team on roster.teamID = team.ID
where roster.teamID is not null;

select * from team
left join roster on team.ID = roster.teamID
where roster.playerID is NULL;

select batting.battingAvg, batting.ID, team.teamName
from team
join batting on batting.teamID = team.ID
order by batting.battingAvg;

select * from baseball.vbattingleaders;

select concat(firstName, ' ', lastName) as name, ABBR, hits
from vbattingleaders
order by hits DESC;

select concat(firstName, ' ', lastName) as name, ABBR, hits
from vbattingleaders
order by hits;

select *
from vbattingleaders
order by teamName ASC, atbats DESC;


