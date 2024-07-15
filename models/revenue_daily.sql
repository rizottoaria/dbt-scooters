select date, sum(price_rub) revenue_rub
from {{ ref("trips_prep") }} 
{% if is_incremental() %}
  where "date" >= (select max("date") - interval '2' day from {{ this }})
{% endif %}
group by 1
order by 1
