-- attempt #1

select manufacturer, concat('$',
round(sum(total_sales) / 1000000),
' million') as sales from pharmacy_sales
group by manufacturer
order by sales desc;

--attempt #2 (order by total_sales rather than new field)
select manufacturer, concat('$',
round(sum(total_sales) / 1000000),
' million') as sales from pharmacy_sales
group by manufacturer
order by sum(total_sales) desc;
