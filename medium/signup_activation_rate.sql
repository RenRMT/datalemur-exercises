-- attempt #1

with activations as(
select user_id, 
case when texts.email_id is not null then 1 else 0 end as activation_no 
from emails
left join texts
on emails.email_id = texts.email_id
and signup_action = 'Confirmed'
)

select
round(1.0 * sum(activation_no) / count(user_id), 2) as activated_rate
from activations;
