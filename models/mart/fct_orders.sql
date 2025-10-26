{{
    config(
        materialized = "table"
    )
}}
with stg_orders as (
    select distinct * from {{ ref('stg_orders') }} 
),
dim_customer as (
    select distinct customer_key, customer_id from {{ ref('dim_customer') }} 
),
fct_trip as (
    select distinct trip_key, trip_id from {{ ref('fct_trips') }} 
)
select distinct
    {{ dbt_utils.generate_surrogate_key(['order_id']) }} as order_key,
    stg_orders.order_id, 
    dim_customer.customer_key, 
    fct_trip.trip_key, 
    price_eur, 
    seat_no, 
    status
from stg_orders
left join dim_customer on stg_orders.customer_id=dim_customer.customer_id
left join fct_trip on fct_trip.trip_id=stg_orders.trip_id
