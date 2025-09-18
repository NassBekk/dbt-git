{% test switzerland(model, column_name) %}

with validation as (

    select
        {{ column_name }} as name

    from {{ model }}

),

validation_errors as (

    select
        name

    from validation

    where name = 'Switzerland'

)

select *
from validation_errors

{% endtest %}