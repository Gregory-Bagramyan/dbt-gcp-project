WITH raw_sales as (
    SELECT * FROM {{ source('raw', 'raw_sales') }}
)

SELECT
    CAST(`Order ID` as string) as order_id,
    PARSE_DATE('%d/%m/%Y', `Order Date`) as order_date,
    PARSE_DATE('%d/%m/%Y', `Ship Date`)as ship_date,
    CAST(`Customer ID` as string) as customer_id,
    CAST(`Customer Name` as string) as customer_name,
    CAST(`Segment` as string) as customer_segment,
    CAST(`Country` as string) as country,
    CAST(`City` as string) as city,
    CAST(`State` as string) as state,
    NULLIF(TRIM(CAST(`Postal Code` as string)), '') as postal_code,
    CAST(`Region` as string) as region,
    CAST(`Product ID` as string) as product_id,
    CAST(`Category` as string) as product_category,
    CAST(`Sub-Category` as string)as product_sub_category,
    CAST(`Product Name` as string) as product_name,
    CAST(`Sales` as float64) as sales
FROM raw_sales