{{
    config(
        materialized = "table"
    )
}}
with stg_aeroplane_model as (
    select distinct * from {{ ref('stg_aeroplane_model') }} 
),
stg_aeroplane as (
    select distinct * from {{ ref('stg_aeroplane') }} 
)
select distinct
    {{ dbt_utils.generate_surrogate_key(['stg_aeroplane_model.manufacturer','stg_aeroplane_model.airplane_model']) }} as aeroplane_model_key,
    stg_aeroplane_model.manufacturer,
    stg_aeroplane_model.airplane_model,
    stg_aeroplane_model.max_seats,
    stg_aeroplane_model.max_weight,
    stg_aeroplane_model.max_distance,
    stg_aeroplane_model.engine_type,
    case when stg_aeroplane.airplane_model is not null then 'True' else 'False' end as exists_on_platform
from stg_aeroplane_model
left join stg_aeroplane on upper(stg_aeroplane_model.manufacturer)=upper(stg_aeroplane.manufacturer) and upper(stg_aeroplane_model.airplane_model)=upper(stg_aeroplane.airplane_model)