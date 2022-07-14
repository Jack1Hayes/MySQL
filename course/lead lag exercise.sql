SELECT *
FROM(
SELECT*,
case when temperature < 0
		and lead(temperature) over(order by id) < 0
		and lead(temperature, 2) over(order by id) < 0
	then 'YES'
    
    when temperature < 0
		and lag(temperature) over(order by id) < 0
		and lead(temperature) over(order by id) < 0
	then 'YES'
    
        when temperature < 0
		and lag(temperature) over(order by id) < 0
		and lag(temperature, 2) over(order by id) < 0
	then 'YES'
    
    
    ELSE NULL end flag
    
FROM weather) x

WHERE x.flag is not null