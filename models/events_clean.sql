select distinct user_id, "timestamp", type_id
from {{ source("scooters_raw", "events") }}
{% if is_incremental() %} 
where timestamp < date '2023-08-01'
{% else %} 
where timestamp > (select max(timestamp) from {{ this }})
{% endif %}
