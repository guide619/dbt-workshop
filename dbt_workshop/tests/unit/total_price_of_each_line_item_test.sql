-- depends_on: {{ ref('2023_supermarket_data_report') }}

{{ config(tags=['unit-test']) }}

{% call dbt_unit_testing.test('total_price_of_each_line_item','should find total price of each line item correctly') %}
    {% call dbt_unit_testing.mock_ref('2023_supermarket_data_report', options={"input_format": "csv"}) %}
        id,item,quantity,price_per_unit,year,month,day
        '001','banana',3,10,2023,1,1
        '002','apple',2,15,2023,1,2
        '003','lemon',4,20,2023,1,3
        '004','banana',5,10,2023,1,4
    {% endcall %}

    {% call dbt_unit_testing.expect({"input_format": "csv"}) %}
        id,item,quantity,price_per_unit,year,month,day,total_price
        '001','banana',3,10,2023,1,1,30
        '002','apple',2,15,2023,1,2,30
        '003','lemon',4,20,2023,1,3,80
        '004','banana',5,10,2023,1,4,50
    {% endcall %}
{% endcall %}
