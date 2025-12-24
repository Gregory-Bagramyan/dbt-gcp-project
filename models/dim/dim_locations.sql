with locations as (

    select
        country,
        state,
        city,
        postal_code,
        region
    from {{ ref('stg_sales') }}

    where country is not null

),

deduped as (

    select distinct
        country,
        state,
        city,
        postal_code,
        region
    from locations

)

select
    {{ dbt_utils.generate_surrogate_key([
        'country',
        'state',
        'city',
        'postal_code',
        'region'
    ]) }} as location_sk,

    country,
    state,
    city,
    postal_code,
    region

from deduped