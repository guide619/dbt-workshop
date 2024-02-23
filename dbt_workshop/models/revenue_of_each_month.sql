{{ config(materialized='table') }}

SELECT year, month, SUM(total_price) AS total_price
FROM {{ dbt_unit_testing.ref('total_price_of_each_line_item') }}
GROUP BY year, month
ORDER BY year ASC, month ASC
