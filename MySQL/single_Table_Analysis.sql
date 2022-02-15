SELECT distinct
Length,
CASE
WHEN length <60 THEN 'under 1hr'
WHEN length BETWEEN 60 AND 90 THEN '1-1.5hr'
WHEN length >90 THEN 'over 1.5hr'
ELSE 'uh oh .....Check logic'
END AS length_bucket
FROM film;

SELECT distinct
title,
CASE
WHEN rental_duration<=4 THEN 'rental_too_short'
WHEN rental_rate>=3.99 THEN 'too_expensive'
WHEN rating in ('NC-17','R') THEN 'too_Adult'
WHEN length NOT BETWEEN 60 and 90 THEN 'too_Short_or_too_Long'
WHEN description Like '%shark%' THEN 'Nope_has_Shark'
ELSE 'great_Reco_for_my_niece'
END as fit_for_recomendation
FROM film;

SELECT 
first_name,
last_name,
CASE
WHEN store_id=1 AND active=1 THEN 'Store 1 Active'
WHEN store_id=1 AND active=0 THEN 'Store 1 Inactive'
WHEN store_id=2 AND active=1 THEN 'Store 2 Active'
WHEN store_id=1 AND active=0 THEN 'Store 2 Inactive'
else 'Not Found'
END as store_and_status
FROM customer;

SELECT
	film_id,
    COUNT(CASE WHEN store_id=1 THEN inventory_id ELSE NULL END) AS Store_1_inventory,
    COUNT(CASE WHEN store_id=2 THEN inventory_id ELSE NULL END) AS Store_1_inventory,
    COUNT(inventory_id) as total_copies
FROM inventory
GROUP BY film_id
ORDER BY film_id;

-- Pivoting the Data
SELECT
store_id,
COUNT(CASE WHEN active=1 THEN store_id ELSE NULL END) as Active,
COUNT(CASE WHEN active=0 THEN store_id ELSE NULL END) as inActive
FROM customer
GROUP BY store_id
ORDER BY store_id;




