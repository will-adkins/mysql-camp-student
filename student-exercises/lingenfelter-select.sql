use RockStarDay2;

SHOW COLUMNS FROM Band;

mysql> select * from Individual where LastName = 'Jennings';


mysql> select ID, LastName from Individual where DeceasedDate is not null;

--ex 4
mysql> select ID, LastName, BirthDate from Individual where Year(BirthDate) > 1940;


mysql> select * from Individual where ID in (1,3,5,7,19);

mysql> select Name, YearFormed from Band where IsTogether = 0 and Genre = 'alternative';

mysql> select ID, Name from Band where ID = 4;

-- ex 5
select * from Band where Name like 'The%';
select * from Band where Name like '%Stones';
select * from Individual where FirstName like '_ck';
select * from Band where Name like '% and %';
select * from Individual where FirstName like '_im';
select * from Band where Name like '%s';

-- ex 1 JOINS
select b.playerID, p.FirstName, p.LastName, b.battingAvg from batting as b inner join player as p where b.playerID = p.ID and b.battingAvg = 331;
select p.*, r.* from player as p inner join roster as r on p.ID = r.PlayerID;
select p.*, r.*, t.* from player as p inner join roster as r on p.ID = r.PlayerID inner join team as t on r.teamID = t.ID where t.teamName = 'Boston Red Sox';

--ex 2 JOINS
select p.*, b.* from player as p left outer join batting as b on p.ID = b.playerID;
select r.*, t.* from roster as r left outer join team as t on r.teamID = t.ID;
select distinct r.teamID, t.teamName from roster as r left outer join team as t on r.teamID = t.ID where playerID is not null;
select team.ID, team.teamName, team.ABBR, roster.* from team left join roster on team.ID = roster.teamID where roster.ID is null;

--order by ex1
select t.teamName, b.BattingAvg, b.ID from batting as b left join team as t on t.ID = b.teamID order by b.BattingAvg DESC;
select FirstName, LastName, ABBR, Hits from vbattingleaders order by hits desc;
select FirstName, LastName, ABBR, Hits from vbattingleaders order by hits asc;
select FirstName, LastName, ABBR, Hits, AtBats from vbattingleaders order by ABBR, AtBats;
