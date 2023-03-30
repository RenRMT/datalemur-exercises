-- attempt #1

select user_id, 
extract(days from 
	max(post_date) - min(post_date)
) as days
from posts
group by user_id
having count(post_id) > 1;

-- attempt #2 (filter by year 2021)
select user_id, 
extract(days from 
	max(post_date) - min(post_date)
) as days
from posts
where extract(year from post_date) = 2021
group by user_id
having count(post_id) > 1;
