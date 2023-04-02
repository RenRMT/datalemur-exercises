-- attempt #1

with ranked_transactions as(
select user_id, product_id, rank() over(partition by user_id order by transaction_date desc) as transaction_rank
from user_transactions
)

select transaction_date, user_id,
count(product_id) as total_products
from ranked_transactions
where transaction_rank = 1
group by transaction_date, user_id
order by transaction_date asc;

-- attempt #2 (forgot transaction date in cte)
with ranked_transactions as(
select transaction_date, user_id, product_id, rank() over(partition by user_id order by transaction_date desc) as transaction_rank
from user_transactions
)

select transaction_date, user_id,
count(product_id) as total_products
from ranked_transactions
where transaction_rank = 1
group by transaction_date, user_id
order by transaction_date asc;