SELECT *
FROM employee;

SELECT dept_name, max(salary) AS max_salary
FROM employee
group by dept_name;

SELECT e.*,
max(salary) over(partition by dept_name) as max_salary
FROM employee e;

-- row number

SELECT e.*,
row_number() over(partition by dept_name order by emp_id) as rn
FROM employee e;

-- RANK

SELECT e.*,
RANK() OVER(PARTITION BY dept_name ORDER BY salary DESC) AS rnk
FROM employee e;

-- DENSE RANK

SELECT e.*,
RANK() OVER(PARTITION BY dept_name ORDER BY salary DESC) AS rnk,
DENSE_RANK() OVER(PARTITION BY dept_name ORDER BY salary DESC) AS densernk
FROM employee e;

-- LEAD/LAG shows previous or next rows

SELECT e.*,
LAG(salary) OVER (PARTITION BY dept_name ORDER BY emp_id) as prev_emp_sal,
LEAD(salary) OVER (PARTITION BY dept_name ORDER BY emp_id) as next_emp_sal
FROM employee e;