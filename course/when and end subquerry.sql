select distinct repeated_names
from (
	select *,
	case when user_name = lead(user_name) over(order by login_id)
		and  user_name = lead(user_name, 2) over(order by login_id)
	then user_name else null end as repeated_names
	from login_details) x
where x.repeated_names is not null;