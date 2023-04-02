-- attempt #1

with total_expense as (
select category, product, sum(spend) as total_spent
from product_spend
where extract(year from transaction_date) = 2022
group by category, product
order by sum(spend) desc
), top_expense as (
select * , rank() over(partition by category order by total_spent desc) as top_rank
from total_expense)

select category, product, total_spent
from top_expense
where top_rank < 3
order by category, total_spent desc;