-- attempt #1

SELECT card_name, max(issued_amount) - min(issued_amount) as issued_diff
from monthly_cards_issued
group by card_name;

-- attempt #2 (order according to biggest difference

SELECT card_name, max(issued_amount) - min(issued_amount) as issued_diff
from monthly_cards_issued
group by card_name
order by issued_diff desc;