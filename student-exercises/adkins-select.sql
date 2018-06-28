USE rockStarDay2;
SHOW COLUMNS FROM band;

select ID, name, genre from band;

select * from individual where lastName = 'Jennings';

select ID, lastName from individual where deceasedDate is not null;

select ID, lastName, birthDate from individual where Year(birthDate) > 1940;

select * from individual where id in (1,3,5,7,19);

select * from band where genre = 'Alternative' and isTogether = 0;

select ID, name from band where ID = 4;