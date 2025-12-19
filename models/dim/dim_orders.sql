WITH raw_sales as (
    SELECT * FROM ancient-folio-481614-p3.test_raw_data.raw_sales_data
)


SELECT
    `Order ID` as order_id,
    `Order Date` as order_date,
    `Ship Date` as ship_date
FROM raw_sales
