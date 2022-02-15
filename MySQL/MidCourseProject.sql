-- we will need a list of all staff members,including their first and last names,email addresses and the store identification number where they work.
SELECT 
first_name,
last_name
emial,
store_id
FROM staff;

-- we will need separate counts of inventory items held at each of your two stores.
SELECT
store_id,
COUNT(inventory_id) as Count_inventory_Items
 FROM inventory
 GROUP BY store_id;
 
 -- we need a count of active customers for each of your stores separately, please.
 SELECT
 store_id,
 COUNT(customer_id) AS No_of_Customers
 FROM customer
 where  active=1
 GROUP BY store_id;
 
  
 -- inorder to acces liability of a data breach, we need you to provide  a count of all customer email addresses stored in a database.
 SELECT DISTINCT
 COUNT(email)
 FROM customer;
 
 /* we are interested in how diverse your film offering is as a means of understanding how likely you are to
 keep customer engaged in future. please provide a count of unique film titles you have in inventory at each store 
 and then provide  a count of the unique categories of films you provide*/
 SELECT distinct 
 store_id,
 COUNT(distinct film_id) AS Unique_films
 FROM inventory
 GROUP BY store_id;
 
 SELECT 
	COUNT(DISTINCT name) as unique_categories
    FROM category;
 
 
 
 
 
 /* we would like to understand the replacement cost of your films. Please provide the replacement cost for film that is list 
 expensive to replace, the most expensive to replace, and the average of all films you carry*/
 
 SELECT 
 MIN(replacement_cost) AS minimum_replacement_cost,
 MAX(replacement_cost) as maximum_replacement_cost,
 AVG(replacement_cost) as Average_replacement_cost
 FROM film;
 
 /* We are interested in having you put payment monitoring systems and maximum payment processing restriction
 in place in order to minimise the future risk of fraud by your staff. please provide the average payment you process,
 as well as the maximum payment you have processed. */
 
 SELECT 
 AVG(amount) AS average_payment_processed,
 MAX(amount) As maximum_payment_processed
 FROM payment;
 
 /* we would like to better understand what your customer base looks like.Please provide a list of all customer identification values, with  a 
 Count of rentals they have made all-time, with your highest volume customers as the top of the list. */
 
 SELECT
 customer_id,
 COUNT(rental_id) AS count_of_rental
 FROM rental
 GROUP BY customer_id
 ORDER BY COUNT(rental_id) DESC;
 
 
 