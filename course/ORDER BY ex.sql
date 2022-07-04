SELECT*
FROM order_items
WHERE order_id = '2'
ORDER BY unit_price  * quantity DESC