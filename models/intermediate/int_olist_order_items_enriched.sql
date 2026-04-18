WITH order_items AS (
    SELECT * FROM {{ref('stg_olist_order_items')}}
),
orders AS (
    SELECT * FROM {{ref('stg_olist_orders')}}
),
reviews AS (
    SELECT 
        order_id,
        ANY_VALUE(review_score) AS review_score
    FROM {{ref('stg_olist_order_reviews')}}
    GROUP BY order_id
),
joined_data AS (
    SELECT 
        oi.order_item_sk,
        oi.order_id,
        oi.order_item_id,

        oi.product_id,
        oi.seller_id,

        oi.price,
        oi.freight_value,

        o.customer_id,
        o.order_status,
        o.purchase_ts,
        o.approved_ts,
        o.delivered_carrier_ts,
        o.delivered_customer_ts,
        o.estimated_delivery_ts,

        r.review_score
    FROM order_items oi
    INNER JOIN orders o ON oi.order_id = o.order_id
    LEFT JOIN reviews r ON oi.order_id = r.order_id
),
final_data AS (
    SELECT 
        *,
        --Delivery time in days
        CASE 
        WHEN delivered_customer_ts IS NULL OR purchase_ts IS NULL THEN NULL
        WHEN delivered_customer_ts < purchase_ts THEN NULL
        ELSE TIMESTAMP_DIFF(delivered_customer_ts, purchase_ts, DAY)
        END AS delivery_time_days,

        -- Seller handling time in days
        CASE 
        WHEN delivered_carrier_ts IS NULL OR approved_ts IS NULL THEN NULL
        WHEN delivered_carrier_ts < approved_ts THEN NULL
        ELSE TIMESTAMP_DIFF(delivered_carrier_ts, approved_ts, DAY)
        END AS handling_time_days,

        -- delay time in days
        CASE 
        WHEN delivered_customer_ts IS NULL OR estimated_delivery_ts IS NULL THEN NULL
        ELSE TIMESTAMP_DIFF(delivered_customer_ts, estimated_delivery_ts, DAY)
        END AS delay_days,

        --  delivery status classification
        CASE 
        WHEN delivered_customer_ts IS NULL THEN 'pending'
        WHEN delivered_customer_ts <= estimated_delivery_ts THEN 'on_time'
        ELSE 'delayed'
        END AS delivery_status

    FROM joined_data
)
SELECT * FROM final_data