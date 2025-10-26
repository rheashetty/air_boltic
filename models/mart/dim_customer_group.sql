{{
    config(
        materialized = "table"
    )
}}
with stg_customer_group as (
    select distinct * from {{ ref('stg_customer_group') }} 
)
select distinct
    {{ dbt_utils.generate_surrogate_key(['customer_group_id']) }} as customer_group_key,
    customer_group_id, 
    "type", 
    "name", 
    registry_no
from stg_customer_group