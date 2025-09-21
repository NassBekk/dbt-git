{{ config(tags=["exam_done_tag"]) }}

with spe as (
    select * from {{ source('Exam_STAR_DBT','DIMSPECTRACK')}}
),

final as (
    select  playlist
    from spe
    where spe.milliseconds >= 240000 
    group by spe.playlist
)
select * from final