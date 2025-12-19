WITH raw_sales as (
    SELECT * FROM ancient-folio-481614-p3.test_raw_data.raw_sales_data
)

SELECT 
    `Row ID` as row_id,
    `Order ID` as order_id,
    `Customer ID` as customer_id,
    `Product ID` as product_id,
    `Sales` as sales
FROM raw_sales