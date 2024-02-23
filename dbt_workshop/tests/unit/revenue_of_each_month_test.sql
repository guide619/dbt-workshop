{{ config(tags=['unit-test']) }}

{% call dbt_unit_testing.test('revenue_of_each_month','should find revenue of each month correctly') %}
    {% call dbt_unit_testing.mock_ref('total_price_of_each_line_item', options={"input_format": "csv"}) %}
        id,item,quantity,price_per_unit,year,month,day,total_price
        '001','banana',3,10,2023,1,1,30
        '002','apple',2,15,2023,1,2,30
        '003','lemon',4,20,2023,1,3,80
        '004','banana',5,10,2023,1,4,50
    {% endcall %}

    {% call dbt_unit_testing.expect({"input_format": "csv"}) %}
        year,month,total_price
       2023,1,190
    {% endcall %}
{% endcall %}