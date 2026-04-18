WITH source  AS (
    SELECT * FROM {{source('ecommerce_supply_chain_dataset', 'olist_geolocation_raw')}}
),
cleaned_geolocation_data AS (
    SELECT 
        --Ids
        TRIM(geolocation_zip_code_prefix) AS zip_code_prefix,
        -- Coordinates
        SAFE_CAST(geolocation_lat AS FLOAT64) AS latitude,
        SAFE_CAST(geolocation_lng AS FLOAT64) AS longitude,
        --Location
        TRIM(LOWER(geolocation_city)) AS city,
        TRIM(UPPER(geolocation_state)) AS state
    FROM source
)
SELECT * FROM cleaned_geolocation_data