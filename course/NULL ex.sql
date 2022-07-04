SELECT*
FROM orders
WHERE shipped_date IS NULL OR shipper_id IS NULL