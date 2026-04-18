WITH source AS (
    SELECT * FROM {{source('ecommerce_supply_chain_dataset', 'olist_customers_raw')}}
),
cleaned_customer_data AS (
    SELECT 
        --Ids
        TRIM(customer_id) AS customer_id,
        TRIM(customer_unique_id) AS customer_unique_id,
        --Location
        TRIM(customer_zip_code_prefix) AS customer_zip_code_prefix,
        TRIM(LOWER(customer_city)) AS customer_city,
        TRIM(UPPER(customer_state)) AS customer_state
    FROM source
)
SELECT * FROM cleaned_customer_data