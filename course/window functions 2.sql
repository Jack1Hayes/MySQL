SELECT * 
FROM product;

-- FIRST VALUE/LAST VALUE , if using both you need a frame clause to repartition
SELECT p.*,
FIRST_VALUE(product_name) 
	over(partition by product_category order by price DESC) as Most_Expensive,
LAST_VALUE(product_name) 
	over(partition by product_category order by price DESC 
		RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as Least_Expensive
FROM product p;

-- ALTERNATIVE WRITING (creating an aliace for functions)
SELECT p.*,
FIRST_VALUE(product_name) 
	over(W) as Most_Expensive,
LAST_VALUE(product_name) 
	over(W) as Least_Expensive
FROM product p
WINDOW W AS (partition by product_category order by price DESC RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING);

-- Nth VALUE

SELECT p.*,
FIRST_VALUE(product_name) 
	over(W) 
		as Most_Expensive,
LAST_VALUE(product_name) 
	over(W 
		RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) 
			as Least_Expensive,
NTH_VALUE(product_name, 2) 
	OVER (W 
		RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) 
			AS Second_Most_Expensive
FROM product p
WINDOW W AS (partition by product_category order by price DESC);

-- N TILE
-- seperating expensive, mid range, cheap into equal 'buckets'

SELECT *,
NTILE(3) OVER(ORDER BY price DESC) AS bucket
FROM product
WHERE product_category = 'Phone';

-- CUME_DIST

SELECT*,
CUME_DIST() OVER(ORDER BY price DESC) AS cume_distrib,
round(CUME_DIST() OVER(ORDER BY price DESC),3)*100 AS cume_distrib_percentage
FROM product;

-- PERCENT_RANK

SELECT*,
PERCENT_RANK() OVER(ORDER BY price DESC) AS pers_rank,
round(PERCENT_RANK() OVER(ORDER BY price DESC),3)*100 AS pers_rank
FROM product

