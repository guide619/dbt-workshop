WITH total_price_of_each_line_item AS (
    SELECT *, quantity*price_per_unit AS total_price
    FROM {{ dbt_unit_testing.ref('2023_supermarket_data_report') }}
)

SELECT year, month, SUM(total_price) AS total_price
FROM total_price_of_each_line_item
GROUP BY year, month
ORDER BY year ASC, month ASC