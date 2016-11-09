USE  RockstarDay2;

SHOW COLUMNS FROM Band;

SELECT * FROM Individual WHERE LastName='Jennings';
SELECT ID, LASTNAME FROM Individual WHERE DeceasedDate IS NOT NULL;
SELECT ID, LASTNAME, BIRTHDATE FROM Individual WHERE Year(Birthdate) > 1940;
SELECT * FROM Individual WHERE ID IN (1,3,5,7,19);
