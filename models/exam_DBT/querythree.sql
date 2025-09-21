{{ config(tags=["exam_done_tag"]) }}

with dimspectrack as (
    select * from {{ source('Exam_STAR_DBT','DIMSPECTRACK')}}
),

final as (
    select  Track_name, Composer
    from dimspectrack
    where genre = 'Rock' or genre = 'Jazz'
)
select * from final