-- attempt #1

select user_id, tweet_date, round(avg(count(tweet_id))
over(order by tweet_date rows between 2 preceding and current row), 2)
as rolling_avg
from tweets 
group by user_id, tweet_date
order by user_id,tweet_date;

/* attempt #2 (had to partition by user_id in the 
over() function.
*/

select user_id, tweet_date, round(avg(count(tweet_id))
over(partition by user_id order by tweet_date rows between 2 preceding and current row), 2)
as rolling_avg
from tweets
group by user_id, tweet_date
order by user_id, tweet_date;