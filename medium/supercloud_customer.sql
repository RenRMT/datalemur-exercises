-- attempt #1

with customer_products as (
select customer_id, count(distinct(product_category)) as product_no from customer_contracts
right join products
on customer_contracts.product_id = products.product_id
group by customer_id
)

select customer_id from customer_products
where product_no = 3;