UPDATE invoices
SET 
	payment_total = invoice_total * 0.5,
	payment_date = '2019-1-01'
WHERE invoice_id = 1