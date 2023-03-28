-- attempt #1
select sender_id, count(message_id) as message_count from messages
group by sender_id
order by message_count desc
limit 2;

-- attempt #2 (select month 8)
select sender_id, count(message_id) as message_count from messages
where extract(month from sent_date) = 8 and extract(year from sent_date) = 2022
group by sender_id
order by message_count desc
limit 2;
