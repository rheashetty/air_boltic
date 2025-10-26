{{
    config(
        materialized = "table"
    )
}}
with stg_aeroplane as (
    select distinct * from {{ ref('stg_aeroplane') }} 
),
master_aeroplane_model as (
    select distinct * from {{ ref('master_aeroplane_model') }}     
)
select distinct
    {{ dbt_utils.generate_surrogate_key(['stg_aeroplane.airplane_id']) }} as aeroplane_key,
    stg_aeroplane.airplane_id, 
    stg_aeroplane.airplane_model, 
    stg_aeroplane.manufacturer,
    case when master_aeroplane_model.airplane_model is not null then aeroplane_model_key else null end as master_aeroplane_model_key
from stg_aeroplane
left join master_aeroplane_model on upper(master_aeroplane_model.manufacturer)=upper(stg_aeroplane.manufacturer) and upper(master_aeroplane_model.airplane_model)=upper(stg_aeroplane.airplane_model)