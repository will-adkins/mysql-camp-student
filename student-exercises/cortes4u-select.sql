USE RockStarDay2;
/* exercise 1 */

SELECT * FROM Individual WHERE LastName = 'Jennings';

SELECT ID, LASTNAME FROM Individual WHERE DeceasedDate IS NOT NULL;

SELECT ID, LastName, BirthDate FROM Individual WHERE Year(BirthDate) > 1940;

SELECT * FROM Individual WHERE ID IN (1,3,5,7,19);

/* exercise 2 */

SELECT * FROM Band WHERE IsTogether = '0' and Genre = 'Alternative';

SELECT ID, Name FROM Band WHERE ID = 4;


/* exercise 3 */


SELECT * FROM Band WHERE Name LIKE ‘The%’;

SELECT * FROM Band WHERE Name LIKE ‘%Stones’;

SELECT * FROM Individual WHERE FirstName Like ‘__ck’;

SELECT * FROM Band WHERE Name LIKE '% and %';

SELECT * FROM Individual WHERE FirstName Like '___';

SELECT * FROM Band WHERE Name LIKE '%s';

/* exercise 4 joining */
select IB. *, I.FirstName, I.LastName
from IndividualBand as IB
inner join Individual as I ON IB.IndividualID = I.ID
where IB.BandID = 9;

select IB. *,B.Name , I.FirstName, I.LastName from IndividualBand IB
inner join Individual as I ON IB.IndividualID = I.ID
inner join Band as B on B.ID = IB.BandID
Where B.Name = 'Widespread Panic';
