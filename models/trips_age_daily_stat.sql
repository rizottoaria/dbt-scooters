select age, avg(trips) as avg_trips,avg(revenue_rub) avg_revenue_rub 
from {{ ref("trips_age_daily") }}
group by age
order by age



