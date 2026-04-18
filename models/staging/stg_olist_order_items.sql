WITH source AS (
        SELECT * FROM {{ source('ecommerce_supply_chain_dataset', 'olist_order_items_raw') }}
),
cleaned_order_items_data AS (
    SELECT 
        --Ids
        TRIM(order_id) AS order_id,
        SAFE_CAST(order_item_id AS INT64) AS order_item_id,
        TRIM(product_id) AS product_id,
        TRIM(seller_id) AS seller_id,
        {{ dbt_utils.generate_surrogate_key(['order_id', 'order_item_id']) }} as order_item_sk,
        --Dates
        SAFE_CAST(shipping_limit_date AS TIMESTAMP) AS shipping_limit_ts,
        --Quantities and prices
        SAFE_CAST(price AS FLOAT64) AS price,
        SAFE_CAST(freight_value AS FLOAT64) AS freight_value
    FROM source
)
SELECT * FROM cleaned_order_items_data