-- attempt #1

with ranked_measurements as(
select *, date(measurement_time) as measurement_day,
rank() over(partition by extract(day from measurement_time) order by measurement_time) as measurement_rank
from measurements
)

select measurement_day,
sum( 
case when measurement_rank % 2 != 0 then measurement_value else 0 end)
as odd_measurement,
sum(
case when measurement_rank % 2 = 0 then measurement_value else 0 end)
as even_measurement
from ranked_measurements
group by measurement_day
order by measurement_day;