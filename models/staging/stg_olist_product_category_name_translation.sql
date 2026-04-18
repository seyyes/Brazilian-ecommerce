WITH source  AS (
    SELECT * FROM {{source('ecommerce_supply_chain_dataset', 'product_category_name_translation_raw')}}
),
cleaned_product_category_data AS (
    SELECT 
        --Original category name and its English translation
        LOWER(TRIM(product_category_name)) AS product_category_name,
        LOWER(TRIM(product_category_name_english)) AS product_category_name_english
    FROM source
)
SELECT * FROM cleaned_product_category_data