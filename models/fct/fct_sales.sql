{{ config(
    partition_by = {
        "field": "order_date",
        "data_type": "date"
    },
    cluster_by = ["customer_id", "product_id"]
) }}

with sales as (

    select
        -- degenerate dimension
        order_id,

        -- business foreign keys
        customer_id,
        product_id,

        -- dates
        order_date,
        ship_date,

        -- location join fields
        country,
        state,
        city,
        postal_code,
        region,

        -- measure
        sales

    from {{ ref('stg_sales') }}

),

locations as (

    select
        location_sk,
        country,
        state,
        city,
        postal_code,
        region
    from {{ ref('dim_locations') }}

),

dates as (

    select
        date_sk,
        date_day
    from {{ ref('dim_dates') }}

)

select
    -- degenerate dimension
    s.order_id,

    -- foreign keys
    s.customer_id,
    s.product_id,
    l.location_sk,

    -- date foreign keys
    od.date_sk as order_date_sk,
    sd.date_sk as ship_date_sk,

    -- raw dates (kept intentionally)
    s.order_date,
    s.ship_date,

    -- measures
    s.sales

from sales s

-- location join
left join locations l
  on s.country = l.country
 and s.state = l.state
 and s.city = l.city
 and coalesce(s.postal_code, '__unknown__')
     = coalesce(l.postal_code, '__unknown__')
 and s.region = l.region

-- order date join
left join dates od
  on s.order_date = od.date_day

-- ship date join
left join dates sd
  on s.ship_date = sd.date_day