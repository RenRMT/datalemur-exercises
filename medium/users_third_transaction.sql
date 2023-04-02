-- attempt #1

with ordered as (
select user_id, spend, transaction_date, 
rank() 
over(partition by user_id 
order by transaction_date asc) 
from transactions)

select user_id, spend, transaction_date
from ordered
where ordered.rank = 3;