use RockStarDay2;

SHOW COLUMNS FROM Band;

mysql> select * from Individual where LastName = 'Jennings';


mysql> select ID, LastName from Individual where DeceasedDate is not null;


mysql> select ID, LastName, BirthDate from Individual where Year(BirthDate) > 1940;


mysql> select * from Individual where ID in (1,3,5,7,19);

mysql> select Name, YearFormed from Band where IsTogether = 0 and Genre = 'alternative';

mysql> select ID, Name from Band where ID = 4;
