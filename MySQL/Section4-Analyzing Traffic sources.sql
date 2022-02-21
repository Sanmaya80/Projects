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
