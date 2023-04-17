-- TODO: This query will return a table with two columns; order_status, and
-- Ammount. The first one will have the different order status classes and the
-- second one the total ammount of each.

SELECT olist_orders.order_status, COUNT(olist_orders.order_status) AS Ammount
FROM olist_orders
GROUP BY olist_orders.order_status