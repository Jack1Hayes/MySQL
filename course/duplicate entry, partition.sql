USE sakila;
select  user_id, name, email
 from(
	 Select* ,
	 row_number() over(partition by name order by user_id) as rn
	 From new_users
	 order by user_id) x
where x.rn > 1; 