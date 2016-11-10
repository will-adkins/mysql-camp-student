/* create select stamements with group by and having. */
-- batting leaders grouped by division having avg weight over 210.
select v.DivisionName, avg(v.weight) from vteamRoster as v inner join batting as b on b.PlayerID = v.PlayerID group by v.DivisionName having avg(v.weight) > 210.0;

--select team with batting average less than 330
elect team.teamName, count(team.ID), avg(batting.battingAvg) from batting inner join team on team.ID = batting.teamID group by team.teamName having avg(batting.battingAvg) < 330;

-- select count of players group by birth country with count greater than 1
select count(ID), BirthplaceCountry from player group by BirthplaceCountry having count(ID) > 1;
