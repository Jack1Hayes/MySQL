SELECT ABS(units_sold DIV 7), POW(units_sold, 2), MOD(units_sold, 7)
FROM sales
