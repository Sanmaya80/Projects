use mavenmovies;

/*1  My Partner and i want to come by each of your stores in person and meet the managers.please send over
the manager's name at each store, with full address of each property(street address,district,city and country please).*/
SELECT 
	staff.first_name AS first_name,
    staff.last_name AS last_name,
    address.address AS Address,
    address.district AS District,
    city.city,
    country.country
FROM store
	LEFT JOIN Staff ON store.manager_staff_id=staff.staff_id
    LEFT JOIN address ON store.address_id=address.address_id
    LEFT JOIN city ON address.city_id=city.city_id
    LEFT JOIN country ON city.country_id=country.country_id;
    
/* 2- i would like to get a better understanding of all the inventory that would come alongwith the business.
please pull together a list of each inventory item you have stocked, including the store_id number,the inventory_id, the name of the film,
the film's rating,its rental rate and replacement cost*/
SELECT
inventory.inventory_id AS Inventory_Item,
inventory.store_id AS Store_ID,
film.title AS film_Name,
film.rating AS film_Rating,
film.rental_rate As Film_rental_rate,
film.replacement_cost as Replacement_cost
FROM inventory
LEFT JOIN film
	ON inventory.film_id=film.film_id;

/* 3- from the same list of films you just pulled, please roll that data up and provide a summary 
level overview of you inventory.we would like to know how many inventory items you have with each rating at each store.*/
SELECT
inventory.store_id AS Store_ID,
film.rating AS film_Rating,
COUNT(inventory.inventory_id) AS Count_Inventory_Item
FROM inventory
LEFT JOIN film
	ON inventory.film_id=film.film_id
GROUP BY  inventory.store_id,film.rating;

/*4 Similarly,we want to understand how diversified the inventory is in terms of replacement cost. We want to se how big of a hit it would be 
if a certain category of film became unpopular at a certain store. We would like to see the number of films,as well as the average replacement cost,
and total replacement cost sliced by store and film category */

SELECT
store_id,
category.name AS Category_Name,
COUNT(inventory.inventory_id) AS No_FILMs,
AVG(film.replacement_cost) AS AVG_Replacement_cost,
SUM(film.replacement_cost) AS Total_replacement_cost
FROM inventory
LEFT JOIN film
		ON inventory.film_id=film.film_id
LEFT JOIN film_category
		ON film.film_id=film_category.film_id
LEFT JOIN category
		ON film_category.category_id=category.category_id
GROUP BY
store_id,
category.name;
        

/*5 We want to make sure you folks have a good handle on who your customers are.Please provide a list of all customer names,Which store they go
to,whether or not they are currently active, and their full addresses-street address,city and country */
SELECT
customer.first_name,
customer.last_name,
customer.store_id,
customer.active,
address.address,
city.city,
country.country
FROM customer
LEFT JOIN Address
		ON store.address_id=address.address_id
LEFT JOIN city
		ON address.city_id=city.city_id
LEFT JOIN country
		ON city.country_id=country.country_id;

/* 6 We would like to undestand how much you customers are spending with you, and also to know who your most valuable customers are.PLease pull together
a list of customer names, their total life time rentals and the sum of all payments you have collected from them.It would be great to see this ordered on 
total life time value, with most valuable customer ar the top of the list.*/
SELECT
customer.first_name,
customer.last_name,
COUNT(rental.rental_id) AS Total_Rental,
SUM(payment.amount) AS total_Payment_Amount
FROM customer
LEFT JOIN rental
	ON customer.customer_id=rental.customer_id
LEFT JOIN payment
	ON rental.rental_id=payment.rental_id
GROUP BY 
customer.first_name,
customer.last_name
ORDER BY SUM(payment.amount) DESC;

/* 7- My Partner  and i would like to get  to know you board of advisor  and any current investors. Could you please provide a list of advisor and investor names in the table?
Could you please note whether they are an investor or an advisor and for investors, it would be good to include which company they work with*/
use mavenmovies;
SELECT
'Investor' AS Type,
first_name,
last_name,
company_name
FROM investor

UNION

SELECT
'Advisor' as type,
first_name,
last_name,
null
FROM advisor;


/* We are interested in how well you have covered the most awarded actors.Of all the actors with three types of awards for what % of them do we  carry a film
? AND how about for actors with two types of awards?Same questions.Finally how about actors with just one award?*/







