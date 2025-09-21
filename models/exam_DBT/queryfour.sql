{{ config(tags=["exam_done_tag"]) }}

with dimalbum as (
    select * from {{ source('Exam_STAR_DBT','DIMALBUM') }}
),
dimspectrack as (
    select * from {{ source('Exam_STAR_DBT','DIMSPECTRACK')}}
),
facttracks as (
    select * from {{ source('Exam_STAR_DBT','FACTTRACKS')}}
),

final as (
    select  dimalbum.title
    from facttracks
    join dimspectrack on facttracks.spectrack_key = dimspectrack.spectrack_key
    join dimalbum on facttracks.album_key = dimalbum.album_key
    group by dimalbum.title
    order by sum(dimspectrack.milliseconds) desc
    limit 10
)
select * from final