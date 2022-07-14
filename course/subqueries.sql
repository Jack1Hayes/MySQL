SELECT*
FROM employee
WHERE salary > (SELECT avg(salary) from employee);

-- Scalar subquery - most simple, 1 row and 1 column return

SELECT*
FROM employee e
JOIN (SELECT avg(salary) sal from employee) avg_salary
 ON e.salary > avg_salary.sal;
 
 -- Multiple row Subquery
 
 SELECT* 
 FROM employee
 WHERE (dept_name, salary) IN ( SELECT dept_name, max(salary)
								 FROM employee
								 GROUP BY dept_name);
                                 
-- single column multiple row

SELECT*
FROM department
WHERE dept_name NOT IN (SELECT DISTINCT dept_name
						FROM employee);

-- correlated subquery

SELECT AVG(salary) 
FROM employee
WHERE dept_name = 'specific_dept';

SELECT*
FROM employee e1
WHERE salary > (SELECT AVG(salary) 
				FROM employee e2
				WHERE e2.dept_name = e1.dept_name
                )
ORDER BY dept_name, salary;

SELECT*
FROM department d
WHERE dept_name NOT IN (SELECT dept_name
						FROM employee e
                        WHERE d.dept_name=e.DEPT_NAME);
                        
-- Nested subquery
WITH sales AS 
(SELECT store_name, sum(price) as total_sales
		FROM sales
		GROUP BY store_name)
SELECT *
FROM sales
JOIN (SELECT avg(total_sales) as sales
	FROM
		sales x) avg_sales
	On sales.total_sales > avg_sales.sales;

