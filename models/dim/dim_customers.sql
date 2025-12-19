WITH raw_sales as (
    SELECT * FROM ancient-folio-481614-p3.test_raw_data.raw_sales_data
)

SELECT
    `Customer ID` as customer_id,
    `Customer Name` as customer_name,
    `Segment` as customer_segment,
    `Country` as customer_country,
    `City` as customer_city,
    `State` as customer_state,
    `Postal Code` as customer_postal_code,
    `Region` as customer_region
FROM raw_sales