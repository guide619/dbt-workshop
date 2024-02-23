{{ config(materialized='table') }}

SELECT * FROM {{ ref('2023_supermarket_data_report') }}
