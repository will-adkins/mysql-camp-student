select * from band;
select * from individual;
select * from individualBand;

select name from band where yearFormed = 1960;

select count(ID) as "Bands Together" from band where isTogether= 1;

select isTogether, bandsTogether.togetherCount 
from (
select band.isTogether, count(band.ID) as togetherCount 
from band 
group by isTogether) as bandsTogether;

select genre, count(ID) as count
from band
group by genre;


select genre, count(ID) as count
from band 
group by genre
order by count DESC;

select genre, count(ID) as count
from band 
group by genre
order by genre DESC;

select b.name, count(ib.individualID) as "Number of Band Members"
from band b
join individualBand ib on b.id = ib.bandID
group by b.name
order by count(ib.individualID);

select b.name, count(ib.individualID) as "Number of Band Members"
from band b
join individualBand ib on ib.bandID = b.ID
group by b.name
order by b.name;

-- Count the number of members of each Rock band formed before 1970 in descending order by the count.

select b.name, count(ib.bandID) as "Number of Band Members"
from band b
join individualBand ib on b.ID = ib.bandID
where b.genre = "Rock" 
and b.yearFormed < "1970"
group by b.name
order by count(ib.individualID) DESC;

select b.name, b.genre
from band b
join individualBand ib on ib.bandID = b.ID
join individual i on ib.individualID = i.ID
where isTogether = 1
and i.deceasedDate is not null;

