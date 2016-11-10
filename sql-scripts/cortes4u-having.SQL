USE baseball;

select COUNT(playerID) as CNT, Height
from vteamRoster where Height ='5-10'
group by Height
having CNT > 1;

select COUNT(playerID) as CNT, Weight
from vteamRoster where Weight ='230'
group by Height
having CNT > 1;


use RockStarDay2;

select COUNT(Name) as CNT, Genre
from BandMembers where  Genre ='Rock'
group by name
having CNT > 1;
