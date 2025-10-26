{{
    config(
        materialized = "table"
    )
}}
with stg_trip as (
    select distinct * from {{ ref('stg_trip') }} 
),
dim_aeroplane as (
    select distinct aeroplane_key, airplane_id from {{ ref('dim_aeroplane') }} 
)

select distinct
    {{ dbt_utils.generate_surrogate_key(['trip_id']) }} as trip_key,
    stg_trip.trip_id, 
    origin_city, 
    destination_city, 
    aeroplane_key, 
    start_time, 
    end_time
from stg_trip
left join dim_aeroplane on stg_trip.airplane_id=dim_aeroplane.airplane_id
