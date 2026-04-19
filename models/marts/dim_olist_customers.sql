WITH source AS (
    SELECT * FROM {{ ref('stg_olist_customers') }}
),
customers AS (
    SELECT 
        -- pk
        customer_unique_id,

        -- Attributes
        ANY_VALUE(customer_zip_code_prefix) AS zip_code_prefix,
        ANY_VALUE(customer_city) AS city,
        ANY_VALUE(customer_state) AS state
    FROM source
    GROUP BY customer_unique_id
)
SELECT * FROM customers