-- attempt #1
select city, count(order_id) as total_orders from trades
full outer join users
on trades.user_id = users.user_id
where status = 'Completed'
group by city
order by total_orders desc
limit 3;
