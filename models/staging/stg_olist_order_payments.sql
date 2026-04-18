WITH source AS (
    SELECT * FROM {{source('ecommerce_supply_chain_dataset', 'olist_order_payments_raw')}}
),
cleaned_order_payments_data AS (
    SELECT 
        --Ids
        TRIM(order_id) AS order_id,
        --Payment details
        SAFE_CAST(payment_sequential AS INT64) AS payment_sequential,
        LOWER(TRIM(payment_type)) AS payment_type,
        SAFE_CAST(payment_installments AS INT64) AS payment_installments,
        SAFE_CAST(payment_value AS FLOAT64) AS payment_value
    FROM source
)
SELECT * FROM cleaned_order_payments_data