SELECT*
FROM customers
-- WHERE state = 'VA' -- comparison operaters >, >=, <, <=, =, !=
-- WHERE points > 3000
-- WHERE state != 'VA'
WHERE birth_date > '1990-01-01' AND points > 1000 -- AND, OR, NOT
