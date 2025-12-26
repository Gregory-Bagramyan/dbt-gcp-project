WITH ordered_products as (
    SELECT 
        product_id,
        product_name,
        product_category,
        product_sub_category,
        row_number() over (
            partition by product_id
            order by order_date desc
        ) as rn
    FROM {{ ref('stg_sales') }}
    WHERE product_id is not null
)

SELECT 
    product_id,
        product_name,
        product_category,
        product_sub_category
FROM ordered_products
WHERE rn = 1