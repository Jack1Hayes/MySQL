SELECT*
FROM customers
-- WHERE last_name LIKE '%field%'   -- same as:
WHERE last_name REGEXP ' field'    -- ^x begining of a string, $x end of a string, 
-- x|y|z search for n, [a-h]y string must come in [] position y