{{ config(tags=["exam_done_tag"]) }}

with spe as (
    select * from {{ source('Exam_STAR_DBT','DIMSPECTRACK')}}
),

final as (
    select  avg(spe.milliseconds)/60000 as moyenne, spe.genre
    from spe
    group by spe.genre
)
select * from final