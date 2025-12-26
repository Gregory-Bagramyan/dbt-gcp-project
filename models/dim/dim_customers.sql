WITH ordered_customers as (

    SELECT
        customer_id,
        customer_name,
        customer_segment,
        order_date,

        row_number() over (
            partition by customer_id
            order by order_date desc
        ) as rn

    FROM {{ ref('stg_sales') }}

    WHERE customer_id is not null

)

SELECT
    customer_id,
    customer_name,
    customer_segment
FROM ordered_customers
WHERE rn = 1