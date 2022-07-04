SELECT
    c.first_name,
    o.order_id,
    o.order_date,
    os.name AS status,
    sh.name AS shipper 
FROM customers c
JOIN orders o  
	ON o.customer_id = c.customer_id
JOIN order_statuses os  
	ON o.status = os.order_status_id
LEFT JOIN shippers sh
	ON o.shipper_id = sh.shipper_id
