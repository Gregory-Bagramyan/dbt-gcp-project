WITH raw_sales as (
    SELECT * FROM ancient-folio-481614-p3.test_raw_data.raw_sales_data
)

SELECT  
    `Product ID`as product_id,
    `Category`as product_category,
    `Sub-Category`as product_sub_category,
    `Product Name`as product_name
FROM raw_sales