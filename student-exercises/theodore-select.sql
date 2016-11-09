USE RockStarDay2;
SELECT * FROM Individual
WHERE LastName = 'Jennings';


SELECT ID, LASTNAME FROM Individual
WHERE DeceasedDate IS NOT NULL;

SELECT ID, LastName, BirthDate FROM Individual
WHERE Year(BirthDate) > 1940;


SELECT * FROM Individual
WHERE ID IN (1,3,5,7,19);

SELECT * FROM Band
WHERE Genre = 'Alternative' and IsTogether = 0;

SELECT ID, Name FROM Band
WHERE ID= 4;

SELECT YearFormed, COUNT(ID) as BandCount FROM Band
Group BY YearFormed
HAVING BandCount > 1;

Select ID, Name, Genre as BandGenre
FROM Band;

SELECT ID, Name FROM Band
WHERE Name LIKE 'Th_ Band';

SELECT * FROM Band
WHERE Name LIKE '% and %';

SELECT * FROM Individual
WHERE FirstName LIKE '_im';
