-- attempt #1

with ranked_orders as(
select *, rank() over(order by order_occurrences desc) as order_rank
from items_per_order
)
select item_count from ranked_orders
where order_rank = 1
order by item_count asc;