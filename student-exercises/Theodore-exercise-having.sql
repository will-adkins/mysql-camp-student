/*Create three select statements that use the GROUP BY and HAVING clause. Use any table or
 view from any of the databases created to this point. Feel free to create your own database
  and tables with data, if you desire.*/

SELECT MAX(batting.Hits), batting.playerID
FROM batting
JOIN player on player.ID = batting.playerID
WHERE batting.Hits > 165
GROUP BY batting.playerID
HAVING batting.playerID = 103;

SELECT AVG(batting.Runs) as BR, batting.teamID
FROM batting
JOIN team on team.ID = batting.teamID
GROUP BY batting.teamID
HAVING BR > 84;

SELECT player.ID, MIN(player.HeightInches) as minimumheight
FROM player
JOIN roster on roster.playerID = player.ID
GROUP BY player.ID
HAVING minimumheight = 74;
