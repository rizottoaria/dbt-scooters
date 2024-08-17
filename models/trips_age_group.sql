
with cte as (
select 	id,
	user_id,
	scooter_hw_id ,
	started_at,
	finished_at,
	start_lat,
	start_lon,
	finish_lat,
	finish_lon,
	distance_m,
	price_rub,
	duration_s,
	is_free,
	"date",
	sex,
	age,a.group as age_group from {{ref("trips_users")}} t
    join {{ref("age_groups")}} a on t.age>=a.age_start and t.age<=a.age_end)
    select  age_group,count(*) trips, sum(price_rub) revenue_rub
    from cte
    group by 1
    