WITH date_spine AS (
    SELECT
        date_day
    FROM UNNEST(GENERATE_DATE_ARRAY('2016-01-01', '2025-12-31')) AS date_day
)

SELECT
    date_day AS date,

    EXTRACT(YEAR FROM date_day) AS year,
    EXTRACT(MONTH FROM date_day) AS month,
    FORMAT_DATE('%B', date_day) AS month_name,

    EXTRACT(QUARTER FROM date_day) AS quarter,

    EXTRACT(DAY FROM date_day) AS day,
    EXTRACT(DAYOFWEEK FROM date_day) AS day_of_week,
    FORMAT_DATE('%A', date_day) AS day_name,

    CASE 
        WHEN EXTRACT(DAYOFWEEK FROM date_day) IN (1,7) THEN TRUE
        ELSE FALSE
    END AS is_weekend

FROM date_spine