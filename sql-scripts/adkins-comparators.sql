-- people who are dead
select concat_ws(' ', firstName, lastName) as name, deceasedDate is NULL as isDeceased
from individual
where deceasedDate is NOT NULL;

-- people w/o birthdays
select concat_ws(' ', firstName, lastName) as name, birthDate is NULL as hasNoBirthday
from individual
where birthDate is NULL;

-- people w/ birthdays
select concat_ws(' ', firstName, lastName) as name, birthDate, birthDate is NULL as hasNoBirthday
from individual
where birthDate is NOT NULL;

-- born in 1940s
select concat_ws(' ', firstName, lastName) as name, birthDate
from individual
where Year(birthDate) between 1940 and 1949;

-- last name 'A' - 'D'
select concat_ws(' ', firstName, lastName) as name
from individual
where lastName between 'A' and 'E';

