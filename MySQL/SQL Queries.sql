use mavenmovies;

SELECT customer_id,
rental_date
FROM rental;

SELECT first_name,
last_name,
email
from customer;

SELECT DISTINCT rating FROM film;
SELECT DISTINCT rental_duration from film;

SELECT * FROM payment;

SELECT payment_id,
	rental_id,
    amount,
    payment_date
FROM payment
WHERE payment_date>'2006-01-01';

SELECT customer_id,
	rental_id,
    amount,
    payment_date
FROM payment
WHERE customer_id <101;

SELECT payment_id,
	rental_id,
    amount,
    payment_date
FROM payment
WHERE  amount =0.99 AND payment_date>'2006-01-01';

SELECT  customer_id,
	rental_id,
    amount,
    payment_date
from payment
WHERE customer_id<101 AND amount>5 AND payment_date>'2006-01-01';

SELECT customer_id,
	rental_id,
    amount,
    payment_date
FROM payment
WHERE (customer_id=42 and amount>5) OR 
(customer_id=53 and amount>5) or
(customer_id=60 and amount>5)or
(customer_id=70 and amount>5);

SELECT customer_id,
	rental_id,
    amount,
    payment_date
FROM payment
WHERE amount>5 AND 
customer_id IN (42,53,60,70);

SELECT customer_id,
	rental_id,
    amount,
    payment_date
FROM payment
WHERE 
customer_id IN (5,11,9);
SELECT 
Title,
Description
FROM film
WHERE description LIKE "%China";

SELECT title,
special_features
 From film
 WHERE special_features like ("%Behind the Scenes%");

SELECT 
Rating,
count(film_id)
FROM film
GROUP BY Rating;

SELECT
rental_duration,
COUNT(film_id) AS 'films_with_these_rental_duration'
FROM film
GROUP BY rental_duration;

SELECT replacement_cost,
       COUNT(film_id) as Number_of_films,
       min(rental_rate) as Cheapest_rental_rate,
       max(rental_rate) as Most_expensive_rental,
       avg(rental_rate) as Average_rental_rate
  FROM film
  GROUP BY replacement_cost;