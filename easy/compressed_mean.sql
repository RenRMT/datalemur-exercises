-- attempt #1

select sum(item_count * order_occurrences) / sum(order_occurrences) as mean from items_per_order;

-- attempt #2 (return decimal instead of integer)
select round(
sum(item_count::DECIMAL * order_occurrences) / sum(order_occurrences) 
, 1) as mean from items_per_order;
