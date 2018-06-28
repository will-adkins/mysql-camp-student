USE rockStarDay2;
SHOW COLUMNS FROM band;

select ID, name, genre from band;

select * from individual where lastName = 'Jennings';

select ID, lastName from individual where deceasedDate is not null;

select ID, lastName, birthDate from individual where Year(birthDate) > 1940;

select * from individual where id in (1,3,5,7,19);

select * from band where genre = 'Alternative' and isTogether = 0;

select ID, name from band where ID = 4;

-- show the names and band of all the individuals who are in alternative bands formed after 1970

select individual.firstName, individual.lastName, band.name
from individualBand
join band on individualBand.bandID = band.ID
join individual on individualBand.individualID = individual.ID
where band.genre = 'Rock' and band.yearFormed > '1970';

select * from band
where name LIKE '% and %';
 
 select * from individual
 where firstName LIKE 'Tim%' 
 or firstName LIKE 'Kim%'
 or firstName LIKE 'Jim%'
 
 select * from band
 where name LIKE '%s';
 
 