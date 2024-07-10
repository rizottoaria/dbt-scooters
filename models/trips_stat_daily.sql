select t.date,
count(distinct id) trips ,max(price_rub) max_price_rub,avg(distance_m/1000) avg_distance_km,
avg(price_rub) / avg(duration_s) * 60 as avg_price_rub_per_min
  from {{ref("trips_prep")}} t 
group by date 
order by 1