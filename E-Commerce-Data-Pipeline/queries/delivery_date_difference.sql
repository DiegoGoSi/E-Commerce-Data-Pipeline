-- TODO: This query will return a table with two columns; State, and Delivery_Difference.
-- The first one will have the letters that identify the
-- states, and the second one the average difference between the estimate
-- delivery date and the date when the items were actually delivered to the
-- customer.

SELECT olist_customers.customer_state AS State, ROUND(AVG(JULIANDAY(olist_orders.order_estimated_delivery_date)-JULIANDAY(olist_orders.order_delivered_customer_date))+.2) AS Delivery_Difference
FROM olist_orders
JOIN olist_customers ON olist_orders.customer_id = olist_customers.customer_id
WHERE order_status='delivered'
GROUP BY State
ORDER BY Delivery_Difference