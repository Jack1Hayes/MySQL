SELECT
	order_id,
    order_date,
    'Active' AS status
FROM orders
WHERE order_date >='2019-01-01'
UNION      -- Joins the 2 querys
SELECT
	order_id,
    order_date,
    'Archive' AS status
FROM orders
WHERE order_date <'2019-01-01'
