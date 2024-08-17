select 
count(*) filter(where type='cancel_search')*1.0/
count(*) filter(where type='start_search') 
as cancel_pct 
from {{ref("events_full")}}