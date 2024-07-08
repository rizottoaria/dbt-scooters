SELECT 
count(distinct t.id) trips,count(distinct t.user_id) users,
avg(extract(epoch from (finished_at -started_at))/60) avg_duration_m,   
sum(t.price)/100 revenue_rub,
count(distinct t.id) filter (where t.price=0)*1.0/count(distinct t.id) free_trips_pct
FROM scooters_raw.trips t 
