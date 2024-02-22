-- depends_on: {{ ref('2023_supermarket_data_report') }}

{{ config(tags=['unit-test']) }}

{% call dbt_unit_testing.test('highest_sell_item_for_each_month','should highest sell item for each month correctly') %}
    {% call dbt_unit_testing.mock_ref('2023_supermarket_data_report', options={"input_format": "csv"}) %}
        id,item,quantity,price_per_unit,year,month,day
        '001','banana',3,10,2023,1,1
        '002','apple',2,15,2023,1,2
        '003','lemon',4,20,2023,1,3
        '004','lemon',5,10,2023,1,4
        '005','apple',14,20,2023,2,1
        '006','lemon',5,10,2023,2,2
    {% endcall %}

    {% call dbt_unit_testing.expect({"input_format": "csv"}) %}
        year,month,item,total_quantity
        2023,1,'lemon',9
        2023,2,'apple',14
    {% endcall %}
{% endcall %}