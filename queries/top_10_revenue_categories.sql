-- TODO: This query will return a table with the top 10 revenue categories in
-- English, the number of orders and their total revenue. The first column will
-- be Category, that will contain the top 10 revenue categories; the second one
-- will be Num_order, with the total amount of orders of each category; and the
-- last one will be Revenue, with the total revenue of each catgory.

SELECT DISTINCT product_category_name_english AS Category, COUNT(DISTINCT order_id) AS Num_order, SUM (payment_value) AS Revenue
FROM 
 (SELECT product_id, order_id, product_category_name_english, payment_value, order_status, order_delivered_customer_date
 	FROM olist_products
	LEFT JOIN olist_order_items using (product_id)
	LEFT JOIN olist_orders using (order_id)
	LEFT JOIN product_category_name_translation using (product_category_name)
	LEFT JOIN olist_order_payments using (order_id)
	WHERE  olist_orders.order_status <> 'canceled' AND olist_orders.order_delivered_customer_date IS NOT NULL) top_revenue_cat
GROUP BY Category
ORDER BY Revenue DESC LIMIT 10