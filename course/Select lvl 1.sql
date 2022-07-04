SELECT 
	first_name, 	
    last_name, 
	points, 
    points * 10 + 100 AS 'discount factor' -- AS changes name of field
FROM customers      
-- SELECT DISTINCT returns table results but without duplicats