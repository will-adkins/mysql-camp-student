select * from  band;

select distinct genre from band;

select distinct yearFormed, genre from band;

select distinct yearFormed from band;

select distinct isTogether from band;

select ID, genre, name from band;

select distinct genre, name from band;

-- Show a list of the actors that are listed in roles within the database. Don't repeat the name if they're in more than one role

select concat(a.firstName, ' ', a.lastName) as name
from role r
join actor a on r.actorID = a.ID;

select CURRENT_DATE();