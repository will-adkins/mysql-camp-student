# Exercise 2

USE RockStarDay2;

SHOW COLUMNS FROM Band;

SELECT ID, Name, Genre FROM Band;

# Exercise 3

SELECT * FROM Individual WHERE LastName = 'Jennings';

SELECT ID, LASTNAME FROM Individual WHERE DeceasedDate IS NOT NULL;

SELECT ID, LastName, BirthDate FROM Individual WHERE Year(BirthDate) > 1940;

SELECT * FROM Individual WHERE ID IN (1,3,5,7,19);

# Exercise 4

# Create a query that provides a list of alternative bands that have broken up
SELECT * FROM Band WHERE Genre = 'Alternative' AND IsTogether = 0;

#Create a query that provides the id and name of the band with an ID of 4
SELECT ID, Name FROM Band WHERE ID = 4;

