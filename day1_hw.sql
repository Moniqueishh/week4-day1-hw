-- 1. How many actors are there with the last name ‘Wahlberg’?

--2

SELECT * from actor;

SELECT last_name
FROM actor
WHERE last_name = 'Wahlberg';


-- 2. How many payments were made between $3.99 and $5.99?

--0 
--ALMOST WENT CRAZY WITH THIS ONE!!

SELECT * from payment;

SELECT amount
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99

SELECT customer_id, amount
from payment
WHERE amount > 3.99
order by amount ASC
LIMIT 25


-- 3. What film does the store have the most of? (search in inventory)

--There are alot that have 8 (193 for example)

SELECT * from inventory;


-- SELECT film_id
-- FROM inventory
-- GROUP BY film_id
-- -- order by count
-- Having count(film_id) > 7; 


select film_id, COUNT(film_id)
from inventory
GROUP BY film_id
order by COUNT DESC


-- 4. How many customers have the last name ‘William’?

--0

SELECT * from customer;

SELECT last_name
FROM customers
WHERE last_name = 'William';

-- 5. What store employee (get the id) sold the most rentals?

--Employee with staff_id: 1


SELECT * from rental;


SELECT count(staff_id)
FROM rental
GROUP BY staff_id

SELECT count(staff_id)
FROM rental
where staff_id = 1
GROUP BY staff_id

SELECT count(staff_id)
FROM rental
where staff_id = 2
GROUP BY staff_id


-- 6. How many different district names are there?
--378
SELECT * from address;

--How many of each disttrict 
SELECT district, COUNT(district)
FROM address
GROUP BY district
ORDER by count;


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
--film_id = 508


SELECT * from film_actor;

-- SELECT count(actor_id)
-- from film_actor
-- GROUP BY film_id
-- order by count(actor_id) desc

SELECT count(actor_id), film_id
FROM film_actor
GROUP BY film_id
ORDER BY count DESC




-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
--13 

SELECT * from customer;

SELECT last_name, count(last_name)
FROM  customer
WHERE store_id = 1
group BY last_name 
Having last_name like '%es';

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)
-- 38
SELECT * from payment;

SELECT amount, count(rental_id)
from payment
WHERE rental_id > 250
GROUP BY amount -- grouping by amount so it can show
ORDER BY count DESC

SELECT count(rental_id)
from payment
WHERE rental_id > 250
GROUP BY customer_id -- grouping by amount so it can show
Having customer_id between 380 and 430
ORDER BY count DESC


-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
--5 categories, and PG-13 has the most movie totals 


SELECT * from film;

SELECT rating, count(rating)
FROM film
GROUP BY rating