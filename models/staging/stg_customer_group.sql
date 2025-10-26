{{
    config(
        materialized = "view",
        schema= "staging"
    )
}}
with source as (

    select 
    id as customer_group_id, 
    "type", 
    "name", 
    registry_no
    from {{ source('public','customer_group') }}

)
select *
from source