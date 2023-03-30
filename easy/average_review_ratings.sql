-- attempt #1

select extract(month from submit_date) submit_month, product_id, round(avg(stars), 2) as avg_stars 
from reviews
group by submit_month, product_id
order by submit_month, product_id asc;
