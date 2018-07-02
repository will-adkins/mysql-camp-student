select m.title 
from movie m
where m.year > 1989 and m.year < 2000
order by m.title;

select m.genre as Genre, count(m.title) as "Movie Count"
from movie m
group by Genre;

select m.title, m.rottenTomatoes
from movie m
order by rottenTomatoes DESC;

select avg(genreCount.movieGenreCount) as averageGenreCount
from (
select m.genre as genre, count(m.title) as movieGenreCount
from movie m
group by genre
) as genreCount;

select d.name, count(m.directorID) as movieCount
from director d
join movie m on m.directorID = d.ID
group by d.name;

-- 6)  Count the number of actors for each movie.  Include the movie name and the actor count in the result.

select m.title, count(r.actorID) as actorCount
from movie m
join role r on m.ID = r.movieID
group by m.title;

-- 7)  Which comedy made the least money?  Hint:  `LIMIT` clause.

select m.title, m.boxOffice
from movie m
order by m.boxOffice
limit 1;

select concat(a.firstName, ' ', a.lastName) as name, r.roleName as role
from actor a
join role r on a.ID = r.actorID
where r.movieID = 10;

-- 9)  List all the actors that starred in movies before 1990.  Include the actor names, movie name, movie year, and role in the result.

select concat(a.firstName, ' ', a.lastName) as name, m.title, m.year, r.roleName as role
from role r
join actor a on a.ID = r.actorID
join movie m on m.ID = r.movieID
where m.year < 1990;

-- 10) List the movie name, year and director for each drama made after 1980.

select m.title, m.year, d.name
from movie m
join director d on d.ID = m.directorID
where m.genre = "Drama"
and m.year > 1980;

-- 11) What is the average rotten tomato's score by genre?-- 

select m.genre, AVG(m.rottenTomatoes) as averageScore
from movie m
group by m.genre;

-- 12) List movies, actors, and directors for movies that are between 10 and 20 years old.

select m.title, concat(a.firstName, ' ', a.lastName) as name, d.name
from movie m
join director d on d.ID = m.directorID
join role r on r.movieID = m.ID
join actor a on r.actorID = a.ID
where YEAR(NOW()) - m.year between 10 and 20;

-- 13)  list the movies, movie years, movie genres, and roles for Jack Nicholson.

select m.title, m.year, m.genre, r.roleName as "Jack Nicholson's role"
from movie m
join role r on r.movieID = m.ID
where r.actorID = 1;

-- 14)  Provide a list of directors who have made the most money.  Sort results by amount with the highest amounts at the top of the results.  Only one director name per row, please.

select d.name, m.boxOffice
from director d
join movie m on d.ID = m.directorID
order by m.boxOffice DESC;

-- 15)  Find the highest moving rating by genre.  Include the genre name, movie name, director name, and moving rating.  Only one genre per row in the result set.

select genre, title, name, MAX(scores) as "Top Rating"
from (
select m.genre as genre, m.title as title, d.name as name, m.rottenTomatoes as scores
from movie m
join director d on m.directorID = d.ID
order by m.genre, m.rottenTomatoes DESC
) as titles
group by genre;


select m.genre, m.title, d.name, MAX(m.rottenTomatoes)
from movie m
join director d on m.directorID = d.ID
group by m.genre;

