-- highest box office for Comedy movies with a female actor

select m.genre, m.title, Max(m.boxOffice)
from movie m
join role r on r.movieID = m.ID
join actor a on r.actorID = a.ID
where a.gender = 'F'
group by genre
having m.genre = 'Comedy';


-- return the average runtime of movies by genre, greater than 100 minutes

select m.genre, avg(m.runningTimeMinutes) as 'Average Run Time'
from movie m
group by m.genre
having avg(m.runningTimeMinutes) > 100;

-- show the average age of directors by genre with an average director age of greater than 60

select m.genre as genre, avg(year(now()) - d.born) as "Average Age"
from movie m 
join director d on d.ID = m.directorID
group by genre
having avg(year(now()) - d.born) > 60;



