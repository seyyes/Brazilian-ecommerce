WITH source AS (
    SELECT * FROM {{
        source('ecommerce_supply_chain_dataset', 'olist_orders_raw')
    }}
),
cleaned_order_data AS (
    SELECT 
        --Ids
        TRIM(order_id) AS order_id,
        TRIM(customer_id) AS customer_id,
        LOWER(TRIM(order_status)) AS order_status,
        --Dates
        SAFE_CAST(order_purchase_timestamp AS TIMESTAMP) AS purchase_ts,
        SAFE_CAST(order_approved_at AS TIMESTAMP) AS approved_ts,
        SAFE_CAST(order_delivered_carrier_date AS TIMESTAMP) AS delivered_carrier_ts,
        SAFE_CAST(order_delivered_customer_date AS TIMESTAMP) AS delivered_customer_ts,
        SAFE_CAST(order_estimated_delivery_date AS TIMESTAMP) AS estimated_delivery_ts
    FROM source
)
SELECT * FROM cleaned_order_data