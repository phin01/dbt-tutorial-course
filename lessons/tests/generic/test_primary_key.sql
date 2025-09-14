{# This test combines the 'not_null' and 'unique' default dbt tests #}

{% test primary_key(model, column_name) %}

WITH validation AS (
    SELECT 
        {{ column_name }} AS pk,
        COUNT(*) AS count
    FROM {{ model }}
    GROUP BY {{ column_name }}
)

SELECT *
FROM validation
WHERE count > 1 OR pk IS NULL

{% endtest %}