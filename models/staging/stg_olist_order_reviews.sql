WITH source AS (
    SELECT * FROM {{source('ecommerce_supply_chain_dataset', 'olist_order_reviews_raw')}}
),
cleaned_order_reviews_data AS (
    SELECT 
        --Ids
        TRIM(review_id) AS review_id,
        TRIM(order_id) AS order_id,
        --Ratings
        SAFE_CAST(review_score AS INT64) AS review_score,
        --text
        TRIM(review_comment_title) AS review_comment_title,
        TRIM(review_comment_message) AS review_comment_message,

        --Dates
        SAFE_CAST(review_creation_date AS TIMESTAMP) AS review_creation_ts,
        SAFE_CAST(review_answer_timestamp AS TIMESTAMP) AS review_answer_ts
    FROM source
)

SELECT * FROM cleaned_order_reviews_data