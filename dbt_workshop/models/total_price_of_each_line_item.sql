SELECT *, quantity*price_per_unit AS total_price
FROM {{ dbt_unit_testing.source('public', 'input_table') }}
