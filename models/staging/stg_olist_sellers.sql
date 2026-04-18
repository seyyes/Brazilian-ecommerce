WITH source AS (
    SELECT * FROM {{source('ecommerce_supply_chain_dataset', 'olist_sellers_raw')}}
),
cleaned_seller_data AS (
    SELECT 
        --Ids
        TRIM(seller_id) AS seller_id,
        --Location
        TRIM(seller_zip_code_prefix) AS seller_zip_code_prefix,
        TRIM(LOWER(seller_city)) AS seller_city,
        TRIM(UPPER(seller_state)) AS seller_state
    FROM source
)
SELECT * FROM cleaned_seller_data