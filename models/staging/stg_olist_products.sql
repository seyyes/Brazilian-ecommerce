WITH source AS (
    SELECT * FROM {{source('ecommerce_supply_chain_dataset', 'olist_products_raw')}}
),
cleaned_product_data AS (
    SELECT 
        --Ids
        TRIM(product_id) AS product_id,
        --Category
        TRIM(product_category_name) AS product_category_name,
        --Dimensions
        SAFE_CAST(product_name_lenght AS FLOAT64) AS product_name_length,
        SAFE_CAST(product_description_lenght AS INT64) AS product_description_length,
        SAFE_CAST(product_photos_qty AS INT64) AS product_photos_qty,
        SAFE_CAST(product_weight_g AS FLOAT64) AS product_weight_g,
        SAFE_CAST(product_length_cm AS FLOAT64) AS product_length_cm,
        SAFE_CAST(product_height_cm AS FLOAT64) AS product_height_cm,
        SAFE_CAST(product_width_cm AS FLOAT64) AS product_width_cm
    FROM source
)
SELECT * FROM cleaned_product_data