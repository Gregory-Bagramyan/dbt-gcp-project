with date_spine as (

    select
        date_day
    from unnest(
        generate_date_array(
            date('2010-01-01'),
            date('2035-12-31'),
            interval 1 day
        )
    ) as date_day

)

select
    -- surrogate key
    cast(format_date('%Y%m%d', date_day) as int64) as date_sk,

    -- base date
    date_day,

    -- core calendar buckets
    extract(year from date_day)    as year,
    extract(quarter from date_day) as quarter,
    extract(month from date_day)   as month,

    -- behavioral flag
    extract(dayofweek from date_day) in (1, 7) as is_weekend,
    format_date('%A', date_day) as day_name,

from date_spine