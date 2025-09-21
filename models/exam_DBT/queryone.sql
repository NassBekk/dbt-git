{{ config(tags=["exam_done_tag"]) }}

with dimalbum as (
    select * from {{ source('Exam_STAR_DBT','DIMALBUM') }}
),

final as (
    select  title 
    from dimalbum
    where nb_cd > 1
)
select * from final