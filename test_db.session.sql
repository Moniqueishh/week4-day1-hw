-- THIS IS A COMMENT 
--Have to use single quotes '', not ""

SELECT * --Give me everything (the what)
FROM actor; --from where?

SELECT first_name, last_name
from actor

--WHERE Clause
--How we filter out the result of our conditonals
SELECT first_name, last_name
from actor
WHERE first_name = 'Pedro';

--We can use LIKE instead of = for strings
SELECT first_name, last_name
from actor
WHERE first_name LIKE 'Pedro';

--Wildcards for use with like:  __ and %
-- % is a true wildcard - any character AND number of characters
-- _ is one character wildcard

SELECT first_name, last_name
from actor
WHERE first_name like 'P%';

--3 underscores means starts with J and 3 letters...
SELECT first_name, last_name
from actor
WHERE first_name like 'J___';


SELECT first_name, last_name
from actor
WHERE first_name like 'J__%';

-- Comparison operators:
-- * and like examples above

-- Greater/Less  >  <  <=  >= all valid as usual
--Not equal is <>

SELECT *
from  address;

SELECT *
from address
where district like 'Texas';

SELECT * from  payment;

--You can select as many as you want, you need to have the exact column name
SELECT customer_id, amount
from payment
WHERE amount > 2;

--query customers who paid less than 7.99
SELECT customer_id, amount
from payment
WHERE amount <= 7.99;

-- We can use OR AND with the WHERE clause 
SELECT customer_id, amount
from payment
WHERE amount <= 7.99 AND amount > 0;

--OR
SELECT customer_id, amount
from payment
WHERE amount > 2 OR amount > 7.99;

--BETWEEN
SELECT customer_id, amount
from payment
WHERE amount BETWEEN 0 AND 7.99;

--ORDER BY -- How we want our info ordered********
SELECT customer_id, amount
from payment
WHERE amount BETWEEN 0 AND 7.99
ORDER BY amount DESC; --Descending (default)

--ASC is ascending 
SELECT customer_id, amount
from payment
WHERE amount BETWEEN 0 AND 7.99
ORDER BY amount ASC; 

-- NOT EQUAL
SELECT customer_id, amount
from payment
WHERE amount <> 0.00
ORDER BY amount ASC;

SELECT * from customer; --Checking out the customer table 

SELECT first_name, last_name
from customer 
WHERE customer_id = 341;

--SQL aggregations = > SUM(), AVE(), COUNT(), MIN(), MAX()

--query to show the sum of amounts greater than 3.00
SELECT SUM(amount)
from payment
where amount > 5.99;

--same, but averages 
SELECT AVG(amount)
from payment
where amount > 5.99;

--count- Its counting all amounts in the column, like entries for column
SELECT count(amount)
from payment;

select * from payment;

--Individual amounts/ unique amounts
select count(distinct amount)
from payment
where amount > 5.99;

--query to display MIN amount greater than 6.99
select min(amount)
from payment
where amount > 6.99;

--query to display Max amount greater than 6.99
select max(amount)
from payment
where amount > 6.99;


--AS- defining what we want this column to be called
select max(amount) as Biggest_over_7
from payment
where amount > 6.99;

--Group BY
--Any column not in aggregate must be in group by used un conjunction
--with aggregates to modify behaviior or aggregate groups rows 

SELECT amount, count(amount), sum(amount)
from payment
GROUP BY amount -- grouping by amount so it can show
ORDER BY sum(amount) desc; -- grouping by amount, sorting by smallest sum


--bring it back to mre straight-forward example 
SELECT amount
from payment
WHERE amount = 6.99;

select amount, count(amount)
from payment
GROUP BY amount
order by amount;

--looking at customer id with summed amounts for those id's
select customer_id, SUM(amount)
from payment
GROUP BY customer_id
order by customer_id desc; --Highest customer ID to lowest 

select customer_id, amount
from payment
GROUP BY amount, customer_id
order by customer_id desc;

SELECT customer_id, sum(amount)
from payment
GROUP BY customer_id
ORDER BY customer_id; -- have to group by before you order by

-- query to look at customer id's that show more than 5 times
-- query display cus_ids that show up >5
SELECT count(customer_id), email -- where we modify our aggregate 
from customer
where email like 'j__.w%' --where is where we modify our normal column
GROUP BY email
Having count(customer_id) > 0; 
-- having is to aggregate as WHERE is to a column 


SELECT customer_id, SUM(amount) --What you want to see
from payment --From where?
-- these are basic buidlding blocks
Where customer_id BETWEEN 70 and 80 --How?
GROUP BY customer_id --using aggregates 
having sum(amount) --this is the how for aggregates or filter 
ORDER BY customer_id --- How you want them ordered
Limit 2 ----How many results do you want to see?

SELECT *
from payment
LIMIT 50;

--Clauses we've talked about so far-----------
--SELECT <columns> <aggregates>
--FROM <table>
--WHERE <conditional>
--GROUP BY <columns>
--?HAVINGS? <conditional>
--ORDER BY <columns>