{{
    config(
        materialized = "view",
        schema= "staging"
    )
}}
with source as (

    select 
    customer_id, 
    "name", 
    customer_group_id, 
    email, 
    phone
    from {{ source('public','customer') }}

)
select *
from source