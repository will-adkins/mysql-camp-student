
/*
Query 1

Retrieve all the columns from the vteamRoster
 view for only the batting leaders.
 To accomplish this, create a query that joins the batting table
 to the vteamRoster view using the playerID column for the join.
*/
select v.* from vteamRoster v
join batting b on b.playerID = v.playerID;


/*Query 2

Make a copy of the first query and place it below the first query.
Modify the new query to determine the
average weight of the batting leaders  by division.
*/
select v.DivisionName
, AVG(v.Weight) as 'avgWeight'
from vteamRoster v
join batting b on b.playerID = v.playerID
group by v.DivisionName;

/*
Query 3

Create a query that returns all rows
from just the vteamRoster view.

*/
Select *
from vteamRoster;

/*
Query 4

Create a query that counts the number of players within the vteamRoster view by position.

Hint, you will find that you have 4 right fielders (RF) and 2 center fielders (CF).
*/
select Position, count(playerID) as positionCount
from vteamRoster
group by Position;
