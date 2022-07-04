USE sql_invoicing;

SELECT
p.date,
c.name AS 'client',
p.amount,
pm.name AS 'payment method'
FROM payments p
JOIN clients c
	USING (client_id)
LEFT JOIN payment_methods pm
	ON pm.payment_method_id = p.payment_method
