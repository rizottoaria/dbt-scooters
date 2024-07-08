select started_at::date date,
count(distinct id) trips ,max(price/100) max_price_rub,avg(distance/1000) avg_distance_km  from scooters_raw.trips t 
group by started_at::date 
order by 1