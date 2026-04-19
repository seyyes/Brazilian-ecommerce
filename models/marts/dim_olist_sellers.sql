WITH source AS (
    SELECT * FROM {{ ref('stg_olist_sellers') }}
),
sellers AS (
    SELECT 
        -- pk
        seller_id,

        -- Attributes
        seller_zip_code_prefix,
        seller_city,
        seller_state
    FROM source
)
SELECT * FROM sellers