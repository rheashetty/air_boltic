{{
    config(
        materialized = "view",
        schema= "staging"
    )
}}
with source as (

select
    manufacturer,
    airplane_model,
    model_data->>'max_seats' AS max_seats,
    model_data->>'max_weight' AS max_weight,
    model_data->>'max_distance' AS max_distance,
    model_data->>'engine_type' AS engine_type
from (
    select 
        manufacturer,
        airplane_model,
        model_data
    from {{ source('public','aeroplane_model') }},
    jsonb_each(data) as manufacturers(manufacturer, models),
    jsonb_each(models) as models_data(airplane_model, model_data)
) as t

)

select *
from source