-- attempt #1

with caller_country as (
select phone_calls.caller_id, phone_calls.receiver_id, phone_info.country_id as caller_country from phone_calls 
inner join phone_info
on phone_calls.caller_id = phone_info.caller_id
), all_country as (
select caller_country, phone_info.country_id as receiver_country from caller_country
inner join phone_info
on caller_country.receiver_id = phone_info.caller_id
)

select round(100.0 * sum(
case when caller_country != receiver_country then 1 else 0 end) /
count(caller_country), 1)
as international_calls
from all_country ;
