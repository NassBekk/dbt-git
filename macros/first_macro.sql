{% macro divide_by_hundred(argument1, argument2=1) %}
    ({{ argument1 }} / 100)::numeric(16, {{ argument2 }})
{% endmacro %}
