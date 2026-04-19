{# 
    This comment will not show up in the compiled SQL file
#}

-- This comment shows up in the compiled SQL file

{% set my_sql_statement %}
    SELECT 1 as my_column
{% endset %}

{{ my_sql_statement }}

{% set my_columns = ['user', 'info1', 'info2'] %}

SELECT
{%- for col in my_columns %}
    {{ col }} {%- if not loop.last %}, {% endif %}
{%- endfor %}
FROM my_table