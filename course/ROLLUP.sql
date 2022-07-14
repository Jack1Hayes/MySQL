SELECT continent, country, city, sum(units_sold)
FROM sales
GROUP BY continent, country, city WITH ROLLUP
HAVING sum(units_sold) > 7000