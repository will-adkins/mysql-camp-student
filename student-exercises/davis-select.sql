USE RockStarDay2;

SHOW COLUMNS FROM Band;
-- exercise 3

SELECT * FROM Individual
WHERE LastName='Jennings';

SELECT ID, LastName FROM Individual WHERE DeceasedDate IS NOT NULL;

SELECT ID, LastName, BirthDate FROM Individual WHERE YEAR(BirthDate) > 1940;

SELECT * FROM Individual WHERE ID IN (1,3,5,7,19);

-- Create a query that provides a list of alternative bands that have broken up.
SELECT * FROM Band WHERE Genre='Alternative' and IsTogether = 0;

-- Create a query that provides the id and name of the band with an ID of 4
SELECT ID, Name FROM Band WHERE ID=4;

-- HAVING and GROUP BY are friends
SELECT YearFormed, COUNT(ID) as BandCount
FROM Band GROUP BY YearFormed HAVING BandCount >1;

SELECT ID, Name, Genre as BandGenre FROM Band;
Select * FROM Individual Where FirstName LIKE '__ck';

Select * FROM Band WHERE Name Like 'The%';

SELECT * FROM Band WHERE Name LIKE '%Stones';

--Find all bands that have an ‘and’ in the middle of their band name like ‘Jason and the Scorchers’.
SELECT * FROM Band WHERE Name LIKE '% and %';
--Find people who have a three letter first name that is like ‘Tim’ or ‘Kim’ or ‘Jim’.
SELECT * FROM Individual WHERE FirstName LIKE '_im';
--Find all bands that end with ‘s’ like ‘The Beatles’ or ‘The Rolling Stones’ or ‘Pixies’.
SELECT * FROM Band Where Name LIKE '%s';
