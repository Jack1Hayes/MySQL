SELECT 
	o.order_id,
    c.first_name,
    sh.shipper_id
FROM orders o
JOIN customers c
	USING (customer_id)  -- if join column is the same we can use using
LEFT JOIN shippers sh
	USING (shipper_id)