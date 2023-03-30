-- attempt #1

select app_id,
round(
	100.0 * 
	sum(case when event_type = 'click' then 1 end )
	/
	sum(case when event_type = 'impression' then 1 end)
	, 2
) as ctr
from events
where extract(year from timestamp) = 2022
group by app_id;
