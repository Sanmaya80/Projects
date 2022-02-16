-- INNER JOIN

SELECT distinct
	inventory.inventory_id
FROM inventory
INNER JOIN rental
	on inventory.inventory_id=rental.inventory_id
LIMIT 5000;


SELECT 
inventory.store_id,
inventory.inventory_id,
film.title,
film.description
FROM film
	INNER JOIN inventory
    ON film.film_id=inventory.film_id;
    
    
-- LEFT JOIN    
SELECT DISTINCT
	inventory.inventory_id,
    rental.inventory_id
FROM inventory
	LEFT JOIN rental
		ON inventory.inventory_id=rental.inventory_id
LIMIT 5000;

SELECT
title,
Count(film_actor.actor_id) AS Number_of_Actor
FROM film
LEFT JOIN film_actor
		ON film.film_id=film_actor.film_id
GROUP BY title
LIMIT 5000;

SELECT 
	film.film_id,
    film.title,
    category.name AS category_name
FROM film
INNER JOIN film_category
	ON film.film_id=film_category.film_id
INNER JOIN category
	ON film_category.category_id=category.category_id
LIMIT 5000;

SELECT
actor.first_Name as First_Name,
actor.last_name as Last_Name,
film.title AS title
FROM actor
INNER JOIN film_actor
	ON actor.actor_id=film_actor.actor_id
INNER JOIN film
	ON film.film_id=film_actor.film_id
LIMIT 5000;

SELECT distinct
film.title As Title,
film.description As Description,
inventory.store_id As Store_ID
FROM film
INNER JOIN inventory
	ON film.film_id=inventory.film_id
    AND inventory.store_id=2;
    
use mavenmovies;    
SELECT 
	'advisor' AS type,
    first_name,
    last_name
FROM advisor

UNION

SELECT 
	'investor' AS type,
    first_name,
    last_name
FROM investor;

SELECT 
'advisor' AS type,
first_name,
last_name
FROM advisor
UNION
SELECT
'Staff' as Type,
first_name,
last_name
From staff;



 
