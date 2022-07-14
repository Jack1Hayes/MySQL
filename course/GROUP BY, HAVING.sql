USE sql_store;

SELECT state, city, count(*)
FROM customers
GROUP BY state, city  -- aggregates rows with same value
-- HAVING count(*) > 1  -- filters results
ORDER BY count(*) DESC