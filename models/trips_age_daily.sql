with
    cte as (
        select
           date,
            extract(year from t.started_at) - extract(year from u.birth_date) as age,price_rub revenue_rub
        from {{ref("trips_prep")}} t
        join  {{ source("scooters_raw", "users") }} as u on t.user_id = u.id
    )

select date, age, count(*) as trips,sum(revenue_rub) revenue_rub from cte 
group by 1, 2
