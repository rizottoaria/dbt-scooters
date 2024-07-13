select
    t.id,
    t.user_id,
    scooter_hw_id,
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
    date,
    sex,
    extract(year from t.started_at) - extract(year from u.birth_date) as age
from {{ ref("trips_prep") }} t
left join {{ source("scooters_raw", "users") }} u on t.user_id = u.id
