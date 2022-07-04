SELECT*
FROM order_items oi
JOIN order_item_notes oin
	USING (order_id, product_id)