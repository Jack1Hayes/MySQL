SELECT o.order_id, product_id, unit_price, quantity
FROM order_items oi
JOIN orders o
	ON o.order_id = oi.order_id