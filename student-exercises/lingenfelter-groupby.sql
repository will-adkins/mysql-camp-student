--group by ex 1
/* Retrieve all the columns from the vteamRoster view for only the batting leaders. To accomplish this, create a query that joins the batting table to the vteamRoster view using the playerID column for the join. */
select v.teamName, v.PlayerName, v.weight, v.heightInches, b.battingAvg from vteamRoster as v left join batting as b on b.playerID = v.PlayerID where b.battingAvg is not null;
--or --
select v.*, b.* from vteamRoster as v  inner join batting as b on v.PlayerID = b.PlayerID;
/* Make a copy of the first query and place it below the first query. Modify the new query to determine the average weight of the batting leaders by division. */
select v.DivisionName, avg(v.weight) from vteamRoster as v inner join batting as b on b.PlayerID = v.PlayerID group by v.DivisionName;
/* select all rows from vteamRoster */
select * from vteamRoster;
/* Create a query that counts the number of players within the vteamRoster view by position. */
select Position, count(playerID) as positionCount from vteamRoster as v group by Position;
