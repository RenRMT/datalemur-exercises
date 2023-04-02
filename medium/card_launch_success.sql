-- attempt #1

with ranked_cards as(
select card_name, issued_amount, 
rank() over(partition by card_name order by issue_year asc) as year_rank,
rank() over(partition by card_name order by issue_year, issue_month asc) as month_rank
from monthly_cards_issued
)
select card_name, issued_amount
from ranked_cards
where year_rank = 1 and month_rank = 1
order by issued_amount desc;
