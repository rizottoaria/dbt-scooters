select
    count(distinct id) trips,
    count(distinct user_id) users,
    avg(duration_s) avg_duration_m,
    sum(price_rub) revenue_rub,
    sum(is_free) * 1.0 / count(*) free_trips_pct,
    sum(distance_m) / 1000 sum_distance_km
from {{ ref("trips_prep") }}
