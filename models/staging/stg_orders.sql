{{
    config(
        materialized = "view",
        schema= "staging"
    )
}}
with source as (

    select 
    order_id, 
    customer_id, 
    trip_id, 
    price_eur, 
    seat_no, 
    status
    from {{ source('public','orders') }}

)
select *
from source