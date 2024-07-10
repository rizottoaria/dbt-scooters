select age, avg(trips) as avg_trips
from {{ ref("trips_age_daily") }}
group by age
order by age
