USE mavenfuzzyfactory;
SELECT 
website_sessions.utm_content,
COUNT(DISTINCT website_sessions.website_session_id) AS Session,
COUNT(DISTINCT orders.order_id) as NO_of_Order,
COUNT(DISTINCT orders.order_id)/COUNT(DISTINCT website_sessions.website_session_id) as No_order_con_rt
FROM website_sessions
LEFT JOIN orders
	ON orders.website_session_id=website_sessions.website_session_id
    
WHERE website_sessions.website_session_id BETWEEN 1000 AND 2000
GROUP BY
utm_content
ORDER BY COUNT(DISTINCT website_session_id) DESC;


SELECT 
utm_source,
utm_campaign,
http_referer,
COUNT(website_session_id)
FROM website_sessions
WHERE created_at<'2012-04-12'
GROUP BY 
utm_content,
utm_campaign,
http_referer
;
SELECT
COUNT(DISTINCT website_sessions.website_session_id) AS Sessions,
COUNT(DISTINCT orders.order_id) as Orders,
COUNT(DISTINCT orders.order_id)/COUNT(DISTINCT website_sessions.website_session_id) AS Session_to_Order_Conv_rate
FROM website_sessions
LEFT JOIN orders
	ON orders.website_session_id=website_sessions.website_session_id
WHERE website_sessions.created_at < '2012-04-14'
AND utm_source='gsearch'
AND utm_campaign='nonbrand';

USE mavenfuzzyFactory;
SELECT
website_session_id,
created_at,
MONTH(created_at),
WEEK(created_at),
YEAR(created_at)
FROM website_sessions
WHERE website_session_id BETWEEN 10000 AND 11500;


SELECT
YEAR(created_at),
WEEK(created_at),
COUNT(DISTINCT website_session_id) AS Sessions
FROM website_sessions
WHERE website_session_id BETWEEN 10000 AND 11500
GROUP BY 1,2;

-- use of CASE & COUNT 
SELECT
primary_product_id,
-- order_id,
-- items_purchased,
COUNT(DISTINCT CASE WHEN items_purchased=1 THEN order_id ElSE NULL END) AS Count_single_item_orders,
COUNT(DISTINCT CASE WHEN items_purchased=2 THEN order_id ELSE NULL END) AS Count_multiple_item_orders
FROM orders
WHERE order_id BETWEEN 31000 AND 32000
GROUP BY 1;
SELECT * FROM website_sessions;
SELECT 
-- YEAR(created_at) AS YEAR,
-- Week(created_at) AS WK, 
MIN(DATE(created_at)) AS WEEK_START_DATE,
COUNT( DISTINCT website_session_id) AS Sessions
FROM website_sessions
WHERE created_at <'2012-05-12'
AND utm_source='gsearch'
AND utm_campaign='nonbrand'
GROUP BY 
YEAR(created_at),
WEEK(created_at);

SELECT
website_sessions.device_type,
COUNT(DISTINCT website_sessions.website_session_id) as Sessions,
COUNT(DISTINCT orders.order_id) AS Orders,
COUNT(DISTINCT orders.order_id)/COUNT(DISTINCT website_sessions.website_session_id) AS Conv_rate_from_Session_ord
FROM website_sessions
LEFT JOIN orders
		ON orders.website_session_id=website_sessions.website_session_id
WHERE website_sessions.created_at <'2012-05-11'
AND utm_source='gsearch'
AND utm_campaign='nonbrand'
GROUP BY website_sessions.device_type;

SELECT 
MIN(DATE(created_at)) AS Week_Start_Date,
COUNT(CASE WHEN device_type='desktop' THEN website_session_id ELSE NULL END) AS dtop_Sessions,
COUNT(CASE WHEN device_type='mobile' THEN website_session_id ELSE NULL END) AS mob_Sessions
FROM website_sessions
WHERE created_at<'2012-06-09'
AND created_at>'2012-04-15'
AND utm_source='gsearch'
AND utm_campaign='nonbrand'
GROUP BY
YEAR(created_at),
WEEK(created_at);


