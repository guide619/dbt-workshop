{{ config(materialized='table') }}

WITH total_quantity_by_item AS (
    SELECT year, month, item, SUM(quantity) AS total_quantity
    FROM {{ dbt_unit_testing.source('public', 'input_table') }}
    GROUP BY year, month, item
    ORDER BY year ASC, month ASC, total_quantity DESC
)

SELECT year, month, item, total_quantity
FROM (
    SELECT *, RANK() OVER (
        PARTITION BY year, month
        ORDER BY total_quantity DESC
    ) AS rank_num
    FROM total_quantity_by_item
)
WHERE rank_num = 1
