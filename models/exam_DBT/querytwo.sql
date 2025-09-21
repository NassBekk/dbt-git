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
    select  dimspectrack.Track_name 
    from facttracks
    join dimspectrack on facttracks.spectrack_key = dimspectrack.spectrack_key
    join dimalbum on facttracks.album_key = dimalbum.album_key
    where dimalbum.prod_year = 2000 or dimalbum.prod_year = 2002
)
select * from final