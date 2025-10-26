{{
    config(
        materialized = "view",
        schema= "staging"
    )
}}
with source as (

    select 
    airplane_id, 
    airplane_model, 
    manufacturer
    from {{ source('public','aeroplane') }}

)
select *
from source