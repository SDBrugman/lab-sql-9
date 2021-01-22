USE sakila;

-- 1 --
Select * from rental;

SELECT *, MONTHNAME(rental_date) AS month
from rental
#group by MONTHNAME(rental_date);
WHERE MONTHNAME(rental_date) = 'June';

drop table if exists rentals_may;

CREATE TABLE `rentals_may` LIKE `rental`;

Select * from rentals_may;

TRUNCATE TABLE rentals_may;

-- 2 --
INSERT INTO rentals_may SELECT * FROM rental
WHERE DATE_FORMAT(rental_date, "%M")='May';

-- 3 --
drop table if exists rentals_june;

CREATE TABLE `rentals_june` LIKE `rental`;

Select * from rentals_june;

TRUNCATE TABLE rentals_june;

-- 4 --
INSERT INTO rentals_june SELECT * FROM rental
WHERE DATE_FORMAT(rental_date, "%M")='June';

-- 5 --
SELECT c.first_name, c.last_name, r.rental_date, count(r.rental_id) AS nr_of_rentals
FROM rentals_may as r
join customer as c
on r.customer_id = c.customer_id
group by c.last_name
order by nr_of_rentals DESC;

-- 6 --
SELECT c.first_name, c.last_name, r.rental_date, count(r.rental_id) AS nr_of_rentals
FROM rentals_june as r
join customer as c
on r.customer_id = c.customer_id
group by c.last_name
order by nr_of_rentals DESC;
