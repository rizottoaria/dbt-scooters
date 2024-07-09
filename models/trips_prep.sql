select id, 
user_id,
	scooter_hw_id ,
	started_at ,
	finished_at ,
	start_lat ,
	start_lon ,
	finish_lat,
	finish_lon,
	distance distance_m,
	round(price/100,2) price_rub,
    extract(epoch from (finished_at -started_at)) duration_s,
    case when price=0 and extract(epoch from (finished_at -started_at))>0 then 1 else 0 end  is_free, 
 date(started_at) as date
     from {{ source("scooters_raw", "trips") }}

