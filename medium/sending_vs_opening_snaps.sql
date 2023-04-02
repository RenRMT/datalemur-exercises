-- attempt #1

with activity_times as (
select age_bucket,
sum(
case 
  when activity_type = 'open' 
  then time_spent end
  )
  as open_activity,
sum(
case
  when activity_type = 'send'
  then time_spent end
  )
  as send_activity
from activities
left join age_breakdown
on activities.user_id = age_breakdown.user_id
where activities.activity_type in ('open', 'send')
group by age_bucket )

select age_bucket,
round(
100.0 * send_activity / (send_activity + open_activity), 2)
as send_pct,
round(
100.0 * open_activity / (send_activity + open_activity), 2)
as open_pct
from activity_times;
