WITH source AS (
    SELECT * FROM {{ ref('int_olist_order_items_enriched') }}
),
final_data AS (
    SELECT 
        -- pk
        order_item_sk,

        -- fk
        order_id,
        product_id,
        seller_id,
        customer_id,
        customer_unique_id,

        -- Metrics
        price,
        freight_value,
        review_score,
        delivery_time_days,
        handling_time_days,
        delay_days,
        delivery_status,
        purchase_ts,

        --Business flags

        CASE 
        WHEN delay_days > 0 THEN 1
        ELSE 0
        END AS is_delayed, 
        CASE 
        WHEN delivery_time_days IS NOT NULL THEN 1
        ELSE 0
        END AS is_delivered

    FROM source
)
SELECT * FROM final_data