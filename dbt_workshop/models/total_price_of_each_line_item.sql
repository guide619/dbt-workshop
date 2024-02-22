-- SELECT * FROM {{ ref('2023_supermarket_data_report') }}

SELECT *, quantity*price_per_unit AS total_price
FROM {{ dbt_unit_testing.ref('2023_supermarket_data_report') }}
