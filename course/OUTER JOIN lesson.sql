SELECT
	c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
LEFT JOIN orders o     -- LEFT JOIN gets all customers from left (FROM) table RIGHT JOIN (JOIN) table
	ON o.customer_id = c.customer_id
