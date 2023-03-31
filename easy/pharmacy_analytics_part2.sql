-- attempt #1

select manufacturer, count(drug), sum(total_sales - cogs) as total_neg_prof from pharmacy_sales
where total_sales - cogs <= 0
group by manufacturer
order by total_neg_prof asc;

-- attempt #2 (absolute values for losses)
select manufacturer, count(drug), abs(sum(total_sales - cogs)) as total_neg_prof from pharmacy_sales
where total_sales - cogs <= 0
group by manufacturer
order by total_neg_prof desc;
