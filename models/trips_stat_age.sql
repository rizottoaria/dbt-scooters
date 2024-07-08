 with cte as (
 select round((started_at::date-birth_date)/365,0) as age,started_at::date date,count(distinct t.id) as trips from scooters_raw.trips t 
join scooters_raw.users u on u.id=t.user_id 
group by round((started_at::date-birth_date)/365,0),date)

select age,avg(trips) as avg_trips  from cte
group by age
order by 1