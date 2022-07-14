SELECT *, coalesce(comments, 'N/A') -- same as IFNULL
FROM sql_store.orders;