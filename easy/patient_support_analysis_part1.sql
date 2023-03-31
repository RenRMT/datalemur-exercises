-- attempt #1

with freq_callers as ( 
select policy_holder_id
from callers
group by policy_holder_id
having count(case_id) >2) 

select count(policy_holder_id) from freq_callers;
