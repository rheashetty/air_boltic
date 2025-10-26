{{
    config(
        materialized = "view",
        schema= "staging"
    )
}}
with source as (

    select 
    trip_id, 
    origin_city, 
    destination_city, 
    airplane_id, 
    start_time, 
    end_time
    from {{ source('public','trip') }}

)
select *
from source