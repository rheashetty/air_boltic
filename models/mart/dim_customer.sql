{{
    config(
        materialized = "table"
    )
}}
with stg_customer as (
    select distinct * from {{ ref('stg_customer') }} 
),
dim_customer_group as (
    select distinct customer_group_key, customer_group_id from {{ ref('dim_customer_group') }} 
)
select distinct
    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_key,
    customer_id, 
    "name", 
    customer_group_key, 
    email, 
    phone
from stg_customer
left join dim_customer_group on stg_customer.customer_group_id=dim_customer_group.customer_group_id