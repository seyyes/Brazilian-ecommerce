WITH products AS (
    SELECT * FROM {{ ref('stg_olist_products') }}
),
category_translation AS (
    SELECT 
        *
    FROM {{ ref('stg_olist_product_category_name_translation') }}
),
products_final AS (
    SELECT 
        -- pk
        product_id,

        -- Attributes
        product_category_name_english AS category,
        product_name_length,
        product_description_length,
        product_photos_qty,
        product_weight_g,
        product_length_cm,
        product_height_cm,
        product_width_cm
    FROM products p
    LEFT JOIN category_translation ct 
        ON p.product_category_name = ct.product_category_name
)
SELECT * FROM products_final