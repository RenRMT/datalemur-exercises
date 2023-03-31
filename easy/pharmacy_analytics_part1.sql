-- attempt #1

with top_sales as
(select drug, total_sales - cogs as total_profit 
from pharmacy_sales
)
select * from top_sales
order by total_profit desc
limit 3;
